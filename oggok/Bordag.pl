sub EVENT_SAY 
	{
	if($text =~ /Hail/i)
		{
		quest::say('Hello. I am the guild master.');
		}
	}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 18846 =>1)) 
		{ #A tattered note
		my @task_array;
		push (@task_array, 81); # Ruthless Armor
		quest::say("You strong and mean like bear! You wear bear fur so all know you beastlord o' da Feerrott! Talk to Grapok and get to work!");
		quest::taskselector(@task_array);
		quest::faction(394, 15);
		quest::summonitem(13575); #Bear Fur Tunic
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
	plugin::return_items(\%itemcount);
	}
