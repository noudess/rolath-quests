sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::say("Hi, I'm Captain Orben, and I'm in charge of the troops and [volunteers] here at the Highpass West Gate. If you'd like to help us out, I'll pay you for every [gnoll] scalp you return to me.");
		}
	if($text=~/what volunteer/i)
		{
		quest::say("We set up this Volunteer Watch to help keep these beasts outta Highpass Hold. We get volunteers to stand watch at the gates, and pay them a small reward for every [gnoll] scalp they turn in.");
		}
	#[gnolls], [gnoll raids]
	if($text=~/gnoll/i)
		{
		# Verified on live.
		if ($client->GetModCharacterFactionLevel(332) >= -150)
			{
			quest::say("Well, these [gnolls] keep sending small raiding parties into Highpass. Thanks to the [Volunteer Watch] and myself, they never get past these gates. Sure keeps us busy, though.");
			}
		else
			{
			plugin::reject_say();
			}
		}
	} 

sub EVENT_ITEM 
	{
	#Player gives gnoll scalp
	my $scalps = 0;
	if (plugin::check_handin(\%itemcount,13792=>4)) 
		{
		$scalps=4;
		} 
	elsif (plugin::check_handin(\%itemcount,13792=>3)) 
		{
		$scalps=3;
		} 
	elsif (plugin::check_handin(\%itemcount,13792=>2)) 
		{
		$scalps=2;
		}
	elsif (plugin::check_handin(\%itemcount,13792=>1)) 
		{
		$scalps=1;
		}
	if ($scalps>=1) 
		{
		for ($i=0; $i<$scalps; $i++)
			{
			if ($client->GetModCharacterFactionLevel(332) >= -150)
				{
				my @randomGivenCopper = (0,1,2,3,4,5,6,7,8,9);
				my $copperGiven = ($randomGivenCopper[int(rand(scalar @randomGivenCopper))]);
				my @randomGivenSilver = (0,1,2,3,4,5,6);
				my $silverGiven = ($randomGivenSilver[int(rand(scalar @randomGivenSilver))]);
				my @randomGivenGold = (0,1,2,3);
				my $goldGiven = ($randomGivenGold[int(rand(scalar @randomGivenGold))]);
				my @randomGivenPlatinum = (0,1);
				my $platinumGiven = ($randomGivenPlatinum[int(rand(scalar @randomGivenPlatinum))]);
				quest::say("Great work! Maybe you can help us out again sometime?");
				quest::givecash($copperGiven,$silverGiven,$goldGiven,$platinumGiven);
				# Faction verified on live
				quest::faction(332,2);
				quest::faction(329,1);
				quest::faction(331,1);
				quest::faction(230,1);
				quest::faction(330,1);
				$client->AddLevelBasedExp(1,14);
				quest::ding();
				} 
			else 
				{
				#INCORRECT TEXT.  Faction is too low, eat items and laugh.
				quest::say("I will not aid beings such as you.");
				}
			}
		}

	plugin::return_items(\%itemcount); # return unused items
	}

#End of File, Zone:highpass  NPC:5036 -- Captain_Orben
