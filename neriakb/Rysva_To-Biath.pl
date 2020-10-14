#Rysva_To-Biath.pl
#Book of Turmoil

sub EVENT_SAY 
	{
	if($text=~/Hail/i)
		{
		quest::emote("raises any eyebrow and glances at the bottles of liquor behind her.");
		}
	}
sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 18200 => 1))
		{
		quest::emote("Hands you a note and waves her hand in dismissal.");
		quest::summonitem(18201);#a note (book of Turmoil, Text: TomeOfAges2)
		#factions verified on ZAM
		quest::faction(370, 1);#Dreadguard Inner
		quest::faction(334, 1);#Dreadguard Outer
		quest::faction(236, 10);#Dark Bargainers
		}

	elsif(plugin::check_handin(\%itemcount, 13846 => 1))#Dark Elf Decapitated Head
		{
		quest::emote("Hands you a book and waves her hand in dismissal.");
		quest::summonitem(18202);#Book of Turmoil
		#factions verified on ZAM
		quest::faction(370, 1);#Dreadguard Inner
		quest::faction(334, 1);#Dreadguard Outer
		quest::faction(236, 10);#Dark Bargainers
		quest::exp(7000);
		quest::ding();
		}

	elsif(plugin::check_handin(\%itemcount, 19071 => 1, 19070 => 1) && $platinum >= 1000) 
		{
		quest::summonitem(18302);
		}

	else 
		{
		quest::emote("hands back the useless items.");#text made up
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:neriakb  ID:41042 -- Rysva_To`Biath 
