#Qeynos Badge of Honor (Badge #4)
#Author: Drool & Neysa

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::emote("coughs and struggles to move.");
		quest::say("There were... too many... too strong."); 
		}
	if ($text=~/too late/i) 
		{
		quest::emote("gasps clutching a wound");
		quest::say("Their magic was too powerful. Necromancers. Undead. Cursed knights of an unholy god. They left when they thought I was dead. But even now their curses sap the last of my life. I made it as far as I could. If Helminth lives, tell him [I am dead]. Please complete the mission. Bring this Azibelle to justice. Avenge me.");
		}
	}

sub EVENT_ITEM 
{
	if (plugin::check_handin(\%itemcount, 2694 => 1)) 
		{
		quest::say("Vegalys sent you. I'm done for. Guard Helminth found a false wall. We stepped through it. We were ambushed. I didn't see where Helminth went. He disappeared. I knew we were overwhelmed. I ran and feigned death but I knew [it was too late].");
		quest::summonitem(2694);
		quest::spawn2(45200,0,0,-49,376,-38.22,0);
		}
}
