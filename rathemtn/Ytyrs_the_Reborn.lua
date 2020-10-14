function event_death_complete(e)
	x = e.self:GetX();
	y = e.self:GetY();
	z = e.self:GetZ();
	h = e.self:GetHeading();

	-- Spawn Reborn and 5 minions.
	eq.spawn2(50346,0,0,x,y,z,h);

	eq.spawn2(50073,0,0,x-7,y,z,h);
	eq.spawn2(50347,0,0,x+7,y,z,h);
	eq.spawn2(50073,0,0,x,y-7,z,h);
	eq.spawn2(50347,0,0,x,y-7,z,h);
	eq.spawn2(50073,0,0,x+12,y+12,z,h);
	eq.spawn2(50073,0,0,x-12,y-12,z,h);
end
