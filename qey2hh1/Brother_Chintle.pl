sub EVENT_SAY
	{
	if($text=~/hail/i)
		{
		quest::say("Blessed are the followers of Rodcet Nife. Do you [seek the answers to life]?");
		}	
	elsif ($text=~/seek the answers/i)
		{
		quest::say("Take this. I urge you to visit the Temple of Life in Qeynos. The answers can be found therein.");
		quest::summonitem(18830);
		}
	elsif ($text=~/Trintle/i)
		{
		quest::say("Brother Trintle is a member of my order, the Priests of Life.  I take his watch from time to time.  The last I saw of him, he was met by some lady named Nomaria Dosenar.  She appeared to be a cleric of some kind, but I have never seen her in Qeynos.  Perhaps she is new to the Knights of Thunder.");
		}
	elsif ($text=~/Estle/i)
		{
		quest::say("Brother Estle spends most of his time at the merchant's homestead opposite this tree.  He is one of the young acolytes sent by the Temple of Life to assist the residents of the plains, as am I.");
		}
	}
