
vim.api.nvim_create_user_command("JavaRun", function()
  local file = vim.fn.expand("%:p") -- full path to current file
  local class = vim.fn.expand("%:t:r") -- filename without extension
  local dir = vim.fn.expand("%:p:h") -- directory of current file
  local source_root = file:match("(.*/src/main/java)/")

  if not source_root then
    print("❌ Could not detect source root (src/main/java)")
    return
  end

  -- Read package name from file
  local package = nil
  for line in io.lines(file) do
    local pkg = line:match("^%s*package%s+([%w%.]+)%s*;")
    if pkg then
      package = pkg
      break
    end
  end

  local fqcn = package and (package .. "." .. class) or class

  -- Close all terminal windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_win_close(win, true)
    end
  end

  -- Compile all .java files in the current directory
  local java_files = vim.fn.glob(dir .. "/*.java", false, true)

  if #java_files == 0 then
    print("❌ No Java files found in directory.")
    return
  end

  vim.fn.jobstart(vim.list_extend({ "javac" }, java_files), {
    on_exit = function(_, code)
      if code == 0 then
        vim.cmd("belowright split | terminal")
        vim.fn.chansend(vim.b.terminal_job_id, "cd " .. source_root .. " && java " .. fqcn .. "\n")
      else
        print("❌ Compilation failed.")
      end
    end,
  })
end, { desc = "Compile and run current Java file with dependencies" })
