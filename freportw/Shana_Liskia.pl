my $taskid=91;
my $containerid=17260;
my $bracerid=9873;
my $robeid=9878;
my $titleid=59;
my $pre="Arcane Scientist";
my $fix="";

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail and well met $name. I am Shana Liskia. Enchantress of Freeport. I have studied my art for years here in our wonderful academy. I am also delighted to meet and teach those that come here to gain knowledge. My specialty however lies in Beguiling so I like to train young newcomers to our academy. Are you studying the ways of a [Magician] an [Enchanter] or a [Wizard]??");
  }
  if($text=~/magician/i || $text=~/enchanter/i || $text=~/wizard/i) {
    quest::say("Wonderful! Let me be the first to tell you that your training here will be top notch and you will learn all that is to be known about being an enchanter should you put forth the willingness to learn. I will walk you through your early training and assist you in your hunting and gathering skills. I have created a [special sewing kit] that I present to all of the new initiates.");
  }
  if($class eq "Magician" || $class eq "Enchanter" || $class eq "Wizard") {
    if($text=~/special sewing kit/i) {
      quest::say("This kit that I speak of is one that is able to magically infuse different components into materials used for creating Arcane Scientists Armor. The components that you use will be collected from numerous different areas and shops in Freeport. You will use these materials along with patterns that I will present you with to create your armor. Once you are [ready to begin] I will present you with your Enchanted Sewing Kit.");
    }
    if($text=~/ready to begin/i) {
	$varname="Blessed$charid";
	if (!defined($qglobals{$varname}))
		{
      	quest::say("Very well. Here you are $name. in this box you will combine specific component recipes as I mentioned before. When you are ready to attempt a specific piece you must tell me what piece you [want] to craft. For example if you had intent on crafting a cap you would say. [I want to craft a cap]. I can offer you the recipes for Arcane Scientists [Caps], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes]. I must also suggest that you attempt your robe last due to the difficult nature of collecting the correct components.");
		my @task_array;
		push(@task_array, $taskid);
		quest::taskselector(@task_array);
		}
	else
		{
		quest::say("You are already blessed.");
		}
    }
    if($text=~/sleeves/i) {
      quest::say("Sleeves will be a great and necessary addition to your armor. To create your sleeve material you will need to combine 2 Woven Spider Silks, 2 Bone Chips, 1 Spider Legs and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Sleeves.");
      quest::summonitem(22586); #An Enchanted Sleeves Pattern
    }
    if($text=~/bracer/i) {
      quest::say("A wise choice indeed, having the correct wrist protection is very important in spell channeling. To create your bracer material you will need to combine 1 Woven Spider Silk, 1 Desert Tarantula Chitin, 1 Armadillo Tooth and a Cloth wristband in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Bracer.");
      quest::summonitem(22584); #An Enchanted Bracer Pattern
    }
    if($text=~/cap/i) {
      quest::say("A cap will keep you safe from any attackers as well as the elements. To create your cap material you will need to combine 2 Woven Spider Silks, 1 Snake Fang, 1 Chunk of Meat and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Cap.");
      quest::summonitem(22583); #An Enchanted Cap Pattern
    }
    if($text=~/gloves/i) {
      quest::say("Gloves are very important for your early training especially Isola. While you are learning your first set of incantations you should not have to worry about any injuries to your hands. To create your glove material you will need to combine 3 Woven Spider Silks, 1 Giant Scarab Brain, 1 High Quality Cat Pelt 1 Zombie Skin and 1 Large Leaf Scarab Leg in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Gloves.");
      quest::summonitem(22588); #An Enchanted Gloves Pattern
    }
    if($text=~/sandals/i) {
      quest::say("Sandals will keep you save from any harmful things you may walk in, it is a good idea to have them. To create your sandal material you will need to combine 3 Woven Spider Silks, 1 Coyote Pelt, 2 Black Bear Paws, 1 Urticating Hairs and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Sandals.");
      quest::summonitem(22585); #An Enchanted Sandals Pattern
    }
    if($text=~/trousers/i) {
      quest::say("I would always recommend pants to all my new students since they are a very important part of your armor set. To create your trouser material you will need to combine 4 Woven Spider Silks, 1 Embalming Dust, 1 Rotting Zombie Skull and 1 Armadillo Tail in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Trousers.");
      quest::summonitem(22587); #An Enchanted Trousers Pattern
    }
    if($text=~/robe/i) {
      quest::say("I am very pleased to see that you have progressed through your armor pieces so quickly. I am also proud to see that you are ready to attempt your robe! To create your robe material you will need to combine 5 Woven Spider Silks, 1 Snake Bile, 1 Cutthroat Golden Tooth, 1 Shadow Wolf Tibia, 1 Orc Prayer Beads and 1 Cloth Shirt in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Robe. Be sure to come back to see me for a [final assignment] after you have completed your robe.");
      quest::summonitem(22589); #An Enchanted Robe Pattern
    }
    if($text=~/final assignment/i) {
      quest::say("I have a trinket that was given to me by my mother a long time ago. Before she died I told her I would always keep it close to me. Recently, some militia officers came in to our academy and confiscated anything that appeared to be valuable. Fearing for my life I did not fight to keep the necklace my mother gave me. The officer that took it was named Teridsan. If you should find him you have my permission to kill him if that's what it takes to get my necklace back. Return to me when you have my necklace along with 2 Lion Teeth.");
    }
  }
  else {
    quest::say("Only casters may earn the rewards of the Academy!");
  }
}

sub EVENT_ITEM 
	{
	if(plugin::check_handin(\%itemcount, 9917 => 2, 9933 => 1)) 
		{ #Lion Tooth x 2, Shana's Necklace
		quest::say("Thank you for bringing back one of my most valued possesion. You have proven yourself to be worthy.  I plan to use this dagger, but you have earned the riught to wield this Shard.");
		quest::ding();
		quest::summonitem(1264); # Rolath shard
		quest::faction(200,25);
		quest::faction(281,6);
		quest::faction(296,-3);
		quest::faction(330,-3);
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
				quest::incstat(0,1); 	# STR
				quest::incstat(1,6); 	# STA
				quest::incstat(2,5);	# AGI
				quest::incstat(4,6);	# INT
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
