sub EVENT_SAY 
{ 

if($text=~/Hail/i)
	{
	quest::say("Hail. $name!  My name is Roesager Thusten. Paladin of Life.  I am a loyal servant of the Prime Healer and I seek to destroy all who wish to bring [death and disease] to the land of Norrath."); 
	}

if($text=~/death and disease/i)
	{
	quest::say("Yes.  Disgusting waste of life.  It's that foul [Bertoxxulous] that corrupts."); 
	}
	
if($text=~/Bertoxxulous/i)
	{
	quest::say("Bertoxxulous is a vile creature who rules the Plane of Disease. His filthy followers are spreading their stain across all of Norrath. We fear they are already here in Qeynos, calling themselves the [Plaguebringers]."); 
	}

if($text=~/Plaguebringers/i)
	{
	quest::say("The Plaguebringers are followers of the disease lord, Bertoxxulous. We believe a sect of them now operates in Qeynos, but we need [proof] before we can act."); 
	}

if($text=~/proof/i)
	{
	quest::say("[Niclaus] reported seeing a Plaguebringer roaming about in the hills near Qeynos. We have long suspected that their dark influence was spreading. I am searching for proof that they are now here in Qeynos. If you find anything, please bring it to me at the Temple of Life."); 
	}

if($text=~/Niclaus/i || $text=~/undead/i)
	{
	if($faction < 5)
		{
		quest::say("Niclaus Ressinn?  Have you seen him?  He is one of our paladins who was sent out to investigate the undead sightings in the Qeynos Hills.  I have a message from Jahnda for him, but I must continue my own search here in Qeynos.  Could you take this to Niclaus?  Your help would be appreciated."); 
		quest::summonitem(18970);
	    quest::updatetaskactivity(55,0,1);
		}
    else
		{
		quest::say("I don't know you $name, why are you asking me a senstive issue?  Do some more work for us, and perhaps we can talk. Priestess Caulria needs help with the rabid animals I hear.");
		}
	}

}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 18802 => 1))
		{
		quest::doanim(27);
		quest::summonitem(14007);
		# Faction verified on live
		quest::faction(219,7);
		quest::faction(262,25);
		quest::faction(221,-12);
		quest::faction(280,15);
		quest::faction(341,50);
		quest::ding();
		quest::exp(400);
		quest::say("Rodcet be praised!! This is what we have been searching for! On behalf of the Temple of Life, let me thank you and offer you this small reward for your aid in our war against the Plaguebringer.  It is sad to hear that there are those in Qeynos that deal with the likes of Opal.");
		quest::say("WAIT HERE....");
		quest::emote("starts to think");
		quest::say("$name...  Take this back and deliver it to Sragg.  You will need to hide your alliegences to get in.  Place this globe into your neck slot.  It should fool them for now.  Maybe you can get more proof.");
		quest::summonitem(18802);
		quest::summonitem(1352);
	    quest::updatetaskactivity(56,1,1);
	    quest::updatetaskactivity(56,2,1);
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
			quest::say("Good LORD!  Sragg is resposible for all this?!!! I knew he was up to no good.  Damn Bertoxxulous and their foul minds.");
			quest::say("WAIT HERE....");
			quest::emote("starts to think");
			quest::say("$name...  Take this back and deliver it to Sragg.  You will need to hide your alliegences to get in.  Place this globe into your neck slot.  It should fool them for now.");
			quest::summonitem(1353);
			quest::summonitem(1352);
			quest::updatetaskactivity(56,2,1);
			}
		else
			{
			quest::say("Good LORD!  Sragg is resposible for all this?!!! I knew he was up to no good.  Damn Bertoxxulous and their foul minds.");
			quest::say("$name...  Take this back and deliver it to Sragg, if you can somehow get an audience without getting yourself killed.  Unfortunately we have no more magics to help get you in.");
			quest::summonitem(1353);
			}
		}
	else
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
		plugin::return_items(\%itemcount);
		}
	}


#END of FILE Zone:qeynos2  ID:2049 -- Roesager_Thusten 
