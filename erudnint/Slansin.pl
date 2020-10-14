# Inert Potion

sub EVENT_SAY 
	{

	if ($text=~/Hail/i)
		{
		quest::say("Greetings and welcome! Please feel free to look around.");
		quest::say("$mobid");
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount,13983=>1))
		{
		$myclass=$npc->GetClass();
		if ($myclass == 41) # Fake Slansin Merchant
			{
			quest::say("Ha!! What a fool!! I have stolen another potion to add to the crate. I shall make a fortune!! The real Slansin is in back. Now it is time for me to leave.");
			# Factions verified on live.
			quest::faction(229,2); # +Coalition of Tradefolk
			quest::faction(336,2); # +Coalition of Tradefolk Underground
			quest::faction(329,1); # +Carson McCabe
			quest::faction(230,1); # +Corrupt Qeynos Guards
			quest::faction(330,1); # +Freeport Militia
			quest::depop(23001);
			}
		else
			{
			quest::say("Thank you. I have been expecting this. We require it for mixing.");
			# Faction verified on live
			quest::faction(265,1);  # +Heretics
			quest::faction(231,-1);  # -Craftkeepers
			quest::faction(266,-1); # -High Council of Erudin
			quest::faction(267,-1); # -High Guard of Erudin
			quest::exp(50);
			quest::ding();
quest::ding();
			quest::depop(23081);
			}
		}
	}

#END of FILE Zone:erudnint  ID:23001 -- Slansin
