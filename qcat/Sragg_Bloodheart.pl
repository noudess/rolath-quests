sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18706)) { 
		$client->Message(15,"As you orient yourself amongst the filth and decay of the catacombs, a menacing figure turns to address you. 'I am Sragg Bloodheart. Should you wish to dedicate your pathetic life to the way of Bertoxxulous and learn the ways of the Shadowknight, read the note in your inventory and hand it to me to begin your training.'");
  }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18706  => 1)) { #Stained Cloth Note
		quest::say("Ah, another would-be soldier for the army of the Plaguebringer. Unmuz has just lost a few of his men, he'll have plenty of work for you. I'm sure. Begone!");
		quest::summonitem(13598); #Ruined Training Tunic*
		# Factions verified on live
		quest::faction(221,100); #Bloodsabers
		quest::faction(262,-15); #Guards of Qeynos
		quest::faction(296,10); #Opal Dark Briar
		quest::faction(341,-25); #Priest of Life
		quest::faction(230,5); #Corrupt Qeynos Guards
		quest::exp(100);
		quest::ding();
	}
	elsif (plugin::check_handin(\%itemcount, 18802  => 1) # parchment
			or plugin::check_handin(\%itemcount, 13718  => 1) # Note to Opal
			or plugin::check_handin(\%itemcount, 1353  => 1)) # Deciphered parchment
		{
		$note=$item1;
		quest::say("What have you brought me, worm? Hmm... This is disappointing. That Tovax has failed us for the last time. Your loyalty to Bertoxxulous and the Bloodsabers has been noted. Now, if you will excuse me a moment.....");
		quest::ding();
		
		# Positive faction if we did this FOR priests of life
		if (plugin::check_hasitem($client, 1352, 1))
			{
			quest::faction(262,7); #Guards of Qeynos
			quest::faction(341,12); #Priest of Life
			}
		# negative if we're revealing the note as a friend to Sragg..
		else
			{
			quest::faction(262,-7); #Guards of Qeynos
			quest::faction(341,-12); #Priest of Life
			}

		# The think we're on their side in either case.
		quest::faction(221,50); #Bloodsabers
		quest::faction(296,5); #Opal Dark Briar
		quest::faction(230,2); #Corrupt Qeynos Guards
		quest::exp(125);
		quest::emote("evokes a magical aura and summons Tovax to appear before him");
		quest::spawn2(4020,0,0,-315.6,418.35,-38.22,108);
		quest::signal(4020, 15000);
		quest::updatetaskactivity(56,3,1);

		# Limit reward to one per account
		my $accountid=$client->AccountID();
		my $limitvar="mayhem$accountid";
		if (!defined($qglobals{$limitvar}))
			{
			quest::setglobal($limitvar, 1, 7, "F");
			if (plugin::check_hasitem($client, 1352, 1))
				{
				quest::summonitem(1372);
				}
			else
				{
				quest::summonitem(1373);
				}
			}
		else
			{
			quest::say("Your account has already been blessed with this item");
			}
		}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	}
	plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL
	{
	if ($note == 13718)
		{
		quest::say("I get private notes from a stranger?!  What if someone deciphered this?  Do you think we want my association with this necromancy known to all?");

		}
	elsif ($note == 1353)
		{
		quest::say("You lost the incantations and they were deciphered?  The Lifers could know everything!  FOOL!");
		}
	else
		{
		quest::say("I get private notes from a stranger?!  And what if Rineval had gotten her hands on certain other correspondance?  What then?");
		}
	quest::say("I will hear no more excuses, Tovax! Enjoy eternal pain and suffering!");
	quest::attacknpctype(4020);
	}
