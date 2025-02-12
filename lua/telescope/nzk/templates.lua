---@class NZKOpts
---@field content? string
---@field date? string
---@field dir? string
---@field dryRun? boolean
---@field edit? boolean
---@field extra? table
---@field group? string
---@field insertContentAtLocation? string
---@field insertLinkAtLocation? string
---@field template? string
---@field title? string

---@class NZK
---@field new fun(opts: NZKOpts)
---@field edit fun(opts: NZKOpts)
local zk = require('zk')
