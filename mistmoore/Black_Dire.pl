#This is more for flavor than anything, and isn't really required

sub EVENT_SPAWN
	{
	quest::settimer("despawndire", 1800);
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		if ($class == "Shaman")
			{    #Part of Shaman Epic 1.0
			quest::say("So, you've come. I suppose my brothers have sent you to lead me back to their flock. Those fools are so blinded by their devotion they know nothing of life. If they only knew the power I've become, the luxuries I've amassed, the pleasures I've known, they too would leave that sour and unrewarding existence in seconds. You know, you could come to know what I have, shaman. You found me, which speaks of your intelligence; we could use you. What do you say, $name? [Will you join] my master Mayong Mistmoore?");
			}
		else
			{
			quest::say("Hello, $name.");
			}
		}
	if ($text =~ /will not join/i && $class == "Shaman")
		{    #Part of Shaman Epic 1.0
		quest::say("Good shaman, now bare your neck that I may show our master your devotion in death. The more blood you spill upon the grass, the more impressed our Lord Mistmoore will be. Then maybe, just maybe, you will be allowed to scour our kitchen floors in the eternity of unlife. TEAR him to pieces, my wolves!");
		quest::attack($name);
		}
	}

sub EVENT_ITEM
	{
	quest::say("I have no need for this, $name.");
	plugin::return_items(\%itemcount);
	}

sub EVENT_TIMER
	{
	if ($timer eq "despawndire")
		{
		quest::stoptimer("despawndire");
		quest::depop();
		}
	}
