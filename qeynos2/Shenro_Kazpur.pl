sub EVENT_SPAWN
	{
	quest::set_proximity($x-100,$x+100,$y-100,$y+100); 
	}

sub EVENT_ENTER
	{
	plugin::playmp3once("Brilaret.mp3");
	}

sub EVENT_EXIT
	{
	plugin::playmp3once("");
	}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, and welcome to my shop. I am humble merchant Shenro Kazpur of the Silent Fist Clan.");
  }
}

#EndFile qeynos2\Shenro_Kazpur (2076)
