sub EVENT_SPAWN
	{
	quest::shout("ENOUGH!  Blackburrow will stand no more killing of it's residents.  Prepare to meet the doom of the Burrow!");
	quest::setglobal("gnoll_counter", 0, 3,"F");
	quest::SetRunning(1)
	}
