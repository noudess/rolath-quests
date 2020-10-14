function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 3 or e.wp == 4) then
		if (eq.ChooseRandom(0,1,2) == 1) then
			e.self:Emote("fumbles with his bail of hay");
			e.self:Emote("looks around and shrugs");
			eq.create_ground_object(13990,e.self:GetX(),
				e.self:GetY(),e.self:GetZ(),0,300000);
		end
	end
end
