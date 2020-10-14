# Unsar's Glory

sub EVENT_SAY {

if($text=~/hail/i) {
   quest::say("Hello, $name, I am Unsar, student of Mespha. I am working on a spell. . . I call it [Unsar's Glory]. Great name, huh?");
}

if($faction <= 7 && $text=~/unsar's glory/i) {
   quest::say("Ah, Unsar's Glory. . . Mind you, I haven't perfected it yet, but bring me some [rat whiskers], [snake scales], and two [bat wings], and I'll show you how it works.");
}

}

sub EVENT_ITEM {

if ($faction <= 7 && plugin::check_handin(\%itemcount,13071 => 1,13070 =>1,13068 =>2)) { # batwing 2, snake scale, rat whiskers
   quest::say("All right, check this out... Maybe one day you'll be good enough to do this too.");
   quest::doanim(15);
   # Faction from ZAM	
   # Xp from live via spreadsheet
   quest::faction(342,5); # Order of Three
   quest::faction(262,1); # Guards of Qeynos
   quest::faction(221,-1); # Bloodsabers
   quest::faction(296,-1); # Opal Dark Briar
   quest::exp(145);
   quest::ding();
 }

}

#END of FILE Zone:qeynos  ID:1066 -- Unsar_Koldhagon.pl
