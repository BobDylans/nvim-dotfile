local uv = vim.uv or vim.loop

local function join_path(base, name)
  return base .. package.config:sub(1, 1) .. name
end

local function find_single_child_dir(path)
  local handle = uv.fs_scandir(path)
  if not handle then
    return nil
  end

  local child_dir = nil

  while true do
    local name, entry_type = uv.fs_scandir_next(handle)
    if not name then
      break
    end

    if not name:match("^%.") then
      if entry_type ~= "directory" then
        return nil
      end
      if child_dir then
        return nil
      end
      child_dir = join_path(path, name)
    end
  end

  return child_dir
end

local function expand_compact_dirs(state)
  local fs = require("neo-tree.sources.filesystem")
  local renderer = require("neo-tree.ui.renderer")
  local tree = state.tree
  local start_node = tree:get_node()

  if not start_node or start_node.type ~= "directory" then
    require("neo-tree.sources.filesystem.commands").open(state)
    return
  end

  local final_path = start_node.path

  local function ensure_directory_expanded(node, callback)
    if node.loaded == false or not node:is_expanded() then
      fs.toggle_directory(state, node, nil, true, false, callback)
    else
      callback()
    end
  end

  local function step(path)
    local next_path = find_single_child_dir(path)
    if not next_path then
      renderer.redraw(state)
      renderer.focus_node(state, final_path)
      return
    end

    local next_node = tree:get_node(next_path)
    if next_node then
      final_path = next_path
      ensure_directory_expanded(next_node, function()
        step(next_path)
      end)
    else
      local current_node = tree:get_node(path)
      if not current_node then
        renderer.redraw(state)
        renderer.focus_node(state, final_path)
        return
      end
      ensure_directory_expanded(current_node, function()
        final_path = next_path
        step(next_path)
      end)
    end
  end

  ensure_directory_expanded(start_node, function()
    step(start_node.path)
  end)
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        indent = {
          indent_size = 1,
          padding = 0,
          with_markers = false,
          with_expanders = true,
        },
        modified = {
          symbol = "",
        },
        git_status = {
          symbols = {
            added = "+",
            deleted = "-",
            modified = "~",
            renamed = "r",
            untracked = "?",
            ignored = "",
            unstaged = "*",
            staged = "",
            conflict = "!",
          },
        },
      },
      renderers = {
        directory = {
          { "indent" },
          { "icon" },
          {
            "container",
            content = {
              { "name", zindex = 10 },
              { "clipboard", zindex = 10 },
              { "git_status", zindex = 10, align = "right", hide_when_expanded = true },
            },
          },
        },
        file = {
          { "indent" },
          { "icon" },
          {
            "container",
            content = {
              { "name", zindex = 10 },
              { "clipboard", zindex = 10 },
              { "git_status", zindex = 10, align = "right" },
            },
          },
        },
      },
      window = {
        width = 32,
      },
      filesystem = {
        group_empty_dirs = true,
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = true,
          hide_gitignored = true,
        },
        commands = {
          expand_compact_dirs = expand_compact_dirs,
        },
        window = {
          mappings = {
            ["L"] = "expand_compact_dirs",
            ["p"] = { "toggle_preview", config = { use_float = false } },
          },
        },
      },
    },
  },
}
