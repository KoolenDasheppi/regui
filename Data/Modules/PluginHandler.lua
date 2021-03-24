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
            return _ReGui.Helper.Io:ListFiles(_ReGui.Helper.Path:Join(_ReGui.Directory,"Data","Plugins"))
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