return function(LocalPath)
    local DummyPlugin = {
        Meta = {
            Title = "Dummy";
            Desc = "Dummy";
            Creator = "Dummy";
            Thumb = {
                StaticThumb = _ReGui.Helper.Asset:Get(
                    table.concat({LocalPath,"DummyThumb.png"},"/")
                )
                AnimThumb = _ReGui.Helper.Asset:Get(
                    table.concat({LocalPath,"DummyHover.webm"},"/")
                )
            };
        };
        Storage = {};
        IsEnabled = false;
        DummyPlugin.Enable = function(self)
            self.IsEnabled = true
            _ReGui:Log("DummyPlugin: Enabled")
        end
        DummyPlugin.Disable = function(self)
            self.IsEnabled = false
            _ReGui:Log("DummyPlugin: Disabled")
        end
    }

    return DummyPlugin
end