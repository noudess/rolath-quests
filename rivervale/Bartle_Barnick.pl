my $taskid=70;
my $containerid=17124;
my $bracerid=19681;
my $robeid=19679;

sub EVENT_SAY 
	{
	if($text=~/hail/i)
		{
		quest::say("Good day, $name! Are you are a new Druid of the Storm Reapers? If so, I promised Hibbs that I would assist in getting you outfitted for ventures beyond Rivervale. But first, you must bring me a note from Hibbs as proof that he sent you. There are many dangers outside of the shire, so leather clothing and a weapon often become necessities for a traveling druid.");
		}

	if($text=~/moss toe cap/i)
		{
		quest::say("To assemble a Moss Toe Cap you will require two [silk thread], a ruined mossy rat pelt, and a giant thicket rat skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
		# Summon: Tattered Cap Pattern
		quest::summonitem(19555);

		}
	if($text=~/moss toe bracer/i)
		{
		quest::say("To assemble a Moss Toe Bracer you will require a [silk thread], a ruined mossy rat pelt, and a large wood spider tibia. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Wristband Pattern.");
		# Summon: Tattered Wristband Pattern
		quest::summonitem(19558);
		}

	if($text=~/moss toe gloves/i)
		{
		quest::say("To assemble Moss Toe Gloves you will require two [silk thread], a ruined mossy rat pelt, and two large wood spider tarsus. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
		# Summon: Tattered Glove Pattern
		quest::summonitem(19559); 
		}

	if($text=~/moss toe boots/i)
		{
		quest::say("To assemble Moss Toe Boots you will require two [silk thread], two ruined mossy rat pelts, and two giant wood spider hairs. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
		# Summon: Tattered Boot Pattern
		quest::summonitem(19561); 

		}
	if($text=~/moss toe sleeves/i)
		{
		quest::say("To assemble Moss Toe Sleeves you will require two [silk thread], a mossy rat pelt, and two giant wood spider patella. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
		# Summon: Tattered Sleeves Pattern
		quest::summonitem(19557);
		}

	if($text=~/moss toe leggings/i)
		{
		quest::say("To assemble Moss Toe Leggings you will require three [silk thread], two mossy rat pelts, and two giant wood spider femurs. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Pants Pattern.");
		# Summon: Tattered Pants Pattern
		quest::summonitem(19560);
		}

	if($text=~/moss toe tunic/i)
		{
		quest::say("To assemble a Moss Toe Tunic you will require four [silk thread], an undamaged mossy rat pelt, and a giant wood spider thorax. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
		# Summon: Tattered Tunic Pattern
		quest::summonitem(19556);
		}

	if($text=~/silk thread/i)
		{
		quest::say("Silk Thread is sewn by a tailor using a [sewing kit] or a community [loom]. Two spiderling silks combined in the sewing kit or loom will create one silk thread.");
		}

	if($text=~/sewing kit/i)
		{
		quest::say("Meeka Diggs in the center of Rivervale behind the Fools Gold Tavern may be able to provide you with a sewing kit. There is also a loom near where she peddles her goods.");
		}

	if($text=~/loom/i)
		{
		quest::say("Meeka Diggs in the center of Rivervale behind the Fools Gold Tavern may be able to provide you with a sewing kit. There is also a loom near where she peddles her goods.");
		}
	}

sub EVENT_ITEM 
	{
	# Handin: Letter to Bartle Barnick
	if(plugin::check_handin(\%itemcount, 19629 => 1))
		{
		$varname="Blessed$charid";
		if (!defined($qglobals{$varname}))
			{
			quest::say("It is good to see another of our young people choose the humble life of a druid of Karana. I have assembled patterns that will allow you to construct some protective leather garments to keep you comfortable in the wilds and help turn aside the weapons of the Storm Reapers enemies. The required components for the leather vary according to which piece of Moss Toe Leather your are planning on crafting. Do you wish to craft a [moss toe cap], a [moss toe bracer], [moss toe gloves], [moss toe boots], [moss toe sleeves], [moss toe leggings], or a [moss toe tunic]?");
			my @task_array;
			push(@task_array, $taskid);
			quest::taskselector(@task_array);
			}
		else
			{
			quest::say("You are already blessed.");
			}
		}

    if (quest::istaskactivityactive($taskid, 7))
        {
        if (plugin::check_handin(\%itemcount, $containerid => 1))
            {
            quest::updatetaskactivity($taskid,7);
            }
        }

    if (quest::istaskactivityactive($taskid, 14))
        {
        if (plugin::check_handin(\%itemcount, $robeid => 1))
            { # robe is last step
            if (!plugin::has_newbie_stuff($client))
                {
                quest::incstat(0,2);    # STR
                quest::incstat(1,6);    # STA
                quest::incstat(2,5);   # AGI
                quest::incstat(3,5);   # DEX
                quest::incstat(5,3);    # WIS
                quest::incstat(6,3);   # CHA
                quest::enabletitle(40);
                quest::shout2("All Hail Storm Druid $name!");
                quest::updatetaskactivity($taskid,14);
                }
            else
                {
                quest::summonitem($robeid);
                }
            }
        }
	}

sub EVENT_TASKACCEPTED
    {
    $varname="Blessed$charid";
    quest::summonitem($containerid);
    quest::setglobal($varname,1,5,"F");
    }

#EOF
