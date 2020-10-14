sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		if ($name eq "Deret")
			{
			quest::say("Hello my love.  What luck brings my handsome husband to my side today?");
			}
		else
			{
			quest::say("What have we here? Perhaps a future Ebon Strongbear? A [member of the Steel Warriors]? If the way of the warrior is not to your liking, might I suggest joining the League of Antonican Bards? The only damage you might take there is a sore throat! HAHAHA!");
			}
		}
	elsif ($faction > 4)
		{
		quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild."); 
		}
	elsif ($text=~/member of the Steel Warriors/i) 
		{
		quest::say("A warrior, you say? I have never met you. You must be from the [bunker] or perhaps just a new recruit. You should test your skills with Brin Stolunger. When you have done that, then, maybe you could [assist] me.");
		}
	elsif ($text=~/dangerous task/i) 
		{
		quest::say("A ship sank while returning from Odus. On this ship was my squire, Tombor. He sank to the bottom and there he still lies. With him went a map. I would very much like you to search for this sunken ship. Return the map to me. I am sure it is still in the rotting hands of Tombor.");
		}
	elsif ($text=~/bunker/i) 
		{
		quest::say("Far to the eastern coast of Antonica lies the great trade city of Freeport. It is there that our second chapter of Steel Warriors has built the arena called the bunker.");
		}
	elsif ($text=~/assist/i) 
		{
		quest::say("So, you think you can be of assistance to me? Let me test your skill. Travel to Erudin and seek out the beasts which are called Kobolds. I have never seen one and would very much like to have four Kobold Hides with which to make a rug. To do so would earn you some barely used rawhide armor - maybe even a shield.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction >= 5)
		{
		quest::say("I am sure the arena can make use of this donation.");
		}
	elsif (plugin::check_handin(\%itemcount, 13423 => 1)) 
		{
		quest::say("The map!! It is all blurred. The ink has run. I shall never be able to decipher it now. Still, I owe you for completion of your mission. May these be of assistance. It is always good for a warrior to be well supplied.");
		quest::summonitem(5082);
		quest::summonitem(13009,10);
		#Faction verified on live
		quest::faction(262, 1);
		quest::faction(281, 1);
		quest::faction(311, 5);
		quest::faction(230, -1);
		quest::faction(330, -1);
		quest::exp(500);
		quest::ding();
		quest::givecash(0,9,3,0);    
		}
	elsif (plugin::check_handin(\%itemcount, 13424 => 4)) 
		{
		quest::say("Incredible!! Such grand tones. It shall make a fine rug. You have shown me that you cannot always judge a book by its cover. You are quite skilled. Would you like to perform a [dangerous task] for me?");
		# Verified
		quest::faction(262, 4);
		quest::faction(281, 4);
		quest::faction(311, 20);
		quest::faction(230, -3);
		quest::faction(330, -3);
		quest::exp(200);
		quest::ding();
		# Get a reward.  2137-2148 are rawhide.
		# If we get 2149 - reroll a shield
		$reward=plugin::RandomRange(2137, 2149);
		if ($reward == 2149)
			{
			$reward=plugin::RandomRange(9001, 9008);
			}
		quest::summonitem($reward);
		quest::givecash(0,4,0,0);
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	}
#END of FILE Zone:qeynos  ID:1098 -- Tabure_Ahendle 
