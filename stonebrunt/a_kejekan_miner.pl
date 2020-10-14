my $quietmode=0;

sub EVENT_SPAWN
    {
    quest::set_proximity($x - 20,$x + 20,$y - 20,$y + 20);
    }

sub EVENT_ENTER
    {
	if ($quietmode == 0)
		{
		$quietmode=1;
		quest::say("Mrroowww where are these snakes coming from??  They have a nasty bite, watch your toes and tails!");
		quest::settimer("noisy",20);
		}
    }

sub EVENT_SAY 
{
	if($text=~/Hail/i)
		{
		quest::say("No time to talk $name, we are way behind schedule because of those nasty snakes popping up!"); 
		}
}

sub EVENT_TIMER
	{
	quest::stoptimer("noisy");
	$quietmode=0;
	}
