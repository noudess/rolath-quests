sub EVENT_SAY
	{ 
	if($text=~/Hail/i)
		{
		quest::say("Welcome into our church of rage.  I am Vesagar Nekio. servant of Innoruuk.  If you should need me to [cure poison]. [cure disease]. or if you [require healing]. just let me know.");
		}
	elsif($text=~/cure poison/i && $faction <="5")
		{
		quest::say("Before the rage inside can force the poison from your blood, you will pay tribute by offering the Prince of Hate a spider venom sac.");
		}
	elsif($text=~/cure disease/i && $faction <="5")
		{
		quest::say("I thought I sensed the the touch of Bertoxxulous within you.  Before we can cast it out, we shall need a slab of zombie skin.");
		}
	elsif($text=~/require healing/i && $faction <="5")
		{
		quest::say("If you wish me to lay my hands upon your wounds, you must first lay 10 gold coins upon my palm.");
		}
	else
		{
		quest::say("Blasphemer!!  You are no ally of the Dismal Rage.  Run while you still have legs!!");
		}

	}

sub EVENT_ITEM
	{
	if (plugin::check_handin(\%itemcount, 13074 =>1 ))
		{
		quest::say("The malady which has overtaken your frail body shall be cast out and in its place, your hate shall grow.");
		# Cure Disease Spell
		quest::ding();
		quest::selfcast(213);
		}

	if (plugin::check_handin(\%itemcount, 14018 =>1 ))
		{
		quest::say("You offering has strengthened your faith in our ways.  Let the spittle of Innoruuk wash the poison from your body.");
		# Cure Disease Spell
		quest::ding();
		quest::selfcast(203);
		}

	my $cash = $copper + $silver * 10 + $gold * 100 + $platinum * 1000;
	if ($cash >= 1000)
		{
		quest::ding();
		quest::say("Your gold has proven your faith in our ways as well as having made my pockets a bit heavier.  Let the power of the Prince of Hate bind your wounds.");	
		# Light Healing
		quest::selfcast(17);
		}	
	} 

