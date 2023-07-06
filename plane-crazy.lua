local nhook 
local GC = getgc()

repeat task.wait()
    until GC

for _, f in ipairs(GC) do 
    if getfenv(f).script == SettingsScript and type(f) == "function" and getinfo(f).name == "destroyvals" then 
        hookfunction(f,function()end)
    end
end

nhook = hookmetamethod(game, "__namecall", function(self, ...)
    if getnamecallmethod() == "Kick" or self == RS.Remotes.KickEvent then 
        return true
    end 
    return nhook(self, ...)
end)

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3c5eab1ddda4aa5b56f664744e796852.lua"))()
