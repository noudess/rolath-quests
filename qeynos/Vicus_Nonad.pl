my $list=0;
my $box=0;

sub EVENT_SPAWN {
	quest::settimer("cough",90);
	quest::set_proximity($x-50,$x+50,$y-50,$y+50);
	}

sub EVENT_ENTER
	{
	quest::settarget("entity",$mobid);
	plugin::SetAnim("sit");
	}

sub EVENT_TIMER {
	quest::emote("coughs and wheezes.");
	}

sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Greetings, $name.  My name is Vicus Nonad. <cough>  I am the official tax collector for the fine city of Qeynos. <cough>  I serve the will of Antonius Bayle, our glorious leader.  <cough>  <cough>  Please excuse my [cough].  <cough>");
		}
	if($text=~/what cough/i)
		{
		quest::say("Oh, <cough> I am sorry, but it seems I have fallen a bit ill.  I was caught out in the rain the other day and my chills have gotten the best of me. <cough>  Would you [help] me with today's collections..  <cough>");
		}
	if($text=~/help/i)
		{
		#:: Data bucket to verify quest has been started appropriately
		$key = $client->CharacterID() . "-tax-collection";
		#:: Set a data bucket, quest started
		quest::set_data($key, 1);
		quest::say("Oh thank <cough> you so <cough> <cough> much <cough>..  Here is the official collection box.  Please collect from each merchant on the <cough> [list].  Then bring me back the combined total of all your collections.");
		quest::summonitem(17012);
		}
	if($text=~/what list/i)
		{
		quest::say("Oh.  <cough>  I am sorry..  I forgot to give it to you.  Here you go.  Be sure to give that back when your job is finished.  <cough>");
		quest::summonitem(18009);
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 13181 => 1))
		{
		$box=1;
		if ($list == 0)
			{
			quest::say("<cough> That is good, but I also need the list I gave you!  I can't be expected to write another.");
			}
		}

	if (plugin::check_handin(\%itemcount, 18009 => 1))
		{
		$list=1;
		if ($box == 0)
			{
			quest::say("<cough> That is good, but I need the actual collection box filled.");
			}
		}

	if ($box == 1 && $list == 1)
		{
		quest::say("<cough> Great!  Thank you so much!  Here is a small gratuity for a job well cone.  Thank you again. <cough> Antonius Bayle and the People of Qeynos appreciate all you have done,");
		#:: Delete the data bucket
		$key = $client->CharacterID() . "-tax-collection";
		quest::delete_data($key);
		quest::faction(219,10); # Antonius Bayle
		quest::faction(262,4);  # Guards of Qeynos
		quest::faction(304,-5); # Ring of Scale
		quest::faction(273,-10);# Kane Bayle
		quest::faction(291,10); # Merchants of Qeynos
		quest::givecash(0,9,1,0);
		quest::ding();
		quest::exp(375);
		}
	}

#END of FILE Zone:qeynos  ID:1056 -- Vicus_Nonad 

