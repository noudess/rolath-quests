my @task_array=0;
push(@task_array,56);

sub EVENT_WAYPOINT_ARRIVE {
	if($wp eq 4) {
	$npc->SetAppearance(4);
	$npc->SetAppearance(0);
	}
	if($wp eq 5) {
	quest::SetRunning(1);
	}
	if($wp eq 6) {
	plugin::DoAnim("wave");
	}
	if($wp eq 7) {
	quest::say("Guard! Come quick! The undead gather near the ruins of Geupal!");
	quest::SetRunning(0);
	}
	if($wp eq 8) {
	$npc->SetAppearance(4);
	$npc->SetAppearance(0);
	}
	if($wp eq 9) {
	plugin::DoAnim("bash");
	}
	if($wp eq 10) {
	quest::say("Shh.. The fiends seems to dwell amongst the ruins. They wander off but eventually congregate back here. Shh.. OK NOW! RODCET PROTECT US!");
	quest::SetRunning(1);
	}
	if($wp eq 11) {
	quest::SetRunning(0);
	}
}


sub EVENT_SAY 
	{ 
	# Factions checked on live
	if ($faction >= 7)
		{
		plugin::reject_say();
		}
	elsif($text=~/Hail/i)
		{
		quest::say("Hail. $name.  I am Niclaus Ressinn. loyal Paladin of Life. I am scouting the Qeynos Hills on orders from High Priestess Jahnda.  We have received reports of [undead prowling] these hills of late."); 
		}
	elsif ($faction >= 6)
		{
		plugin::reject_say();
		}
	elsif($text=~/undead prowling/i)
		{
		quest::say("I believe the undead prowl these hills at night.  I have found the remains of several adventurers who obviously had the misfortune of running into some of Bertoxxulous' dark minions.  One young human was still cluching this [parchment] in his cold, dead fist."); 
		}
	elsif($faction >= 5)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif($text=~/parchment/i)
		{
		quest::say("I believe it is from a spell book of some kind and I do not have a working knowledge of things arcane.  Perhaps you could help?  Take it.  I am sure someone in Qeynos could decipher it.  I must remain here to gather more evidence but please return to me with anything you discover."); 
		quest::summonitem(13718);
		quest::taskselector(@task_array);
		}
	}

sub EVENT_ITEM 
	{
	if ($faction >= 7)
		{
		plugin::reject_say();
		}
	elsif(plugin::check_handin(\%itemcount, 18970 => 1))
		{
		#Give Niclaus note from Roesager
		quest::say("Oh, things are becoming dire here in Norrath.  May Rodcet protect us!  I have gathered most of the evidence I will need to present to Jahnda, but I could still use your assistance with one final piece.  I need to recover a rib bone from one of the undead beasts that wander these hills.  Be sure the rib bone comes from one of the putrid skeletons.  They are the spawn of Bertoxxulous");
		}
	elsif($faction >= 5)
		{
		quest::say("Priests of Life do not trust you well enough to accept your service.");
		}
	elsif(plugin::check_handin(\%itemcount, 13722 => 1))
		{
		#Give Niclaus a putrid rib bone
		plugin::Autovtell("thanks");
		quest::say("Excellent!  Rodcet smiles upon us this day!  Here, please take this pouch of evidence to Jahnda in the Temple of Life.  She will know what we must do.  I will remain here to keep an eye out for the minions of Bertoxxulous.  Also, accept this small reward as a token of my appreciation of your efforts to rid Norrath of the influence of the Plaguebringer.");
		# Faction verified on live
		quest::summonitem(13724);
		quest::faction(341,50);    #Priests of Life
		quest::faction(280,15);     #Knights of Thunder
		quest::faction(262,25);     #Guards of Qeynos
		quest::faction(221,-12);     #Bloodsabers
		quest::faction(219,7);       #Antonius Bayle
		quest::givecash(0,7,0,0);
		# Moved XP to the task in Qeynos Hills
		if (!quest::istaskactive(56))
			{
			quest::say("Perhaps you can do more for me?  Take a look at this.  I believe it is from a spell book of some kind and I do not have a working knowledge of things arcane.  Perhaps you could help?  Take it.  I am sure someone in Qeynos could decipher it.  I must remain here to gather more evidence but please return to me with anything you discover."); 
			quest::taskselector(@task_array);
			}
		}
	}

sub EVENT_TASKACCEPTED
	{
	quest::summonitem(13718);
	}

#END of FILE Zone:qeytoqrg  ID:4112 -- Niclaus_Ressinn 
