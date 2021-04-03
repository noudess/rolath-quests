sub EVENT_SAY
    {
	$mg628=$client->GetModCharacterFactionLevel(322);
    if ($text =~ /hail/i)
        {
        quest::say("Welcome to the mines of Kaladim!");
        }
	elsif ($faction > 5)
		{
		quest::say("The word around the mines is that you are not to be trusted. You'd best leave before my dagger finds a new home in your back.");
		}
	elsif ($mg628 < 200)
		{
		quest::say("Don't take this personally, but I can't quite trust you with such matters. Maybe a few less Butcherblock bandits would prove your worth.");
		}
    elsif ($text =~ /earn mining pick 628/i)
        {
        if ( plugin::check_hasitem( $client, 12166 ) )
            {    #Parrying Pick 628
            quest::say("So you have heard of Mining Pick 628 and feel you are ready to wield one? You shall earn one with the return of the ogre head of [Boog Mudtoe] and the 300 gold pieces he still owes me. Don't return unless you have the head and the 300 gold!");
            }
        else
            {
            quest::say("I do not think you are ready for such power. You need to prove yourself first. Maybe you should go talk with Diggins."); #Text made up
            }
        }
    elsif ($text =~ /Boog Mudtoe/i)
		{
        quest::say("Boog Mudtoe is one of the last remaining ogres of the Mudtoe clan. We helped him escape the assault of the Stormguard for a small fee. Unfortunately for him, we have come to believe his head to be more valuable than the fee. We hear there is someone near the port of Butcherblock who knows of the Mudtoe's whereabouts.");
		}
    }

sub EVENT_ITEM
    {
	$mg628=$client->GetModCharacterFactionLevel(322);
    my $cash = $copper + $silver * 10 + $gold * 100 + $platinum * 1000;
    if ($mg628 > 199 && plugin::check_handin( \%itemcount, 13316 => 1 ) )
        {             #Ogre Head
        if ( $cash >= 30000 )
            {         #300 gold
            quest::say("Very good! You found him. His head shall bring us a great reward from the Stormguard. And as for you, here is your Mining Pick 628. Only a member of 628 can wield this fine weapon. We are the only ones who can wield it in such a way as to pierce our foes");
            quest::summonitem(12161);    #Miners Pick 628
			# Factions verified on live
			quest::faction(322,30);
			quest::faction(223,-1);
			quest::faction(379,-1);
			quest::faction(241,1);
			quest::faction(244,-4);
            }
        else
            {
            quest::say("It seems you are a little short on gold pieces...");
            quest::summonitem(13316);    #Ogre Head
            quest::givecash( $copper, $silver, $gold, $platinum );
            }
        }
    elsif (plugin::check_handin( \%itemcount, 18767 => 1 ))
        {                                #Small, Folded Note
        quest::say("Ah, welcome! We could use some fresh blood around here. The name's Mater, and I run this little outfit. Work hard for me, and I will reward you well. Cross me, and you'll find yourself buried under the mine cap. Once you are ready to begin your training please make sure that you see Crovsar Dirkbringer, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
        quest::summonitem(13516);        #Ruined Miner's Tunic
		# Factions verified on live
		quest::faction(322,100);
		quest::faction(223,-5);
		quest::faction(379,-5);
		quest::faction(241,5);
		quest::faction(244,-15);
        quest::exp(5); # XP estimated from live at level 2
        quest::ding();
        }

    plugin::try_tome_handins( \%itemcount, $class, 'Rogue' );
    plugin::return_items( \%itemcount );
    }

sub EVENT_SPAWN
    {
    quest::settimer( "repeat", 530 );
    }

sub EVENT_TIMER
    {
    quest::say("Blast all these pesky rats!! Jeet, you need to get one of the new rogues.. I mean miners, to get rid of them!!");
    quest::signal( 67018, 1 );
    }

#END of FILE Zone:kaladimb  ID:67019 -- Mater
