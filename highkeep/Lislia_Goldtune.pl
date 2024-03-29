#############
#Quest Name: Bard Mail Quest
#Author: RealityIncarnate
#NPCs Involved: Tralyn Marsinger, Eve Marsinger, Lislia Goldtune, Felisity Starbright, Jakum Webdancer, Ton Twostring, Idia, Sivina Lutewhisper, Ticar Lorestring, Marton Stringsinger, Drizda Tunesinger, Travis Two Tone, Silna Songsmith, Siltria Marwind, Tacar Tissleplay, Kilam Oresinger, Lyra Lyrestringer 
#Items Involved: Bardic letters: 18150-18167
#################

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Hail. $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
		}

	if($text=~/I am interested in delivering mail/i)
		{
		quest::say("I have messages that need to go to Freeport and to Qeynos.  Will you [deliver] mail [to Freeport] or [to Qeynos] for me?"); 
		}

	if($text=~/deliver to freeport/i) 
		{
		quest::say("Take this pouch of mail to Ton Twostring. You can find him at the bard guild hall. I'm sure he will compensate you for your trouble.");
		quest::summonitem("18164");
		}

	if($text=~/deliver to qeynos/i) 
		{
		quest::say("Take this pouch to Eve Marsinger. You can find her at the bard guild hall. I'm sure she will compensate you for your trouble.");
		quest::summonitem("18165");
		}
	}

sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 18152 => 1) || plugin::check_handin(\%itemcount, 18156 => 1)) 
		{
		quest::say("More mail - you have done us a noteworthy service!  Please take this gold for your troubles.  If you are interested in more work, just ask me.");
		quest::givecash(0,0,quest::ChooseRandom(8,9,10,11,12),0);
		quest::exp(100);
		quest::ding();
		# Verified on Live
		quest::faction(284,10); #league of antonican bards
		quest::faction(281,1); #knights of truth
		quest::faction(262,1); #guards of qeynos
		quest::faction(304,-1); #ring of scale
		quest::faction(285,-1); #mayong mistmoore
		}

	else 
		{
		quest::say("I have no need for that.");
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:highkeep
