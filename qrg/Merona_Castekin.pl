# NPC: Merona_Castekin
# Zone: Qrg
# By Andrew80k

sub EVENT_SAY 
	{
	if($text =~ /Hail/i) 
		{
		quest::say("Oh, hello! Welcome to Surefall Glade. Are you planning a trip to Qeynos? If you are, I could use some help finding my [brother].");
		}

	if($text =~ /brother/i) 
		{
		if ($faction >= 6)
			{
			quest::say("You dare show your face around here, as bad as your reputation is with the Protectors of Jaggedpine? Begone, enemy of the forest!");
			}
		elsif ($faction >= 5)
			{
			quest::say("Well, I, and the Protectors of Jaggedpine, have noticed your helpful deeds so far...  just keep up the good work, and you will soon be trusted enough to handle such important matters.");
			}
		else
			{
			quest::say("My brother Ronn went to Qeynos several days ago for supplies. He was just going to Sneed's and back. But he hasn't been seen since. I can't leave the Glade because the Sabertooths could attack at any minute. Could you please find out what happened to my brother? Ask Sneed about [Ronn Castekin]");
			}
		}
	}

sub EVENT_ITEM 
	{
	if($faction <= 4 && plugin::check_handin(\%itemcount,18014=>1)) 
		{
		quest::say("Oh Tunare why!?!? Those foul Bloodsabers will pay for my brother's death!! Here. You have given us valuable information about a new threat to our homes. Take this a token of our appreciation.");
		#faction and EXP verified on love
		quest::faction(302,5);	#Protectors of the Pine
		quest::faction(272,1);	#Jaggedpine Treefolk
		quest::faction(306,-1);	#Sabertooths
		quest::faction(262,1);	#Guards of Qeynos
		quest::exp(190);
		quest::ding();
		quest::givecash(int(rand(10)),int(rand(10)),0,0);
        my $roll = plugin::RandomRange(1,100);
        if ($roll <= 6)
            {
            quest::summonitem(13184);
            }
        elsif ($roll <= 12)
            {
            quest::summonitem(13185);
            }
        elsif ($roll <= 75)
            {
            quest::summonitem(plugin::RandomRange(1001,1012));
            }
        elsif ($roll <= 100)
            {
			$reward = plugin::RandomRange(13006,13009);
            quest::summonitem($reward,4);
            }
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
	plugin::return_items(\%itemcount);
	}
