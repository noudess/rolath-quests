sub EVENT_SAY 
{ 
if($text=~/hail/i)
	{
	quest::say("Hello. You look a mite scrawny.  You should purchase some fishcakes.  They will add muscle to your frame.");
	}

if($text=~/lion meat/i)
	{
	quest::say("Very well then.  Hee you go.  Be sure to deliver this to Teria O'Danos.  She will be one of the first people you meet in Halas.");
	quest::summonitem(13961); #Lion Meat Shipment
	}
}
#END of FILE Zone:qey2hh1  ID:3563 -- Misla_McMannus 

