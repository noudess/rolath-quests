sub EVENT_DEATH_COMPLETE
	{
	my $killermob=$entity_list->GetMobByID($killer_id);
	my $c;
	my $head=0;
	my $activity=-1;
	my $fac=-1;

	if ($killermob->IsClient())
		{
		$c=$entity_list->GetClientByID($killer_id);
		}
	elsif ($killermob->IsPet())
		{
		my $owner=$killermob->GetOwnerID();
		$c=$entity_list->GetClientByID($owner);
		}

	if ($charid == 432)
		{
		$head = 232503;
		$activity=1;
		$fac=341;
		}
	elsif ($charid == 494)
		{
		$head = 232505;
		$activity=3;
		$fac=272;
		}
	elsif ($charid == 473)
		{
		$head = 232502;
		$activity=2;
		$fac=231;
		}
	elsif ($charid == 348)
		{
		$head = 232501;
		$activity=5;
		$fac=233;
		}
	elsif ($charid == 372)
		{
		$head = 232500;
		$activity=4;
		$fac=254;
		}
	elsif ($charid == 488)
		{
		$head = 232504;
		$activity=0;
		$fac=302;
		}
	elsif ($charid == 673) # Killing Urinak for testing
		{
		$head = 232504;
		$activity=0;
		$fac=214;
		}


	if ($activity > -1 && $c->IsTaskActivityActive(105, $activity))
		{
		my $ckilled = $c->CharacterID();
		my $cclass = $c->GetClass();
		my $crace = $c->GetRace();
		my $cdeity = $c->GetDeity();

		$c->SummonItem($head);
		$c->UpdateTaskActivity(105,$activity,1);
		$c->SetFactionLevel2($ckilled, $fac, $cclass, $crace, $cdeity, -50);
		}

	}
