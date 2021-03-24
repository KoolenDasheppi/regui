_ReGui:Log("Data/Main.lua started")
_ReGui:Log("Load: PluginHandler")
_ReGui.PluginHandler = loadstring(_ReGui.Helper.Io:Read(table.concat({_ReGui.Directory,"Data","Modules","PluginHandler.lua"},"/")))()(table.concat({_ReGui.Directory,"Data","Modules"},"/"))
_ReGui:Log("Loaded: PluginHandler")