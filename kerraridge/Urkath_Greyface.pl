sub EVENT_SAY
	{
	if ($faction > 7) 
		{
		plugin::reject_say(); 
		}
	elsif ($text =~ /Hail/i)
		{
		quest::say("Errr?  What you say to Urrrkath?  Ah.  Hello to you as well. furrrless type person. Would you do Urrrkath a [favor]?");
		}
	elsif ($text =~ /what favor/i)
		{
		quest::say("Grrreatful I am that you would think to do this for me.  I am in need of a special leaf, called a [Sylvani Leaf], if you could brrrring this to me I would rrrrreward you verrrry well.");
		}
	elsif ($text =~ /Sylvani Leaf/i)
		{
		quest::say("They say that the leaf only exists in a small forest farrrrr frrrrrom ourrrrrr island");
		}
	}

sub EVENT_ITEM
	{
	if ($faction < 8 && plugin::check_handin(\%itemcount, 1155 => 1))
		{
		quest::say("Excellent! I can't believe you found it.  Here is the rrrreward that I promised you.");

		# Zam Verified
		quest::faction(382, 5);
		quest::summonitem(2045);
		}
	}
