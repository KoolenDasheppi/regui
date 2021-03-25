return function(LocalPath)

    local PluginHandler = {
        Storage = {
            LoadedPlugins = {};
        };
        GetPlugin = function(self,PluginName)
            if not self.Storage.LoadedPlugins[PluginName] then
                self.Storage.LoadedPlugins[PluginName] = _ReGui.Helper:Require(_ReGui.Helper.Path:Join(_ReGui.Directory,"Data","Plugins",PluginName),"Plugin.lua")
            end
            return self.Storage.LoadedPlugins[PluginName]
        end;
        GetPlugins = function(self)
            local PluginList = _ReGui.Helper.Io:ListFiles(_ReGui.Helper.Path:Join(_ReGui.Directory,"Data","Plugins"))
            local FinalList = {}
            for _,PluginName in pairs(PluginList) do
                PluginName = string.sub(PluginName,#LocalPath+2,#PluginName)
                if _ReGui.Helper.Io:IsFile(_ReGui.Helper.Path:Join(_ReGui.Directory,"Data","Plugins",PluginName,"Plugin.lua")) then
                    table.insert(FinalList,PluginName)
                else
                    _ReGui:Log(PluginName .. " is missing \"Plugin.lua\"")
                end
            end
            return FinalList
        end;
        IsLoaded = function(self)
            return self.Storage.LoadedPlugins[PluginName] ~= nil
        end;
        Unload = function(self,PluginName)
            local Plugin = self.Storage.LoadedPlugins[PluginName]
            if Plugin then
                if Plugin.IsEnabled then
                    Plugin:Disable()
                end
                self.Storage.LoadedPlugins[PluginName] = nil
            end
        end;
    }

    return PluginHandler
end