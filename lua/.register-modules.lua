-- Register all modules for other LUA scripts
-- See reference: https://github.com/vladimir-kotikov/clink-completions/raw/refs/heads/master/.init.lua

-- Get the parent path of this script.
local parent_path = debug.getinfo(1, "S").source:match[[^@?(.*[\/])[^\/]-$]]

-- Extend package.path with modules directory, if not already present, to allow
-- using require() with them.
local modules_path = parent_path.."modules/?.lua"
if not package.path:find(modules_path, 1, true--[[plain]]) then
    package.path = modules_path..";"..package.path
end