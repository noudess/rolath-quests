#############
#Quest Name: Yuio's Illness
#Author: RealityIncarnate
#NPCs Involved: Jali Kaliio, Khonza Ayssla, 
#Items Involved: Asp poison sac (16984), bamboo shoot (6973), kejekan palm fruit (6974), panda claws (6961), vial of healing liquid (6976), burlap satchel (17884)
#################

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Greetings, $race. You are welcome in [Kejek] so long as you do not offend the [spirits] of these lands.");
		}

	if($text=~/kejek/i)
		{
		quest::say("This is Kejek, our village on the peak of Mt. Klaw. It is here that we continue to cherish the customs and beliefs of our ancestors, the Vah'Shir. Our location here in the Stonebrunt Mountains and the protection of the spirits allows us to escape the persecution and war that is waged between our yellow furred cousins and the Erudites.");
		}

	if($text=~/what spirits/i)
		{
		quest::say("There are spirits around us always, the spirits of our ancestors, and the spirits of the beasts that have past on beyond the mortal realms. It is through our devotions to these spirits that we shaman are granted our mystical powers. A few of the more powerful spirits are capable of becoming flesh once again and wander the wild serving as protectors and guides.");
		}

	if ($faction > 6)
		{
		quest::say("You have done much to anger the spirits thus you are not accepted by our people.");
		}
	elsif($text=~/Jali sent me/i)
		{
		quest::say("Ah yes Jali, whose wife is ill. I have been looking for a cure for many moons. I do believe I can make one now if I had the proper ingredients. Unfortunately it will require the deaths of some of our lands creatures but the spirits will not be angered as it is for a noble cause. Perhaps you could [fetch them] for me?");
		}
	elsif ($text=~/Wakizashi/i)
		{
		quest::say("You seek the weapon of the mystics?  Perhaps if you gather some things I need for our medicine chest.  Would you [fetch them]?");
		}
 	elsif($text=~/fetch them/i)
		{
		quest::say("Take this satchel and please listen closely. I need the following and they need to be relatively fresh. So don't waste time with frivolous strolls through the jungle. I require two Panda Claws, two Tiger Skins, two Asp Poison Sacs, a Bamboo Shoot, and a Kejekan Palm Fruit, which you will need to find somewhere in the jungle. Once you have these items, combine them in the bag and return to me."); 
		quest::summonitem(17884);
		}
	}

sub EVENT_ITEM 
	{
	if ($faction <= 6 && plugin::check_handin(\%itemcount, 6975 => 1)) 
		{
		quest::say("I thought the kobolds would have you for dinner, but you made it back.");
		quest::me("Ayssla takes the satchel and begins to pour different vials of foul smelling liquid into it. She then takes the entire contents of the bag and dumps it into a large kettle and begins to chant in an unknown language. After a few minutes, she takes a small amount of the now boiling liquid and puts it in a vial.");
		quest::say("Take this vial back to Jali. I pray to the Titan Spirits that it works.");
		# Verified on Live
		quest::faction(473,5);
		quest::faction(298,1);
		quest::summonitem(6976);
		quest::ding();
		quest::exp(1000);
		}
	else 
		{
		quest::say("I have no need for that.");
		plugin::return_items(\%itemcount);
		}
	}

sub EVENT_SIGNAL
	{
	quest::say("More than you can imagine, sirrrr.  The desire and need for the use of the [Wakizashi] has only grown as the heretics grow more bold, and the number of the dogs of the snow seem to know no end.");
	}
