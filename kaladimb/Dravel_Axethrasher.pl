sub EVENT_SAY 
	{
	if($text =~ /Hail/i) 
		{
		quest::say("Greetin's $name!  You say ye wish to join up with us?  That be great!  Read the note in yer inventory and then hand it to me and we can start yer trainin! Oh, remember to ask me about that [tome] there in yer inventory.  Wouldn't want ta ferget about that!");
		}

	if($text =~ /Tome/i) 
		{
		quest::say("Hand me that tome there in yer inventory and Ill teach yer a new skill.  Check back with Tabber from time to time to see if ye can learn anythin new.  Buy the tome and then hand it to me and I'll teach ye all ya need to know.");
		}
	}

sub EVENT_ITEM 
	{
    if(plugin::check_handin(\%itemcount, 36000 => 1))  # Blood-Smeared Note
		{
		quest::say("Tis a good thing ye're doing by joining up with us, $name. As a member, ye get a wee gift. Take this tunic. Now, take that rage that rushes through yer veins and go kill some of the vermin around the city! Take a good look around ye as well. Grab some ale or talk to some of the miners. Lots to do around 'ere, me friend. Oh, and Goriba over there wanted to talk to ya. Now, off with ye! Come back when ye've cut a few creatures down and gotten some experience with yer blade. I'll be able to educate ye a bit about the ways of the berserker.");
		quest::ding();
		quest::summonitem(36006); # Tattered Miner's Tunic*
		quest::exp(100);
		}

	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Berserker');
	plugin::return_items(\%itemcount);
	}
