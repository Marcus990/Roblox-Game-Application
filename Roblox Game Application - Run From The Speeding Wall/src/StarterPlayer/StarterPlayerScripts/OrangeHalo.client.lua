local player = game.Players.LocalPlayer
local HaloEvent = game.ReplicatedStorage.Events:WaitForChild("HaloEvent")
local CustomHalo = "OrangeHalo"
player.CharacterAdded:Connect(function(char)
	local humanoid = char:WaitForChild("Humanoid")
	humanoid:GetPropertyChangedSignal("Health"):Connect(function()
		local text
		if player:WaitForChild("PlayerGui"):WaitForChild("ShopGui").HalosShopFrame.ScrollingFrame.Template1.BuyButton.OrangeHalo.Text == "Unequip" then 
			text = true
		elseif player:WaitForChild("PlayerGui"):WaitForChild("ShopGui").HalosShopFrame.ScrollingFrame.Template1.BuyButton.OrangeHalo.Text == "Equip" then
			text = false
		end
		if char:FindFirstChild("OrangeHalo") then char:FindFirstChild("OrangeHalo"):Destroy() end
		print("Died")
		player.CharacterAdded:Wait()
		if text == false then
			HaloEvent:FireServer(CustomHalo, text)
			text = false
		elseif text == true then
			HaloEvent:FireServer(CustomHalo, text)
			text = false
		end
		print("Respawned")
	end)
	end)