sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Great!! I have fifty acres to seed and now I have visitors stopping by to waste my time!!");
		}

	plugin::RESIDENT_SAY($text);
	}

sub EVENT_ITEM {

  plugin::RESIDENT_ITEM();
  plugin::return_items(\%itemcount);
}
