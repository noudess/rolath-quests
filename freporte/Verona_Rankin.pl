my $taskid=95;
my $containerid=17125;
my $bracerid=19898;
my $robeid=19896;
my $titleid=62;
my $pre="Coalition Trader";
my $fix="";

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
   quest::say("If you're a new employee of the Coalition of Tradefolk I suggest you speak with Tovan Tenlah. Now if you will excuse me I have much work to do.");
   }

   if($text=~/boots/i)
   {
   quest::say("To craft Coalition Trader Boots you require two [silk thread], two ruined cat pelts, two desert spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
   # Tattered Boot Pattern ID-19561
   quest::summonitem("19561");
   }

   if($text=~/bracer/i)
   {
   quest::say("To craft an Coalition Trader Bracer you require a [silk thread], a ruined cat pelt, and a desert spiderling hairs. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
   # Tattered Wristband Pattern ID-19558
   quest::summonitem("19558");
   }
     
   if($text=~/cap/i)
   {
   quest::say("To craft a Coalition Trader Cap you require two [silk thread], a ruined cat pelt, a dune spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Coif Pattern.");
   # Tattered Cap Pattern ID-19555
   quest::summonitem("19555");
   }

   if($text=~/gloves/i)
   {
   quest::say("To craft Coalition Trader Gloves you require two [silk thread], a ruined cat pelt, two desert spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
   # Tattered Glove Pattern ID-19559
   quest::summonitem("19559");
   }

   if($text=~/leggings/i)
   {
   quest::say("To craft Coalition Trader Leggings you require three [silk thread], a low quality cat pelt, two dune spiderling hairs, and a large rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
   # Tattered Pant Pattern ID-19560
   quest::summonitem("19560");
   }

   if($text=~/sleeves/i)
   {
   quest::say("To craft Coalition Trader Sleeves you require two [silk thread], a low quality cat pelt, two dune spiderling hairs, and a large rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
   # Tattered Sleeve Pattern ID-19557
   quest::summonitem("19557");
   }

   if($text=~/tunic/i)
   {
   quest::say("To craft a Coalition Trader Tunic you require four [silk thread], a medium quality cat pelt, a desert tarantula hairs, and a giant rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
   # Tattered Tunic Pattern ID-19556
   quest::summonitem("19556");
   }

   if($text=~/silk thread/i)
   {
   quest::say("I'm sure you could find a tailor in town to make you some silk thread or you can make your own with 2 Spiderling Silk.");
   }

}

sub EVENT_ITEM
	{
	if(plugin::check_handin(\%itemcount, 19846 => 1)) 
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("Ah, Tovan sent you for a suit of traders clothing. I can instruct you on how to prepare your suit of clothing but you will have to acquire the required materials yourself. Use this Curing Kit to construct the clothing once you have done so. Do you wish to prepare Coalition Trader [Gloves], Coalition Trader [Boots], a Coalition Trader [Bracer], a Coalition Trader [Cap], Coalition Trader [Leggings], Coalition Trader [Sleeves], or a Coalition Trader [Tunic]?");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}
	elsif(plugin::check_handin(\%itemcount, 19919 => 1, 19925 => 1, 19850=>1)) 
		{
		quest::emote("secures the gem into the hilt of the dagger and crafts a grip from the rattlesnake skin.");
		quest::say("This is.. extraordinary.  I think I will keep it!  Fear not, this should be an adequate reward for your hard work.");
		quest::ding();
		quest::exp(100);
		quest::summonitem(1266); #Rolath Shard of Battle
		# Factions Verified on Live
		quest::faction(336,5); #Coalition of TradeFolk III
		quest::faction(229,5);  #Coalition of Trade Folk
		quest::faction(329,1);  #Carson McCabe
		quest::faction(230,1);  #Corrupt Qeynos Guards
		quest::faction(330,1); #Freeport Militia
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
				quest::incstat(3,6);	# DEX
				quest::incstat(6,2);	# CHA
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
