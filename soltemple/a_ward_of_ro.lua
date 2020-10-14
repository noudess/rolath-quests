function event_death_complete(e)
    x = e.self:GetX();
    y = e.self:GetY();
    z = e.self:GetZ();
    h = e.self:GetHeading();

    -- Spawn an_incarnate
	local spawncount = math.random(3);
	local offsetx;
	local offsety;

	eq.spawn2(80043,0,0,x,y,z,h);

	for i=2,spawncount,1
	do
		offsetx = (math.random(50)-25);
		offsety = (math.random(50)-25);
    	eq.spawn2(80043,0,0,x+offsetx,y+offsety,z,h);
	end
end
