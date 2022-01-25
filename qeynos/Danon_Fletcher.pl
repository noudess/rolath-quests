#BeginFile: Qeynos/Danon Fletcher - Custom quest

my $notalk=0;

sub EVENT_SPAWN
	{
    quest::set_proximity($x - 60, $x + 60, $y - 60, $y + 60);
	}

sub EVENT_ENTER
    {
	if($notalk == 0)
		{
	    quest::say("Seeking a skilled tailor.  Come and see me if you are a tailor, I have a fine trade to offer!");
		quest::echo(4,"Danon looks about hopefully as people hurry by.");
		$notalk = 1;
		quest::settimer("noisy",100);
		}
    }

sub EVENT_TIMER
    {
	if($timer eq "noisy")
		{
		quest::stoptimer("noisy");
		$notalk=0;
		}
    }

sub EVENT_SAY 
	{
	if($text=~/hail/i)
		{
		quest::say("Hello $name, take a look at my fine fletching supplies.");
		}

	if($text=~/tailor/i)
		{
		if($client->GetSkill(61)>99) 
			{
			quest::say("You are a tailor $name? I am seeking a skilled tailor to make a special [quiver] for me.  I have a fine limited edition sewing kit to offer in trade.");
			}
		else
			{
			quest::say("Sorry $name, you are not yet skilled enough for my needs.  Keep working and see me when you have gained at least Apprentice!");
			}
		}

	if($text=~/quiver/i)
		{
		if($client->GetSkill(61)>99) 
			{
			quest::say("I have heard of a magical quiver that is enchanced to speed up an archers ability to fire arrows!  Bring me this quiver and the special sewing kit is yours!");
			}
		else
			{
			quest::say("Sorry $name, you are not yet skilled enough for my needs.  Keep working and see me when you have gained at least Apprentice!");
			}
		}

	if($text=~/aviak/i)
		{
		if($client->GetSkill(61)>99) 
			{
			quest::say("I have heard aviaks roosting in one of the Karanas.  Surely if they roost, they must have nests of eggs!");
			}
		else
			{
			quest::say("Sorry $name, you are not yet skilled enough for my needs.  Keep working and see me when you have gained at least Apprentice!");
			}
		}
	}

sub EVENT_ITEM
	{
    if($client->GetSkill(61)>99 && plugin::check_handin(\%itemcount, 17327 => 1))
		{
		quest::say("So it is true $name, the magical fleeting quiver does exist, very nice work!  Here is your limited edition deluxe sewing kit, use it well!");
        quest::summonitem(17966);
        quest::ding();
		}
	}

# End of file
