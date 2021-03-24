return function(LocalPath)

    local PluginHandler = {
        Storage = {
            LoadedPlugins = {};
        };
        GetPlugin = function(self,PluginName)
            if not self.LoadedPlugins[PluginName] then
                self.LoadedPlugins[PluginName] = loadstring(table.concat({_ReGui.Directory,"Data","Plugins","PluginName","Plugin.lua"},"/"))()(table.concat({_ReGui.Directory,"Data","Plugins","PluginName"},"/"))z
            end
            return self.LoadedPlugins[PluginName]
        end;
        GetPlugins = function(self)
            return _ReGui.Helper.Io:ListFiles(table.concat({_ReGui.Directory,"Data","Plugins"},"/"))
        end;
        IsLoaded = function(self)
            return self.LoadedPlugins[PluginName] ~= nil
        end;
        Unload = function(self,PluginName)
            local Plugin = self.LoadedPlugins[PluginName]
            if Plugin then
                if Plugin.IsEnabled then
                    Plugin:Disable()
                end
                self.LoadedPlugins[PluginName] = nil
            end
        end;
    }

    return PluginHandler
end