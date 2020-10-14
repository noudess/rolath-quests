# Accept signals to disable and enable grimling camp(s).
# Incoming signal is negative to turn off camp, positive to turn it on.
#
#
# (1, -1) is Dararin's raid camp
# More as we implement them,

sub EVENT_SIGNAL
	{
	if ($signal == -1)
		{
		quest::disable_spawn2(37684);
		quest::disable_spawn2(37687);
		quest::disable_spawn2(37715);
		quest::disable_spawn2(37742);
		quest::disable_spawn2(152159);
		quest::disable_spawn2(152160);
		quest::forcedooropen(68);
		}
	elsif ($signal == 1)
		{
		quest::settimer("Repop1", 45);
		}
	}

sub EVENT_TIMER
	{
	if ($timer eq "Repop1") 
		{
		quest::stoptimer("Repop1");

		# Do repops
		quest::enable_spawn2(37684);
		quest::enable_spawn2(37687);
		quest::enable_spawn2(37715);
		quest::enable_spawn2(37742);
		quest::enable_spawn2(152159);
		quest::enable_spawn2(152160);

		#Set Flag to Grimling
		quest::forcedoorclose(68);
		}
	}
