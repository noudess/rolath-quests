my $furdone = 0;
my $wingsdone = 0;

sub EVENT_SAY 
	{
	if ($text=~/hail/i) 
		{
		quest::say("Hi $name. Did [Bordag send you]?");
		}
	if ($faction > 4)
		{
		quest::say("Me not know you enough");
		}
	elsif ($text=~/bordag sent me/i) 
		{
		quest::say("So you want learn about how to fight like bear and crush enemy with bare hand? That good. Best way to start is just go out and do it. Biggest enemy around here lizard men. You go practice. Fight against lizard men. Bring me their tasty meat. You bring four.");
		}
	}

sub EVENT_ITEM
	{
	if ($faction < 5)
		{
		plugin::mass_handin(13410, 4, \&BRACER);
		plugin::mass_handin(16486, 4, \&CAP);
		plugin::mass_handin(13367, 1, \&LEGS);
		plugin::mass_handin(13354, 4, \&TUNIC);
		plugin::mass_handin(13061, 2, \&FUR);
		plugin::mass_handin(13062, 2, \&WING);

		quest::exp(200);
		quest::ding();

		if ($furdone and $wingdone)
			{
			$furdone = 0;
			$wingdone = 0;
			quest::say("Good job, these keep me warm. Last job for you. Go kill more lizards. Bring four tails.");
			}
		}
	}

sub BRACER
	{
	quest::say("Hmm, you do good against the lizard men. Here you go. If you want hat for head, bring four silk thread.");
	quest::summonitem(7375);
	quest::updatetaskactivity(81,3, 4);
	}

sub CAP
	{
	quest::say("Very nice. You fight good with hat me make you. You want pants to cover legs, bring me doll from lizards.");
	quest::summonitem(7376);
	quest::updatetaskactivity(81,7, 4);
	}

sub LEGS
	{
	quest::say("You do good, now me have doll to play with. I give you wepun if you bring me fur and wings from two big bats.");
	quest::summonitem(7377);
	quest::updatetaskactivity(81,8, 1);
	}

sub TUNIC
	{
	quest::say("You quick. You do good work. Me come find you when more jobs need done. Here is last armur me have.");
	quest::summonitem(7379);
	}

sub FUR()
	{
	$furdone=1;
	quest::say("Nice job!");
	quest::summonitem(7378);
	quest::updatetaskactivity(81,10, 1);
	}

sub WING()
	{
	$wingdone=1;
	quest::say("Nice job!");
	quest::summonitem(7378);
	quest::updatetaskactivity(81,9, 1);
	}
