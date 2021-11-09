my %muted;
my %emitters = (
	-740 => { "m" => "The home of the golems opens up before you.  Their massive forms have made great indentations in the ground."},
	-144 => { "m" => "The banners of this once great city are hung on the walls with pride.  The tattered and worn fabric is rough to the touch, yet very brittle."},
	-101 => { "m" => "The summoned creatures seem to gain in power the closer you get to the heart of the old city."},
	-155 => { "m" => "The buildings nearby are obviously aged, but more than that, they appear to have defended against a great battle.  Several doors are lying about, off their hinges, while others seem to be unable to be opened."},
	292 => { "m" => "The walls of this building lie in ruin near your feet.  You step thru the wall into what appears to be a dining room or banquet hall of some sort."},
	827 => { "m" => "The hallways twist and turn around you and you notice the absense of noise.  It's too quiet."},
	434 => { "m" => "The pool of water at your feet is unusually clean, the retaining walls free of moss or other growth you would expect."},
	735 => { "m" => "There are several water lines and markings on the walls indicating a great flood within these very halls.  Touching the markings brings to mind two questions:  Did the residents drown... or was there a fouler fate for them?"},
	531 => { "m" => "The structure before you appears to be a temple of some sort.  You feel like you are being watched by the cold still eyes of the gargoyles perched upon the corner of the walls.  A cold breeze rushes by you and makes you shiver."},
	-16 => { "m" => "The torches nearby crackle and spark, illuminating the nearby area."},
	261 => { "m" => "Before you lies a great tower and what lives there is a mystery. The sound of rushing water emanates from the entryway."}
);

sub EVENT_SPAWN
	{
	quest::set_proximity($x-40, $x+40, $y-40, $y+40, $z-10, $z+10);
	}

sub EVENT_ENTER
	{
	my $ex = $npc->GetX();
	$tname = $name . $ex;
	if ($muted{$tname} == 0)
		{
		$msg = $emitters{$ex}{m};
		$client->Message(0,$msg);
		$muted{$tname} = 1;
		quest::settimer($tname, 60);
		}
	}

sub EVENT_TIMER
	{
	quest::stoptimer($timer);
	$muted{$timer} = 0;
	}
