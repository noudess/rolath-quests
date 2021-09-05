# NAME: Toxdil
# QUESTS INVOLVED IN
#
#1 - Toxdils Poison
#2 - Burning Rapier

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i) 
		{
		quest::say("Correct. Toxdil is my name. No last name. I swear allegiance to no house nor guild. What brings you down here? Perhaps you seek my [deadly liquid], perhaps not. Whatever your reasons, I warn you to keep an eye out for the militia. They have begun to patrol the sewers.");
		}

	if($text=~/Nostahla/i)
		{
		quest::say("Nostahla is trying to help [Unsar] with his dilemna");
		}

	if($text=~/Unsar/i)
		{
		quest::say("Unsar what an idiot!  He's spent years trying to master one new spell and all he managed is to turn himself into a slithering fool.  Well I suppose if you bring me the right ingredients, I can make a vial of deadly poison that will either help cure him... or put him out of his misery for good!  Bring me some Taipan Venom, some Mamba Venom, a Choresine Sample and make sure they are all grade A.  I need the the purest you can find or it will be the end of Unsar for sure.  I'll need some Liquidised Snake too.  Bring me these 4 things and don't bother me again until you have them.");
		}

	if ($text=~/deadly liquid/i && $class eq "Rogue") 
		{
		quest::say("The deadly liquid I offer to rogues is called spider venom. I will be glad to make it for you, but first you must supply me with two snake venom sacs and my fee of 20 gold pieces. You may find the sacs upon the giant snakes of the Commonlands.");
		}

	if ($text=~/gems/i && $class eq "Rogue") 
		{
		quest::say("I have made an acquaintance with a certain gem and a [gem case]. I belive I still have one of the keys needed to open the case.");
		}

	if ($text=~/gem case/i && $class eq "Rogue") 
		{
		quest::say("I will give you the key on one condition. That you bring me what was once in the gem case. I belive the last I saw of it, I had sold it to a jewler... Yes, I think Noresa was her name.");
		}
	}

sub EVENT_ITEM 
	{

    if (plugin::check_handin(\%itemcount, 44811 => 1, 44781 => 1, 44796 => 1, 9762 =>1))
        {
        quest::say("Be careful $name, this vial of snake poison is deadly, but it should cure Unsar...");
        quest::summonitem(232627); #Vial of Snake Poison
        quest::updatetaskactivity(114,13);
        quest::ding();
        }
	
	if ($itemcount{14017} == 2 && $gold == 20) 
		{
		quest::ding();
		quest::summonitem(14016); # Snake Venom
		quest::exp(100);
		quest::ding();
		}

	if (plugin::check_handin(\%itemcount, 12353 => 1)) 
		{
		quest::say("The gem!! I would notice it's sparkle anywhere!! I cannot believe you are handing it back to me!! What a fool. Here you are fool. You can have this worthless key now.");
		quest::ding();
		quest::summonitem(12351); # A Tiny Key
		quest::exp(15000);
		quest::ding();
		}

	plugin::return_items(\%itemcount);
	}

#END of FILE Zone:freportw  ID:9123 -- Toxdil
