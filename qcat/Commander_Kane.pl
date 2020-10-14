sub EVENT_SAY 
	{
	if($text=~/hail/i) 
		{
		quest::say('Do you know who I am?!  I am the Commander of the Qeynos Guard!  Do you think I trod through these sewers to speak with you?  If so, then you are quite sadly mistaken.');
		}

	if($text=~/The disease is spreading/i || $text=~/i am a bloodsaber/i) 
		{
		quest::say("Good to see you, my friend. S'ragg said he would be sending his finest. I pray he is right. Do you feel like [going to Highpass] or [going home]?");
		}

	if($text=~/Highpass/i) 
		{
		# Works at Apprehensive.
		quest::say("You will be taking this with you. Give this marked bottle to a man called Barn Bloodstone. He is known to hang around a place called the Golden Rooster. He has a package for me. He will then give you instructions to your next destination. Now, be off! Time is of the essence!");
		quest::summonitem(13130);
		}
	if($text=~/going home/i) 
		{
		quest::say("Just as well.  Get the shrine to send me someone of strength.  No more cowards!");
		}
	}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
