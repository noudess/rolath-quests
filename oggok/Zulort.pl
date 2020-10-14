sub EVENT_SAY 
	{
	if($text=~/Hail/i) 
		{
		quest::say("Um, you. Hi.. You Shaman of War now, right? You gotta learns war and war spells. We fights all and makes the Warlord likes us. You [gonna help] or me gonna feed you fat stoopid boddie to doggies.");
		}
	elsif ($faction > 5)
		{
		plugin::reject_say();
		}
	elsif ($faction == 5)
		{
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		}
	elsif($text=~/help/i) 
		{
		quest::say("Good. Warlord need many boddie.. I means Shamans of War.. to kill and gets killed.. no, ummm.. kill and smoosh for Him and makes Him happy. You goes show me you can smoosh tings good. Gets me four froglok tadpole fleshies for me to munchings on and me be happy.. um, He, the Warlord be so berry happy. Helping our tuff friends de Greenbloods but be watching for dem scummy Crakneks, dumb ogres dey is. No good, no our friends. Go now. Me.. er.. he waiting and hungry.");
		}
	elsif($text=~/bedder shaman/i) 
		{
		quest::say("Yoo want to be bedda shaman? Them lizards in de Feerrott tink de bedda den us and bodder us wit der majiks like fleas on a dog. Kill dem and bring me, um, one of dem bags dey wear around dem necks and, um, three of dem dolls dey hold.");
		}
	}

sub EVENT_ITEM 
	{
	if ($faction < 5 && plugin::check_handin(\%itemcount, 13187 => 4)) 
		{
		quest::say("Oh, me.. um.. Warlord BERRY happy. Berry like dese. Gimme. Uh, why is you still here? Take dis and gets more kills. You learning good, come sees me. I teaches you bout stuff. Make you [bedder shaman]. Go. He and me watching.");
		quest::summonitem(15201); #Changed to Flash of Light on Rolath
		quest::faction(394, 5); #Shamans of War
		quest::exp(100);
		quest::ding();
		}
	elsif ($faction < 5 && plugin::check_handin(\%itemcount, 14199 => 1, 13367 => 3)) 
		{
		quest::say("Dis good stuff! Me and Warlord happy! Wear dis symbol and he make yoo strong with majik!");
		quest::summonitem(1444);
		quest::faction(394, 5); #Shamans of War
		quest::exp(200);
		quest::ding();
		}
	elsif (plugin::check_handin(\%itemcount, 18788 => 1)) 
		{
		quest::say("Take, take...  You now Shaman of War...  Zulort make you majik, too. When u [gonna help] u tell Zulort. You return to me when you stronger, I teach you many things I know.");
		quest::summonitem(13526); #Dirty Patched Fur Tunic*
		#Verified on live
		quest::faction(394, 100); #Shamans of War
		quest::exp(100);
		quest::ding();
		}
	else 
		{
		quest::say("Me not need dis."); #text made up
		plugin::return_items(\%itemcount);
		}
	}
