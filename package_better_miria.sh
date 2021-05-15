#!/bin/sh
rm -Rf mods/fo2_better_miria
mkdir -p mods/fo2_better_miria/data
mkdir -p mods/fo2_better_miria/proto/critters
mkdir -p mods/fo2_better_miria/scripts
mkdir -p mods/fo2_better_miria/text/english/dialog
mkdir -p mods/fo2_better_miria/text/english/game
ln data/data/ai.txt mods/fo2_better_miria/data/ai.txt
ln data/data/aibdymsg.txt mods/fo2_better_miria/data/aibdymsg.txt
ln data/data/aigenmsg.txt mods/fo2_better_miria/data/aigenmsg.txt
ln data/data/party.txt mods/fo2_better_miria/data/party.txt
ln data/proto/critters/00000550.pro mods/fo2_better_miria/proto/critters/00000550.pro
ln data/proto/critters/00000551.pro mods/fo2_better_miria/proto/critters/00000551.pro
ln data/proto/critters/00000552.pro mods/fo2_better_miria/proto/critters/00000552.pro
ln data/proto/critters/00000553.pro mods/fo2_better_miria/proto/critters/00000553.pro
ln data/proto/critters/00000554.pro mods/fo2_better_miria/proto/critters/00000554.pro
ln data/proto/critters/00000555.pro mods/fo2_better_miria/proto/critters/00000555.pro
ln data/proto/critters/critters.lst mods/fo2_better_miria/proto/critters/critters.lst
ln data/scripts/scripts.lst mods/fo2_better_miria/scripts/scripts.lst
ln scripts_src/rndenctr/ectrappr.ssl mods/fo2_better_miria/scripts/ectrappr.ssl
ln scripts_src/rndenctr/ectrappr.int mods/fo2_better_miria/scripts/ectrappr.int
ln scripts_src/modoc/mcmiria_work.ssl mods/fo2_better_miria/scripts/mcmiria.ssl
ln scripts_src/modoc/mcmiria_work.int mods/fo2_better_miria/scripts/mcmiria.int
#ln scripts_src/valtcity/vccasidy.ssl mods/fo2_better_miria/scripts/vccasidy.ssl
#ln scripts_src/valtcity/vccasidy.int mods/fo2_better_miria/scripts/vccasidy.int
ln data/text/english/dialog/ectrappr.msg mods/fo2_better_miria/text/english/dialog/ectrappr.msg
ln data/text/english/dialog/mcmiria.msg mods/fo2_better_miria/text/english/dialog/mcmiria.msg
#ln data/text/english/dialog/vccasidy.msg mods/fo2_better_miria/text/english/dialog/vccasidy.msg
ln data/text/english/game/combatai.msg mods/fo2_better_miria/text/english/game/combatai.msg
ln data/text/english/game/misc.msg mods/fo2_better_miria/text/english/game/misc.msg
ln data/text/english/game/pro_crit.msg mods/fo2_better_miria/text/english/game/pro_crit.msg

rm -f better_miria_rp233u23+.zip
zip -9 -r better_miria_rp233u23+.zip \
 mods/fo2_better_miria \
 readme-MiriaMod.txt
# data/data/vault13.gam
