return function(LocalPath)

    local PluginHandler = {
        Storage = {
            LoadedPlugins = {};
        };
        GetPluginMeta = function(self,PluginName)
            local Meta =  game:GetService("HttpService"):JSONDecode(
                _ReGui.Helper.Io:Read(_ReGui.Helper.Path:Join(_ReGui.Directory,"Data","Plugins",PluginName,"Plugin.json"))  
            )
            for Key,Value in pairs(Meta.Thumb) do
                Meta.Thumb[Key] = _ReGui.Helper.Asset:Get(
                    _ReGui.Helper.Path:Join(_ReGui.Directory,"Data","Plugins",PluginName,Value)
                );
            end
            return Meta
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

        Load = function(self,PluginName)
            if not self.Storage.LoadedPlugins[PluginName] then
                self.Storage.LoadedPlugins[PluginName] = _ReGui.Helper:Require(_ReGui.Helper.Path:Join(_ReGui.Directory,"Data","Plugins",PluginName),"Plugin.lua")
            end
            return self.Storage.LoadedPlugins[PluginName]
        end;

        WasEnabled = function(self,PluginName)
            local JSONPath = _ReGui.Helper.Path:Join(_ReGui.Directory,"EnabledPlugins.json")
            local EnabledPlugins
            if _ReGui.Helper.Io:IsFile(JSONPath) then
                EnabledPlugins = game:GetService("HttpService"):JSONDecode(_ReGui.Helper.Io:Read(JSONPath))
            else
                EnabledPlugins = {}
                _ReGui.Helper.Io:Write(JSONPath,game:GetService("HttpService"):JSONEncode(EnabledPlugins))
            end

            return EnabledPlugins
        end;

        SetWasEnabled = function(self,PluginName,Enabled)
            local JSONPath = _ReGui.Helper.Path:Join(_ReGui.Directory,"EnabledPlugins.json")
            local EnabledPlugins

            if _ReGui.Helper.Io:IsFile(JSONPath) then
                EnabledPlugins = game:GetService("HttpService"):JSONDecode(_ReGui.Helper.Io:Read(JSONPath))
            else
                EnabledPlugins = {}
                _ReGui.Helper.Io:Write(JSONPath,game:GetService("HttpService"):JSONEncode(EnabledPlugins))
            end

            EnabledPlugins[PluginName] = Enabled
            _ReGui.Helper.Io:Write(JSONPath,game:GetService("HttpService"):JSONEncode(EnabledPlugins))
        end;
    }

    return PluginHandler
end