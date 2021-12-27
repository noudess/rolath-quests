my $taskid=116;
my $containerid=17125;
my $robeid=20328;
my $titleid=82;
my $pre="Art Keeper";
my $fix="";

sub EVENT_SAY
	{
	if ($text =~ /hail/i)
		{
		quest::say("Welcome to the Keepers of the Art friend $name. I am Yuin Starchaser and it is my pleasure to assist new scholars wishing to study the arts of Enchantment, Wizardry, and Magery. Although much can be learned within these halls there is no substitute for experiences gained in the world outside Felwithe. The Koada'Dal have many enemies however, and it is wise to be prepared to face them. If you are new to the Keepers of the Art I will assist you in obtaining a [robe and clothing] suitable for study in the wilds.");
		}
	if ($text =~ /robe and clothing/i)
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("You will need this specially prepared Curing Kit to craft the Art Keepers clothing. The materials required vary depending on the piece of clothing you desire to craft. Once you have been outfitted in the garments return to me and you may be assistance with another [task]. Do you desire to craft a art keepers [cap], [wristband], [gloves], [boots], [sleeves], [pantaloons], or [robe]?");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}

	elsif ($text =~ /boots/i)
		{
		quest::say("To craft Art Keepers Boots you require two [silk thread], giant wasp worker pollen, a woven spider silk, and two ruined forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		quest::summonitem(19561);    #Tattered Boot Pattern
		}
	elsif ($text =~ /cap/i)
		{
		quest::say("To craft an Art Keepers Cap you will require two [silk thread], giant wasp worker pollen, and a woven spider silk. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
		quest::summonitem(19555);    #Tattered Cap Pattern
		}
	elsif ($text =~ /gloves/i)
		{
		quest::say("To craft Art Keepers Gloves you require two [silk thread], giant wasp worker pollen, two woven spider silks, and a ruined forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		quest::summonitem(19559);    #Tattered Glove Pattern
		}
	elsif ($text =~ /pantaloons/i)
		{
		quest::say("To craft Art Keepers Pantaloons you require two [silk thread], giant wasp warrior pollen, two woven spider silks, and two forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
		quest::summonitem(19560);    #Tattered Pant Pattern
		}
	elsif ($text =~ /robe/i)
		{
		quest::say("To craft an Art Keepers Robe you will require three [silk thread], giant wasp warrior pollen, two woven spider silks, and a pristine forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
		quest::summonitem(11395);    #Tattered Robe Pattern
		}
	elsif ($text =~ /sleeves/i)
		{
		quest::say("To craft Art Keepers Sleeves you require two [silk thread], giant wasp warrior pollen, a woven spider silk, and a forest drakeling scales. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		quest::summonitem(19557);    #Tattered Sleeves Pattern
		}
	elsif ($text =~ /wristband/i)
		{
		quest::say("To craft an Art Keepers Wristband you require a [silk thread], giant wasp drone pollen, and a woven spider silk. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		quest::summonitem(19558);    #Tattered Wristband Pattern
		}
	elsif ($text =~ /another task/i)
		{
		quest::say("One of the responsibilities of the Keepers of the Art is to weave and maintain powerful magic wards that help protect Felwithe from enemy magic. An understanding of the magic wielded by Felwithes many foes is vital to the success of our protective wards. With the help of the paladins of the Koada'Vie we have discovered many of the secrets of the orcish shaman that reside in the citadel of Clan Crushbone to the north of the Faydarks but there is still much to learn. The task I have to present you will take you into the [Crushbone Citadel] itself.");
		}
	elsif ($text =~ /crushbone citadel/i)
		{
		quest::say("The entrance to the Citadel can be found on the northern edge of the Greater Faydark. Once within the citadel seek out the Orc Thaumaturgist and obtain his book of spells. Once you are in possession of the Orc Thaumaturgists Spell Book return it to me so that the masters of the Keepers of the Art may study its contents.");
		}
	elsif ($text =~ /silk thread/i)
		{
		quest::say("Silk Thread is sewn by a tailor using a sewing kit or a community loom. Two spiderling silks combined in the sewing kit or loom will create one silk thread.");
		}
	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 20293 => 1))  #Orc Thaumaturgists Spell Book
		{ 
		quest::say("Well done young Art Keeper.  Take this Rough Art Keepers Initiate Staff and go forth and gather a Pristine Forest Drakeling Scale and an Arborean Amber. When you have acquired those two items return them to me with the Rough Art Keepers Initiate Staff and I will put the final touches on the staff.");
		quest::summonitem(20296);    #Rough Art Keepers Initiate Staff
		#Factions per ZAM
		quest::faction(275, 5);    #Keepers of the Art
		quest::faction(279, 1);    #King Tearis Thex
		quest::faction(246, 1);    #Faydarks Champions
		quest::faction(239, -1);    #The Dead
		quest::exp(100);
		quest::ding();
		}

	#Handin: Rough Artkeepers Initiate Staff, Pristine Forest Drakeling Scales, Arborean Amber
	elsif (plugin::check_handin(\%itemcount, 20296 => 1, 20271 => 1, 20274 => 1))
		{
		quest::emote("fashions a grip for the staff from the pristine forest drakeling scales, places the arborean amber into a mithril fixture and attaches the fixture to one end of the staff.");
		quest::say("This will serve us well, $name. Take this shard of Rolath, may it serve you well in the pursuit of your studies.");
		quest::summonitem(1264);    
		#Factions per ZAM
		quest::faction(275, 5);    #Keepers of the Art
		quest::faction(279, 1);    #King Tearis Thex
		quest::faction(246, 1);    #Faydarks Champions
		quest::faction(239, -1);    #The Dead
		#Give 8% exp up to level 10
		$client->AddLevelBasedExp(8,10);
		quest::ding();
		}

	if (quest::istaskactivityactive($taskid, 7))
		{
		if (plugin::check_handin(\%itemcount, $containerid => 1))
			{
			quest::updatetaskactivity($taskid,7);
			}
		}

	if (quest::istaskactivityactive($taskid, 14))
		{
		if (plugin::check_handin(\%itemcount, $robeid => 1))
			{ # robe is last step
			if (!plugin::has_newbie_stuff($client))
				{
				quest::incstat(0,5); 	# STR
				quest::incstat(1,6); 	# STA
				quest::incstat(2,5);	# AGI
				quest::incstat(3,5);	# DEX
				quest::incstat(6,3);	# CHA
				quest::enabletitle($titleid);
				quest::shout2("All Hail $pre $name $fix!"); 
				quest::updatetaskactivity($taskid,14);
				}
			else
				{
				quest::summonitem($robeid);
				}
			} 
		}
	}

sub EVENT_TASKACCEPTED
	{
	$varname="Blessed$charid";
	quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
	}
