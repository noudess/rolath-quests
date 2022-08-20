my $oldh;
my $key;

sub EVENT_SPAWN
	{
	quest::set_proximity($x - 15, $x + 15, $y -15, $y + 15);
	}

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Hello $name.");
		}
	elsif ($text =~ /Aderius/i || $text =~ /carrier/i || $text =~ /mail/i || $text =~/word/i || $text =~ /help/i || $text =~ /protection/i || $text =~ /good/i || $text =~ /alliance/i || $text =~ /friend/i)
		{
		if ($faction > 5)
			{
			quest::emote("glances at you awkwardly");
			}
		else
			{
			if ($text =~ /friend of Aderius/i)
				{
				quest::say("Do you have word on him or the progress being made?");
				}
			elsif ($text =~ /Aderius/i)
				{
				quest::say("You are a friend to Aderrrius?");
				}
			elsif ($text =~ /alliance/i)
				{
				quest::say("You know of the alliance?  How would you know this?");
				}
				elsif ($text =~ /carrier/i)
				{
				quest::say("Carrier!  That's not a word taken kindly by my people! ...  OH!  You mean the new mail route?  Do you have word?");
				}
			elsif ($text =~ /mail/i)
				{
				quest::say("You have worrrd of the new mail carrier?  Did Aderius send you?");
				}
			elsif ($text =~ /i have word/i)
				{
				quest::say("Ah, is the progress good?  Will the route be in place soon?  Our people urgently want to rrrreach an agreement with the Erudite scholars.  Their counterrrparts are wreaking havoc upon our lands.");
				}
			elsif ($text =~ /progress is good/i)
				{
				quest::say("Excellent.  Please inform any transporter of mail to check with me first.  The wild cats of our lands will not see them as friends.  I can help with that, though perhaps only long enough for them to get through.");
				quest::emote("purrs");
				}
			elsif ($text =~ /help/i)
				{
				quest::say("Yes, I can place a scent on them so that the wild ones will not attack.  Do you wish protection?");
				}
			elsif ($text =~ /protection/i)
				{
				$key = $client->CharacterID() . "-peepers-pee";
				START_SPRAY();
				}
			}
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "again")
		{
		plugin::DoAnim("falling");
		quest::stoptimer("again");
		quest::settimer("back", 1);
		}
	elsif ($timer eq "back")
		{
		quest::stoptimer("back");
		quest::moveto($x-1, $y-1, $z, $oldh);
		quest::emote("sniff the air surrounding you");
		quest::say("Yes, you should be fine for a bit...");
		}
	}

sub EVENT_ENTER
	{
	if ($race eq "Erudite" && $faction <= 6)
		{
		quest::say("$race, are you here with word?");
		}
	}

sub START_SPRAY
	{
	quest::say("Very well, hold still and I will spray you.");
	$oldh=$h;
	my $newh = ($oldh + 250) % 500;
	quest::moveto($x+1, $y+1, $z, $newh);
	plugin::DoAnim("falling");
	quest::settimer("again", 1);
	quest::faction(5007, 500, 1);
	
	# The character smells bad for 12 hours.
    quest::set_data($key, 1, 43200);
	}

sub EVENT_SIGNAL
	{
	quest::say("Korvik!  Good to see you sir!  I see your uniform is covered in Kobold bites!");
	START_SPRAY();
	}
