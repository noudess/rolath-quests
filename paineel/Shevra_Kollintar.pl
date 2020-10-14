sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Unless you intend to [make yourself useful], do not bother me.  I await the return of our Lord, Cazic-Thule.  He comes, and I shall be the first to greet Him.  I will train you, if need be, for He looks upon those who aid Him kindly.  If you are not here for training, return to your meditations or bother someone else.");
	}
	if($text=~/make myself useful/i){
		quest::say("One of our spies has reported a sighting of Malik Zaren, a courier of [the High Council].  He was seen resting at an inn called 'Golden Roosters' in High Pass Hold and is en route to Erudin Palace. He may be carrying a message containing information of great value to us.  Hunt him down and return to me with the letter he carries. I will reward you for this task.");
	}
	if($text=~/the high council/i){
		quest::say("The High Council is the governing board of Erudin, our sworn enemies.  Beware of these types, they will not look upon you warmly.");
	}

	if (quest::istaskcompleted(74) && !quest::istaskcompleted(105))
		{
		if ($text=~/betrayal/i)
			{
			quest::say("So, only when summoned do you have the intestines to look into my eyes.. this disgusts me.  I can see only one [way] for me to allow you to remain in my service.");
			}

		if ($text=~/way/i)
			{
			quest::say("I require you to kill, disembowel, and bring the heads of any of the criminals that have slain our dogs to Antus, head of the Necromancers.  Nothing short of that will allow me in good conscience to allow you to remain in our city.");
			if(!quest::istaskactive(105))
				{
				quest::assigntask(105);
				}
			}
		}
}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 12270 => 1)) 
		{ #sealed letter
		quest::say("Ah, excellent work.  I certainly had my doubts about you, $name.  Wear this well.");
		quest::ding();
		quest::summonitem(quest::ChooseRandom(3040,3042,3043,3044,3046,3047,3048,3049,3050,3051)); #random blackened iron
		# Faction verified on live
		quest::faction(265,25);  #Heretics
		quest::faction(242,-25);  #Deepwater Knights
		quest::faction(254,-25); #Gate Callers
		quest::faction(231,-25);  #Craftkeepers
		quest::faction(233,-25);  #Crimson Hands
		quest::exp(250);
		}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
	}
#END of FILE Zone:paineel  ID:75109 -- Shevra_Kollintar 
