sub EVENT_SAY {
	if ($text=~/bloodforge brigade/i) {
		quest::say("The Bloodforge Brigade was created to take the place of the now defunct Irontoe Brigade. I hear they are a much stronger force to reckon with.");
	}
	elsif ($text=~/stormguard/i) {
		quest::say("In South Kaladim you will find the Stormguard, the warrior guild. They train on the arena grounds.");
	}
}

sub EVENT_SPAWN
	{
	quest::delete_data("kingkazon_aggroer");
	}

sub EVENT_AGGRO 
	{
	quest::say("I call for the Bloodforge Brigade, to my side at once!");

	# If not already being attacked.. spawn his guys
	my $attacker = quest::get_data("kingkazon_aggroer");
	
	if ($attacker eq "")	
		{
		#Get client character id and store for Bloodforge mobs.
		my $cid = $client->CharacterID();
		quest::set_data("kingkazon_aggroer", $cid, 300);

		#Spawn the kings assistants
		quest::spawn2(60082,0,0,-370,-160,11.13,510);
		quest::spawn2(60081,0,0,-350,-160,11.13,510);
		}
	}

