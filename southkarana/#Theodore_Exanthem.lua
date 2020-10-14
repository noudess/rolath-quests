-- #Theodore_Exantham in south karana
local gavein = false;
local interatcamp = false;

function event_say (e)
	if(e.message:findi("hail")) then
		e.self:Say("Don't bother me creep!");
	end
end

function event_spawn(e)
	gavein = false;
	eq.signal(14050,1,5000);
end

function event_signal(e)
	if(e.signal == 1) then
		eq.move_to(-2750,-5465,00,381,true);
		eq.signal(14050,2,5000);
	elseif(e.signal == 2) then
		e.self:Say("What a joke! I'm not telling you a thing. You don't look like you could scare a moss snake. I'm not afraid of you!");
		e.self:DoAnim(63);
		eq.signal(14050,3,5000);
	elseif(e.signal == 3) then
		e.self:Emote("reels back, his eyes wide with shock. 'Ow,' he says nervously.");
		e.self:DoAnim(13);
		eq.signal(14050,4,5000);
	elseif(e.signal == 4) then
		e.self:Emote("winces and says, 'Oh. Yeah right. Like I'm afraid of that moron or something.' Theodore glances nervously over at you");
		eq.signal(14050,5,5000);
	elseif(e.signal == 5) then
		e.self:Emote("gulps nervously");
	elseif(e.signal == 6) then
		e.self:Say("Fine, follow me creeps.");
		eq.move_to(-3098,-5872,94,160,true);
		eq.set_timer("arrive",1000);
		eq.signal(14050,7,5000);
	elseif(e.signal == 7) then
		interatcamp = true;
		eq.set_timer("abort",1800000);
	end
end

function event_combat(e)
	if(gavein == false and e.joined == true) then
		eq.set_timer("defeat",3000);
	elseif (gavein == true) then
		e.self:WipeHateList();
	end
end

function event_timer(e)

	if(e.timer == "arrive" and interatcamp == true) then
        if(e.self:GetX() == -3098) then
            eq.unique_spawn(14147,0,0,-3287,-6040,0,56);
            eq.unique_spawn(14127,0,0,-3280,-6050,0,62);
            eq.spawn2(14140,0,0,-3285,-6075,0,156);
            eq.spawn2(14140,0,0,-3303,-6039,0,0);
            eq.spawn2(14148,0,0,-3306,-6056,0,132);
            eq.spawn2(14148,0,0,-3298,-6067,0,132);
            eq.stop_timer("arrive");
			e.self:Say("There... They are hiding out just down the hill here... Now release me!");
			e.self:DoAnim(64);
			eq.signal(14050,8,5000);
        end
	end

	if(e.timer == "defeat") then
		e.self:Say("Sweet father of rot, alright already! Stop hitting me and tell me what you want me to do!");
		eq.stop_timer("defeat");
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
		e.self:WipeHateList();
		eq.signal(14050,6,5000); 
		gavein = true;
	end
	if (e.timer == "abort") then
		eq.signal(14050,9,5000) 
		eq.stop_timer("abort")
		eq.depop();
	end
end

function event_trade(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 2344}) and (gavein == true)) then -- confession document
		e.self:Emote("makes a big X at the bottom of the document and hands it back saying, 'A bunch of worthless thugs is all you folks are!'");
		e.other:SummonItem(2395); -- Theodore's Confession
		e.other:Ding();
		eq.signal(14050,9,5000); 
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
