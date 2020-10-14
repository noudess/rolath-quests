function event_aggro(e)
	e.self:Say("I shall chop you down as your people chopped down the beauty of the forests!!");
end

function event_death(e)
	e.self:Say("Long live the green ..");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. I am visiting from the plains. I hope to make a FORTUNE here in Qeynos.");
	elseif(e.message:findi("Flockwalker")) then
		e.self:Say("Gash Flockwalker is a druid from Surefall Glade. I have a special delivery for him.");
	elseif(e.message:findi("special delivery")) then
		eq.attack(e.other:GetName());
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 11) then
		e.self:Say("Pardon me.  Have you seen a man named Gash Flockwalker?  He hails from Surefall Glade.");
		eq.stop_timer("talk");
		eq.signal(1104,2);
	end
end
