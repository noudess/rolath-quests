sub EVENT_WAYPOINT_ARRIVE 
	{
	if($wp == 6) 
		{
		quest::say("When will Wickystick send help?!");
		}
	}

  
sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Ahoy. mate!! The name's Fiddy Bobick! Perhaps you've heard of me.. the greatest halfling to sail the seas of Norrath? I have been to the North. South. East and West. and thank Prexus. I have survived it all!  Why I have returned to this little hollow is a wonder to me. Obviously. the salty air finally got to my brain!");
		} 
	if($text=~/lanena sent me/i)
		{
		quest::say("Well. it's about blasted time!  The ship was about to sink.  Wickystick finally managed to send the troops in!  The problem. mate. is piranha !!  What?!!  That's what I said.  Piranha!  The lake is infested with the little buggers.  More and more every sunrise.  They're chomping down all our food supply.  You have gotta get your can in the drink and kill them.  Take one of their teeth to old Wickystick and see what she has to say about Fiddy then!  I will also give you some booty for any teeth you pull out of this river.  Well. get going. Deputy $name!");  
		}
	}
  
  
sub EVENT_ITEM 
	{
	if($itemcount{13870} > 0)
		{
		quest::say("Whew!! We are sure on the way to saving this village, pal! They're gonna erect a statue in our names.  Fishslayers is what we are!  Let's keep up the good work!");
		plugin::mass_handin(13870, 1, \&ToothReward);
		quest::ding();

		}
	plugin::return_items(\%itemcount); # return unused items

	}

sub ToothReward
	{
	quest::summonitem(13015);
	#Factions verified on live
	quest::faction(292,1);	#Merchants of Rivervale
	quest::faction(241,1); 	#Deeppockets
	quest::faction(263,1); 	#Guardians of the Vale
	quest::faction(286,1); 	#Mayor Gubbin
	quest::faction(336,-1);	#Coalition of Tradefolk Underground
	quest::givecash(0,7,1,0);
	quest::exp(15);
	}
