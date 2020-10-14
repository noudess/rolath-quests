-- Converted to .lua by Speedz
-- edited and added saylink by robregen
-- edited for faction by noudess

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18791) == true) then
		e.other:Message(15,"As your eyes adjust to the darkness, a pretty troll (pretty by trollish standards) turns toward you. 'I be Kaglari. You read note in inventory and hand to me to start training!'");
	end
end

function event_say(e)
	local pfaction = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("<SNORT!>  HHUUUUCCCSSH..  Peh!  You speak at Kaglari, High Priestess of Dark Ones.  Children of Hate.  Spawn of Innoruuk.  " .. e.other:GetName() .. " . speak or be gone!  <SNORT!>  You [" .. eq.say_link("wish majik power",false,"wish majik power") .. "]?");
	elseif(pfaction > 5)  then
		eq.reject_say(e);
	elseif(pfaction > 4) then
		e.self:Say("'You need to prove your dedication to our cause before I can discuss such matters with you.");
	elseif (e.message:findi("wish majik power")) then
		e.self:Say("GOOD! <SNORT> Innoruuk needs more childrens.  You show majik skill or I give you to Innoruuk.  You bring two froglok fleshies and two bone chips ..<SNORT>..  from old bones.  I teach you majik.  GO!  <SNORT!!>");
	elseif (e.message:findi("help innoruuk")) then
		e.self:Say("Yuz go talk to Bregna den.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	local pfaction = e.other:GetFaction(e.self);

	if (pfaction > 4) then
		e.self:Say("'You need to prove your dedication to our cause before I can discuss such matters with you.");
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13073, item2 = 13073, item3 = 13187, item4 = 13187})) then -- Majik power
		e.self:Say("Good. Innoruuk get special gift. Not you, dis time. Here. Learning majik wid dis. You more want to [" .. eq.say_link("help Innoruuk",false,"help Innoruuk") .. "]?");
		e.other:SummonItem(eq.ChooseRandom(15040, 15093, 15200, 15201, 15205, 15213, 15225, 15266, 15267)); -- Item: Spell: Burst of Flame
		e.other:Ding();
		e.other:Faction(237,5,0);  -- +Dark Ones
		e.other:Faction(308,1,0);  -- +Shadowknights of Night Keep
		e.other:Faction(251,-1,0); -- -Frogloks of Guk
		e.other:AddEXP(30);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 18791})) then -- Tattered Note
		e.self:Say("Good.. Kaglari need you help.. Kaglari teach you majik now.  When you ready for task you tell Kaglari!!  Yooz reeturn to mez when yooz ar strongur, mez teech yooz bout da mor advanced tings.");
		e.other:SummonItem(13529); -- Muck Stained Tunic
		e.other:Ding();
		e.other:Faction(237,100,0);  -- +Dark Ones
		e.other:Faction(308,25,0);  -- +Shadowknights of Night Keep
		e.other:Faction(251,-15,0); -- -Frogloks of Guk
		e.other:AddEXP(20);
	else
		item_lib.return_items(e.self, e.other, e.trade)
	end
end
