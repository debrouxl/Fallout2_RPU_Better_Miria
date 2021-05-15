
Endocore's Miria Mod, upgraded by Lionel Debroux
September 2021 (WIP)

(this README is still basically an update from Endocore's)

Thanks for trying out this Miria mod, and I hope you'll enjoy the enhancements to her character.  This mod combines all the functionality of traditional B-Team and later Miria mods, such as:

-- Miria can level up six times, gaining competence (mainly in Small Guns and Energy Weapons);
-- Miria can be asked to wait while the Chosen One pursues solo missions;
-- Miria's appearance changes based on the armor she's currently wearing;

as well as a number of further embellishments I wrote offering a modest marriage-relationship simulation.  Talk to Miria frequently to explore this latter aspect of the mod, or ignore the whole thing at your discretion -- the only consequences are in the relationship of the Chosen One to Miria, so the larger game is unaffected.

This mod is compatible with Fallout 2 Restoration Project Update ("RPU", https://github.com/BGforgeNet/Fallout2_Restoration_Project ).  If you'd like to make futher changes yourself to this mod, feel free to do so -- this material was originally drawn from a tutorial on making NPC followers Endocore wrote, available at http://falloutmods.wikia.com/wiki/Building_a_Better_Miria_Mod , and I converted the changes to high-level source code, integrating bugfixes in the process.  If you come up with something interesting, please share your work with the community -- more mods means more Fo2 playtime means more fun for everyone.


Installation Instructions:

1)  Find the directory where you have the Fallout 2 RPU 2.3.3u23 (at the time of this writing) installed on your computer.
2)  Uncompress the files in this download to that directory.
3)  Start a new game of Fallout 2, or at least, visit Modoc for the first time.  Unlike Endocore's mod, for now, this version does not modify global variables (Endocore's documentation mentions this as a potential change, anyway). If you travel to Modoc and woo Miria (Charisma 8 or a good reputation in Modoc plus Charisma 7 is needed to win her over), your journey of married life will begin.

One rather annoying peculiarity of the mod is that due to the original game's lack of animations, if 

1) Miria is not currently wearing any armor, and
2) One uses the team dialogue interface to force her to equip weapons for which her base female peasant model has no animations, then:

3) the game will crash.

If Miria is not wearing any armor at all, either let her choose her own weapons at combat time or give her some armor.  After all she's your character's wife, so you should take good care of her by giving her some good armor.
Working around this is planned for later.


Credit is due to:
-- the many folks who have worked on various Miria mods over the years, of course particularly Endocore who made the work I converted, and Stone-D, from whose work Endocore's iteration of Miria drew much inspiration;
-- killap, the RP team and the RPU team, for providing the fine venue of the Restoration Project as well as a number of technical aspects of the present mod;
-- MIB88 and Lexx for suggestions, though I haven't implemented MIB88's one yet :)

 
Changelog beyond Endocore's version 2:

-- Version 3 alpha 4 (WIP)
    -- Removed Cassidy's dialog and script changes, in an attempt to make the game more compatible with the taking head or other changes.

-- Version 3 alpha 3
    -- Fixed a bug (my fault) in Cassidy's dialog.
    -- Changed the folder structure to match the one used by e.g. Fo1in2, suggested by Lexx.

-- Version 3 alpha 2
    -- Converted ectrappr and vccasidy changes from scattered / decompiled low-level source code to a high-level RPU patch, indirectly integrating bugfixes in the process.

-- Version 3 alpha 1
    -- Converted a large subset of Endocore's work from binary with scattered / decompiled low-level source code to a high-level RPU patch, indirectly integrating bugfixes in the process.
    -- At least for now, the mod uses further new local variables instead of new global variables.
