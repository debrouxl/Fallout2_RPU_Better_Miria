#!/bin/sh
cp mcmiria_decompiled_reordered_headerfixed.ssl mcmiria_work.ssl
dos2unix mcmiria_work.ssl
perl -W ./convert_mcmiria.pl "$@"
unix2dos mcmiria_work.ssl
