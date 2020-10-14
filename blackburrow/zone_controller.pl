my $green_room_count=0;

sub EVENT_SPAWN
	{
	$green_room_count=0;
	quest::shout("Blackburow awakens");
	# Enable extra spawn spot.
	# This spot goes away later if bigwigs in green room.
	quest::spawn_condition("blackburrow", 3, 1);
	}

sub EVENT_SIGNAL
	{
	if ($signal == 100)
		{
		$green_room_count = $green_room_count + 1;
		quest::spawn_condition("blackburrow", 3, 0);
		}
	else
		{
		$green_room_count = $green_room_count - 1;
		if ($green_room_count <= 0)
			{
			$green_room_count = 0;
			quest::spawn_condition("blackburrow", 3, 1);
			}
		}
	}
