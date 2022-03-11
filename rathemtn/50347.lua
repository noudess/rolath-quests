function event_spawn(e)
	local sex = math.random(2) - 1;
	e.self:SetGender(sex);
end
