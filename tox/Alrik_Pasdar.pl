sub EVENT_SAY 
{   
	if ($text=~ /Hail/i)
		{
		quest::say("These are troubling times, $name.  Our people are continually forrrrced to move and still we are [harrrrassed].");
		}

    if ($text=~/harrrrassed/i)
		{
		if ($faction <= 5)
			{
			quest::say("Yes, it continues.  We simply want a place to call our own.  We conquered these lands and made peace.  There are some allies in the cities nearrrby, but the relationships are tenuous.  Now, we arrrre not sure if they are sound.  The [heretics] are at it once again, killing in ourrrr lands and poaching our pets.");
			}
		else
			{
			quest::say("I am sorrrry, $name.  I have no way to know if you are kind, or arrrre just out to take advantage of my people.  I can speak to you no more.");
			}
		}

	if ($faction <= 5)
		{
    	if ($text=~/heretics/i)
			{
			quest::say("Despicable they are.  And who knows what they are up to.  The Kerra list of allies grows short, and our need grows.  A simple life is all that we seek.  If only we had strong allies that would offer to [help].");
			}
    	if ($text=~/help/i)
			{
			quest::say("An offer of help?  You arrrrre too kind.");
			quest::emote("purrs");
			quest::say("Purrhaps you can learn of their plans?  See what you can learn and bring yourrrr findings to me.  They have somehow entered the Isle undetected.  Seek them out, and be careful.  Thank you, $name!");
			}
		}

    if ($text=~/smuggling/i)
		{
		quest::say("The rumors are alarming if true, but I personally think it is hogwash.");
		quest::say("The man put to death for the smuggling of vasty deep water is said by some to be alive.  His name was Moodoro.  Start by talking to Tol Nicelot in Erudin.  He seems to be one of the men talking about this.");
		push(@task_array, 25);
		quest::taskselector(@task_array);
		}
}

sub EVENT_ITEM 
	{ 
	if (plugin::check_handin(\%itemcount, 1775 => 1))
		{
		quest::say("This is written so poorrrrly.  There herrretics need to learn how to write.");
		plugin::Autovtell("laugh");
		quest::say("Sooo!  They seek out the secrets of Tiger island!?  Now that we know where these deviants are hiding it shall be farrrr easier to rrrid our lands of their kind.  Thank you, $name.");
		quest::faction(298,10);	# Peacekeepers
		quest::faction(382,10);	# Kerra
		quest::faction(265,-5);	# Heretics
		quest::exp(3200);
		quest::ding();
		quest::summonitem(57346); 
		}
	else
		{
		plugin::return_items(\%itemcount);
		quest::say("I have no use for this.");
		}
	}
#END of FILE
