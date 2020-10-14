sub EVENT_CLICKDOOR {
  if ($doorid == 3) { #Frozen Nightmare(mirb) zone in
    my $InInstanceMirB = quest::GetInstanceID("mirb",50);
    if($InInstanceMirB > 0){
      quest::MovePCInstance(237,$InInstanceMirB,607,1503,33);
    } else {
      $client->Message(13, "You are not a part of an instance!");
    }
  }
}

sub EVENT_LOOT
    {
	my $thetask=0;

    if ($looted_id == 72371 || $looted_id == 50808)
        {
		if ($class eq "Necromancer")
			{
			$thetask=104;
			}
		elsif ($class eq "Shadowknight")
			{
			$thetask=107;
			}

        if($thetask > 0 && !quest::istaskactive($thetask))
            {
            $client->Message(15, "This item is very cold to the touch.");
            quest::assigntask($thetask);
            }
        }
    }
