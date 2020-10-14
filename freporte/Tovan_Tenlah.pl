sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::say("I suppose you're one of Nestrals new employees, eh? Well if that's the case I can help get you outfitted with some [gear] necessary for people in this [line of work].");
		}

	if($text=~/gear/i)
		{
		quest::say("The first thing you need is a suit of sturdy traders clothing. Take this note to Verona Rankin and she'll help you with a suit tailored to your needs. Once you have been outfitted in your traders clothing return to me and I will inform you of your [next task].");
		quest::summonitem("19846");
		}

	if($text=~/line of work/i)
		{
		quest::say("We specialize in the acquisition and redistribution of rare and exotic goods. It may not sound like a very exciting job, but I assure you it is.");
		}

	if($text=~/next task/i)
		{
		quest::say("Ready to get to work are you? Listen carefully. Outside Freeports South gate you will find one of our employees, Rigg Nostra, who is acting as an intermediary between the Coalition of Tradefolk and some recently acquired business associates. Give him this card so he knows I've sent you and he will give you further instructions. Do not mention any of our names in public. The Freeport Militia would likely impose high taxes on the Coalition if they found out about the goods being exchanged to us by our new associates.");
		# Bent Playing Card ID-13903 (Not the Correct card but it will do)
		quest::summonitem("13903");
		}

	}

sub EVENT_ITEM
	{

	if (plugin::check_handin(\%itemcount, 19918 =>1 )) 
		{
		quest::say("'I appreciate your discretion in this matter. Now take this Coalition Dirk and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with smithing. Once you have completed this, take the dirk, this faceted gem, and a rattlesnake skin to Verona Rankin. She will reward you for your efforts.");
		quest::exp("100");
		quest::ding();
		# Faceted Blue Gem ID-19919
		quest::summonitem("19919");
		# Dull Coalition Dirk ID-19920
		quest::summonitem("19920");
		# Verified on live.
		quest::faction(336,5);
		quest::faction(229,5);
		quest::faction(329,1);
		quest::faction(230,1);
		quest::faction(330,1);
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
	plugin::return_items(\%itemcount);
	}

