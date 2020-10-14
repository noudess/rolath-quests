sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Why hello there.  Are you perhaps a new recruit?  If you wish to learn the ways of the Wizard, read the note in your inventory and hand me your note to start your training."); }
}
sub EVENT_ITEM { 
if ($item1=="18718"){quest::say("Greetings. I am Gahlith, Master of the Wizards' Order of the Hall of Sorcery. Here, we have devoted our lives and souls to the study of the arcane. My apprentice Kazlo Naedra shall tutor you and teach you the fundamentals of sorcery. Once you are ready to begin your hunting training please see Juegile Sohgohm, he will assist you in some tasks for your early adventures.");
quest::faction(342, 100);
quest::faction(221, -25);
quest::faction(262, 15);
quest::faction(296, -15);
quest::summonitem("13508");
quest::exp("100"); }
quest::ding();
}
#END of FILE Zone:qeynos  ID:1064 -- Gahlith_Wrannstad 

