local currentAbility = getgenv().chosenAbilities[1]
local uis = game:GetService("UserInputService")
local remote = game:GetService("ReplicatedStorage").power
local contextActionService = game:GetService("ContextActionService")

contextActionService:UnbindAction("FireAbility1")
contextActionService:UnbindAction("FireAbility2")
contextActionService:UnbindAction("FireAbility3")
contextActionService:UnbindAction("FireAbility4")

local function switchToAbilitySlot(slotNumber)
    if not getgenv().chosenAbilities[slotNumber] then return end
	currentAbility = chosenAbilities[slotNumber]
end

local function fireAbility(skill, startOrEnd)
	remote:FireServer(currentAbility, skill, startOrEnd)
end

uis.InputBegan:Connect(function(input, gp)
	if gp then return end
	
	if input.KeyCode == Enum.KeyCode.KeypadOne then
		switchToAbilitySlot(1)
	elseif input.KeyCode == Enum.KeyCode.KeypadTwo then
		switchToAbilitySlot(2)
	elseif input.KeyCode == Enum.KeyCode.KeypadThree then
		switchToAbilitySlot(3)
	elseif input.KeyCode == Enum.KeyCode.KeypadFour then
		switchToAbilitySlot(4)
	elseif input.KeyCode == Enum.KeyCode.KeypadFive then
		switchToAbilitySlot(5)
	elseif input.KeyCode == Enum.KeyCode.KeypadSix then
		switchToAbilitySlot(6)
	elseif input.KeyCode == Enum.KeyCode.KeypadSeven then
		switchToAbilitySlot(7)
	elseif input.KeyCode == Enum.KeyCode.KeypadEight then
		switchToAbilitySlot(8)
	elseif input.KeyCode == Enum.KeyCode.KeypadNine then
		switchToAbilitySlot(9)
	elseif input.KeyCode == Enum.KeyCode.KeypadZero then
		switchToAbilitySlot(10)
	end

	if input.KeyCode == Enum.KeyCode.E then
		fireAbility(1, Enum.UserInputState.Begin)
	end

	if input.KeyCode == Enum.KeyCode.Z then
		fireAbility(2, Enum.UserInputState.Begin)
	end

	if input.KeyCode == Enum.KeyCode.G then
		fireAbility(3, Enum.UserInputState.Begin)
	end

	if input.KeyCode == Enum.KeyCode.V then
		fireAbility(4, Enum.UserInputState.Begin)
	end
end)

uis.InputEnded:Connect(function(input, gp)
	if gp then return end
	
	if input.KeyCode == Enum.KeyCode.E then
		fireAbility(1, Enum.UserInputState.End)
	end

	if input.KeyCode == Enum.KeyCode.Z then
		fireAbility(2, Enum.UserInputState.End)
	end

	if input.KeyCode == Enum.KeyCode.G then
		fireAbility(3, Enum.UserInputState.End)
	end

	if input.KeyCode == Enum.KeyCode.V then
		fireAbility(4, Enum.UserInputState.End)
	end
end)