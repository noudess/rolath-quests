my $swings;

sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		if (quest::ChooseRandom(1,2) == 1)
			{
			quest::say("Grab a pick.  Give us a hand!");
			}
		else
			{
			quest::say("Can't you see we're busy here?"); 
			}
		}
	}

sub EVENT_SPAWN 
	{
	$swings=0;
	}

sub EVENT_SIGNAL
	{
	if ($y == -2570)
		{
		quest::say("Yes sir.");
		quest::say("We sure could use a cap for protection in here!.");
		$stopanim=0;
		}

	quest::settimer("Mining", 4);
	}

sub EVENT_TIMER
	{
	quest::doanim(47);

	if ($y == -2570)
		{
		if ($swings == 1)
			{
			quest::emote("mumbles that he is NOONE's PET");
			}
		else
			{
			quest::say("A skeleton's day is never done...");
			}
		}

	$swings = $swings + 1;

	if ($swings > 10 || $stopanim == 1)
		{
		quest::stoptimer("Mining");
		$stopanim=1;
		$swings=0;
		}
	}

sub EVENT_ITEM 
	{ 
	$mylevel=$npc->GetLevel();;
	# Only level 11 in this zone do the quest..
	if ($mylevel == 11)
		{
		if ($faction <= 7 && plugin::check_handin(\%itemcount, 13894 => 1))
			{
			$reward=quest::ChooseRandom(9304,12195,13073,13074); 
			quest::say("Aye.. You cut out the middleman..  I shall reward you.. hmm..  I have not found anything. how about..  <CRACK!! SNAP!! RIPP!!>  How about something off meself?");
			quest::summonitem($reward); 
			}
		else
			{
			plugin::return_items(\%itemcount);
			quest::say("I have no use for this.");
			}
		}
	}
#END of FILE Zone:tox  ID:78028 -- a_skeleton 

