sub EVENT_SPAWN 
	{
	# Since arena boots early (zones boot alpha) set boats to startup config

	quest::spawn_condition("oot", 3, 0);
	quest::spawn_condition("oot", 4, 0);
	quest::spawn_condition("oot", 5, 0);
	quest::spawn_condition("oot", 6, 0);
	quest::spawn_condition("freporte", 6, 0);
	quest::spawn_condition("freporte", 3, 1);
	quest::spawn_condition("butcher", 5, 0);
	quest::spawn_condition("butcher", 4, 1);

	quest::spawn_condition("erudsxing", 7, 0);
	quest::spawn_condition("erudsxing", 4, 0);
	quest::spawn_condition("erudsxing", 5, 0);
	quest::spawn_condition("erudsxing", 6, 0);
	quest::spawn_condition("erudnext", 6, 0);
	quest::spawn_condition("erudnext", 7, 1);
	quest::spawn_condition("qeynos", 5, 0);
	quest::spawn_condition("qeynos", 4, 1);
	}
