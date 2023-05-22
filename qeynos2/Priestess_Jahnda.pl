sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome to the Temple of Life. where the will of Rodcet Nife, the Prime Healer, is carried out.  I am the High Priestess Jahnda.  If you require any training in our ways. please talk to any of our priests or any of the paladins of the Temple of Life.");
		}
	if($text=~/Brother Estle needs the blessed oil/i)
		{
		quest::say("I do not distribute the blessed oil of life. Please speak with Nomsoe Jusagta. Tell Nomsoe that Brother Estle needs the blessed oil.");
		}
	if($text=~/brother hayle/i)
		{
		quest::say("Brother Hayle Mool is one of our finest clerics. He could convert anyone to the ways of Rodcet Nife. Recently, he has been out in the Plains of Karana trying to befriend the [Splitpaw clan]. I pray he has not become their prisoner or even worse, their dinner.");
		}
	if($text=~/splitpaw/i)
		{
		quest::say("Paw is a gnoll burrow. It is said to be located somewhere in the Plains of Karana. The gnolls of this burrow is rarely seen. The fur of these gnolls is white, unlike their brothers in Blackburrow.");
		}
	if ($text=~/undead/i)
		{
		if ($faction < 5)
			{
			quest::say("Undead?  Yes, yes..  There is a problem in the hills.  I have been meaning to talk to [Niclaus] about that.  Perhaps you would [take] a note to him?");
			}
		else
			{
			quest::say("I'm not sure I'm ready to speak with you about this matter.  We don't know you well enough. Perhaps spend some time helping Priestess Caulria?");
			}
		}

	if ($faction < 5 && $text=~/take/i)
		{
		quest::say("Very well and thank you.  Please find Niclaus in the Qeynos hills and deliver this message.");
		plugin::Autovtell("thanks");
		quest::summonitem(18970);
		quest::updatetaskactivity(55,0,1);
		}

	if ($faction < 5 && $text=~/Niclaus/i)
		{
		quest::say("Niclaus Ressinn is one of our paladins who was sent out to investigate the undead sightings in the Qeynos Hills.  I have a message for him, but I have been too busy here in Qeynos.  Couold you take this [note] to Niclaus?  Your help would be appreciated.");
		}

	if ($text=~/honored member/i)
		{
		if ($client->GetModCharacterFactionLevel(341) > 24)
			{
			quest::say("Yes.  The light of righteousness shines from within you.");
			}
		else
			{
			quest::say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
			}
		}
	}

sub EVENT_ITEM 
	{ 
	if($item1 == "18714")
		{
		quest::say("Welcome to the Temple of Life. I am Jahnda. the High Priestess of the Clerics of Nife. Wear this tunic with pride and carry out the will of Nife. Please. see Tonmerk Plorsin or Nomsoe Jusagta. They will help get you started spreading the will of The Prime Healer.  And be sure to find Filian Weagleross who will assist you in creating a set of armor for your protection.");
		quest::summonitem("13506");
		# Validated on live
		quest::faction(341,100); 	#Priests of Life
		quest::faction(280,30);		#Knights of Thunder
		quest::faction(262,50);		#Guards of Qeynos
		quest::faction(221,-25);		#Bloodsabers
		quest::faction(219,15);		#Antonius Bayle
		quest::exp("100");
		quest::ding();
		}

	#Give Jahnda the pouch of evidence
	if(plugin::check_handin(\%itemcount, 13724 => 1))
		{
		quest::say("Excellent work!  You are surely under the protection and guidance of the Prime Healer.  This evidence will help us greatly to convince Antonius and the guild leaders of Qeynos that the Bloodsabers are here and seek to destroy all we have worked so long for");
		# Faction verified on live
		quest::faction(341,50);    #Priests of Life
		quest::faction(280,15);     #Knights of Thunder
		quest::faction(262,25);     #Guards of Qeynos
		quest::faction(221,-12);     #Bloodsabers
		quest::faction(219,7);       #Antonius Bayle
		quest::givecash(0,3,4,0);
		# XP moved to task 55
		quest::ding();
		my $reward = plugin::RandomRange(1,100);
		if ($reward <= 56)
			{
			quest::summonitem(14007,4);
			}
		elsif ($reward <= 92)
			{
			quest::summonitem(14003, 4);
			}
		elsif ($reward <= 98)
			{
			quest::summonitem(1319);
			}
		elsif ($reward <= 100)
			{
			quest::summonitem(1323);
			}
		}

	if (plugin::check_handin(\%itemcount, 18802 => 1))
		{
		quest::say("This looks like something Roesager was after.  Take it to him and see if it is what he has been seeking.");
		quest::summonitem(18802);
		}
	elsif (plugin::check_handin(\%itemcount, 13718 => 1))
		{
		quest::say("I can't make anything out of this.  It needs to be deciphered.");
		quest::summonitem(13718);
		}
	elsif (plugin::check_handin(\%itemcount, 1353 => 1))
		{
		my $accountid=$client->AccountID();
		my $limitvar="mayhem$accountid";
		if (!defined($qglobals{$limitvar}))
			{
			quest::say("May the saints help our cause, I knew it was Sragg!  Wait here,  we will need to find a way to send you in undercover to resolve this once and for all.");
			quest::say("Here, $name.  Take this back and deliver it to Sragg.  You will need to hide your alliegences to get in.  Place this globe into your neck slot.  It should fool them for now.");
			quest::summonitem(1353);
			quest::summonitem(1352);
			quest::updatetaskactivity(56,2,1);
			}
		else
			{
			quest::say("May the saints help our cause, I knew it was Sragg!");
			quest::say("Here, $name.  Take this back and deliver it to Sragg, if you can somehow gain entrance. I unfortunately am out of illusion orbs.");
			quest::summonitem(1353);
			}
		}

	if($itemcount{13911} == 1)
		{
		quest::say("Oh my word!! This is terrible news. This belongs to [Hayle Mool]. He has been captured by the Splitpaw Clan while in Karana. You must go to his aid. We cannot do so at this time. Here. Be sure to hand him this summons. I will need to speak with him.");
		quest::summonitem(18927);
		}

	}
#END of FILE Zone:qeynos2  ID:2069 -- Priestess_Jahnda 

