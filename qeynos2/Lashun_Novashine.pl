#BeginFile: Lashun_Novashine.pl
#Quest for North Qeynos - Lashun Novashine: Bone Chips (Qeynos)

my $ItemCount; #Bone Chip counter

sub EVENT_SPAWN 
{
  $ItemCount = 0;
}

sub EVENT_WAYPOINT_ARRIVE 
{
  if($wp == 13) 
	{
	quest::shout("Cease this endless conflict and seek salvation in the Temple of Life! The glory of Rodcet Nife awaits you!");
	}
  if($wp == 14) 
	{
	quest::shout("Cease this endless conflict and seek salvation in the Temple of Life! The glory of Rodcet Nife awaits you!");
	}
  if($wp == 15) 
	{
	quest::shout("Cease this endless conflict and seek salvation in the Temple of Life! The glory of Rodcet Nife awaits you!");
	}
  if($wp == 57) 
	{
	quest::say("Greetings, people of Qeynos! Are you lost? Has the chaotic life of an adventurer left you empty and alone? Seek redemption in the glorious light of the Prime Healer. Only through Rodcet Nife and the Temple of Life will you find true health and salvation.");
	}
}

sub EVENT_SAY 
{
  if($text=~/hail/i) 
	{
	quest::say("Well met, $name. My name is Lashun Novashine and I am a humble priest of Rodcet Nife, the Prime [Healer]. I wish to spread His word to every corner of Norrath. My job gets more difficult each day with so many so willing to take lives rather than preserve them.");
	}
  elsif ($text=~/healer/i)
	{
	quest::say("Yes, I am a healer.  I can heal you as well, if you would share some proof that you aid Ridcet Nife.  Perhaps 2 bones from the skeketons?");
	}
}

sub EVENT_ITEM 
{
  if(plugin::check_handin(\%itemcount, 13073 => 4)) #Bone Chips (4) Faction Verified on Live
	{
	quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
	$npc->CastSpell(17,$userid); #Light Healing - Verified on Live
	quest::faction(341,1); #Priests of Life
	quest::faction(280,1); #Knights of Thunder
	quest::faction(262,1); #Guards of Qeynos
	quest::faction(221,-1); #Bloodsabers
	quest::faction(219,1);   #Antonius Bayle
	if($ItemCount == 1) 
		{
		  quest::say("Ah good, I see you seek healing. But you must offer the remains of one more minion of Bertoxxulous before Rodcet will deem you worthy.");
		}
	}
  elsif(plugin::check_handin(\%itemcount, 13073 => 3)) #Bone Chips (3) Faction Verified on Live
	{
	if($ItemCount == 1) 
		{
		quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
		$npc->CastSpell(17,$userid); #Light Healing - Verified on Live
		quest::faction(341,1); #Priests of Life
		quest::faction(280,1); #Knights of Thunder
		quest::faction(262,1); #Guards of Qeynos
		quest::faction(221,-1); #Bloodsabers
		quest::faction(219,1);   #Antonius Bayle
		$ItemCount = 0;
		}
	else 
		{
		quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
		$npc->CastSpell(17,$userid); #Light Healing - Verified on Live
		quest::faction(341,1); #Priests of Life
		quest::faction(280,1); #Knights of Thunder
		quest::faction(262,1); #Guards of Qeynos
		quest::faction(221,-1); #Bloodsabers
		quest::faction(219,1);   #Antonius Bayle
		quest::say("Ah good, I see you seek healing. But you must offer the remains of one more minion of Bertoxxulous before Rodcet will deem you worthy.");
		$ItemCount = 1;
		}
	}

  elsif(plugin::check_handin(\%itemcount, 13073 => 2)) #Bone Chips (2) Faction Verified on Live
	{
	quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
	$npc->CastSpell(17,$userid); #Light Healing - Verified on Live
	quest::faction(341,1); #Priests of Life
	quest::faction(280,1); #Knights of Thunder
	quest::faction(262,1); #Guards of Qeynos
	quest::faction(221,-1); #Bloodsabers
	quest::faction(219,1);   #Antonius Bayle
	if($ItemCount == 1) 
		{
		  quest::say("Ah good, I see you seek healing. But you must offer the remains of one more minion of Bertoxxulous before Rodcet will deem you worthy.");
		}
	}
  elsif(plugin::check_handin(\%itemcount, 13073 => 1)) #Bone Chips (1) Verified on Live - NO Faction for 1 Bone Chip and NO Healing unless you have a leftover from a previous turnin
  {
    if($ItemCount == 1) 
	{
	quest::say("Very well, young one. May the light of the Prime Healer wash away your scars.");
	$npc->CastSpell(17,$userid); #Light Healing - Verified on Live
	quest::faction(341,1); #Priests of Life
	quest::faction(280,1); #Knights of Thunder
	quest::faction(262,1); #Guards of Qeynos
	quest::faction(221,-1); #Bloodsabers
	quest::faction(219,1);   #Antonius Bayle
	$ItemCount = 0;
	}
    else 
	{
	quest::say("Ah good, I see you seek healing. But you must offer the remains of one more minion of Bertoxxulous before Rodcet will deem you worthy.");
	$ItemCount = 1;
	}
  }
  elsif ($gold == 2) #Gold (2) Faction verified on live
  { 
    quest::say("Thank you for the donation to the Temple of Life. May Rodcet Nife cleanse your body of all ills.");
    $npc->CastSpell(213,$userid); #Cure Disease - Verified on Live
    quest::faction(341,1); #Priests of Life
    quest::faction(280,1); #Knights of Thunder
    quest::faction(262,1); #Guards of Qeynos
    quest::faction(221,-1); #Bloodsabers
    quest::faction(219,1);   #Antonius Bayle
  }
  else 
	{
	quest::say("I have no need for this, $name.");
	plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:qeynos2 ID:2032 -- Lashun_Novashine.pl
