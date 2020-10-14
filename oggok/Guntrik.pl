sub EVENT_SAY 
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Mmmph!!  Who you?  Oh. you $name.  You supposed to be promising Craknek.  Me need you.  There bad things in swamp.  You want [help Crakneks] or you [want Guntrik bash your face]!!?");
		}
	elsif($text=~/what crakneks/i)
		{
		quest::say("Crakneks warriors!!  They be far back.  Through last caves.  They smash and bash.  They no like Greenbloods.  Bouncers keep thems from bashing.");
		}
	elsif($text=~/i want gruntrik to bash my face/i)
		{
		quest::say("OK!! Me bash!!  You hurt!!");
		quest::say("Me strongest. You weak. Craknek best alwayss."); 
		quest::attack($name);
		}
	elsif ($faction > 5)
		{
		quest::say("Me no trust yuz yet.");
		}
	elsif ($text=~/help crakneks/i) 
		{
		if ($ulevel < 11)
			{
			quest::say("You took weak.  Go be stronger, then we talk.");
			}
		else
			{
			quest::say("Go to swamps. Find noble hunters of humans and elves. All have house crests. Return to me and I give things. If you find special item says where hunters sleep, give to me. If meat founded then give to Clurg's cook. She make fine stew and give coins for meat.");
			}
		}
	}
sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 18787 => 1)) 
		{
		quest::say("Ahh..  good..  good..  here. take..  now you Craknek! You bash good. Bash lizards. Bash froggies. Bash mushrooms. Remember. you no help Greenbloods. Crakneks stronger than Greenbloods.");
		quest::summonitem("13525");	#Mud Stained Skin Tunic
		#Verified on live
		quest::faction(232,100);	#Craknek Warriors
		quest::faction(228,15); 	#Clurg
		quest::faction(261, -15);	#Greeblood Knights
        quest::exp(100);
		quest::ding();
		}
	if ($faction < 5 && plugin::check_handin(\%itemcount, 13361 => 1)) 
		{
		quest::say("One less trouble. Hunhuh!! You do good work. Keep up. Remember to bring any special things to Guntrik. Here junk for good work. Go away now.");
		my $reward;
		my $stein = plugin::RandomRange(1,25);

		if ($stein == 1)
			{
			$reward = 13355;
			}
		else
			{
			$reward = quest::ChooseRandom(5032,5029,5033,5031);
			}

		quest::summonitem($reward);

		#Verified on ZAM
		quest::faction(232,15);	#Craknek Warriors
		quest::faction(228,2); 	#Clurg
		quest::faction(261, -2);#Greeblood Knights
		quest::exp(1000);
		quest::ding();
		} 
	elsif ($faction < 5 && plugin::check_handin(\%itemcount, 18883 => 1)) 
		{
		# This is unimplemented on live.  Made up the details.
		quest::say("Ooh! This where hunters stay. You must go to Rathe Mountains and find Drinn's Inn. Kill all. Bring owners' scalps back and me give good junk. You get more warriors to help. Say Guntrik command them. You will need all help you get.'");
		quest::faction(232,2);	#Craknek Warriors
		quest::faction(228,1); 	#Clurg
		quest::faction(261,-1);	#Greeblood Knights
		quest::exp(1000);
		quest::ding();
		}
	elsif ($faction < 5 && plugin::check_handin(\%itemcount, 13362 => 1, 13363 =>1)) 
		{
		quest::say("'You some great warrior. Crakneks proud. Take reward. You show us you great. Great Crakneks we need.");
		quest::faction(232,20);	#Craknek Warriors
		quest::faction(228,2); 	#Clurg
		quest::faction(261,-2);	#Greeblood Knights
		quest::summonitem(6302);# Ogre War Maul
		quest::exp(3000);
		quest::ding();
		}
	else 
		{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
		plugin::return_items(\%itemcount);
		}
	}
#END of FILE Zone:oggok  ID:49043 -- Guntrik 
