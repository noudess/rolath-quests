sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		plugin::Autovtell("greet");
		quest::say("Hullo, I be Tukar da best Rubicite xpert in da world.  I be here squishing da lizards to collect more armor.  Tells you wat, I takes da chestplate you be wearin and gives you dis trinket back.  You knows yuz wants it!  Now yud best be gibin me it right now or maybe I just smash yur face in!");
		quest::emote("lets loose a loud fart and smiles gleefully.");
		quest::settimer("fart", 1);
		quest::say("Woooweee dat was a gud one!");
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer($timer);
	if ($timer eq "fart")
		{
		plugin::Autovtell("laugh");
		plugin::DoAnim("laugh");
		}
	elsif ($timer eq "part")
		{
		plugin::DoAnim("wave");
		plugin::Autovtell("part");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 4164 => 1))
		{
		quest::say("Haha, yuz is dumber den me, and dat's sayin a lot.  Here takes dis trinket and go squish sum more lizards.");
		quest::summonitem(232629); #Exchange Rubicite BP for Rolath Rubicite Augmentation of Regrowth
		quest::settimer("part",1);
		}
	}
