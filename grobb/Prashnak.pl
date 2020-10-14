my $taskid=101;
my $containerid=61095;
my $robeid=61164;
my $titleid=68;
my $pre="Spirit Charmer";
my $fix="of Grobb";


sub EVENT_SAY {

   if ($text=~/Hail/i) {
      quest::say("Hullo $name, who yoo be? You need be a [Shaman] or me not talk to yoo");
   }

   if ($text=~/i am a shaman/i) {
      quest::say("You is Shaman? Well me is too so I can give yoo some tings to do if yoo want to make yer own [armor]");
   }

   if ($text=~/armor/i) {
	$varname="Blessed$charid";
	if (!defined($qglobals{$varname}))
		{
      	quest::say("Me can tell yoo where to get tings to craft yer own armor. Yoo den take dese tings with dis armor kit and combine dem. When you have yer armor material take it too da forge and with da pattern I give yoo to make yer armor. I can give yoo recipe fer [Coif], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics]. When yoo ready yoo tell me whut piece you [want to craft]");
		my @task_array;
		push(@task_array, $taskid);
		quest::taskselector(@task_array);
		}
	else
		{
		quest::say("You are already blessed.");
		}
   }

   if ($text=~/want to craft coif/i) {
      quest::say("Here is yer pattern, once yoo have combined a Water Moccasin Tail, two Mosquito Eyes and a Chunk of Digested Earth in yer kit place it in da forge along with dis pattern to create yer Spiritcharmer Chainmail Coif.");
   quest::summonitem(22671); # An Enchanted Coif Pattern
   }

   if ($text=~/want to craft bracers/i) {
      quest::say("Go out into da swamp and seek out a Crab Spider's Carapace, da Poison Sac of a Bleeder, and two Airborne Spores. Once yoo have combined dem in yer kit to make da bracer material take it to a forge along with dis pattern to create yer Spiritcharmer Chainmail Bracer.");
   quest::summonitem(22672); # An Enchanted Bracer Pattern
   }

   if ($text=~/want to craft sleeves/i) {
      quest::say("If Sleeves are what yoo wish to craft yoo will need to get two Chunks of Mosquito Meat, a Large Fungal Spore, and a Giant Snake Fang den combine dem in yer kit to fashion da necessary material. Take dis pattern to da nearest forge with that material to create yer Sleeves of the Spiritcharmer.");
   quest::summonitem(22673); # An Enchanted Sleeves Pattern
   }

   if ($text=~/want to craft boots/i) {
      quest::say("If yoo want to make Boots of da Spiritcharmer yoo will need two Kobold Talons, an Amulet from an undead froglok, and Ball of Pulpy Fungus. Combine dem together to make yer mold and put it in da forge along with dis pattern to make yer boots.");
   quest::summonitem(22674); # An Enchanted Boots Pattern
   }

   if ($text=~/want to craft legplates/i) {
      quest::say("If yoo wants leggings go get 4 Bricks of Crude Bronze, 2 Snake Eggs, 1 Low Quality Bear Skin and 1 Red Wine den combine dem in yer kit to create yer Legplates material.");
   quest::summonitem(22675); # An Enchanted Legplates Pattern
   }

   if ($text=~/want to craft gauntlets/i) {
      quest::say("To create da Gauntlet materials please collect 2 pristine bleeder skins, a crab spiderling fang, and a spore mushroom. When yoo done and have made yer material put it in da forge with dis pattern to make yer gauntlets.");
   quest::summonitem(22676); # An Enchanted Gauntlets Pattern
   }

   if ($text=~/want to craft tunic/i) {
      quest::say("'I'm happy to see that yer training is coming along so well ______. I have no doubt in my mind that yoo are ready to craft yer Tunic. Go collect 2 Burly Kobold ears, a moccasin poison, and 2 bull alligator spines. Come back after yoo are finished, I have a [job] for yoo.");
   quest::summonitem(22677); # An Enchanted Tunic Pattern
   }

   if ($text=~/what job/i) {
      quest::say("'I want yoo too get some tings for me that I need for me special trollie. Get me 2 giant snake rattles, a set of snake scales, and an alligator tooth and I will give you a nice shiny ting.");
   }

}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 13070 => 1, 13058 => 2, 13725 => 1))
		{
		quest::summonitem(1264);
		quest::exp(100);
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
				quest::incstat(1,5); 	# STA
				quest::incstat(2,3);	# AGI
				quest::incstat(5,8);	# WIS
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
