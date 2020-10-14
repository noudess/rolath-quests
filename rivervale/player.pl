sub EVENT_TASK_COMPLETE
	{
	if($task_id == 73)
		{
		$client->Message(15,"Twippie Diggs whispers quietly 'My book will explain how to make my new armor, read it carefully and keep it secret, keep it safe!'");
		quest::LearnRecipe(13068);
		quest::LearnRecipe(13069);
		quest::LearnRecipe(13070);
		quest::LearnRecipe(13071);
		quest::LearnRecipe(13072);
		quest::LearnRecipe(13073);
		quest::LearnRecipe(13074);
		quest::LearnRecipe(13075);
		quest::LearnRecipe(13076);
		quest::LearnRecipe(13077);
		quest::LearnRecipe(13078);
		quest::LearnRecipe(13079);
		}
	}
