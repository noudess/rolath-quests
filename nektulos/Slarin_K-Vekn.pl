sub EVENT_SPAWN
	{
	quest::settimer("try_sit", 5);
	}

sub EVENT_TIMER
	{
	if($timer eq "try_sit")
		{
		$npc->SetAppearance(1);
		}
	}

sub EVENT_DEATH
	{
	quest::stoptimer("try_sit");
	}

sub EVENT_SAY
	{
	if($text=~/Hail/i)
		{
		quest::emote("peers at you with glazed eyes from beneath heavy eyelids 'You do not seem to be near death. If you have come to the [Ultricle] to salvage from the dead lika a scavenger wolf then go about your business and leave me to suffer.'");
		}

	if($text=~/Ultricle/i)
		{
		quest::say("Most of the dead that rises here is Teir`Dal as would be expected, but there are undead creatures that burrow from deep within this soil that are human dead from a time before we Teir`Dal emerged into the Nektulos from the underfoot of Norrath. Neither the Teir`Dal nor the Human dead that rises here attacks me or the others that are barely clinging onto life, perhaps it is because they sense we will soon be joining them in death.");
		}
	}
