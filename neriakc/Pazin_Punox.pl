#Pazin_Punox.pl
#Rogue Tome Handin/Rogue Master Sketch

sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the Hall of the Ebon Mask. You had best be a rogue or you have no business here. We have nothing to say to outsiders.");
		}
	if($faction <5 && quest::getlevel() <11)
		{
		if($text=~/I am a rogue/i)
			{
			quest::say("[Interested] in a king's reward $name?  I have just the task for you.");
			}
		if($text=~/interested/i)
			{
			quest::say("Find a troublesome young halfling girl, Lil Honeybugger, rumored to be found in the halfling thicket.  King Naythox has offered a bounty on her, so bring me back her head!");
			}
		}
	if ($text=~/dark assassin/i) 
		{
		quest::say("Aye we were visited by that dark assassin, he left some sketch in my safekeeping, I would gladly give you a copy if you would take care of a problem that has been vexing me.");
		}
	if ($text=~/vexing you/i) 
		{
		quest::say("An old student of mine who goes by the name Lon has disgraced this House; his betrayal to Innoruuk and Neriak is unforgivable.");
		quest::emote("grins 'He must be punished through deceit and trickery. Make him your friend, do as he asks, and pretend to be Redeemed as he calls it. Once you are Redeemed take the cursed blade of Ro and run it through his heart. Bring me his rapier and his head and I shall know the task is complete.'");
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 13890 => 1))#Lil Honeybuggers Head
		{
		quest::emote("laughs and hands you a potion and a worn dagger.");#text made up
		plugin::Autovtell("laugh");
		quest::say("Foolish young elf. This was no contract from King Naythox. I wanted Lil Honeybugger killed before she gave birth to my child. Only a naive dark elf would set foot in Halfling territory. Here's your great reward, garbage from other guild exploits");
		quest::summonitem(96462);#Garbage from other guild exploits
		quest::summonitem(7037);#Garbage from other guild exploits
		}
	elsif(plugin::check_handin(\%itemcount, 7041 => 1, 9438 => 1))#Burning Rapier, Lon's Head
		{
		quest::emote("laughs. 'Here, take this then!'");#text made up
		quest::summonitem(24095);#Vein Rot Sketch
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		#Preserved from original file
		plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
		quest::say("I don't need this.");#text made up
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:neriakc  ID:42075 -- Pazin_Punox 
