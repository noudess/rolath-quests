#BeginFile: rivervale\Twippie_Diggs.pl

my $notalk=0;

sub EVENT_SPAWN
	{
    quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
	}

sub EVENT_ENTER
    {
	if($notalk == 0 && !quest::istaskactive(73) && !quest::istaskcompleted(73))
		{
	    quest::say("Hey $name, come chat with me.  I need some help and you look helpful!");
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

	if($timer eq "sigh")
		{
		quest::stoptimer("sigh");
		plugin::DoAnim("shakeno");
		quest::say("Hmmm... did I not ask for bixie stingers too... I don't see any, there has to be bixie stingers!  Go collect me some bixie stingers.  I'll have your supper kept warm!");
		}

	if($timer eq "peer")
		{
		quest::stoptimer("peer");
		if($ulevel > 3) 
			{
			quest::say("Hey you look like he kind of adventurous $race who could [collect] some things for me!");
			}
		else
			{
			quest::say("But.... you're a little young to be venturing out into the thicket.  Come and see me again when you have a few more beers in your belly.");
			plugin::Autovtell("disagree");
			}
		}
    }

sub EVENT_SAY 
	{
	if($text=~/studs/i && quest::istaskcompleted(73))
		{
		quest::say("shhh this is just between us $name, can't have everyone knowing about my special bixie studs.  You just keep collecting bixie stingers and bringing them to me, I'll take care of making the studs.");
		}
	elsif(quest::istaskactivityactive(73,14))
		{
		quest::say("Thanks for collecting these pelts $name.");
		plugin::Autovtell("thanks");
		quest::emote("digs thru the bag of pelts and then sighs...");
		quest::updatetaskactivity(73,14);
		quest::settimer("sigh",3);
		}
	elsif($text=~/hail/i) 
		{
		quest::say("Hello $name, isn't it a grand day.  Have you been out to the thicket lately, I'm looking for someone to collect some [pelts] and things for me.");
		plugin::Autovtell("greet");
		}

	elsif($text=~/pelts/i) 
		{
		quest::say("The deputies here sure could use some armor upgrades, they've been wearing the same uniforms since my ole gaffer was knee-high to a fire beetle!");
		quest::emote("scratches his chin looking you up and down");
		plugin::DoAnim("peer");
		quest::settimer("peer",3);
		}

	elsif($text=~/collect/i) 
		{
		#Minimum level for task is 4.
		if($faction <5 && $ulevel > 3) 
			{
			if(quest::istaskactive(73)) 
				#Task: Diggs Blackened Armor
				{
				quest::say("Yea, keep working that collecting, you've been lollygagging in the Jumjum field again, haven't you $name?");
				plugin::Autovtell("laugh");
				}
			elsif(quest::istaskcompleted(73))
				{
				quest::say("I've got plenty of skins to work with thanks to you $name.  I only need you to bring more of our secret ingredient!");	
				}
			else 
				{
				quest::taskselector(73); #Task: Diggs Blackened Armor
				}
			}
		else 
			{
			if($faction <5)
				{
				quest::say("I'm afraid you're not yet ready to venture deep into the thicket. You should go see the exterminator and help him with this rodent problem.");
				}
			else
				{
				quest::say("I don't know you well enough to trust you yet, there are strange folk about.");
				}
			plugin::Autovtell("disagree");
			}
		}
	}

sub EVENT_ITEM
	{
	if($itemcount{14029} > 0  && quest::istaskcompleted(73))
		{
		quest::say("Back with more $name, very nice work.  I knew I could count on you!");
		plugin::mass_handin(14029, 1, \&StudReward);
		}
	}

sub StudReward
	{
	quest::emote("hums happily as he exchanges your stingers for studs");
	quest::summonitem(132492);
	}

sub EVENT_TASKACCEPTED 
	{
	quest::say("Ok, thanks and good hunting.  Now get to it or you miss supper!");
	}
