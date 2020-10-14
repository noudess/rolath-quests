#WAR BOSS

sub EVENT_DEATH {

	# BOSS are down - send signal.
	quest::signalwith(166257, 100+$userid, 0);
}
