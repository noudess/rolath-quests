my $groom=0;
my $works=0;

sub EVENT_SAY
	{
	quest::say("Welcome, $name.  The ceremony for Deret and Tabure will begin shortly.");
	if ($name eq "Deret")
		{
		$groom=$userid;
		}
	}

sub EVENT_SIGNAL
	{
	if ($signal == 1) # Time to start
		{
		quest::shout("We are gathered here, in the Hall of Steel, to witness and bless the union of Battlemaster Deret to Guild Leader Tabure Ahendle.  I take great pride in being asked to deliver this cereony, as Tabure is a legend in this city, her service record spotless, even if her church attendence is not.");
		quest::emote("laughs quietly");
		quest::doanim(54);
		quest::settimer("vows",15);
		}
	if ($signal == 2) # Deret is done, now for Tabure.
		{
		quest::settimer("tabure", 4);
		}
	if ($signal == 3) # Both done.. pronouce
		{
		quest::settimer("pro", 10);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "vows")
		{
		quest::stoptimer("vows");
		quest::shout("The couple has asked for a very simple ceremony, limited to my blessing and their vows to each other.");
		quest::shout("Deret, will you begin?");
		quest::signalwith(1088,$groom); # Tell Tabure to face Deret.
		}
	if ($timer eq "pro")
		{
		quest::stoptimer("pro");
		quest::doanim(51);
		quest::shout("With joy in my heart, I now pronouce you Deret and Tabure Ahendle!  You may kiss the bride, just watch out for her sword!");
		quest::settimer("works", 5);
		}
	if ($timer eq "tabure")
		{
		quest::stoptimer("tabure");
		quest::doanim(64);
		quest::shout("Tabure?");
		quest::signalwith(1088,1); # Tell Tabure to start vows
		}
	if ($timer eq "works")
		{
		if ($works == 0)
			{
			$npc->CastSpell(30,$groom);
			$works = 1;
			}
		elsif ($works == 1)
			{
			$npc->CastSpell(119,$groom);
			$works = 2;
			}
		elsif ($works == 2)
			{
			$npc->CastSpell(214,$groom);
			$works = 3;
			}
		else
			{
			$npc->CastSpell(206,$groom);
			quest::stoptimer("works");
			}
		}
	}
