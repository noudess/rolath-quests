#Gindlin's Poison

sub EVENT_SAY
{
 if($text=~/Hail/i)
  {
   quest::say("Enough with the formalities.  I don't make it to these parts often and I only plan on being here a couple days.  My time is precious.  You must be a rogue in search of the [death juice].");
  }
 if($text=~/death juice/i)
  {
   quest::emote("grins");
   quest::say("Spider venom.  You can't mix it yourself.  If you want,  I can do it.  I'll need two spider venom sacs from the giant spiders.  There should be some around these plains.  I also demand a fee of 20 gold pieces, oh yeah!...  I have been banished from Qeynos...  I also want a bottle of my favorite brew, Crow's special brew, purchased from Crow himself in North Qeynos.");
  }
}

sub EVENT_ITEM
{
  if(plugin::check_handin(\%itemcount, 14018 => 2, 13901 => 1) && $gold == 20)
  {
   quest::emote("grins slyly");
   quest::say("Here.  I could care less what you do with this.  Hopefully you'll lay some on the Circle of Unseen Hands.");
   quest::summonitem(14015);
  }
plugin::return_items(\%itemcount);
}
#END of FILE zone: ID:12011 -- Gindlin_Toxfodder.pl 
