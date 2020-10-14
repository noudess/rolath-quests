sub EVENT_SPAWN
	{
	quest::set_proximity($x-100,$x+100,$y-100,$y+100); 
	}

sub EVENT_ENTER
	{
	$client->PlayMP3("Brilaret.mp3");
	}

sub EVENT_EXIT
	{
	$client->PlayMP3("");
	}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, and welcome to my shop. I am humble merchant Shenro Kazpur of the Silent Fist Clan.");
  }
}

#EndFile qeynos2\Shenro_Kazpur (2076)
