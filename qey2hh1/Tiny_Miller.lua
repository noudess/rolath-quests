function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Duhh... uhh... hiya, " .. e.other:GetName() .. ". My name is umm... Tiny. I works here on da farm. Look out for da scarecrows. Dey will squish ya if ya tresspass in da fields.");
	end
end

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
