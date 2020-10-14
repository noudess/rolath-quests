my $taskid=99;
my $containerid=55375;
my $robeid=55360;
my $titleid=66;
my $pre="Bloodwolf";
my $fix="of Grobb";

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Wot you want, weakling? You tink you be strong [berserker]? You fight with da anger in yer heart? Me give you test. If you can do, mebbe me thinkz you be strong.");
 }
 if($text =~ /berserker/i) {
	quest::say("Dis test be to make [armor]. Grigdor be strong. Me pass test after three timez.");
 }
 if($text =~ /armor/i) {
	$varname="Blessed$charid";
	if (!defined($qglobals{$varname}))
		{
		quest::emote("Grigdor let's out a gravelly laugh.");
     	quest::say("So you tink you can pass my test? Ok. We will see. You take dis here kit. You put stuff in dere and combine it to help make Bloodwolf Armor. Grigdor can give test to make [boots], [leggings], [bracers], [gloves], a [coif], a [gorget], or a [tunic]. Only da strongest of da Trolls can make da tunic first. It be da hardest.");
		my @task_array;
		push(@task_array, $taskid);
		quest::taskselector(@task_array);
		}
	else
		{
		quest::say("You are already blessed.");
		}
 }
 if($text =~ /boots/i) {
	quest::say("To make da Bloodwolf Boots, youz gonna need to get one Kobold Scalp, one Chunk of Digested Earth, and two Small Pieces of Ore");
    quest::summonitem(55371);
 }
 
 if ($text=~/leggings/i) {
   quest::say("To make da Bloodwolf Leggings, youz gonna need to get three snake eggs, two Kobold Livers, a larval carapace and one small piece of ore.  Mebba youz can find animal partz out in da swamp but I tinks yuz gonna needs to goes to da Rathe Mountains to finds dem. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Leggings Material to a forge, with dis mold to make your new leggings.");
   quest::summonitem(55372);
 }
 
 if ($text=~/bracers/i) {
   quest::say("To make da Bloodwolf Bracer, youz gonna need to get one small piece of ore, two snake fangs, one zombie skin, and one bone chips. Mebba youz can find animal partz out in da swamp but I tinks yuz gonna needs to goes to da Rathe Mountains to finds dem. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Bracer Material to a forge, with dis mold to make your new bracer");
   quest::summonitem(55369);
 }
 
 if ($text=~/gloves/i) {
   quest::say("To make da Bloodwolf Gloves, youz gonna need to get two Small Pieces of Ore, one Bleeder's Poison Sac, and two Bleeder Carapaces. Mebba youz can find animal partz out in da swamp but I tinks yuz gonna needs to goes to da Rathe Mountains to finds dem. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Gloves Material to a forge with dis mold to make your new gloves.");
   quest::summonitem(55373);
 }
 
 if ($text=~/coif/i) {
   quest::say("To make da Bloodwolf Coif, youz gonna need to get two Small Pieces of Ore, one Alligator Hide, one Cracked Skeleton Skull, and one Ball of Pulpy Fungus. Mebba youz can find animal partz out in da swamp but I tinks yuz gonna needs to goes to da Rathe Mountains to finds dem. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Coif Material to a forge with dis mold to make your new coif.");
   quest::summonitem(55368);
 }
 
 if ($text=~/gorget/i) {
   quest::say("To make da Bloodwolf Gorget, youz gonna need to get two Small Pieces of Ore, two Giant Moccasin Fangs, sum Bleeder Wings, and sum Moccasin Scales. Mebba youz can find animal partz out in da swamp but I tinks yuz gonna needs to goes to da Rathe Mountains to finds dem. For da ore, mebbe you can find somewhere here in da city. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Gorget Material to a forge with dis mold to make your new gorget.");
   quest::summonitem(55370);
 }
 
 if ($text=~/tunic/i) {
   quest::say("Dis part be hard to make. If you tink you can do, then you need to get two Small Pieces of Ore, sum Pristine Moccasin Scales, one Burly Kobold Ear, sum Pristine Alligator Hide, and sum Moccasin Poison. Once you have all of dese itemz, combine dem in your assembly kit and take the Bloodwolf Tunic Material to a forge, with dis mold to make your new tunic. If you do dis, come back here and me have one more [test] for you.");
   quest::summonitem(55374);
 }
 
 if ($text=~/test/i) {
   quest::say("Dere still be sum frogs hidin in da swamp. Show dem your anger. Get one Froglok Eye and not won, not too, but tree Bull Alligator Spines. Youz might need ta get some other trollz ta help youz with dis. If you get deze itemz, give dem to me and I give you final reward.");
 }
}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13372 =>1, 51038 =>3 )) 
		{
		quest::say("Good job.  Here is your reward");  #ad lib text
		quest::summonitem(1266);
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
				quest::incstat(1,6); 	# STA
				quest::incstat(2,10);	# AGI
				quest::incstat(3,3);	# DEX
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
