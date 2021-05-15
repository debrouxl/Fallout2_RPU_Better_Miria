#!/usr/bin/perl -W
use strict;
use warnings;

package main;
    my $flags = $ARGV[0];

    my $work;
    my $line;

    my $node1002 = 0;
    my $shorten_else_begin = 0;
    my $shorten_end_else_begin = 0;
    my $indentation_level = 0;
    my $indentation = '';

    open(INFILE, '<', 'mcmiria_decompiled_reordered_headerfixed.ssl') or die "Cannot open input file 1: $!";
    open(OUTFILE, '>', 'mcmiria_work.ssl') or die "Cannot open output file 1: $!";

    read(INFILE, $work, -s INFILE);
    (length($work) == -s INFILE) or die "Could not read the entire input file 1: $!";
    close(INFILE);

    $work =~ s/gsay_reply\(106, /Reply(/g;
    $work =~ s/Reply\(random\((\d+), (\d+)\)\)/Reply_Rand($1,$2)/g;
    $work =~ s/did_node_11 := 0/did_node_11 := false/g;
    $work =~ s/did_node_12 := 0/did_node_12 := false/g;
    $work =~ s/did_node_11 := 1/did_node_11 := true/g;
    $work =~ s/did_node_12 := 1/did_node_12 := true/g;
    $work =~ s/did_node_11 == 0/did_node_11 == false/g;
    $work =~ s/did_node_12 == 0/did_node_12 == false/g;
    $work =~ s/did_node_11 == 1/did_node_11 == true/g;
    $work =~ s/did_node_12 == 1/did_node_12 == true/g;

    $work =~ s/set_global_var\(117, 1\)/set_tool_flag/g;
    $work =~ s/\(global_var\(105\) >= 4\) and \(global_var\(105\) < 7\) or \(\(global_var\(106\) >= 4\) and \(global_var\(106\) < 7\)\)/family_feud_seed_active/g;
    $work =~ s/get_critter_stat\(dude_obj, 3\)/dude_charisma/g;
    $work =~ s/get_critter_stat\(self_obj, 7\)/self_max_hits/g;
    $work =~ s/get_critter_stat\(dude_obj, 34\) == 0/dude_is_male/g;
    $work =~ s/get_critter_stat\(dude_obj, 34\) == 1/dude_is_female/g;
    $work =~ s/get_critter_stat\(self_obj, 34\) == 0/self_is_male/g;
    $work =~ s/get_critter_stat\(self_obj, 34\) == 1/self_is_female/g;
    $work =~ s/get_critter_stat\(self_obj, 35\)/self_cur_hits/g;
    $work =~ s/get_critter_stat\(self_obj, 0\)/get_strength(self_obj)/g;

    $work =~ s/critter_state\(party_member_obj\(16777380\)\) bwand \(4 bwor 8 bwor 16 bwor 32\)/Is_Crippled(self_obj)/g;

    $work =~ s/call Node(\d+)\(\)/call Node$1/g;

    $work =~ s/elevation\(dude_obj\)/dude_elevation/g;
    $work =~ s/elevation\(self_obj\)/self_elevation/g;

    $work =~ s/tile_num\(dude_obj\)/dude_tile/g;
    $work =~ s/tile_num\(self_obj\)/self_tile/g;

    $work =~ s/self_cur_hits == self_max_hits/party_healed_max/g;
    $work =~ s/\(self_cur_hits \* 100 \/ self_max_hits\) >= 90/party_healed_good/g;
    $work =~ s/\(self_cur_hits \* 100 \/ self_max_hits\) >= 70/party_healed_hurt/g;

    $work =~ s/do_check\(dude_obj, 3, 0\)/do_check(dude_obj, STAT_ch, 0)/g;
#    $work =~ s/global_var\(795/global_var(GVAR_MIRIA_WANTS/g;
#    $work =~ s/global_var\(794/global_var(GVAR_MIRIA_SEXTIME/g;
#    $work =~ s/global_var\(793/global_var(GVAR_MIRIA_ASK3TIME/g;
#    $work =~ s/global_var\(792/global_var(GVAR_MIRIA_ASK2TIME/g;
#    $work =~ s/global_var\(791/global_var(GVAR_MIRIA_ASK1TIME/g;
    $work =~ s/global_var\(728/global_var(GVAR_DEN_ORPHANAGE/g;
    $work =~ s/global_var\(590/global_var(GVAR_DUDE_VIRGIN/g;
    $work =~ s/global_var\(589/global_var(GVAR_GIGALO/g;
    $work =~ s/global_var\(588/global_var(GVAR_SEXPERT/g;
    $work =~ s/global_var\(449/global_var(GVAR_PLAYER_WAS_MARRIED/g;
    $work =~ s/global_var\(422/global_var(GVAR_ENDGAME_MOVIE_VAULT_13/g;
    $work =~ s/global_var\(398/global_var(GVAR_PARTY_NO_FOLLOW/g;
    $work =~ s/global_var\(358/global_var(GVAR_SEX_COUNTER/g;
    $work =~ s/global_var\(296/global_var(GVAR_ADDICT_JET/g;
    $work =~ s/global_var\(295/global_var(GVAR_ADDICT_TRAGIC/g;
    $work =~ s/global_var\(291/global_var(GVAR_MODOC_STAGE_STATE/g;
    $work =~ s/global_var\(290/global_var(GVAR_MODOC_STAGE_TIMER/g;
    $work =~ s/global_var\(232/global_var(GVAR_NEW_RENO_PORN_STAR/g;
    $work =~ s/global_var\(230/global_var(GVAR_NEW_RENO_MADE_MAN/g;
    $work =~ s/global_var\(194/global_var(GVAR_PLAYER_SEX_LEVEL/g;
    $work =~ s/global_var\(137/global_var(GVAR_ENEMY_VAULT_CITY/g;
    $work =~ s/global_var\(59/global_var(GVAR_TOWN_REP_VAULT_13/g;
    $work =~ s/global_var\(57/global_var(GVAR_TOWN_REP_NCR/g;
    $work =~ s/global_var\(56/global_var(GVAR_TOWN_REP_REDDING/g;
    $work =~ s/global_var\(55/global_var(GVAR_TOWN_REP_NEW_RENO/g;
    $work =~ s/global_var\(52/global_var(GVAR_TOWN_REP_MODOC/g;
    $work =~ s/global_var\(50/global_var(GVAR_TOWN_REP_VAULT_CITY/g;
    $work =~ s/global_var\(49/global_var(GVAR_TOWN_REP_THE_DEN/g;
    $work =~ s/global_var\(47/global_var(GVAR_TOWN_REP_ARROYO/g;
    $work =~ s/global_var\(26\)/global_var(GVAR_ALCOHOL_ADDICT)/g;
    $work =~ s/global_var\(25\)/global_var(GVAR_RADAWAY_ADDICT)/g;
    $work =~ s/global_var\(24\)/global_var(GVAR_PSYCHO_ADDICT)/g;
    $work =~ s/global_var\(23\)/global_var(GVAR_MENTATS_ADDICT)/g;
    $work =~ s/global_var\(22\)/global_var(GVAR_BUFF_OUT_ADDICT)/g;
    $work =~ s/global_var\(14\)/global_var(GVAR_ENEMY_DEN)/g;
    $work =~ s/global_var\(11\)/global_var(GVAR_REPUTATION_SLAVER)/g;
    $work =~ s/global_var\(6,/global_var(GVAR_PLAYER_MARRIED,/g;
    $work =~ s/global_var\(6\)/global_var(GVAR_PLAYER_MARRIED)/g;
    $work =~ s/global_var\(1,/global_var(GVAR_CHILDKILLER_REPUTATION,/g;
    $work =~ s/global_var\(1\)/global_var(GVAR_CHILDKILLER_REPUTATION)/g;
    $work =~ s/global_var\(0/global_var(GVAR_PLAYER_REPUTATION/g;
    $work =~ s/game_time >= global_var\(GVAR_MODOC_STAGE_TIMER\)/stage_time_ready/g;
    $work =~ s/set_global_var\(GVAR_MODOC_STAGE_TIMER, game_time \+ \(3 \* 10\)\);/set_next_stage_time_only(quick_stage_time);/g;
              #s/game_time \+ \(2 \* \(30 \* \(24 \* \(60 \* \(60 \* 10\)\)\)\)\)/game_time + (2 * (30 * (HOURS_PER_DAY * (MINUTES_PER_HOUR * (SECONDS_PER_MINUTE * GAME_TIME_SUBSECOND_RESOLUTION)))))/g;
    $work =~ s/game_time \+ \(2 \* \(30 \* \(24 \* \(60 \* \(60 \* 10\)\)\)\)\)/game_time + 2 * ONE_GAME_MONTH/g;

    $work =~ s/global_var\(297\) bwand 131072/grisham_dead/g;
    $work =~ s/\(grisham_dead\) != 0/grisham_dead/g;
    $work =~ s/game_time_advance\(get_critter_stat\(dude_obj, 2\) \* random\(4, 8\) \* \(60 \* 10\)\);/advance_sex_time;/g;
    $work =~ s/\(\(\(\(dude_charisma \* 50\) \+ \(get_critter_stat\(dude_obj, 2\) \* 25\) \+ \(get_critter_stat\(dude_obj, 5\) \* 13\) \+ \(get_critter_stat\(dude_obj, 0\) \* 12\)\) \/ 100\) \+ \(has_trait\(0, dude_obj, 94\) \* 2\) \+ has_trait\(2, dude_obj, 13\) \+ \(\(\(global_var\(GVAR_PLAYER_SEX_LEVEL\) >= 100\) or \(global_var\(GVAR_NEW_RENO_PORN_STAR\) > 0\)\) \* 2 \* \(dude_obj == dude_obj\)\)\)/dude_sex_rating/g;
    $work =~ s/set_global_var\(GVAR_PLAYER_SEX_LEVEL, global_var\(GVAR_PLAYER_SEX_LEVEL\) \+ \(dude_sex_rating \* 1\)\);/up_sex_level(1);/g;

    $work =~ s/set_local_var\(6, 2\)/set_local_var(LVAR_Insulted,insult_bad)/g;
    $work =~ s/set_local_var\(10, 3\)/set_follow_close/g;
    $work =~ s/set_local_var\(10, 6\)/set_follow_medium/g;
    $work =~ s/set_local_var\(10, 9\)/set_follow_far/g;
    $work =~ s/local_var\(4/local_var(LVAR_Hostile/g;
    $work =~ s/local_var\(5/local_var(LVAR_Here_Before/g;
    $work =~ s/local_var\(6/local_var(LVAR_Insulted/g;
    $work =~ s/local_var\(7/local_var(LVAR_Mode/g;
    $work =~ s/local_var\(8/local_var(LVAR_TEAM/g;
    $work =~ s/local_var\(9/local_var(LVAR_WAITING/g;
    $work =~ s/local_var\(10/local_var(LVAR_FOLLOW_DISTANCE/g;
    $work =~ s/local_var\(13/local_var(LVAR_Home_Tile/g;
    $work =~ s/local_var\(14/local_var(LVAR_Gave_Weapon/g;
    $work =~ s/local_var\(15/local_var(LVAR_DID2100/g;
    $work =~ s/local_var\(16/local_var(LVAR_DID2600/g;
    $work =~ s/local_var\(17/local_var(LVAR_TALLY/g;
    $work =~ s/local_var\(18/local_var(LVAR_TALLY_TIMER/g;
    $work =~ s/local_var\(19/local_var(LVAR_HAVESEX/g;

    $work =~ s/set_local_var\(LVAR_Mode, 1\);/set_local_var(LVAR_Mode,mode_rape);/g;

    $work =~ s/set_local_var\((\w+), local_var\(\1\) \+ 1\)/inc_local_var($1)/g;
    $work =~ s/set_local_var\((\w+), local_var\(\1\) - 1\)/dec_local_var($1)/g;

    $work =~ s/cur_map_index == 172/cur_map_index == MAP_SHENG_HIDEOUT/g;
    $work =~ s/cur_map_index == 171/cur_map_index == MAP_EPA_SUBLEVELS_2/g;
    $work =~ s/cur_map_index == 170/cur_map_index == MAP_EPA_SUBLEVELS_1/g;
    $work =~ s/cur_map_index == 169/cur_map_index == MAP_SAN_FRAN_SUB/g;
    $work =~ s/cur_map_index == 168/cur_map_index == MAP_VILMERCH/g;
    $work =~ s/cur_map_index == 167/cur_map_index == MAP_MERCHANT/g;
    $work =~ s/cur_map_index == 166/cur_map_index == MAP_EASTER/g;
    $work =~ s/cur_map_index == 165/cur_map_index == MAP_RANGER_SAFE_HOUSE3/g;
    $work =~ s/cur_map_index == 164/cur_map_index == MAP_RANGER_SAFE_HOUSE2/g;
    $work =~ s/cur_map_index == 163/cur_map_index == MAP_RANGER_SAFE_HOUSE1/g;
    $work =~ s/cur_map_index == 162/cur_map_index == MAP_HUBOLOGIST_STASH/g;
    $work =~ s/cur_map_index == 161/cur_map_index == MAP_GECKO_ENCLAVE_PATROL/g;
    $work =~ s/cur_map_index == 160/cur_map_index == MAP_SLAVER_CAMP/g;
    $work =~ s/cur_map_index == 159/cur_map_index == MAP_EPA_SECRET/g;
    $work =~ s/cur_map_index == 158/cur_map_index == MAP_EPA_SUBLEVELS/g;
    $work =~ s/cur_map_index == 157/cur_map_index == MAP_EPA/g;
    $work =~ s/cur_map_index == 156/cur_map_index == MAP_PRIMITIVE_TRIBE2/g;
    $work =~ s/cur_map_index == 155/cur_map_index == MAP_PRIMITIVE_TRIBE1/g;
    $work =~ s/cur_map_index == 154/cur_map_index == MAP_VAULT_VILLAGE/g;
    $work =~ s/cur_map_index == 153/cur_map_index == MAP_ABBEY_CAVE/g;
    $work =~ s/cur_map_index == 152/cur_map_index == MAP_ABBEY_BASEMENT/g;
    $work =~ s/cur_map_index == 151/cur_map_index == MAP_ABBEY_OUTSIDE/g;
    $work =~ s/cur_map_index == 150/cur_map_index == MAP_BESS_DEAD/g;
    $work =~ s/cur_map_index == 149/cur_map_index == MAP_IN_GAME_MOVIE1/g;
    $work =~ s/cur_map_index == 148/cur_map_index == MAP_SHI_TEMPLE/g;
    $work =~ s/cur_map_index == 147/cur_map_index == MAP_NEW_RENO_VB/g;
    $work =~ s/cur_map_index == 146/cur_map_index == MAP_RND_CITY_8/g;
    $work =~ s/cur_map_index == 145/cur_map_index == MAP_RND_CITY_7/g;
    $work =~ s/cur_map_index == 144/cur_map_index == MAP_RND_CITY_6/g;
    $work =~ s/cur_map_index == 143/cur_map_index == MAP_RND_CITY_5/g;
    $work =~ s/cur_map_index == 142/cur_map_index == MAP_RND_CITY_4/g;
    $work =~ s/cur_map_index == 141/cur_map_index == MAP_RND_CITY_3/g;
    $work =~ s/cur_map_index == 140/cur_map_index == MAP_ELRONOLOGIST_BASE/g;
    $work =~ s/cur_map_index == 139/cur_map_index == MAP_SHUTTLE_INTERIOR/g;
    $work =~ s/cur_map_index == 138/cur_map_index == MAP_SHUTTLE_EXTERIOR/g;
    $work =~ s/cur_map_index == 137/cur_map_index == MAP_SAN_FRAN_CHINATOWN/g;
    $work =~ s/cur_map_index == 136/cur_map_index == MAP_SAN_FRAN_DOCK/g;
    $work =~ s/cur_map_index == 135/cur_map_index == MAP_SAN_FRAN_TANKER/g;
    $work =~ s/cur_map_index == 134/cur_map_index == MAP_ENCLAVE_TRAP_ROOM/g;
    $work =~ s/cur_map_index == 133/cur_map_index == MAP_ENCLAVE_REACTOR/g;
    $work =~ s/cur_map_index == 132/cur_map_index == MAP_ENCLAVE_PRESIDENT/g;
    $work =~ s/cur_map_index == 131/cur_map_index == MAP_ENCLAVE_BARRACKS/g;
    $work =~ s/cur_map_index == 130/cur_map_index == MAP_ENCLAVE_END_FIGHT/g;
    $work =~ s/cur_map_index == 129/cur_map_index == MAP_ENCLAVE_DOCK/g;
    $work =~ s/cur_map_index == 128/cur_map_index == MAP_ENCLAVE_DETENTION/g;
    $work =~ s/cur_map_index == 127/cur_map_index == MAP_DESTROYED_ARROYO_BRIDGE/g;
    $work =~ s/cur_map_index == 126/cur_map_index == MAP_ARROYO_TEMPLE/g;
    $work =~ s/cur_map_index == 125/cur_map_index == MAP_RND_CITY_2/g;
    $work =~ s/cur_map_index == 124/cur_map_index == MAP_RND_MOUNTAIN_6/g;
    $work =~ s/cur_map_index == 123/cur_map_index == MAP_RND_MOUNTAIN_5/g;
    $work =~ s/cur_map_index == 122/cur_map_index == MAP_RND_MOUNTAIN_4/g;
    $work =~ s/cur_map_index == 121/cur_map_index == MAP_RND_MOUNTAIN_3/g;
    $work =~ s/cur_map_index == 120/cur_map_index == MAP_RND_CAVERN_7/g;
    $work =~ s/cur_map_index == 119/cur_map_index == MAP_RND_CAVERN_6/g;
    $work =~ s/cur_map_index == 118/cur_map_index == MAP_RND_DESERT_13/g;
    $work =~ s/cur_map_index == 117/cur_map_index == MAP_RND_DESERT_12/g;
    $work =~ s/cur_map_index == 116/cur_map_index == MAP_RND_DESERT_11/g;
    $work =~ s/cur_map_index == 115/cur_map_index == MAP_RND_DESERT_10/g;
    $work =~ s/cur_map_index == 114/cur_map_index == MAP_RND_DESERT_9/g;
    $work =~ s/cur_map_index == 113/cur_map_index == MAP_RND_DESERT_8/g;
    $work =~ s/cur_map_index == 112/cur_map_index == MAP_RND_COAST_12/g;
    $work =~ s/cur_map_index == 111/cur_map_index == MAP_RND_COAST_11/g;
    $work =~ s/cur_map_index == 110/cur_map_index == MAP_RND_COAST_10/g;
    $work =~ s/cur_map_index == 109/cur_map_index == MAP_NAVARRO_ENTRANCE/g;
    $work =~ s/cur_map_index == 108/cur_map_index == MAP_SPECIAL_RND_MAD_COW/g;
    $work =~ s/cur_map_index == 107/cur_map_index == MAP_SPECIAL_RND_PARIAH/g;
    $work =~ s/cur_map_index == 106/cur_map_index == MAP_SPECIAL_RND_TOXIC/g;
    $work =~ s/cur_map_index == 105/cur_map_index == MAP_SPECIAL_RND_GUARDIAN/g;
    $work =~ s/cur_map_index == 104/cur_map_index == MAP_SPECIAL_RND_HOLY2/g;
    $work =~ s/cur_map_index == 103/cur_map_index == MAP_SPECIAL_RND_HOLY1/g;
    $work =~ s/cur_map_index == 102/cur_map_index == MAP_SPECIAL_RND_CAFE/g;
    $work =~ s/cur_map_index == 101/cur_map_index == MAP_SPECIAL_RND_BRIDGE/g;
    $work =~ s/cur_map_index == 100/cur_map_index == MAP_SPECIAL_RND_UNWASHED/g;
    $work =~ s/cur_map_index == 99/cur_map_index == MAP_SPECIAL_RND_SHUTTLE/g;
    $work =~ s/cur_map_index == 98/cur_map_index == MAP_SPECIAL_RND_HEAD/g;
    $work =~ s/cur_map_index == 97/cur_map_index == MAP_SPECIAL_RND_WOODSMAN/g;
    $work =~ s/cur_map_index == 96/cur_map_index == MAP_SPECIAL_RND_WHALE/g;
    $work =~ s/cur_map_index == 95/cur_map_index == MAP_BH_RND_MOUNTAIN/g;
    $work =~ s/cur_map_index == 94/cur_map_index == MAP_BH_RND_DESERT/g;
    $work =~ s/cur_map_index == 93/cur_map_index == MAP_RAIDERS_CAMP2/g;
    $work =~ s/cur_map_index == 92/cur_map_index == MAP_RAIDERS_CAMP1/g;
    $work =~ s/cur_map_index == 91/cur_map_index == MAP_RND_COAST9/g;
    $work =~ s/cur_map_index == 90/cur_map_index == MAP_RND_COAST8/g;
    $work =~ s/cur_map_index == 89/cur_map_index == MAP_RND_COAST7/g;
    $work =~ s/cur_map_index == 88/cur_map_index == MAP_RND_COAST6/g;
    $work =~ s/cur_map_index == 87/cur_map_index == MAP_RND_COAST5/g;
    $work =~ s/cur_map_index == 86/cur_map_index == MAP_RND_COAST4/g;
    $work =~ s/cur_map_index == 85/cur_map_index == MAP_RND_COAST3/g;
    $work =~ s/cur_map_index == 84/cur_map_index == MAP_RND_DESERT7/g;
    $work =~ s/cur_map_index == 83/cur_map_index == MAP_RND_DESERT6/g;
    $work =~ s/cur_map_index == 82/cur_map_index == MAP_RND_DESERT5/g;
    $work =~ s/cur_map_index == 81/cur_map_index == MAP_RND_DESERT4/g;
    $work =~ s/cur_map_index == 80/cur_map_index == MAP_RND_CAVERN5/g;
    $work =~ s/cur_map_index == 79/cur_map_index == MAP_BROKEN_HILLS2/g;
    $work =~ s/cur_map_index == 78/cur_map_index == MAP_BROKEN_HILLS1/g;
    $work =~ s/cur_map_index == 77/cur_map_index == MAP_RND_COAST2/g;
    $work =~ s/cur_map_index == 76/cur_map_index == MAP_RND_COAST1/g;
    $work =~ s/cur_map_index == 75/cur_map_index == MAP_RND_MOUNTAIN2/g;
    $work =~ s/cur_map_index == 74/cur_map_index == MAP_RND_MOUNTAIN1/g;
    $work =~ s/cur_map_index == 73/cur_map_index == MAP_RND_CAVERN4/g;
    $work =~ s/cur_map_index == 72/cur_map_index == MAP_RND_CAVERN3/g;
    $work =~ s/cur_map_index == 71/cur_map_index == MAP_RND_CAVERN2/g;
    $work =~ s/cur_map_index == 70/cur_map_index == MAP_RND_CAVERN1/g;
    $work =~ s/cur_map_index == 69/cur_map_index == MAP_RND_CAVERN0/g;
    $work =~ s/cur_map_index == 68/cur_map_index == MAP_RND_CITY1/g;
    $work =~ s/cur_map_index == 67/cur_map_index == MAP_REDDING_MINE_TUNNEL/g;
    $work =~ s/cur_map_index == 66/cur_map_index == MAP_REDDING_DTOWN_TUNNEL/g;
    $work =~ s/cur_map_index == 65/cur_map_index == MAP_REDDING_MINE_ENT/g;
    $work =~ s/cur_map_index == 64/cur_map_index == MAP_REDDING_DOWNTOWN/g;
    $work =~ s/cur_map_index == 63/cur_map_index == MAP_REDDING_WANAMINGO_12/g;
    $work =~ s/cur_map_index == 62/cur_map_index == MAP_REDDING_WANAMINGO_ENT/g;
    $work =~ s/cur_map_index == 61/cur_map_index == MAP_NEW_RENO_BOXING/g;
    $work =~ s/cur_map_index == 60/cur_map_index == MAP_NEW_RENO_STABLES/g;
    $work =~ s/cur_map_index == 59/cur_map_index == MAP_NEW_RENO_GOLGATHA/g;
    $work =~ s/cur_map_index == 58/cur_map_index == MAP_NEW_RENO_CHOP_SHOP/g;
    $work =~ s/cur_map_index == 57/cur_map_index == MAP_NEW_RENO_4/g;
    $work =~ s/cur_map_index == 56/cur_map_index == MAP_NEW_RENO_3/g;
    $work =~ s/cur_map_index == 55/cur_map_index == MAP_NEW_RENO_2/g;
    $work =~ s/cur_map_index == 54/cur_map_index == MAP_NEW_RENO_1/g;
    $work =~ s/cur_map_index == 53/cur_map_index == MAP_CAR_DESERT/g;
    $work =~ s/cur_map_index == 52/cur_map_index == MAP_DEN_SLAVE_RUN/g;
    $work =~ s/cur_map_index == 51/cur_map_index == MAP_MILITARY_BASE_ENTRANCE/g;
    $work =~ s/cur_map_index == 50/cur_map_index == MAP_MILITARY_BASE_34/g;
    $work =~ s/cur_map_index == 49/cur_map_index == MAP_MILITARY_BASE_12/g;
    $work =~ s/cur_map_index == 48/cur_map_index == MAP_KLAMATH_CANYON/g;
    $work =~ s/cur_map_index == 47/cur_map_index == MAP_NCR_COUNCIL/g;
    $work =~ s/cur_map_index == 46/cur_map_index == MAP_NCR_BAZAAR/g;
    $work =~ s/cur_map_index == 45/cur_map_index == MAP_NCR_GRAZING_LANDS/g;
    $work =~ s/cur_map_index == 44/cur_map_index == MAP_NCR_WESTIN_RANCH/g;
    $work =~ s/cur_map_index == 43/cur_map_index == MAP_NCR_COUNCIL/g;
    $work =~ s/cur_map_index == 42/cur_map_index == MAP_NCR_DOWNTOWN/g;
    $work =~ s/cur_map_index == 41/cur_map_index == MAP_VAULT_13_ENTRANCE/g;
    $work =~ s/cur_map_index == 40/cur_map_index == MAP_VAULT_13/g;
    $work =~ s/cur_map_index == 39/cur_map_index == MAP_VAULT_15_EAST_ENTRANCE/g;
    $work =~ s/cur_map_index == 38/cur_map_index == MAP_THE_SQUAT_B/g;
    $work =~ s/cur_map_index == 37/cur_map_index == MAP_THE_SQUAT_A/g;
    $work =~ s/cur_map_index == 36/cur_map_index == MAP_VAULT_15/g;
    $work =~ s/cur_map_index == 35/cur_map_index == MAP_ARROYO_WILDERNESS/g;
    $work =~ s/cur_map_index == 34/cur_map_index == MAP_GECKO_ACCESS_TUNNELS/g;
    $work =~ s/cur_map_index == 33/cur_map_index == MAP_GECKO_JUNKYARD/g;
    $work =~ s/cur_map_index == 32/cur_map_index == MAP_GECKO_POWER_PLANT/g;
    $work =~ s/cur_map_index == 31/cur_map_index == MAP_GECKO_SETTLEMENT/g;
    $work =~ s/cur_map_index == 30/cur_map_index == MAP_VAULT_CITY_VAULT/g;
    $work =~ s/cur_map_index == 29/cur_map_index == MAP_SIERRA_4/g;
    $work =~ s/cur_map_index == 28/cur_map_index == MAP_SIERRA_123/g;
    $work =~ s/cur_map_index == 27/cur_map_index == MAP_SIERRA_BATTLE/g;
    $work =~ s/cur_map_index == 26/cur_map_index == MAP_GHOST_LAKE/g;
    $work =~ s/cur_map_index == 25/cur_map_index == MAP_GHOST_CAVERN/g;
    $work =~ s/cur_map_index == 24/cur_map_index == MAP_GHOST_FARM/g;
    $work =~ s/cur_map_index == 23/cur_map_index == MAP_MODOC_WELL/g;
    $work =~ s/cur_map_index == 22/cur_map_index == MAP_MODOC_DOWNTHESHITTER/g;
    $work =~ s/cur_map_index == 21/cur_map_index == MAP_MODOC_GARDEN/g;
    $work =~ s/cur_map_index == 20/cur_map_index == MAP_MODOC_BRAHMINPASTURES/g;
    $work =~ s/cur_map_index == 19/cur_map_index == MAP_MODOC_BEDNBREAKFAST/g;
    $work =~ s/cur_map_index == 18/cur_map_index == MAP_MODOC_MAINSTREET/g;
    $work =~ s/cur_map_index == 17/cur_map_index == MAP_VAULTCITY_COUNCIL/g;
    $work =~ s/cur_map_index == 16/cur_map_index == MAP_VAULTCITY_DOWNTOWN/g;
    $work =~ s/cur_map_index == 15/cur_map_index == MAP_VAULTCITY_COURTYARD/g;
    $work =~ s/cur_map_index == 14/cur_map_index == MAP_KLAMATH_GRAZE/g;
    $work =~ s/cur_map_index == 13/cur_map_index == MAP_KLAMATH_TRAPCAVES/g;
    $work =~ s/cur_map_index == 12/cur_map_index == MAP_KLAMATH_TOXICCAVES/g;
    $work =~ s/cur_map_index == 11/cur_map_index == MAP_KLAMATH_RATCAVES/g;
    $work =~ s/cur_map_index == 10/cur_map_index == MAP_KLAMATH_MALL/g;
    $work =~ s/cur_map_index == 9/cur_map_index == MAP_KLAMATH_1/g;
    $work =~ s/cur_map_index == 8/cur_map_index == MAP_DEN_RESIDENTIAL/g;
    $work =~ s/cur_map_index == 7/cur_map_index == MAP_DEN_BUSINESS/g;
    $work =~ s/cur_map_index == 6/cur_map_index == MAP_DEN_ENTRANCE/g;
    $work =~ s/cur_map_index == 5/cur_map_index == MAP_ARROYO_BRIDGE/g;
    $work =~ s/cur_map_index == 4/cur_map_index == MAP_ARROYO_VILLAGE/g;
    $work =~ s/cur_map_index == 3/cur_map_index == MAP_ARROYO_CAVES/g;
    $work =~ s/cur_map_index == 2/cur_map_index == MAP_RND_DESERT_3/g;
    $work =~ s/cur_map_index == 1/cur_map_index == MAP_RND_DESERT_2/g;
    $work =~ s/cur_map_index == 0/cur_map_index == MAP_RND_DESERT_1/g;
    $work =~ s/\(cur_map_index == MAP_MODOC_MAINSTREET\) or \(cur_map_index == MAP_MODOC_BEDNBREAKFAST\)/dude_in_modoc_town/g;

    $work =~ s/fixed_param == 666/fixed_param == param_clear_float/g;

    $work =~ s/obj_pid\(obj_being_used_with\) == 482/obj_pid(obj_being_used_with) == PID_KITTY_SEX_DRUG_STRENGTH/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 469/obj_pid(obj_being_used_with) == PID_ROT_GUT/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 311/obj_pid(obj_being_used_with) == PID_ROENTGEN_RUM/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 310/obj_pid(obj_being_used_with) == PID_GAMMA_GULP_BEER/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 273/obj_pid(obj_being_used_with) == PID_HEALING_POWDER/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 144/obj_pid(obj_being_used_with) == PID_SUPER_STIMPAK/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 125/obj_pid(obj_being_used_with) == PID_BOOZE/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 124/obj_pid(obj_being_used_with) == PID_BEER/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 40/obj_pid(obj_being_used_with) == PID_STIMPAK/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 39/obj_pid(obj_being_used_with) == PID_MICRO_FUSION_CELL/g;
    $work =~ s/obj_pid\(obj_being_used_with\) == 38/obj_pid(obj_being_used_with) == PID_SMALL_ENERGY_CELL/g;

    $work =~ s/metarule\(43, self_obj\)/inven_unwield(self_obj)/g;
    $work =~ s/metarule\(14, 0\)/map_first_run/g;
    $work =~ s/metarule\(17, 13\)/metarule(METARULE_AREA_KNOWN, AREA_REDDING)/g;
    $work =~ s/metarule\(17, 10\)/metarule(METARULE_AREA_KNOWN, AREA_NCR)/g;
    $work =~ s/metarule\(17, 7\)/metarule(METARULE_AREA_KNOWN, AREA_NEW_RENO)/g;
    $work =~ s/metarule\(17, 4\)/metarule(METARULE_AREA_KNOWN, AREA_VAULT_CITY)/g;
    $work =~ s/metarule\(17, 1\)/metarule(METARULE_AREA_KNOWN, AREA_DEN)/g;

    $work =~ s/party_member_obj\(16777380\) != 0/Miria_In_Party/g;
    $work =~ s/\(Miria_In_Party == true\) == 0/Miria_In_Party == false/g;
    $work =~ s/\(Miria_In_Party\) == 0/Miria_In_Party == false/g;
    $work =~ s/\(local_var\(LVAR_WAITING\) != 0\)/party_is_waiting/g;
    $work =~ s/party_is_waiting == 0/party_is_waiting == false/g;
    $work =~ s/\(global_var\(GVAR_PARTY_NO_FOLLOW\) != 0\)/party_no_follow/g;
    $work =~ s/party_no_follow == 0/party_no_follow == false/g;

    $work =~ s/set_local_var\(LVAR_WAITING, game_time\);\s+party_remove\(self_obj\);/set_party_waiting;/sg;

    $work =~ s/global_var\(GVAR_TOWN_REP_MODOC\) <= -1000/dude_enemy_modoc/g;

    $work =~ s/\(global_var\(GVAR_MODOC_STAGE_STATE\) % 100\)/get_sub_stage/g;

    $work =~ s/get_sub_stage == 5/get_sub_stage == wedding_stage_place_important/g;
    $work =~ s/get_sub_stage == 6/get_sub_stage == wedding_stage_place_party/g;
    $work =~ s/get_sub_stage == 7/get_sub_stage == wedding_stage_place_butcher_1/g;
    $work =~ s/get_sub_stage == 8/get_sub_stage == wedding_stage_place_butcher_2/g;
    $work =~ s/get_sub_stage == 9/get_sub_stage == wedding_stage_place_guest_1/g;
    $work =~ s/get_sub_stage == 10/get_sub_stage == wedding_stage_place_guest_2/g;
    $work =~ s/get_sub_stage == 11/get_sub_stage == wedding_stage_place_guest_3/g;
    $work =~ s/get_sub_stage == 12/get_sub_stage == wedding_stage_place_guest_4/g;
    $work =~ s/get_sub_stage == 13/get_sub_stage == wedding_stage_ready/g;
    $work =~ s/get_sub_stage == 14/get_sub_stage == wedding_stage_dealy_beloved/g;
    $work =~ s/get_sub_stage == 15/get_sub_stage == wedding_stage_ask_skip/g;
    $work =~ s/get_sub_stage == 16/get_sub_stage == wedding_stage_jo_question/g;
    $work =~ s/get_sub_stage == 17/get_sub_stage == wedding_stage_question_response/g;
    $work =~ s/get_sub_stage == 18/get_sub_stage == wedding_stage_question_response_2/g;
    $work =~ s/get_sub_stage == 19/get_sub_stage == wedding_stage_continue/g;
    $work =~ s/get_sub_stage == 20/get_sub_stage == wedding_stage_jo_bride_vow/g;
    $work =~ s/get_sub_stage == 21/get_sub_stage == wedding_stage_bride_vow_response/g;
    $work =~ s/get_sub_stage == 22/get_sub_stage == wedding_stage_jo_groom_vow/g;
    $work =~ s/get_sub_stage == 23/get_sub_stage == wedding_stage_groom_vow_response/g;
    $work =~ s/get_sub_stage == 24/get_sub_stage == wedding_stage_grisham_response_2/g;
    $work =~ s/get_sub_stage == 25/get_sub_stage == wedding_stage_player_vow_response/g;
    $work =~ s/get_sub_stage == 26/get_sub_stage == wedding_stage_pronounce_married/g;
    $work =~ s/get_sub_stage == 27/get_sub_stage == wedding_stage_done/g;
    $work =~ s/get_sub_stage == 1/get_sub_stage == rape_stage_help/g;
#    $work =~ s/get_sub_stage == 1/get_sub_stage == wedding_stage_grisham_what/g;
    $work =~ s/get_sub_stage == 2/get_sub_stage == wedding_stage_what_response/g;
    $work =~ s/get_sub_stage == 3/get_sub_stage == wedding_stage_grisham_response/g;
    $work =~ s/get_sub_stage == 4/get_sub_stage == wedding_stage_response_wait/g;

    $work =~ s/has_trait\(1, self_obj, 6\)/self_team/g;

    $work =~ s/self_team != 28/self_team != TEAM_MODOC/g;
    $work =~ s/critter_add_trait\(self_obj, (.+), (.+), (.+)\)/set_self_team($3)/g;
    $work =~ s/set_self_team\(28\)/set_self_team(TEAM_MODOC)/g;

    $work =~ s/fixed_param == 4/fixed_param == COMBAT_SUBTYPE_TURN/g;

    $work =~ s/\(\(obj_item_subtype\(critter_inven_obj\(self_obj, 1\)\) == 3\) or \(obj_item_subtype\(critter_inven_obj\(self_obj, 2\)\) == 3\)\)/self_is_armed/g;
    $work =~ s/obj_is_carrying_obj_pid\(self_obj, 4\)/self_item_count(PID_KNIFE)/g;
    $work =~ s/obj_carrying_pid_obj\(self_obj, 4\)/self_item(PID_KNIFE)/g;
    $work =~ s/party_member_obj\(obj_pid\(self_obj\)\) != 0/obj_in_party(self_obj)/g;
    $work =~ s/obj_can_see_obj\(self_obj, dude_obj\)/self_can_see_dude/g;
    $work =~ s/metarule3\(109, self_obj, 0, 0\)/chem_use_level(self_obj)/g;

    $work =~ s/metarule3\(107, self_obj, 16777252, 0\)/art_change_fid_num(self_obj, FID_NFPEAS)/g;
    $work =~ s/metarule3\(107, self_obj, 16777221, 0\)/art_change_fid_num(self_obj, FID_HFLTHR)/g;
    $work =~ s/metarule3\(107, self_obj, 16777217, 0\)/art_change_fid_num(self_obj, FID_HAPOWR)/g;
    $work =~ s/metarule3\(107, self_obj, 16777287, 0\)/art_change_fid_num(self_obj, FID_HANPWR)/g;
    $work =~ s/metarule3\(107, self_obj, 16777223, 0\)/art_change_fid_num(self_obj, FID_HFMETL)/g;
    $work =~ s/metarule3\(107, self_obj, 16777222, 0\)/art_change_fid_num(self_obj, FID_HFMAXX)/g;
    $work =~ s/metarule3\(107, self_obj, 16777219, 0\)/art_change_fid_num(self_obj, FID_HFCMBT)/g;
    $work =~ s/metarule3\(107, self_obj, 16777218, 0\)/art_change_fid_num(self_obj, FID_HAROBE)/g;
    $work =~ s/metarule3\(107, self_obj, 16777320, 0\)/art_change_fid_num(self_obj, FID_HAENRO)/g;

    $work =~ s/16777409/PID_GRISHAM/g;

    $work =~ s/obj_pid\(critter_inven_obj\(self_obj, 0\)\)/obj_pid(self_armor)/g;
    $work =~ s/critter_inven_obj\(self_obj, 0\)/self_armor/g;
    $work =~ s/obj_pid\(self_armor\) == 554/obj_pid(self_armor) == PID_ENVIRONMENTAL_ARMOUR/g;
    $work =~ s/obj_pid\(self_armor\) == 524/obj_pid(self_armor) == PID_BRIDGEKEEPERS_ROBE/g;
    $work =~ s/obj_pid\(self_armor\) == 381/obj_pid(self_armor) == PID_COMBAT_ARMOR_MK_II/g;
    $work =~ s/obj_pid\(self_armor\) == 380/obj_pid(self_armor) == PID_METAL_ARMOR_MK_II/g;
    $work =~ s/obj_pid\(self_armor\) == 379/obj_pid(self_armor) == PID_LEATHER_ARMOR_MK_II/g;
    $work =~ s/obj_pid\(self_armor\) == 349/obj_pid(self_armor) == PID_ADVANCED_POWER_ARMOR_MK2/g;
    $work =~ s/obj_pid\(self_armor\) == 348/obj_pid(self_armor) == PID_ADVANCED_POWER_ARMOR/g;
    $work =~ s/obj_pid\(self_armor\) == 265/obj_pid(self_armor) == PID_CURED_LEATHER_ARMOR/g;
    $work =~ s/obj_pid\(self_armor\) == 240/obj_pid(self_armor) == PID_TESLA_ARMOR/g;
    $work =~ s/obj_pid\(self_armor\) == 239/obj_pid(self_armor) == PID_BROTHERHOOD_COMBAT_ARMOR/g;
    $work =~ s/obj_pid\(self_armor\) == 232/obj_pid(self_armor) == PID_HARDENED_POWER_ARMOR/g;
    $work =~ s/obj_pid\(self_armor\) == 113/obj_pid(self_armor) == PID_PURPLE_ROBE/g;
    $work =~ s/obj_pid\(self_armor\) == 74/obj_pid(self_armor) == PID_LEATHER_JACKET/g;
    $work =~ s/obj_pid\(self_armor\) == 17/obj_pid(self_armor) == PID_COMBAT_ARMOR/g;
    $work =~ s/obj_pid\(self_armor\) == 3/obj_pid(self_armor) == PID_POWERED_ARMOR/g;
    $work =~ s/obj_pid\(self_armor\) == 2/obj_pid(self_armor) == PID_METAL_ARMOR/g;
    $work =~ s/obj_pid\(self_armor\) == 1/obj_pid(self_armor) == PID_LEATHER_ARMOR/g;

    $work =~ s/create_object_sid\(385,/create_object_sid(PID_SAWED_OFF_SHOTGUN,/g;
    $work =~ s/create_object_sid\(95,/create_object_sid(PID_SHOTGUN_SHELLS,/g;
    $work =~ s/create_object_sid\(482,/create_object_sid(PID_KITTY_SEX_DRUG_STRENGTH,/g;

    $work =~ s/self_is_armed == 0/self_is_armed == false/g;
    $work =~ s/combat_is_initialized == 0/combat_is_initialized == false/g;
    $work =~ s/anim_busy\(self_obj\) == 0/anim_busy(self_obj) == false/g;
    $work =~ s/\(global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage\) == 100/is_staging_rape/g;
    $work =~ s/\(global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage\) == 200/is_staging_miria_wedding/g;
    $work =~ s/\(global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage\) == 300/is_staging_davin_wedding/g;
    $work =~ s/\(is_staging_miria_wedding\) or \(is_staging_davin_wedding\)/is_staging_wedding/g;

    $work =~ s/set_global_var\(GVAR_MODOC_STAGE_STATE, 0\);/clear_stage/g;

#    $work =~ s/\s+debug_msg\("start: set_dude_was_married"\);\s+//g;
#    $work =~ s/\s+debug_msg\("finished: set_dude_was_married"\);\s+//g;
#    $work =~ s/\s+debug_msg\("   GVAR_PLAYER_WAS_MARRIED before == " \+ global_var\(GVAR_PLAYER_WAS_MARRIED\)\);\s+//g;
#    $work =~ s/\s+debug_msg\("   GVAR_PLAYER_WAS_MARRIED after == " \+ global_var\(GVAR_PLAYER_WAS_MARRIED\)\);\s+//g;
#    $work =~ s/global_var\(GVAR_PLAYER_MARRIED\) == 0/not(dude_is_married)/g;
    $work =~ s/global_var\(GVAR_PLAYER_MARRIED\) != 0/dude_is_married/g;
    $work =~ s/global_var\(GVAR_PLAYER_MARRIED\) == 1/dude_spouse_is_female/g;
#    $work =~ s/global_var\(GVAR_PLAYER_MARRIED\) != 1/not(dude_spouse_is_female)/g;
    $work =~ s/global_var\(GVAR_PLAYER_MARRIED\) == 2/dude_spouse_is_male/g;
#    $work =~ s/global_var\(GVAR_PLAYER_MARRIED\) != 2/not(dude_spouse_is_male)/g;
#    $work =~ s/global_var\(GVAR_PLAYER_WAS_MARRIED\) == 0/not(dude_was_married)/g;
    $work =~ s/global_var\(GVAR_PLAYER_WAS_MARRIED\) != 0/dude_was_married/g;
    $work =~ s/global_var\(GVAR_PLAYER_WAS_MARRIED\) == 1/dude_spouse_was_female/g;
#    $work =~ s/global_var\(GVAR_PLAYER_WAS_MARRIED\) != 1/not(dude_spouse_was_female)/g;
    $work =~ s/global_var\(GVAR_PLAYER_WAS_MARRIED\) == 2/dude_spouse_was_male/g;
#    $work =~ s/global_var\(GVAR_PLAYER_WAS_MARRIED\) != 2/not(dude_spouse_was_male)/g;
    $work =~ s/\(self_is_male\) and \(dude_spouse_is_female\) or \(\(self_is_female\) and \(dude_spouse_is_male\)\) and \(dude_is_married\)/\(married_to_sibling)/g;

    $work =~ s/wield_obj_critter\(self_obj, /wield_obj(/g;

    $work =~ s/get_critter_stat\((.+), 37\)/get_rads($1)/g;
    $work =~ s/get_rads\(self_obj\)/self_rads/g;

    $work =~ s/local_var\(LVAR_Insulted\) > 0/insulted/g;

    $work =~ s/create_object_sid\((\S+), (\d+), (\d+), -1\)/create_object($1, $2, $3)/g;
    $work =~ s/create_object_sid\((\S+), (\S+), (\S+), 101\)/create_object_sid($1, $2, $3, SCRIPT_MCGRISHA)/g;
#    $work =~ s/use_obj_on_obj\(create_object\(PID_KITTY_SEX_DRUG_STRENGTH, 0, 0\), (\S+)\);/call create_and_use_itempid_on($1, PID_KITTY_SEX_DRUG_STRENGTH);/g;

    $work =~ s/message_str\(14, random\(375, 376\)\)/g_bye/g;
    $work =~ s/message_str\(14, /g_mstr(/g;
    $work =~ s/message_str\(106, /mstr(/g;
    $work =~ s/obj_name\(dude_obj\)/dude_name/g;

    $work =~ s/giq_option\((\d+), /giq_option(00$1, /g;
    $work =~ s/giq_option\(-(\d+), /giq_option(-00$1, /g;

    $work =~ s/giq_option\((.+), (.+), g_mstr\(random\((.+)\)\), (.+), (.+)\);/NOption(g_mstr(random($3)),$4,$1);/g;
    $work =~ s/giq_option\((.+), (.+), mstr\(random\((.+)\)\), (.+), (.+)\);/NOption(mstr(random($3)),$4,$1);/g;
    $work =~ s/giq_option\((.+), (.+), random\((.+)\), (.+), (.+)\);/NOption(random($3),$4,$1);/g;
    $work =~ s/giq_option\((.+), (.+), (.+), (.+), (.+)\);/NOption($3,$4,$1);/g;
    $work =~ s/float_msg\(dude_obj, mstr([^,]+), 8\)/dude_floater($1)/g;
    $work =~ s/float_msg\(self_obj, mstr\((random\(\d+, \d+\))\), 8\)/floater($1)/g;
    $work =~ s/float_msg\(self_obj, mstr([^,]+), 8\)/floater($1)/g;
    $work =~ s/floater\(\((.+?)\)\);/floater($1);/g;
    $work =~ s/float_msg\(dude_obj, " ", 8\);/float_msg(dude_obj, " ", FLOAT_COLOR_NORMAL);/g;
    $work =~ s/float_msg\(self_obj, " ", 8\);/float_msg(self_obj, " ", FLOAT_COLOR_NORMAL);/g;
    $work =~ s/float_msg\(dude_obj, 0, 0\);/float_msg_clear(dude_obj);/g;
    $work =~ s/float_msg\(self_obj, 0, 0\);/float_msg_clear(self_obj);/g;

    $work =~ s/16777379/PID_DAVIN/g;
    $work =~ s/16777380/PID_MIRIA/g;

    if (index($flags, 'full') != -1) {
        $work =~ s/then begin(\s+floater)([^;]+?);\s+end/then$1$2;/sg;
        $work =~ s/else begin(\s+floater)([^;]+?);\s+end/else$1$2;/sg;
        $work =~ s/then begin(\s+float_msg)([^;]+?);\s+end/then$1$2;/sg;
        $work =~ s/then begin(\s+set_local_var)([^;]+?);\s+end/then$1$2;/sg;
        $work =~ s/then begin(\s+inc_local_var)([^;]+?);\s+end/then$1$2;/sg;
        $work =~ s/then begin(\s+dec_local_var)([^;]+?);\s+end/then$1$2;/sg;
#        $work =~ s/then begin(\s+NOption)([^;]+?);\s+end/then$1$2;/sg;
        $work =~ s/end\s+else begin/end else begin/sg;

        $work =~ s/if \(obj_is_carrying_obj_pid\(self_obj, 144\)\) then begin.+?debug_msg\(obj_name\(self_obj\) \+ " used First Aid kit."\);\s+?end\s+?end\s+?end\s+?end\s+?end/obj_heal_no_skill(self_obj)/sg;
        $work =~ s/if \(obj_is_carrying_obj_pid\(self_obj, 144\)\) then begin.+?debug_msg\(obj_name\(self_obj\) \+ " healed some using first aid skill."\);\s+?end\s+?end\s+?end\s+?end\s+?end\s+?end\s+?end/obj_heal(self_obj)/sg;

        # This pair of regex needs to be in this order: shorten the full version of party abandon code first, then the special version.
        # NOTE: this probably works only because Node1100 is the last occurrence of the (reduced) party abandon code in mcmiria_work.ssl.
        $work =~ s/if \(obj_in_party\(self_obj\)\) then begin\s+debug_msg\("abandon party: " \+ obj_name\(self_obj\)\);.+?if \(obj_pid\(self_obj\) == PID_MIRIA\) then begin.+?debug_msg\("" \+ obj_name\(self_obj\) \+ " has abandoned the party"\);/set_self_abandon_party;/sg;
        $work =~ s/if \(obj_in_party\(self_obj\)\) then begin\s+debug_msg\("abandon party: " \+ obj_name\(self_obj\)\);.+?debug_msg\("" \+ obj_name\(self_obj\) \+ " has abandoned the party"\);/set_self_abandon_party_no_spouse;/sg;

        $work =~ s/if \(party_is_waiting == false\) then begin\s+if \(local_var\(LVAR_FOLLOW_DISTANCE\) == 0\) then begin\s+(\S+).+?debug_msg\("USED PARTY MEMBER OPTIONS"\);/$1
   miria_party_member_options;/sg;
        $work =~ s/if \(g_mstr\(10004\) != 0\) then begin\s+if \(local_var\(LVAR_FOLLOW_DISTANCE\) != 3\) then begin.+?debug_msg\("USED PARTY FOLLOW OPTIONS"\);/miria_party_follow_options;/sg;
        $work =~ s/if \(g_mstr\(10013\) != 0\) then begin\s+NOption\(g_mstr\(10013\),Node1010,004\);.+?debug_msg\("USED PARTY GEAR OPTIONS"\);/miria_party_gear_options;/sg;
        $work =~ s/set_global_var\(37, 0\);.+?set_global_var\(45, 1\);\s+end\s+end\s+end\s+end\s+end\s+end\s+end\s+end/CheckKarma;/sg;
        $work =~ s/set_global_var\(0, global_var\(0\) \+ (-?\d+)\);\s+debug_msg\("Player gains " \+ \1 \+ " Karma Points."\);\s+CheckKarma;/inc_general_rep($1);/sg;
        $work =~ s/if \(source_obj == dude_obj\) then begin\s+set_global_var\(2, 0\);.+?set_global_var\(\S+, global_var\(\S+\) \+ -?\d+\);\s+debug_msg\("Added " \+ -?\d+ \+ " to Town Rep"\);\s+end/inc_childkiller/sg;
        $work =~ s/if \(source_obj == dude_obj\) then begin\s+set_global_var\(5, global_var\(5\) \+ 1\);.+?set_global_var\(\S+, global_var\(\S+\) \+ -?\d+\);\s+debug_msg\("Added " \+ -?\d+ \+ " to Town Rep"\);\s+end/inc_good_critter/sg;
        $work =~ s/debug_msg\("start: set_dude_was_married"\);.+?debug_msg\("finished: set_dude_was_married"\);/set_dude_was_married;/sg;
        $work =~ s/if \(\(cur_map_index == MAP_MODOC_BEDNBREAKFAST\) or \(cur_map_index == MAP_THE_SQUAT_A\) or \(cur_map_index == MAP_THE_SQUAT_B\)\) then begin\s+if \(\(self_elevation != dude_elevation\) and party_is_waiting\) then begin\s+move_to\(self_obj, self_tile, dude_elevation\);\s+end\s+end/party_member_map_enter;/sg;
        $work =~ s/if \(\(party_is_waiting == false\) and \(party_no_follow == false\)\) then begin\s+if \(local_var\(LVAR_FOLLOW_DISTANCE\) == 0\) then begin.+?reg_anim_func\(2, self_obj\);\s+end\s+end\s+end\s+end/party_member_follow_dude/sg;
        $work =~ s/reg_anim_func\(2, self_obj\);\s+move_to\(self_obj, \(21504 * \(is_staging_miria_wedding\)\) \+ \(22705 * \(is_staging_davin_wedding\)\), dude_elevation\);\s+anim\(self_obj, 1000, rotation_to_tile\(self_tile, tile_num\(modoc_jo_obj\)\)\);/place_in_church_seat(self_obj, church_miria_seat);/sg;
        $work =~ s/rm_timer_event\(self_obj\);\s+add_timer_event\(self_obj, game_ticks\(random\(40, 50\)\), 1\);\s+end\s+debug_msg\("join party: " \+ obj_name\(self_obj\)\);/
      end
      debug_msg("join party: " + obj_name(self_obj));
      if (is_critter_dead(self_obj) == false) then begin
         rm_timer_event(self_obj);
         add_timer_event(self_obj, game_ticks(random(40, 50)), 1);
      end/sg;
        $work =~ s/if \(\(critter_state\(self_obj\) bwand 1\) == 0\) then begin\s+if \(local_var\(LVAR_FOLLOW_DISTANCE\) == 0\) then begin\s+set_follow_close;.+?debug_msg\("join party: " \+ obj_name\(self_obj\)\);/party_add_self;/sg;
        $work =~ s/if \(\(\(dude_is_married\) == 0\) and \(\(dude_was_married\) == 0\)\) then begin.+?debug_msg\("set_dude_married"\);/set_dude_married;/sg;
        $work =~ s/restock_obj := create_object\((\d+), \d+, \d+\);\s+add_mult_objs_to_inven\((\S+), restock_obj, (\d+)\);/give_pid_qty($2, $1, $3)/sg;
        $work =~ s/restock_obj := create_object_sid\((\d+), \d+, \d+, -\d+\);\s+add_mult_objs_to_inven\((\S+), restock_obj, (\d+)\);/give_pid_qty($2, $1, $3)/sg;
        $work =~ s/if \(get_sub_stage == wedding_stage_place_important\) then begin(\s+).+?(\s+)end/if (get_sub_stage == wedding_stage_place_important) then begin$1place_in_church_seat(self_obj, church_miria_seat);$2end/sg;

        $work =~ s/if \(critter_is_fleeing\(self_obj\)\) then begin\s+if \(anim_busy\(self_obj\) == false\) then begin.+?else begin\s+attack_complex\(dude_obj, 0, 1, 0, 0, 30000, 0, 0\);\s+end/self_attack_dude;/sg;

        $work =~ s/set_global_var\(GVAR_MODOC_STAGE_STATE, global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage \+ 2\);\s+debug_msg\("\\n SET_STAGE_EVENT == " \+ global_var\(GVAR_MODOC_STAGE_STATE\) \+ " in script " \+ obj_name\(self_obj\)\);/set_sub_stage(rape_stage_confront)/sg;
        $work =~ s/set_global_var\(GVAR_MODOC_STAGE_STATE, global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage \+ 3\);\s+debug_msg\("\\n SET_STAGE_EVENT == " \+ global_var\(GVAR_MODOC_STAGE_STATE\) \+ " in script " \+ obj_name\(self_obj\)\);/set_sub_stage(wedding_stage_grisham_response)/sg;
        $work =~ s/set_global_var\(GVAR_MODOC_STAGE_STATE, global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage \+ 18\);\s+debug_msg\("\\n SET_STAGE_EVENT == " \+ global_var\(GVAR_MODOC_STAGE_STATE\) \+ " in script " \+ obj_name\(self_obj\)\);/set_sub_stage(wedding_stage_question_response_2)/sg;
        $work =~ s/set_global_var\(GVAR_MODOC_STAGE_STATE, global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage \+ 20\);\s+debug_msg\("\\n SET_STAGE_EVENT == " \+ global_var\(GVAR_MODOC_STAGE_STATE\) \+ " in script " \+ obj_name\(self_obj\)\);/set_sub_stage(wedding_stage_jo_bride_vow)/sg;
        $work =~ s/set_global_var\(GVAR_MODOC_STAGE_STATE, global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage \+ 22\);\s+debug_msg\("\\n SET_STAGE_EVENT == " \+ global_var\(GVAR_MODOC_STAGE_STATE\) \+ " in script " \+ obj_name\(self_obj\)\);/set_sub_stage(wedding_stage_jo_groom_vow)/sg;
        $work =~ s/set_global_var\(GVAR_MODOC_STAGE_STATE, global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage \+ 24\);\s+debug_msg\("\\n SET_STAGE_EVENT == " \+ global_var\(GVAR_MODOC_STAGE_STATE\) \+ " in script " \+ obj_name\(self_obj\)\);/set_sub_stage(wedding_stage_grisham_response_2)/sg;
        $work =~ s/set_global_var\(GVAR_MODOC_STAGE_STATE, global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage \+ 26\);\s+debug_msg\("\\n SET_STAGE_EVENT == " \+ global_var\(GVAR_MODOC_STAGE_STATE\) \+ " in script " \+ obj_name\(self_obj\)\);/set_sub_stage(wedding_stage_pronounce_married)/sg;
        $work =~ s/if \(\(dude_enemy_modoc\) == 0\) then begin\s+set_global_var\(GVAR_TOWN_REP_MODOC, -1000\);\s+end/set_enemy_modoc;/sg;

        $work =~ s/if \(\(self_tile != local_var\(LVAR_Home_Tile\)\) and \(local_var\(LVAR_Home_Tile\) != 0\)\) then begin.+?if \(tile_distance\(self_tile, local_var\(LVAR_Home_Tile\)\) < tile_distance\(dest_tile, local_var\(LVAR_Home_Tile\)\)\) then begin\s+reg_anim_func\(2, self_obj\);\s+end\s+end\s+end\s+end/anim_move_to_point_rate(local_var(LVAR_Home_Tile), 5)/sg;
        $work =~ s/set_next_stage_time_only\(quick_stage_time\);\s+add_timer_event\(self_obj, game_ticks\(3\) - 2, 666\);/set_next_stage_time(quick_stage_time)/sg;

        $work =~ s/gfade_out\(1\);\s+game_ui_disable;\s+clear_stage\s+set_global_var\(GVAR_MODOC_STAGE_STATE, 100 \+ get_sub_stage\);.+?add_obj_to_inven\(dude_obj, restock_obj\);\s+end/setup_rape_stage;/sg;
        $work =~ s/gfade_out\(1\);\s+set_global_var\(GVAR_PARTY_NO_FOLLOW, 1\);\s+game_ui_disable;.+?set_global_var\(GVAR_MODOC_STAGE_STATE, global_var\(GVAR_MODOC_STAGE_STATE\) - get_sub_stage \+ 1\);\s+debug_msg\("\\n SET_STAGE_EVENT == " \+ global_var\(GVAR_MODOC_STAGE_STATE\) \+ " in script " \+ obj_name\(self_obj\)\);/setup_wedding_stage/sg;

        $work =~ s/up_sex_level\(1\);\s+if \(global_var\(GVAR_SEX_COUNTER\) >= 9\) then begin\s+set_global_var\(GVAR_GIGALO, 1\);\s+end\s+if \(dude_sex_rating >= 9\) then begin\s+set_global_var\(GVAR_SEXPERT, 1\);\s+end\s+if \(global_var\(GVAR_DUDE_VIRGIN\) == 1\) then begin\s+set_global_var\(GVAR_DUDE_VIRGIN, 0\);\s+end\s+set_global_var\(GVAR_SEX_COUNTER, global_var\(GVAR_SEX_COUNTER\) \+ 1\);/up_sex_status;/sg;
        $work =~ s/if \(global_var\(GVAR_SEX_COUNTER\) >= 9\) then begin\s+set_global_var\(GVAR_GIGALO, 1\);\s+end/set_gigalo_if_necessary/sg;
        $work =~ s/if \(dude_sex_rating >= 9\) then begin\s+set_global_var\(GVAR_SEXPERT, 1\);\s+end/set_sexpert_if_necessary/sg;
        $work =~ s/if \(global_var\(GVAR_DUDE_VIRGIN\) == 1\) then begin\s+set_global_var\(GVAR_DUDE_VIRGIN, 0\);\s+end/clear_dude_virgin/sg;

        $work =~ s/if \(obj_item_subtype\(self_armor\) == 0\) then begin\s+restock_obj := self_armor;\s+debug_msg\("armour pid == " \+ obj_pid\(restock_obj\)\);\s+rm_obj_from_inven\(self_obj, restock_obj\);\s+add_obj_to_inven\(self_obj, restock_obj\);\s+end/remove_armor(self_obj)/sg;
    }

    $work =~ s/give_pid_qty\(self_obj, 49, (\d+)\)/give_pid_qty(self_obj, PID_ANTIDOTE, $1)/g;
    $work =~ s/give_pid_qty\(self_obj, 40, (\d+)\)/give_pid_qty(self_obj, PID_STIMPAK, $1)/g;
    $work =~ s/\(dude_enemy_modoc\) == 0/dude_enemy_modoc == false/g;

    $work =~ s/advance_sex_time;\s+up_sex_status;/do_default_sex/g;

    print OUTFILE "$work";
    close(OUTFILE);


    $work = '';
    open(INFILE, '<', 'mcmiria_work.ssl') or die "Cannot open input file 2: $!";
  
    while ($line = <INFILE>) {
        if ($line =~ m@^procedure Node1002 begin@) {
            $node1002 = 1;
        }
        elsif ($line =~ m@^procedure location_floats begin@) {
            $shorten_else_begin = 1;
            $indentation_level = 6;
            $indentation = '      ';
        }
#        elsif ($line =~ m@^procedure Node2400 begin@) {
#            $shorten_end_else_begin = 1;
#            $indentation_level = 9;
#            $indentation = '         ';
#        }
#        elsif ($line =~ m@^procedure map_update_p_proc begin@) {
#            $shorten_end_else_begin = 1;
#            $indentation_level = 12;
#            $indentation = '            ';
#        }
        elsif ($node1002 != 0 && $line =~ m@miria_party_member_options;@) {
            $line =~ s/miria_party_member_options/miria_party_member_options_no_additional_option/g;
        }
        elsif ($shorten_else_begin != 0 || $shorten_end_else_begin != 0) {
            if ($shorten_else_begin != 0 && $line =~ m@\s+else begin@) {
                $line = "${indentation}else ";
            }
            if ($shorten_end_else_begin != 0 && $line =~ m@\s+end else begin@) {
                $line = "${indentation}end else ";
            }
            elsif ($line =~ m@\s+if \(cur_map_index == (.+)@) {
                $line = "if (cur_map_index == $1";
                chomp $line;
                $line = "$line\n";
            }
            elsif ($line =~ m@\s+if \(\(cur_map_index == (.+)@) {
                $line = "if ((cur_map_index == $1";
                chomp $line;
                $line = "$line\n";
            }
            elsif ($line =~ m@\s+if \(chem_use_level(.+?) then begin@) {
                $line = "if (chem_use_level$1 then";
                chomp $line;
                $line = "$line\n";
            }
            elsif ($line =~ m@\s+if \(global_var(.+?) then begin@) {
                $line = "if (global_var$1 then begin";
                chomp $line;
                $line = "$line\n";
            }
            elsif ($line =~ m@\s+(float_msg\(self_obj, .+)@) {
                $line = "         $1";
                chomp $line;
                $line = "$line\n";
            }
            elsif ($line =~ m@\s{$indentation_level,}end@) {
                $line = '';
            }
        }
        elsif ($line =~ m@^end@) {
            $node1002 = 0;
            $shorten_else_begin = 0;
            $shorten_end_else_begin = 0;
            $indentation_level = 0;
            $indentation = '';
        }
        $work = "$work" . "$line";
    }

    close(INFILE);
#sed -i -e '/procedure Node1002 begin/,/^end/ s/miria_party_member_options/miria_party_member_options_no_additional_option/g' mcmiria_work.ssl
#sed -i -E -e '/procedure location_floats begin/,/^end/ s/else begin\n\s+if/else if/g' mcmiria_work.ssl
#sed -i -e '/procedure location_floats begin/,/^end/ p' mcmiria_work.ssl | perl -pe 's/else begin\s+if/else if/sg' > test.txt

#perl -e 'package main;
#open(INFILE, 'mcmiria_work.ssl') or die "Cannot open input file";
#' > mcmiria_work2.ssl
#mv mcmiria_work2.ssl mcmiria_work.ssl


# TODO special code massaging for one-liner if / else body contents in timed_event_p_proc, look_at_p_proc, description_p_proc, use_obj_on_p_proc, Node1001, Node1100, location_floats.

# Harder:
# * map_update_p_proc: a strict subset of the "then begin" can be simplified.


    # Optionally substitute set_global_var(79[12345], by set_local_var(2[12345]), to increase compatibility with other mods.
    if (index($flags, 'localvar') != -1) {
        $work =~ s/global_var\(791/local_var(LVAR_ASK1TIME/g;
        $work =~ s/global_var\(792/local_var(LVAR_ASK2TIME/g;
        $work =~ s/global_var\(793/local_var(LVAR_ASK3TIME/g;
        $work =~ s/global_var\(794/local_var(LVAR_SEXTIME/g;
        $work =~ s/global_var\(795/local_var(LVAR_CITY_WANTS/g;
    }

    open(OUTFILE, '>', 'mcmiria_work.ssl') or die "Cannot open output file 1: $!";
    print OUTFILE "$work";
    close(OUTFILE);
