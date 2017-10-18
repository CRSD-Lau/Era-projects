echo --------------------------------------------------------------------
echo Skillupcore v2.5
echo Original code by <a href="mailto:Aikar@Windower.net">Aikar@Windower.net</a> (Retired)
echo (This is a modified version of the original)
echo --------------------------------------------------------------------
//
// Extra Files skillupexit.txt Note: This file is only needed if you want to 
// completely exit this Skillupcore.txt
//
// This script is not designed to be initialized in init.txt.
// It provides framework for you to use in creating skillup profiles.
//
// ALL Skillup profiles MUST be in this format:
// FIRST LINE: alias skillup_file exec <YOUR FILENAME HERE>
// example: alias skillup_file exec blah.txt
//
// CUSTOM AUTOEXEC EVENTS: 50201 through 50220 are reserved for your code as custom
// events. These will only need load once the first time your macro code is executed.
// You should only use skillup_cmd_once for these custom events.
//
// RUN ONCE COMMANDS: skillup_cmd_once and skillup_send_once. These function exactly like
// skillup_cmd and skillup_send but they only execute on the first loop cycle.
//
// Run Once Examples below. \/
// skillup_cmd_once ae registerq 50201 hpp_? input "Cure V" <me>
// skillup_cmd_once ae registerq 50210 tp_??? skillup_custom_wskill
// skillup_cmd_once skillup_wait5s
// skillup_send_once /echo it's time to play!
// skillup_send_once /ja "Composure" <me>
// skillup_send_once /ma "Refresh II" <me>
//
// AUTO RECAST EVENTS: These are 4 aliases that can be set to auto recast events
// skillup_event1, skillup_event2, skillup_event3, and skillup_event4
//
// here is an example of how to use custom events with the auto recast.
// Custom auto recast examples below \/
// skillup_cmd_once ae registerq 50201 gainbuff_composure alias skillup_event1 /;
// skillup_cmd_once ae registerq 50202 losebuff_composure alias skillup_event1 skillup_send /ja "Composure" <me>
// skillup_cmd_once ae registerq 50203 gainbuff_refresh alias skillup_event2 /;
// skillup_cmd_once ae registerq 50204 losebuff_refresh alias skillup_event2 skillup_send /ma "Refresh II" <me>
//
// CUSTOM EQUIPS: If you need to use custom commands before resting or before resuming
// you must create aliases for skillup_custom_lowmp, and skillup_custom_fullmp. These should
// be loaded after custom autoexec events and core once events but before your macro 
// code.
//
// Custom Examples below. \/
// alias skillup_custom_lowmp input /equip main "Dark Staff";input /equip body "Body Armor"
// alias skillup_custom_fullmp input /equip main "Light Staff";input /equip body "Body Armor"
//
// CUSTOM WEAPON SKILL: This can be loaded only after your first wait and only if you have 
// a custom autoexec event at the start of your macro code. Check the run once examples above.
// If you place this at the very start and have a regain effect you may lose TP if the 
// target isn't in range. The first wait allows delay time to get in range. By changing this
// in your code. You can also change it to swap auto weapon skills in the middle of the custom 
// code.
//
// Custom Weapon Skill (both lines) Example below. \/
// skillup_cmd_once skillup_wait5s
// alias skillup_custom_wskill skillup_send /ws "Fastblade"
//
// CODE (Everything in middle): 
// --1: prefix FFXI commands with skillup_send - use skillup_cmd for Windower commands.
// --   Normal Example: skillup_send /ma cure <me>
// --   Spellcast Example: skillup_cmd cure me
// --2: do NOT use wait or pause. you must use the pre provided commands,
// --   skillup_waiths (half second) through skillup_wait20s, and 30s/45s/1m provided.
// --3: plugin commands like 'cancel' are fine, just dont forget to use them with
// --   skillup_cmd and not by themselves!!!
// 
// END LINE: !skillup_run
// The ! before skillup_run is VERY IMPORTANT. If you forget to put this, your game
// will possibly crash. Do not forget it.
//
// --\/-- Skillupcore Alias Code - Do Not Modify --\/--
alias skillup_reload skillup_stop;pause 2;echo [Skillupcore Script Restarting];pause 0.5;exec skillupcore.txt
alias skillup_clear1 ae unregister 50101;ae unregister 50102;ae unregister 50103;ae unregister 50104;ae unregister 50105;ae unregister 50106;ae unregister 50107
alias skillup_clear2 ae unregister 50201;ae unregister 50202;ae unregister 50203;ae unregister 50204;ae unregister 50205;ae unregister 50206;ae unregister 50207;ae unregister 50208;ae unregister 50209;ae unregister 50210
alias skillup_clear3 ae unregister 50211;ae unregister 50212;ae unregister 50213;ae unregister 50214;ae unregister 50215;ae unregister 50216;ae unregister 50217;ae unregister 50218;ae unregister 50219;ae unregister 50220
alias skillup_init :;alias skillup_run skillup_once;alias skillup_exe skillup_file;alias skillup_send input;alias skillup_waiths pause 0.5;alias skillup_wait1s wait 1;alias skillup_custom_lowmp /;alias skillup_send_once skillup_send;alias skillup_cmd_once skillup_cmd;alias skillup_custom_fullmp /;alias skillup_custom_wskill /;alias skillup_cmd :\\;
alias skillup_once :;alias skillup_send_once /;alias skillup_cmd_once /;skillup_file
alias skillup_start skillup_pause;skillup_clear1;skillup_clear2;skillup_clear3;echo [Skillupcore Script Running in Normal Mode];input /heal off;pause 2;ae registerq 50101 (regex)mpp_[0-9](/regex) skillup_lowmp;ae registerq 50103 (regex)chat_(tell|emote|say)_.*$(/regex) skillup_chatstop;ae registerq 50104 status_idle skillup_resume;ae registerq 50106 (regex)status_(resting|dead|zoning)(/regex) skillup_resting;ae registerq 50107 time_*.* skillup_auto_events;skillup_init;exec
alias skillup_launch skillup_pause;skillup_clear1;skillup_clear2;skillup_clear3;echo [Skillupcore Script Running in Ignore Mode];input /heal off;pause 2;ae registerq 50101 (regex)mpp_[0-9](/regex) skillup_lowmp;ae registerq 50104 status_idle skillup_resume;ae registerq 50106 (regex)status_(resting|dead|zoning)(/regex) skillup_resting;ae registerq 50107 time_*.* skillup_auto_events;skillup_init;exec
alias skillup_engage skillup_pause;skillup_clear1;skillup_clear2;skillup_clear3;echo [Skillupcore Script Running in Combat Mode];ae registerq 50104 (regex)status_(idle|resting|dead|zoning)(/regex) skillup_asleep;ae registerq 50105 status_engaged skillup_wakeup;ae registerq 50107 time_*.* skillup_auto_events;skillup_init;alias skillup_file exec
alias skillup_pause :;alias skillup_waiths /;alias skillup_wait1s /;alias skillup_run /;alias skillup_send /;alias skillup_cmd /;alias skillup_send_once /;alias skillup_cmd_once /;alias skillup_event1 /;alias skillup_event2 /;alias skillup_event3 /;alias skillup_event4 /;
alias skillup_asleep ae unregister 50107;skillup_clear2;skillup_clear3;skillup_pause
alias skillup_wakeup ae registerq 50107 time_*.* skillup_auto_events;skillup_init;skillup_exe;
alias skillup_stop skillup_pause;skillup_clear1;skillup_clear2;skillup_clear3;pause 0.5;echo [Skillupcore Script Stopped]
alias skillup_resume skillup_pause;wait 1;skillup_custom_fullmp;ae registerq 50101 (regex)mpp_[0-9](/regex) skillup_lowmp;ae unregister 50102;ae unregister 50104;echo [Skillupcore Resume];input /heal off;pause 2;ae registerq 50104 status_idle skillup_resume;ae registerq 50107 time_*.* skillup_auto_events;skillup_init;skillup_exe;
alias skillup_resting skillup_custom_lowmp;ae registerq 50102 (regex)mpp_(100|9[5-9])(/regex) skillup_fullmp;ae unregister 50101;ae unregister 50107;skillup_pause;echo [Skillupcore Paused]
alias skillup_lowmp skillup_pause;input /heal on
alias skillup_fullmp skillup_init;input /heal off
alias skillup_auto_events skillup_event1;skillup_event2;skillup_event3;skillup_event4
alias skillup_waiths /;
alias skillup_wait1s /;
alias skillup_wait2s skillup_wait1s;skillup_wait1s;
alias skillup_wait3s skillup_wait2s;skillup_wait1s;
alias skillup_wait4s skillup_wait3s;skillup_wait1s;
alias skillup_wait5s skillup_wait4s;skillup_wait1s;
alias skillup_wait6s skillup_wait5s;skillup_wait1s;
alias skillup_wait7s skillup_wait6s;skillup_wait1s;
alias skillup_wait8s skillup_wait7s;skillup_wait1s;
alias skillup_wait9s skillup_wait8s;skillup_wait1s;
alias skillup_wait10s skillup_wait9s;skillup_wait1s;
alias skillup_wait11s skillup_wait10s;skillup_wait1s;
alias skillup_wait12s skillup_wait11s;skillup_wait1s;
alias skillup_wait13s skillup_wait12s;skillup_wait1s;
alias skillup_wait14s skillup_wait13s;skillup_wait1s;
alias skillup_wait15s skillup_wait14s;skillup_wait1s;
alias skillup_wait16s skillup_wait15s;skillup_wait1s;
alias skillup_wait17s skillup_wait16s;skillup_wait1s;
alias skillup_wait18s skillup_wait17s;skillup_wait1s;
alias skillup_wait19s skillup_wait18s;skillup_wait1s;
alias skillup_wait20s skillup_wait10s;skillup_wait10s;
alias skillup_wait30s skillup_wait15s;skillup_wait15s;
alias skillup_wait45s skillup_wait30s;skillup_wait15s;
alias skillup_wait1m skillup_wait30s;skillup_wait30s;
// --/\-- skillupore Alias Code - Do Not Modify --/\--
echo ---- Commands List ----
echo events (list all autoexec events)
echo orders (list all loaded aliases)
echo stop (stops, halts or pauses skillup)
echo restart (reloads this core file)
echo start <filename.txt> (for normal mode)
echo engage <filename.txt> (for combat mode)
echo launch <filename.txt> (same as start except ignores chat)
echo exitskillup (closes with full clear)
// ::---- Commands alias ----
alias restart skillup_reload
alias engage skillup_engage
alias launch skillup_launch
alias start skillup_start
alias stop skillup_stop
alias exitskillup skillup_pause;pause 2;exec exitskillup.txt
alias orders listaliases
alias events ae list echo;pause 2;input /echo ===== Done Listing Events =====
