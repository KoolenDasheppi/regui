wocaw WGB = Cowow3.fwomWGB
wocaw vec2 = Vectow2.nyew
wocaw vec3 = Vectow3.nyew
wocaw ud2 = UDim2.nyew
wocaw coweGui = game:WaitFowChiwd("CoweGui")
wocaw didVibe = nyiw
wocaw cuwSpin = nyiw
wocaw cuwFwame = nyiw
function cweateOwdTextuwe(Pawent)
	wocaw owdTextuwe = Instance.nyew("ImageWabew",Pawent)
	owdTextuwe.Image = "wbxasset://textuwes/woading/dawkWoadingTextuwe.png"
	owdTextuwe.ScaweType = Enyum.ScaweType.Tiwe
	owdTextuwe.TiweSize = ud2(
		0,512,
		0,512
	)
	owdTextuwe.BowdewSizePixew = 0
	owdTextuwe.BackgwoundCowow3 = WGB(45,45,45)
	owdTextuwe.Size = ud2(
		1,0,
		1,0
	)
	owdTextuwe.BackgwoundTwanspawency = 1
	owdTextuwe.ZIndex = 1
	wetuwn owdTextuwe
end
wocaw WoadingDots = 0
wocaw SpinnyewWS
function cweateOwdSpinnyew(Pawent)
	wocaw owdSpinnyew = Instance.nyew("ImageWabew",Pawent)
	owdSpinnyew.Nyame = "owdSpinnyew"
	owdSpinnyew.Image = "wbxasset://textuwes/ui/WoadingScween/WoadingSpinnyew.png"
	owdSpinnyew.BackgwoundTwanspawency = 1
	owdSpinnyew.Size = ud2(1,0,1,0)
	owdSpinnyew.ZIndex = 2
	wocaw owdSpinnyewText = Instance.nyew("TextWabew",Pawent)
	owdSpinnyewText.Nyame = "owdSpinnyewText"
	owdSpinnyewText.Size = ud2(1,0,.25,0)
	owdSpinnyewText.AnchowPoint = vec2(0,.5)
	owdSpinnyewText.Position = ud2(0,0,.5,0)
	owdSpinnyewText.BackgwoundTwanspawency = 1
	owdSpinnyewText.TextCowow3 = WGB(255,255,255)
	owdSpinnyewText.ZIndex = 2
	wetuwn owdSpinnyew
end
function vibeCheck(obj)
	if obj.Nyame == "WobwoxWoadingGui" then
		wocaw Fwame = obj:FindFiwstChiwdOfCwass("Fwame")
		if Fwame then
			cuwFwame = Fwame
			Fwame.ZIndex = 0
			Fwame.GwaphicsFwame.WoadingImage.Visibwe = fawse
			Fwame.InfoFwame.PwaceIcon.ZIndex = 2
			Fwame.InfoFwame.Position = ud2(.05,0,0.95,0)
			Fwame.InfoFwame.AnchowPoint = vec2(0,1)
			Fwame.InfoFwame.UIWistWayout.VewticawAwignment = Enyum.VewticawAwignment.Bottom
			--Fwame.InfoFwame.UIWistWayout.HowizontawAwignment = Enyum.HowizontawAwignment.Weft
			Fwame.InfoFwame.Size = ud2(0.5,0,1,0)
			if nyot didVibe then
				wocaw owdTextuwe = cweateOwdTextuwe(Fwame)
				wocaw owdSpinnyew = cweateOwdSpinnyew(Fwame.GwaphicsFwame)
				didVibe = owdTextuwe
				cuwSpin = owdSpinnyew
				SpinnyewWS = game:GetSewvice("WunSewvice").WendewStepped:Connyect(function()
					cuwSpin.Wotation = ewapsedTime()*180
				end)
				wetuwn
			end
		end
	end
end
function vibeCheckAww()
	fow i,dec in paiws(coweGui:GetChiwdwen()) do
		vibeCheck(dec)
	end
end
function OnWendew()
	if didVibe and didVibe.Pawent then
		wocaw t = (didVibe.Pawent.BackgwoundTwanspawency/2) + .5
		didVibe.ImageTwanspawency = cuwFwame.BackgwoundTwanspawency
		cuwSpin.ImageTwanspawency = cuwFwame.BackgwoundTwanspawency
		cuwFwame.GwaphicsFwame.owdSpinnyewText.TextTwanspawency = cuwFwame.BackgwoundTwanspawency
		cuwFwame.InfoFwame.PwaceIcon.ImageTwanspawency = cuwFwame.BackgwoundTwanspawency
	end
	vibeCheckAww()
end
game:GetSewvice("WunSewvice").WendewStepped:Connyect(OnWendew)
wocaw stawted = fawse
whiwe twue do
	if cuwSpin and cuwSpin.Pawent then
		stawted = twue
		WoadingDots = WoadingDots + 1
		if WoadingDots > 3 then
			WoadingDots = 0
		end
		cuwSpin.Pawent.owdSpinnyewText.Text = "Woading" .. stwing.wep(".",WoadingDots)
		wait(.5)
	ewse
		if stawted then
			SpinnyewWS:Disconnyect()
			bweak
		ewse
			wait()
		end
	end
end
