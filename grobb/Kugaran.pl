my $taskid=100;
my $containerid=61096;
my $robeid=61171;
my $titleid=67;
my $pre="Dark Basher";
my $fix="Of Grobb";

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Whut yoo want from Kugaran! Unless yoo [Shadowknight] yoo leave me alone.");
  }
  
  if ($text=~/shadowknight/i) {
    quest::say("I don't know if I should trust yoo but I suppose I can let yoo prove yerself. If yoo are [interested] in helping me wit gadaring some tings and [creating yer own armor] yoo let Kugaran know.");
  }
  
  if ($text=~/creating my own armor/i) {
	$varname="Blessed$charid";
	if (!defined($qglobals{$varname}))
		{
    	quest::say("Well den I guess we get started. Dere isn't much to tell besides dat yoo will have to go out and collect [various items] fer yer armor materials. First tings first go ahead and take yer assembly kit now, it is in here dat yoo will put da items yoo collect to make yer armor material. Once yoo have da material yoo can use it wit da right mold I gib yoo to make yer armor.");
		my @task_array;
		push(@task_array, $taskid);
		quest::taskselector(@task_array);
		}
	else
		{
		quest::say("You are already blessed.");
		}
  }
  
  if ($text=~/various items/i) {
    quest::say("Dere are lots of tings yoo will need. Once yoo are ready I can gib yoo da mold fer Dark Basher's [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. When yoo are ready to make a piece yoo tell me which piece you [wish to craft] and I gib yoo da right mold.");
  }
  
  if ($text=~/helm/i) {
    quest::say("To create yer helm material yoo will need to combine 2 small bricks of ore, a giant snake rattle, and a fungus clump in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Helm.");
    quest::summonitem(22610);
  }
  
  if ($text=~/bracers/i) {
    quest::say("To create yer Bracer material yoo will need to combine one Snake Fang, a Zombie Skin, one Turquoise, and a Small Brick of Ore in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Bracer.");
    quest::summonitem(22611);
  }
  
  if ($text=~/armguards/i) {
    quest::say("To create yer armguard material yoo will need to combine 1 small bricks of ore, 2 snake fangs and spiderling legs in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Armguards.");
    quest::summonitem(22613);
  }
  
  if ($text=~/boots/i) {
    quest::say("To create yer boot material yoo will need to combine a Snake Fang, a Small Mosquito Wing, a Zombie Skin, and two Small Bricks of Ore in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Boots.");
    quest::summonitem(22612);
  }
  
  if ($text=~/greaves/i) {  
    quest::say("To create yer greaves material yoo will need to combine a Desert Tarantula Chitin, a Giant Snake Fang, a Pristine Giant Scarab Carapace, and three Small Bricks of Ore in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Greaves.");
    quest::summonitem(22614);
  }
  
  if ($text=~/gauntlets/i) {
    quest::say("To create yer gauntlets material yoo will need to combine a Small Mosquito Wing, a Large Snake Skin, two Zombie Skins, and one Small Brick of Ore in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Gauntlets.");
    quest::summonitem(22615);
  }
  
  if ($text=~/breastplate/i) {
    quest::say("To create yer breastplate material yoo will need to combine 1 Lightstone, 1 Pristine Giant Scarab Carapace, 1 Desert Tarantula Chitin, 1 Deathfist Slashed Belt, and 2 Small Bricks of Ore in yer assembly kit. Once yoo have created da proper material take it to a forge along with this mold to fashion yer very own Dark Basher's Breastplate. Return to me for one [final task] I have to ask of yoo after yoo have completed yer breastplate.");
    quest::summonitem(22616);
  }
  
  if ($text=~/final task/i) {
    quest::say("Da task is to get me a few [important items] that I need for me studies. If yoo go get dem I give you nice shiny ting.");
  }
  
  if ($text=~/important items/i) {
    quest::say("Me needs a froglok eye and 3 pristine bull alligator hides. Bring me these tings and I give yoo nice reward.");
  }
}

sub EVENT_ITEM 
	{
	if (plugin::check_handin(\%itemcount, 13372 => 1, 51018 => 3)) 
		{
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
				quest::incstat(1,5); 	# STA
				quest::incstat(2,6);	# AGI
				quest::incstat(3,3);	# DEX
				quest::incstat(4,7);	# INT
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
