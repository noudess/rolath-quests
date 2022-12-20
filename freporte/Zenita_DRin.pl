sub EVENT_SAY
	{
	if ($text =~ /Hail/i)
		{
		quest::say("Greetings. I would love to chat with you, but I just realized something.. I do not waste time with whelps.");
		}
	if ($text =~ /lens/i)
		{
		quest::say("So you seek the Spare Lens. Yes. I have it. There are only two ways you can obtain it, [fight] the great Zenita or [play a game of chance].");
		}
	if ($text =~ /play a game of chance/i)
		{
		quest::say("Great. It is rather simple. I have five cards and only one is King Naythox. Find it. In order to get one card all you need to do is buy me a bottle of Innoruuks Kiss of Death from the barkeep in Chops N Hops. One bottle for one card. Return the King Naythox card to me and you shall get the Spare Lens.");
		}
	if ($test =~ /fight/i)
		{
		quest::say("Darn!! I was hoping not to hear that word, fight. Oh well."); quest::attack($name);
		}
	}

sub EVENT_DEATH
	{
	quest::say("You have no idea what a big mistake you made. Either my fellow rogues shall find you or the Freeport Mi.. Unnnghh.");
	}

sub EVENT_ITEM
	{

	if (plugin::check_handin(\%itemcount, 13121 => 1))  #Innoruuk's Kiss of Death
		{
		quest::say("Why, thank you!  Here is your card.  I hope it is the king.");
		quest::summonitem(
						  quest::ChooseRandom(
								 22293, 22294, 22295, 22296, 22297, 22298, 22299
							  ));
		}

	elsif (plugin::check_handin(\%itemcount, 22298 >= 1)) #King Card
		{
		quest::say("Why I will be.. You got it!! I thought I took it out of the deck... Er... Ahem. Very well. You win the Spare Lens fair and square. Here you are. Now get out of my sight.");
		quest::summonitem(13279);    # Phiz's lens
		quest::exp(50);
		quest::ding();
		}

	else
		{
		plugin::return_items(\%itemcount);
		quest::say("I don't want that!");
		}
	}

#END of FILE Zone:freporte  ID:10153 -- Zenita_DRin
