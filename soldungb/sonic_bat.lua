function event_spawn(e)
	if (e.self:GetLevel() > 40) then
		e.self:ModifyNPCStat("see_hide","1");
	end
end
