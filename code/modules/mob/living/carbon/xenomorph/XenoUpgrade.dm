/mob/living/carbon/xenomorph/proc/age_xeno()
	if(stat == DEAD || !caste || QDELETED(src) || !client || age == XENO_NO_AGE)
		return

	age = XENO_NORMAL
	var/hours_as_xeno = client.get_total_xeno_playtime()
	var/hours_as_caste = get_job_playtime(client, caste.caste_type)

	switch(hours_as_caste)
		if(JOB_PLAYTIME_TIER_1 to JOB_PLAYTIME_TIER_2)
			age = XENO_MATURE
		if(JOB_PLAYTIME_TIER_2 to JOB_PLAYTIME_TIER_3)
			age = XENO_ELDER
		if(JOB_PLAYTIME_TIER_3 to JOB_PLAYTIME_TIER_4)
			age = XENO_ANCIENT
		if(JOB_PLAYTIME_TIER_4 to INFINITY)
			age = XENO_PRIME

	if(hours_as_xeno < JOB_PLAYTIME_TIER_1)
		age = XENO_YOUNG

	// For people who wish to remain anonymous
	if(!client.prefs.playtime_perks)
		age = XENO_NORMAL

	/* BANDASTATION EDIT START - Age Prefixes
	switch(age)
		if(XENO_YOUNG)
			age_prefix = "Young "
		if(XENO_NORMAL)
			age_prefix = ""
		if(XENO_MATURE)
			age_prefix = "Mature "
		if(XENO_ELDER)
			age_prefix = "Elder "
		if(XENO_ANCIENT)
			age_prefix = "Ancient "
		if(XENO_PRIME)
			age_prefix = "Prime "
	*/
	age_prefix = caste.get_age_prefix(age)
	// BANDASTATION EDIT END

	hud_update() //update the age level insignia on our xeno hud.

	//One last shake for the sake of it
	xeno_jitter(25)
