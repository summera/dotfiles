local escape_chars = function(string)
  return string.gsub(string, "[%(|%)|\\|%[|%]|%-|%{%}|%?|%+|%*|%^|%$|%.]", {
    ["\\"] = "\\\\",
    ["-"] = "\\-",
    ["("] = "\\(",
    [")"] = "\\)",
    ["["] = "\\[",
    ["]"] = "\\]",
    ["{"] = "\\{",
    ["}"] = "\\}",
    ["?"] = "\\?",
    ["+"] = "\\+",
    ["*"] = "\\*",
    ["^"] = "\\^",
    ["$"] = "\\$",
    ["."] = "\\.",
  })
end

local opts_contain_invert = function(args)
  local invert = false
  local files_with_matches = false

  for _, v in ipairs(args) do
    if v == "--invert-match" then
      invert = true
    elseif v == "--files-with-matches" or v == "--files-without-match" then
      files_with_matches = true
    end

    if #v >= 2 and v:sub(1, 1) == "-" and v:sub(2, 2) ~= "-" then
      local non_option = false
      for i = 2, #v do
        local vi = v:sub(i, i)
        if vi == "=" then -- ignore option -g=xxx
          break
        elseif vi == "g" or vi == "f" or vi == "m" or vi == "e" or vi == "r" or vi == "t" or vi == "T" then
          non_option = true
        elseif non_option == false and vi == "v" then
          invert = true
        elseif non_option == false and vi == "l" then
          files_with_matches = true
        end
      end
    end
  end
  return invert, files_with_matches
end

-- Taken from https://github.com/nvim-telescope/telescope.nvim/blob/c392f1b78eaaf870ca584bd698e78076ed301b26/lua/telescope/builtin/__files.lua#L187
-- Customized to avoid using word under cursor
local find_string = function(opts)
  opts = opts or {}
  
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values
  local make_entry = require "telescope.make_entry"
  local utils = require "telescope.utils"
  local flatten = utils.flatten
  local pickers = require "telescope.pickers"
  
  local vimgrep_arguments = vim.F.if_nil(opts.vimgrep_arguments, conf.vimgrep_arguments)
  -- if not has_rg_program("grep_string", vimgrep_arguments[1]) then
  --   return
  -- end
  local word
  local visual = vim.fn.mode() == "v"

  if visual == true then
    local saved_reg = vim.fn.getreg "v"
    vim.cmd [[noautocmd sil norm! "vy]]
    local sele = vim.fn.getreg "v"
    vim.fn.setreg("v", saved_reg)
    word = vim.F.if_nil(opts.search, sele)
  else
    word = vim.F.if_nil(opts.search, "")
  end
  local search = opts.use_regex and word or escape_chars(word)

  local additional_args = {}
  if opts.additional_args ~= nil then
    if type(opts.additional_args) == "function" then
      additional_args = opts.additional_args(opts)
    elseif type(opts.additional_args) == "table" then
      additional_args = opts.additional_args
    end
  end

  if opts.file_encoding then
    additional_args[#additional_args + 1] = "--encoding=" .. opts.file_encoding
  end

  if search == "" then
    search = { "-v", "--", "^[[:space:]]*$" }
  else
    search = { "--", search }
  end

  local args
  if visual == true then
    args = flatten {
      vimgrep_arguments,
      additional_args,
      search,
    }
  else
    args = flatten {
      vimgrep_arguments,
      additional_args,
      opts.word_match,
      search,
    }
  end

  opts.__inverted, opts.__matches = opts_contain_invert(args)

  if opts.grep_open_files then
    for _, file in ipairs(get_open_filelist(opts.grep_open_files, opts.cwd)) do
      table.insert(args, file)
    end
  elseif opts.search_dirs then
    for _, path in ipairs(opts.search_dirs) do
      table.insert(args, utils.path_expand(path))
    end
  end

  opts.entry_maker = opts.entry_maker or make_entry.gen_from_vimgrep(opts)
  pickers
    .new(opts, {
      prompt_title = "Find Word (" .. word:gsub("\n", "\\n") .. ")",
      finder = finders.new_oneshot_job(args, opts),
      previewer = conf.grep_previewer(opts),
      sorter = conf.generic_sorter(opts),
    })
    :find() 
end

return {
  find_string = find_string
}
