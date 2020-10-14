sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the Temple of Divine Light.  We are the Peacekeepers. followers of Quellious.  If you are a paladin of this temple. you can assist us by showing a [desire to protect the peace].");
		}
	else
		{
		if ($faction <= 4)
			{
			if($text=~/desire to protect the peace/i)
				{
				quest::say("It was a fine decision.  We are in need of your services.  It seems there is a disturbance in Toxxulia Forest.  There are poachers from other nations who have sought to cause turbulence among the creatures there.  Will you help us [catch the poachers] or are you skeptical about this mission?");
				}

			if($text=~/catch the poachers/i)
				{
				quest::say("The infidels are in Toxxulia Forest.  They have begun hunting the kobolds.  We have no love of the kobolds. but cannot allow the lands of Odus to be overrun by outsiders.  The ways of tranquility are balanced with harmony.  We will not allow chaos to take hold of our land.  Go and find these poachers.  Bring me their heads!!"); 
				}
			}
		elsif ($faction < 7)
			{
			quest::say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.");
			}
		else
			{
			quest::say("You have not done much to upset the Peacekeepers of this temple, but we must ask you to prove yourself to us before we may discuss things such as this.")
			}
		}
	}

sub EVENT_ITEM 
	{
	if ($faction <= 4)
		{
		if (plugin::check_handin(\%itemcount, 13825 => 1)) 
			{
			quest::say("You have served us well. The harmony of the forest shall be preserved. I have word that theses infidels were all working for one man. Find me evidence pertaining to this man. Surely one of these poachers has something which could aid in finding this man. We must stop him to stop the poachers. Go in peace.");
			quest::summonitem(10004);
			# cash and faction verified live
			quest::givecash(1,1,0,0);
			quest::faction(298, 5);
			quest::faction(266, 1);
			quest::faction(265, -1);
			quest::exp(500);
			quest::ding();
			}

		if (plugin::check_handin(\%itemcount, 7 => 1)) 
			{
			quest::say("Excellent work.  I have heard of this, Talym, before.  Bring me his head for further reward.");
			quest::summonitem(7681);
			quest::faction(298, 7);
			quest::faction(266, 1);
			quest::faction(265, -1);
			quest::exp(1000);
			quest::ding();
			}

		if (plugin::check_handin(\%itemcount, 13913 => 1)) 
			{
			quest::say("It is done!  Quellious will look favorably upon our church and we will look favorably upon you.  Go in peace,");
			quest::summonitem(15011);
			# Faction verified on live
			quest::faction(298, 10);
			quest::faction(266, 2);
			quest::faction(265, -2);
			quest::ding();
			quest::exp(100);
			quest::givecash(0,0,3,0);
			}
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:erudnext  ID:98041 -- Jras_Solsier 
