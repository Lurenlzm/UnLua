require('UnLua')


local record Test
	x : string
end

local record del
	Add : function(any, any, any)
end

local record Button
	OnClicked : del
end

local record UMG_Main_C
	ExitButton : Button

	OnClicked_ExitButton : function()
end

RegisterUeClass(UMG_Main_C)

function UMG_Main_C:Construct()

	local a : Test = { x = 'aaaaaaaaaaa'}  

	self.ExitButton.OnClicked:Add(self, UMG_Main_C.OnClicked_ExitButton)	
	--self.ExitButton.OnClicked:Add(self, function(Widget) UE4.UKismetSystemLibrary.ExecuteConsoleCommand(Widget, "exit") end )
end

function UMG_Main_C:OnClicked_ExitButton()
	UE4.UKismetSystemLibrary.ExecuteConsoleCommand(self, "exit")
end

return UMG_Main_C
