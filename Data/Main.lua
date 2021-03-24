return function(LocalPath)
    _ReGui:Log("Data/Main.lua started")
    _ReGui:Log("Load: PluginHandler")
    _ReGui.PluginHandler = _ReGui.Helper:Require(_ReGui.Helper.Path:Join(_ReGui.Directory,"Data","Modules"),"PluginHandler.lua")
    _ReGui:Log("Loaded: PluginHandler")
end