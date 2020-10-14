function event_say(e)

	--local tax = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:DoAnim(27);
		e.self:Say(string.format("Hail, %s!  Welcome to Fish's Ale. I am Fish Ranamer, owner of the joint.  Come in and have some brew but don't be startin' no trouble or Bruno will bust you open!",e.other:GetName()));
	elseif(e.message:findi("tax")) then
	--elseif(e.message:findi("tax collection") and tax.tax_collection ~= nil) then
		e.self:Say("Taxes?! Taxes?! Tax me right out of business is what you folks are doing! Take your taxes and get out of my pub! Unless, of course, you care to buy some drinks...?");
		e.other:SummonItem(13178);
		e.other:Faction(291,-1,0);
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
	
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Why Hello Korvik!  What brings you here?  Celebrating your return to Qeynos?");
		e.self:DoAnim(27);
	eq.signal(1305,2,1000);
    end
end
