return function(LocalPath)
    local DummyPlugin = {
        Meta = {
            Title = "Dummy";
            Desc = "Dummy";
            Creator = "Dummy";
            Thumb = {
                StaticThumb = _ReGui.Helper.Asset:Get(
                    _ReGui.Helper.Path:Join(LocalPath,"DummyThumb.png")
                );
                AnimThumb = _ReGui.Helper.Asset:Get(
                    _ReGui.Helper.Path:Join(LocalPath,"DummyHover.webm")
                );
            };
        };
        Storage = {};
        IsEnabled = false;
        Enable = function(self)
            self.IsEnabled = true
            _ReGui:Log("DummyPlugin: Enabled")
        end;
        Disable = function(self)
            self.IsEnabled = false
            _ReGui:Log("DummyPlugin: Disabled")
        end;
    }

    return DummyPlugin
end