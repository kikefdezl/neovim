-- Spawns a floating terminal window on the top right with system monitoring

-- System Monitoring tool of your choice, top, htop, nvtop, mltop, btm...
local MONITORING_TOOL = "mltop"

local state = {
  buf = nil,
  win = nil,
  first_open = true,
}

local function create_window(width, height)
  local ui = vim.api.nvim_list_uis()[1]
  local win_width = width or math.floor(ui.width / 3)
  local win_height = height or math.floor(ui.height / 2)

  local opts = {
    relative = "editor",
    width = win_width,
    height = win_height,
    col = math.floor(ui.width - win_width),
    row = 0,
    style = "minimal",
    border = "none",
  }

  return vim.api.nvim_open_win(state.buf, false, opts)
end

local function create_buffer()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "hide"
  return buf
end

local function toggle_terminal(width, height)
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true)
    state.win = nil
    return
  end

  if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
    state.buf = create_buffer()
    state.first_open = true
  end

  state.win = create_window(width, height)

  if state.first_open then
    local current_win = vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(state.win)
    vim.cmd("terminal " .. MONITORING_TOOL)
    vim.api.nvim_set_current_win(current_win)
    state.first_open = false
  end
end

vim.keymap.set("n", "<leader>hw", toggle_terminal, { desc = "Toggle floating terminal" })
