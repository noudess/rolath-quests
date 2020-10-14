#Qeynos Badge of Honor (Badge #4)
#Author: Drool & Neysa

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Who are you and what are you doing here? This place is not safe. You are to leave here immediately! You do not belong here!"); 
		}
	if ($text=~/is dead/i) 
		{
		quest::say("So he did not make it, that is a shame. I managed to defeat all of the enemies. It was difficult but they were no match for one of my skill. Did Vegalys send you?");
		}
	if ($text=~/Vegalys sent me/i) 
		{
		quest::say("So Vegalys sent you to check on our progress then? I don't believe you. Prove it!");
		}
	if ($text=~/ready to complete the mission/i) 
		{
		quest::depop(45200);
		quest::spawn2(45201,0,0,-49,376,-38.22,260);
		quest::spawn2(45202,0,0,-49,393,-38.22,260);
		quest::spawn2(45203,0,0,-49,411,-38.22,260);
		quest::signalwith(45201,$charid);
		}
	}

sub EVENT_ITEM 
{
	if (plugin::check_handin(\%itemcount, 2694 => 1)) 
		{
		quest::say("Well, well! Vegalys did send you after all. Are you [ready to complete the mission]? I am certain I know where Azibelle is hiding.");
		quest::summonitem(2694);
		}
}
