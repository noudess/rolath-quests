function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	local msgc = eq.ChooseRandom(0,4,5,13,14,15,21);
	e.other:SendColoredText(msgc, "A sharp rock falls from the low ceiling, banging you on the head!  Why are you here again?");
end
