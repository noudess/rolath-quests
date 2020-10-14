sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome to our temple.  We are the paladins of the Church of Underfoot.  I am lord of our holy order.  I call upon you to assist us in the defense of Kaladim.  Speak with the master paladins or priests and find ways to prove your allegiance to Brell."); 
		}

	if ($text=~/honored member/i)
		{
		if ($faction < 5)
			{
			quest::say("Yes.  The light of righteousness shines from within you.");
			}
		elsif ($faction == 5)
			{
			quest::say("Welcome to our temple.  We are the paladins of the Church of Underfoot.  I am lord of our holy order.  I call upon you to assist us in the defense of Kaladim.  Speak with the master paladins or priests and find ways to prove your allegiance to Brell.");
			}
		else
			{
			quest::say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!");
			}
		}

	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 18768 => 1)) #Dusty Tunic
		{
		#Faction verified on ZAM and live
		quest::summonitem(13514);
		quest::faction(227, 100);
		quest::faction(274, 100);
		quest::faction(293, 75);
		quest::exp(100);
		quest::ding();
		}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:kaladimb  ID:67029 -- Datur_Nightseer 
