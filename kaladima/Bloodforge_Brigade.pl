my $attacker="";

sub EVENT_SPAWN
	{
	my $cid = quest::get_data("kingkazon_aggroer");
	my $c = $entity_list->GetClientByCharID($cid);
	$attacker = $c->GetName();
	if ($x == -370)
		{
		quest::moveto(-385, -123, 11, 111, 1);
		}
	else
		{
		quest::moveto(-332, -122, 11, 393, 1);
		}
	quest::settimer("path", 5);
	}

sub EVENT_TIMER
	{
	if ($timer eq "despawn")
		{
		quest::stoptimer("despawn");
		quest::delete_data("kingkazon_aggroer");
		quest::depop();
		}

	if ($timer eq "path")
		{
		quest::stoptimer("path");
		quest::say("Now you shall know the skill of the Bloodforge Brigade!");
		quest::attack($attacker);
		quest::settimer("despawn",300);
		}
	}
