#!/bin/sh
diff -ub mcmiria.ssl mcmiria_work.ssl > mcmiria.diff
cp mcmiria_work_decompiled.ssl mcmiria_work_decompiled_trimmed.ssl
perl -0pi -e 's/"mcmiria" \+ ": " \+ //g;
              s/ \+ "\\n"//g;
              s/local_var\(20/global_var(791/g;
              s/local_var\(21/global_var(792/g;
              s/local_var\(22/global_var(793/g;
              s/local_var\(23/global_var(794/g;
              s/local_var\(24/global_var(795/g;
' mcmiria_work_decompiled_trimmed.ssl
diff -ub mcmiria_decompiled_reordered_headerfixed_decompiled.ssl mcmiria_work_decompiled_trimmed.ssl > mcmiria_decomp_check.diff
