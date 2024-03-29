# Ranger GM - newbie note hand in
#
sub EVENT_SPAWN
	{
    quest::settimer("repeat", 90); #Repeated shoot every 90 seconds
	quest::set_proximity($x -25, $x + 25, $y - 25, $y + 25);
	}

sub EVENT_ENTER
	{
	plugin::playmp3once("");
	}

sub EVENT_EXIT
	{
	plugin::playmp3once("otr.mp3");
	}

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Greetings, $name.  Feel free to rest here in Surefall Glade.  Just be sure you do no hunting whilst here.  If so, then you shall pay the punishment of death.  I trust you [will abide by the laws]?");
		}
	if ($text =~ /will abide by the laws/i ) 
		{
		quest::say("That is wise.  Your health, for now, is assured.  A plague of hunters has infested our land heavily in recent weeks.  The word is out that [Mammoth] still lives.  Hunters have flocked here in search of a trophy or profit and glory.  Instead, they find the deadly accuracy of my arrows.");
		}
	if ($text =~ /Tunare/i) 
		{
		quest::say("Tunare is the Mother of All.  It is through Her will that we protect this land and its many creatures.");
		}
	if ($text =~ /Talym Shoontar/i) 
	{
	quest::say("Talym Shoontar is a poacher.  He has eluded us for quite some time.  He has organized parties of poachers to plague our forest as well as others.  He hails from Halas, but I have heard he now calls the Plains of Karana home.  I have placed a bounty upon his head.  Do you [wish to collect the bounty]?");
	}

	# Here and below require indifferent or higher

	if ($faction >= 6)
		{
		quest::say("I smell an enemy of the Protectors of the Pine");
		}
	elsif ($text =~ /Mammoth/i) 
		{
		quest::say("Mammoth is the great bear of the caves.  [Tunare] has blessed our home with Mammoth's presence.  It is said that when the great bear dies, so too shall the Jaggedpine.  He would be quite a trophy to some hunter.  And quite profitable to a poacher. Even the infamous [Talym Shoontar] has tried his hand at the hunt.");
		}
	elsif ($text =~ /wish to collect the bounty/i ) 
		{
		quest::say("That's the spirit!!  Spoken like a true Protector of the Pine!  Last I heard, Talym Shoontar was hunting in the Plains of Karana.  He has also been spotted running to and from Qeynos.  No doubt he is selling hides to some merchant.  End his life of hunting.  Bring me his head to collect the bounty.");
		}
	}
sub EVENT_ITEM {
  if ($faction <= 5 && plugin::check_handin(\%itemcount, 18709 => 1)) {
    quest::say("Welcome, we are the Protectors of the Pine. Wear this tunic of our guild, and help us defend our great and beautiful woods. Go to Larsk Juton, he will help train you and teach you the power of the woods.");
    quest::summonitem(13509);
    quest::exp(100);
	quest::ding();
    quest::faction(302,100); # Protectors of Pine
    quest::faction(272,25); # Jaggedpine Treefolk
    quest::faction(306,-15); # Sabertooths of Blackburrow
    quest::faction(262,25); # Guards of Qeynos
  }
  if ($faction <= 5 && plugin::check_handin(\%itemcount,13913=>1)) {
    quest::say("His days of hunting are over. In the name of the Protectors of the Pine, I offer you this reward. If you are unable to make use of it, you may sell it. I suggest you hold onto it. If you are a ranger it will come in handy.");
    quest::summonitem(17804);
    quest::givecash(0,11,8,4);
    quest::exp(1000);
	quest::ding();
	# Faction verified on live
    quest::faction(302,20); # Protectors of Pine
    quest::faction(272,5); # Jaggedpine Treefolk
    quest::faction(306,-3); # Sabertooths of Blackurrow
    quest::faction(262,3); # Guards of Qeynos
  }
  #do all other handins first with plugin, then let it do discipline
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  plugin::DoAnim(bow);
}
# EOF zone: qrg ID: 3032 NPC: Hagar_Sureshot
