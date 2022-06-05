# Crush the Undead
# Created by Gonner

sub EVENT_WAYPOINT_ARRIVE 
	{
	if($wp == 4) 
		{
		quest::say("Your Excellency, we need to recruit a newcomer to find and infiltrate the Shrine of Bertoxxulous. The Shrine's eyes are watching all our moves.");
		quest::signal(1128,1)
		}
	}

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hail, noble $name. Remember to spread the words of [Karana] throughout the faraway lands on which you shall tread. We of the Temple of Thunder are looking for new members - good people who [wish to join our cause]. Let the call go out!"); 
		}

	if($text=~/join .+ cause/i)
		{
		quest::say("That IS good news! If you walk the righteous path of the Rainkeeper, Karana, then you are truly noble. I have need of someone like that. I must find someone to perform a [dangerous mission] or perhaps you would rather [seek out the Rat King] or [crush the undead]");  
		}

	if($text=~/crush the undead/i)
		{
		quest::say("Those who passed generations ago have had their bones exhumed and enchanted. Some evil force plagues this land with these evil skeletons. You will fight for us and crush the skeletons. Take this box and fill it with the bones of those creatures. We will not allow them to rise again and you shall earn our respect. Go forth and fight for Karana!");
		quest::summonitem(17941); # Box for bones  
		}

	if ($text=~/dangerous mission/i) 
		{
		if ($faction > 6)
			{
			quest::say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself. Now leave, sewer rat!");
			}
		else
			{
			quest::say("You must go into the catacombs and find a man named Drosco Finlayer. Pass him this note. He has been deep undercover in the Shrine of [Bertoxxulous] and will have directions to that vile place. To do this will surely show your allegiance to this temple.");
			quest::summonitem(18804);
			}
		}

	if ($text=~/seek out the rat king/i) 
		{
		quest::say("Under this city lie the catacombs of Qeynos. Somewhere down there lurks the Rat King. None have truly seen him, but we know of him. It is he who plagues us with the recent infestation of rats. Why? Who knows? We need a brave member to [hunt the Rat King].");
		}

	if ($text=~/hunt the rat king/i) 
		{
		quest::say("You are truly brave, young knight. Go to the catacombs. Find the Rat King. Bring me his head as proof of your noble deed. He must be stopped. Beware of his allies. May Karana watch over you.");
		}

	if ($text=~/Karana/i) 
		{
		quest::say("Karana, the Rainkeeper, is the provider of the storms.  If it were not for the storms of Karana, life would not flurish.  All should pay tribute to the Rainkeeper.");
		}

	if ($text=~/Bertoxxulous/i) 
		{
		quest::say("Bertoxxulous, the Plaguebringer, is the Lord of Disease.  It is he who smites Norrath with his diseases and imperfections.  Those who follow him are called [Bloodsabers].");
		}

	if ($text=~/Bloodsabers/i) 
		{
		quest::say("It is rumored that there is a shrine in the great city of Qeynos which pays homage to the Plaguebringer, Bertoxxulous. The members of this vile church of the damned are called the Bloodsabers. They are dreaded shadowknights, necromancers and evil clerics. It is our duty to destroy all who dare to pray to such a deity. Join our fight. Speak more of this matter with Chesgard Sydwend.");
		}
	}


sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13882 => 1)) # A box for bones 
		{  
		quest::say("You have done well. Let it be known to all that you fight for the Rainkeeper. Go and continue the battle.");  
		# Faction and XP verified on live
		quest::faction(280,10); # Knights of Thunder
		quest::faction(341,7); # Preists of Life
		quest::faction(262,7); # Guards of Qeynos
		quest::faction(221,-10); # Bloodsabers
		quest::exp(200);
		quest::ding();
		quest::summonitem(13006); # Water flask
		quest::summonitem(13015); # Loaf of Bread
		quest::givecash(5,0,0,0); # 5 Copper 2 Silver
		}

	if ($faction < 7 && plugin::check_handin(\%itemcount, 18805 =>1 )) 
		{
		quest::say("This is terrible news. It is good you did not find your grave in the catacombs. You completed your mission regardless of the odds of survival. The temple thanks you. We shall still require your service, Knight of Thunder. Events have transpired which put all agents of righteousness in danger. We cannot explain all as yet. Take this note to Freeport. You will give it to Eestyana Naestra at the Hall of Truth. Beware, now. The Shrine of Bertoxxulous now knows of your allegiance. Give me any other item");
		# Factions verified on live.
		quest::faction(280,50 );
		quest::faction(221,-50 );
		quest::faction(341,37 );
		quest::faction(262,37 );
		quest::exp(500);
		quest::ding();
		quest::givecash(0,0,8,0);
		quest::summonitem(18816);
		}

	if ($faction < 7 && plugin::check_handin(\%itemcount, 13288 =>1 )) 
		{
		quest::say("Ah, Drosco's Order of Thunder.  You are a truly honorable knight.  Many vile people would pay greatly for this medal.  I thank you for its return.  I shall honor you by rewarding you with a thunder staff.  Meant for young paladins of this temple.  Never let it leave your side.");
		# factions verified on live
		quest::faction(280,50 );
		quest::faction(221,-50 );
		quest::faction(341,37 );
		quest::faction(262,37 );
		quest::exp(500);
		quest::ding();
		quest::summonitem(6357);
		}

	if (plugin::check_handin(\%itemcount, 13396 => 1)) # Rat Kings head
		{
		quest::say("So it is true, he does... or did, exist.  Well done $name, take this for your trouble.");
		# XP and faction verified on live
		quest::faction(262, 37);
		quest::faction(280, 50);
		quest::faction(341, 37);
		quest::faction(221, -50);
		quest::givecash(7,5,5,0);
		quest::summonitem(plugin::RandomRange(2102, 2112));
		quest::exp(1958);
		quest::ding();
		}

	# Do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	plugin::return_items(\%itemcount);

	}

#END of FILE Zone:qeynos  ID:1043 -- Wolten_Grafe 

