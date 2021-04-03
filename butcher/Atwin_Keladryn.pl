#BeginFile: butcher\Atwin_Keladryn.pl (68076)
#Quest file for Butcherblock Mountains - Atwin Keladryn: Beetles of the Estate

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("What are you looking at? Yeah, I'm a half elf, so what? I'm only here because my father is off gallivanting around looking for treasure off in some hidden dungeons somewhere. I wish I could have gone. It sounds like more fun than 'holding down the fort,' as he called it. He asked me to keep some of the local ruffians busy with some [tasks], but I don't see any reason why you can't help, that is, if you're interested."); 
		}
	if ($text =~ /task/i)
		{
		if (($ulevel > 9) && ($ulevel < 21))
			{
			if (quest::istaskactive(15))
				{
				quest::say("Beetles of the Estate is already in progress.");
				}
			else
				{
				quest::taskselector(15);    #Task: Beetles of the Estate
				}
			}
		else
			{
			quest::say(
				  "I don't have any tasks suitable to one of your experience.");
			}
		}
	}

sub EVENT_ITEM
	{
	quest::say("I have no use for this, $name.");
	plugin::return_items(\%itemcount);
	}

#EndFile: butcher\Atwin_Keladryn.pl (68076)
