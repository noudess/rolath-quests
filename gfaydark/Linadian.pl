sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Greetings!  Please look through my fine wares.  I have spent my whole life practicing my skills in tailoring.  I do my best to compete with the other local merchants, but I have yet to make a profit.  I pray to Tunare that my [banded orc vests] will finally bring me a few extra coins.");
		}
	elsif ($faction > 5)
		{
		quest::say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
		}
	elsif ($text =~ /banded orc vests/i)
		{
		quest::say("Glad you are interested!  I can create a leather vest I call a banded orc vest.  It will aid you in repelling any disease and offers quite a bit of protection in battle.  I will need some materials. For a Deathfist banded orc vest, I require two legionnaire pads worn by the clan Deathfist, one Deathfist slashed belt, and ten gold coins.  For a Crushbone banded orc vest, I require two legionnaire pads worn by the Clan Crushbone, one Crushbone belt, and one silk swatch.");
		}
	}

sub EVENT_ITEM
	{
	#:: Match two 13917 - Deathfist Slashed Shoulderpads, one 13916 - Deathfist Slashed Belt and 10 gold coins
	if ($faction < 6 && plugin::takeItemsCoin(0, 0, 10, 0, 13917 => 2, 13916 => 1))
		{
		quest::say("Grand doing business with you. Hold your nose. I can never get rid of the orc stench of the vests. That is why the other merchants do not pay me much for them.");

		#:: Give a 12187 - Banded Orc Vest
		quest::summonitem(12187);

		#:: Ding!!
		quest::ding();

		#:: Grant a small amount of experience
		quest::exp(100);

		#:: Set factions - Verified per ZAM
		quest::faction(276,  5);    #:: + Kelethin Merchants
		quest::faction(246,  1);    #:: + Faydark's Champions
		quest::faction(326,  1);    #:: + Emerald Warriors
		quest::faction(5001, 1);    #:: + Anti-mage
		}

	#:: Match two 13319 - Crushbone Shoulderpads, one 13318 - Crushbone Belt,, and one 16482 silk swatch
	if ($faction < 6 && plugin::takeItems(13319 => 2, 13318 => 1, 16482 => 1))
		{
		quest::say("Grand doing business with you. Hold your nose. I can never get rid of the orc stench of the vests. That is why the other merchants do not pay me much for them.");

		#:: Give a 12187 - Banded Orc Vest
		quest::summonitem(12187);

		#:: Ding!!
		quest::ding();

		#:: Grant a small amount of experience
		quest::exp(100);

		#:: Set factions - Verified per ZAM
		quest::faction(276,  5);    #:: + Kelethin Merchants
		quest::faction(246,  1);    #:: + Faydark's Champions
		quest::faction(326,  1);    #:: + Emerald Warriors
		quest::faction(5001, 1);    #:: + Anti-mage
		}

	#:: Return unused items
	plugin::returnUnusedItems();
	}
