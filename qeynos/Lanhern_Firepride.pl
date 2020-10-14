sub EVENT_SPAWN
	{
	my $swills=0;
	}

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		if ($x == -278) # Only at the bar
			{
			quest::say("Why, hello there!!  What is a powerful adventurer such as yourself doing in a dive like this?  I hope it is buying little ol' me a drink...?");
			}
		}
	}

sub EVENT_ITEM
	{
	my $i = 13038; #Ogre Swill
	my $c = $itemcount{$i};
	$swills = $swills + $c;
	if($swills > 3) 
		{
		$swills=0;
		quest::say("Mmmmmm. Ahh... <Burp!>  Thank you.  Here is a little dona... <Hic!> dpna... <Hic!> mmoney for your generosity");
		# Faction and reward verified on live.
		quest::summonitem(13290,1); #donation 1
		quest::faction(291,1);
		quest::faction(223,-1);
		quest::faction(219,1);
		quest::faction(229,1);
		quest::faction(262,1);
		quest::exp(50);
		quest::ding();
		}
	elsif ($c > 0)
		{
		quest::say("Mmmmmm. Ahh... <Burp!>  That was delicious!  How about another?");
		}
	else
		{
		quest::say("Not really my favorite drink...");
		}
	}
