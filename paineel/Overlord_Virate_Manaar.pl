my $messenger="noone";
my $fac=0;
my $c = 0;

sub EVENT_ITEM 
	{
	$fac = $client->GetModCharacterFactionLevel(265);	
	$c = $client;

	if (plugin::check_handin(\%itemcount, 232506 => 1))
		{
		$messenger = $name;
		quest::emote("opens the letter and starts to read");
		quest::settimer("reaction", 5);
		}
	else
		{
		quest::say("I have no need for this, $name.");
		plugin::return_items(\%itemcount);
		}
	}

sub EVENT_TIMER
	{
	my $cid = $c->CharacterID();
	my $cclass = $c->GetClass();
	my $crace = $c->GetRace();
	my $cdeity = $c->GetDeity();

	quest::stoptimer("reaction");

	if ($fac < -100)
		{
		quest::emote("looks at you and his face grows red");
		quest::say("What nerve you have to bring this to me.  I shall sever each and every one of your limbs!");
		$c->SetFactionLevel2($cid, 265, $cclass, $crace, $cdeity, -1);
		$c->SetFactionLevel2($cid, 473, $cclass, $crace, $cdeity, 5);
		quest::attack($messenger);
		}	
	elsif ($fac < 100)
		{
		quest::emote("looks at you and slowly tempers his anger.");
		quest::say("Leave me $messenger.  NOW.");
		$c->SetFactionLevel2($cid, 473, $cclass, $crace, $cdeity, 5);
		}
	else
		{
		quest::emote("peers at you, his anger with the letter quite evident");
		quest::say("I hope that you do not agree with this hogwash, $messenger.  Is it good that you have opened my eyes to this.");
		quest::say("You may go... NOW!");
		quest::ding();
		quest::exp(100);
		$c->SetFactionLevel2($cid, 265, $cclass, $crace, $cdeity, 1);
		$c->SetFactionLevel2($cid, 473, $cclass, $crace, $cdeity, 5);
		}
	quest::ding();
	}
