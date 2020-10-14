sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Greetings...  I am Mespha Tevalian, Master Enchantress of the Hall of Sorcery and the Order of Three. Here, we all study the three circles of magic, and lend our services to citizens of Qeynos. Rumors of an underground group calling themselves the Bloodsabers have recently been spreading throughout the city. It is our duty to help local guards protect Qeynos' citizens from this new evil."); }
}
sub EVENT_ITEM { 
	if ($item1=="18720"){quest::say("Greetings $name. Welcome to the Hall of Sorcery. You have much to learn. Wear this tunic and represent us well. See my apprentice, Unsar Koldhagon, he will get you started and help you with your studies. If you are in need of some armor, go see Juegile.");
quest::faction(342, 100);
quest::faction(221, -25);
quest::faction(262, 15);
quest::faction(296, -15);
quest::summonitem("13508");
quest::ding();
quest::exp("100"); }
}
#END of FILE Zone:qeynos  ID:1068 -- Mespha_Tevalian 

