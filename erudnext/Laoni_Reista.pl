my $ACCEPTED=1;
my $REJECTED=0;
my $TURNIN=1;
my $HAILIN=0;

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Very good to make your acquaintance. $name. If you are a [new knight]. then let it be known. for I am seeking young knights of Deepwater.");
		}
	elsif($text=~/i am a new knight/i)
		{
		if (faction_reject($HAILIN) == $ACCEPTED)
			{
			quest::say("You do seem a bit young. We shall have to test your mettle. Within this temple. you shall learn to swim as fast as the swordfish and attack with the bravery and skill of the shark. Are you willing to [assist with the cleansing of the ocean]?");
			}
		}

	if($text=~/assist with the cleansing of the ocean/i)
		{
		if (faction_reject($HAILIN) == $ACCEPTED)
			{
			quest::say("Go to the waters near the harbor. We have heard of Qeynos' rogue guild attempting to smuggle our valuable Vasty Deep water from Odus by way of swimmers. We require proof of their involvement. It is said they often carry special coins. Return one of these coins to me."); 
			}
		}
	}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13881 => 1)) 
		{
		if (faction_reject($TURNIN) == $ACCEPTED)
			{
			quest::say("Good work. You have shown these rogues who are the better swimmers. Now we have proof of their involvement. You are a fine addition to the temple. Take this small reward. Go, and serve Prexus.");
			# Faction verified on live
			quest::faction(242, 10);
			quest::faction(266, 1);
			quest::faction(265, -1);
			quest::exp(100); # xp verified close
			quest::givecash(9,0,0,0);
			quest::summonitem(quest::ChooseRandom(10004,10005,10009,10010,10011));
			quest::ding();
			}
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	}

# This lady only rejects some based on faction.  Oddly he wont give the list of tasks,
# but he will respond to some of the more direct questions.

sub faction_reject()
	{
	if ($faction >= 5 && $_[0] == $TURNIN)
		{
		quest::say("A gift for the needy?  Very thoughtful.  May Prexis watch over you.");
		return $REJECTED;
		}
    elsif($faction > 5) 
		{
		quest::say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
		return $REJECTED;
    	}
    elsif($faction == 5) 
		{
      	quest::say("There is no reason to dislike you, but we of the Deepwater Knights must see more done for our cause before we truly accept you.");
		return $REJECTED;
    	}

	return $ACCEPTED;
	}
#END of FILE Zone:erudnext  ID:24065 -- Weligon_Steelherder
