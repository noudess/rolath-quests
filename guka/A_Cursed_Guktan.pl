my $choice=0;

sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		$choice=quest::ChooseRandom(1,2,3,4,5);
		if ($choice == 1)
			{
			# Make Pet
			}
		elsif ($choice == 2)
			{
			# HEal Party (both right now - finding better options)
			quest::selfcast(3409);
			}
		elsif ($choice == 3)
			{
			# Mana to Party (both right now - finding better options)
			quest::selfcast(3409);
			}
		elsif ($choice == 4)
			{
			# Nothing
			}
		elsif ($choice == 5)
			{
			# Spawn more mobs.
			}
		}
	}

