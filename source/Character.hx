package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import Song.SwagSong;



using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public static var SONG:SwagSong;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer', 0, -3);
				addOffset('sad', 0, -21);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 12);
				addOffset("singRIGHT", 0, -3);
				addOffset("singLEFT", 0, 1);
				addOffset("singDOWN", 0, -13);
				addOffset('hairBlow', 0, -9);
				addOffset('hairFall', 0, -9);

				addOffset('scared', 0, -19);

				playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('characters/soft_pico_blow_car');
				frames = tex;
				animation.addByPrefix('schmoovin', 'soft_pico hair blow CAR', 24, true);

				addOffset('schmoovin');

				playAnim('schmoovin');

			case 'oggf':
				tex = Paths.getSparrowAtlas('characters/gflol');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note RIGHT', 24);

				addOffset('idle');
				addOffset("singUP", -6, 45);
				addOffset("singRIGHT", -3, 13);
				addOffset("singLEFT", -5, -6);
				addOffset("singDOWN", 2, -50);

				playAnim('idle');

			case 'dad2':
				// DAD slightly pissed ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/dad2', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note RIGHT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);

				addOffset('idle');
				addOffset("singUP", -4, 44);
				addOffset("singLEFT", -3, -7);
				addOffset("singRIGHT", -3, 12);
				addOffset("singDOWN", 3, -51);

				playAnim('idle');

			case 'dad3':
				// DAD PISSSSED AS FUCKKKKKKKKKKKK ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/dad3', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT', 24);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Dad Sing Note RIGHT', 24);

				addOffset('idle');
				addOffset("singUP", -5, 44);
				addOffset("singRIGHT", 0, 12);
				addOffset("singLEFT", -5, -6);
				addOffset("singDOWN", 3, -50);

				playAnim('idle');

			case 'spooky':
				tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", -23, 35);
				addOffset("singRIGHT", -127, -2);
				addOffset("singLEFT", 84, -12);
				addOffset("singDOWN", -64, -130);

				playAnim('danceRight');
			case 'mom':
				tex = Paths.getSparrowAtlas('characters/Mom_Assets');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');

			case 'mom-car':
				tex = Paths.getSparrowAtlas('characters/momCar');
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');
			case 'hot_mom_phase_1':
				tex = Paths.getSparrowAtlas('characters/hot_mom_phase_1');
				frames = tex;
	
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 15, 71);
				addOffset("singRIGHT", 21, -49);
				addOffset("singLEFT", 91, -14);
				addOffset("singDOWN", -11, -197);
	
				playAnim('idle');
			case 'hot_mom_phase_2':
				tex = Paths.getSparrowAtlas('characters/hot_mom_phase_2');
				frames = tex;
		
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);
		
				addOffset('idle');
				addOffset("singUP", 15, 71);
				addOffset("singRIGHT", 21, -49);
				addOffset("singLEFT", 91, -14);
				addOffset("singDOWN", -11, -197);
		
				playAnim('idle');
			case 'hot_mom_phase_3':
				tex = Paths.getSparrowAtlas('characters/hot_mom_phase_3');
				frames = tex;
			
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);
			
				addOffset('idle');
				addOffset("singUP", 15, 71);
				addOffset("singRIGHT", 21, -49);
				addOffset("singLEFT", 91, -14);
				addOffset("singDOWN", -11, -197);
			
				playAnim('idle');
			case 'monster':
				tex = Paths.getSparrowAtlas('characters/Monster_Assets');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);
				setGraphicSize(Std.int(width * 1.15));

				addOffset('idle');
				addOffset("singUP", 175, 86);
				addOffset("singRIGHT", 214, 5);
				addOffset("singLEFT", 106, -75);
				addOffset("singDOWN", 181, -63);

				playAnim('idle');

			case 'monster-christmas':
				tex = Paths.getSparrowAtlas('characters/monsterChristmas');
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster Right note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster left note', 24, false);
				setGraphicSize(Std.int(width * 1.15));

				addOffset('idle');
				addOffset("singUP", 190, 75);
				addOffset("singRIGHT", 110, -70);
				addOffset("singLEFT", 225, -10);
				addOffset("singDOWN", 180, -75);
				playAnim('idle');
			case 'pico':
				tex = Paths.getSparrowAtlas('characters/Pico_FNF_assetss');
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -68, -7);
				addOffset("singLEFT", 65, 9);
				addOffset("singDOWN", 200, -70);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');

				flipX = true;

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/softie', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", 0, 10);
				addOffset("singRIGHT", -43, -7);
				addOffset("singLEFT", 19, -9);
				addOffset("singDOWN", 1, -53);
				addOffset("singUPmiss", -12, 9);
				addOffset("singRIGHTmiss", -53, -8);
				addOffset("singLEFTmiss", 20, -8);
				addOffset("singDOWNmiss", 0, -53);
				addOffset("hey", 3, -2);
				addOffset('firstDeath', 37, 5);
				addOffset('deathLoop', 37, -4);
				addOffset('deathConfirm', 37, 41);
				addOffset('scared', -8, -5);

				playAnim('idle');

				flipX = true;

			case 'ogbf':
				var tex = Paths.getSparrowAtlas('characters/ogbf', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", 0, 10);
				addOffset("singRIGHT", -43, -7);
				addOffset("singLEFT", 19, -9);
				addOffset("singDOWN", 1, -53);
				addOffset("singUPmiss", -12, 9);
				addOffset("singRIGHTmiss", -53, -8);
				addOffset("singLEFTmiss", 20, -8);
				addOffset("singDOWNmiss", 0, -53);
				addOffset("hey", 3, -2);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 11);
				addOffset('scared', -8, -5);

				playAnim('idle');

			case 'bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/softie_crimmus');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT 0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS0', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS0', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS0', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS0', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", 0, 10);
				addOffset("singRIGHT", -43, -7);
				addOffset("singLEFT", 19, -9);
				addOffset("singDOWN", 1, -53);
				addOffset("singUPmiss", -12, 9);
				addOffset("singRIGHTmiss", -53, -8);
				addOffset("singLEFTmiss", 20, -8);
				addOffset("singDOWNmiss", 0, -53);

				playAnim('idle');
				flipX = true;

			case 'bf-christmas2':
				var tex = Paths.getSparrowAtlas('characters/softie_crimmus2');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance determined norm', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP deter', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT deter', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT deter', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN deter', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS deter', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS deter', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS deter', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS deter', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", 0, 10);
				addOffset("singRIGHT", -43, -7);
				addOffset("singLEFT", 19, -9);
				addOffset("singDOWN", 1, -53);
				addOffset("singUPmiss", -12, 9);
				addOffset("singRIGHTmiss", -53, -8);
				addOffset("singLEFTmiss", 20, -8);
				addOffset("singDOWNmiss", 0, -53);

				playAnim('idle');
				
			
				flipX = true;
				
			case 'bf-christmas3':
				var tex = Paths.getSparrowAtlas('characters/softie_crimmus3');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance determined sad', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP deter', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT deter', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT deter', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN deter', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS deter', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS deter', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS deter', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS deter', 24, false);
				animation.addByPrefix('bigYell', 'BF SCREAMING INSIDE', 24, false);
				animation.addByPrefix('sadSmile', 'BF idle dance copy', 24, false);


				addOffset('bigYell', -10, -20);
				addOffset('idle', -5);
				addOffset("singUP", 0, 10);
				addOffset("singRIGHT", -43, -7);
				addOffset("singLEFT", 19, -9);
				addOffset("singDOWN", 1, -53);
				addOffset("singUPmiss", -12, 9);
				addOffset("singRIGHTmiss", -53, -8);
				addOffset("singLEFTmiss", 20, -8);
				addOffset("singDOWNmiss", 0, -53);
				addOffset("sadSmile", -5);
				

				playAnim('idle');
				
			
				flipX = true;
				
			case 'bf-car':
				var tex = Paths.getSparrowAtlas('characters/softieblowing');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5, 20);
				addOffset("singUP", 0, 25);
				addOffset("singRIGHT", -43, 13);
				addOffset("singLEFT", 22, 12);
				addOffset("singDOWN", 12, -35);
				addOffset("singUPmiss", -6, 34);
				addOffset("singRIGHTmiss", -41, 12);
				addOffset("singLEFTmiss", 22, 14);
				addOffset("singDOWNmiss", 0, -33);
				playAnim('idle');

				flipX = true;
			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'senpai':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);
				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-angry':
				frames = Paths.getSparrowAtlas('characters/senpai');
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = Paths.getPackerAtlas('characters/spirit');
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -220, -240);
				addOffset("singRIGHT", -220, -280);
				addOffset("singLEFT", -200, -280);
				addOffset("singDOWN", 170, 110);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'parents-christmas':
				frames = Paths.getSparrowAtlas('characters/mom_dad_christmas_assets');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				addOffset('idle');
				addOffset("singUP", -18, 65);
				addOffset("singRIGHT", -17, -15);
				addOffset("singLEFT", -6, 21);
				addOffset("singDOWN", -3, -36);
				addOffset("singUP-alt", -21, 63);
				addOffset("singRIGHT-alt", -22, -12);
				addOffset("singLEFT-alt", -6, 19);
				addOffset("singDOWN-alt", 1, -33);

				playAnim('idle');

			case 'parents-christmas2':
				frames = Paths.getSparrowAtlas('characters/parents_xmas_2');
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				addOffset('idle');
				addOffset("singUP", -12, 64);
				addOffset("singRIGHT", -15, -15);
				addOffset("singLEFT", -3, 20);
				addOffset("singDOWN", -3, -36);
				addOffset("singUP-alt", -10, 62);
				addOffset("singRIGHT-alt", -1, -24);
				addOffset("singLEFT-alt", -3, 18);
				addOffset("singDOWN-alt", -4, -32);

				playAnim('idle');


			case 'softgf':
				// tama is awesome
				tex = Paths.getSparrowAtlas('characters/Soft_GF_Assets', 'shared');
				frames = tex;
				animation.addByIndices('danceLeft', 'Pico Idle Dance', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceRight', 'Pico Idle Dance', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP', 'pico Up note', 24, false);
				animation.addByPrefix('singRIGHT', 'Pico Note Right', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note', 24, false);
				animation.addByPrefix('singLEFT', 'Pico NOTE LEFT', 24, false);

				addOffset('danceLeft', 50);
				addOffset('danceRight', 50);
				addOffset("singUP", 50, 88);
				addOffset("singRIGHT", -20, 26);
				addOffset("singLEFT", 60, 4);
				addOffset("singDOWN", 29, -55);

				playAnim('danceRight');
				flipX = true;

			case 'softgf2':
				// tama is awesome
				tex = Paths.getSparrowAtlas('characters/softgf2', 'shared');
				frames = tex;
				animation.addByIndices('danceLeft', 'Soft GF Idle 2', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceRight', 'Soft GF Idle 2', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP', 'pico Up note 2', 24, false);
				animation.addByPrefix('singRIGHT', 'Soft GF Body RIGHT 2', 24, false);
				animation.addByPrefix('singDOWN', 'Soft GF Body DOWN 2', 24, false);
				animation.addByPrefix('singLEFT', 'Soft GF Body LEFT 2', 24, false);

				addOffset('danceLeft', 50);
				addOffset('danceRight', 50);
				addOffset("singUP", 50, 88);
				addOffset("singRIGHT", -20, 26);
				addOffset("singLEFT", 60, 4);
				addOffset("singDOWN", 29, -55);

				playAnim('danceRight');
				flipX = true;

			case 'softgf3':
				// tama is awesome
				tex = Paths.getSparrowAtlas('characters/softgf3', 'shared');
				frames = tex;
				animation.addByIndices('danceLeft', 'Soft GF Idle 3', [0, 1, 2, 3, 4, 5, 6, 7], "", 24, false);
				animation.addByIndices('danceRight', 'Soft GF Idle 3', [8, 9, 10, 11, 12, 13, 14, 15], "", 24, false);
				animation.addByPrefix('singUP', 'pico Up note 3', 24, false);
				animation.addByPrefix('singRIGHT', 'Soft GF Body RIGHT 3', 24, false);
				animation.addByPrefix('singDOWN', 'Soft GF Body DOWN 3', 24, false);
				animation.addByPrefix('singLEFT', 'Soft GF Body LEFT 3', 24, false);

				addOffset('danceLeft', 50);
				addOffset('danceRight', 50);
				addOffset("singUP", 50, 88);
				addOffset("singRIGHT", -20, 26);
				addOffset("singLEFT", 60, 4);
				addOffset("singDOWN", 29, -55);

				playAnim('danceRight');
				flipX = true;

		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				//trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
			case 'hot_mom_phase_1'|'hot_mom_phase_2'|'bf-car':
			if(animation.curAnim.name == 'idle' && animation.curAnim.finished)
				playAnim('idle',false,false,11);
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{

				case 'hot_mom_phase_1'|'hot_mom_phase_2':
					if(danced)
						playAnim('idle',true);
					danced = !danced;
				case 'bf-car':
					if(!danced)
						playAnim('idle' ,true);
					danced = !danced;	
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if(PlayState.getBeat() >113 && PlayState.getBeat() < 117 && PlayState.getSong() == "no-cigar")
						{
							playAnim('cheer');
						}
						else
						{
							playAnim('cheer');
							if (danced)
									playAnim('danceRight', true);
							else
									playAnim('danceLeft', true);
						}
					}
				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					playAnim('schmoovin', true);

				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'oggf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case "softgf" | "softgf2" | "softgf3":
						danced = !danced;
	
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
				
				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');

				case "bf-christmas3":
					if (PlayState.getBeat() >= 264 && PlayState.getBeat() < 272 && PlayState.getStage() == 'mallEvil'){}
					else if (PlayState.getBeat() <= 332 && PlayState.getStage() == 'mallEvil'){
						playAnim('idle');
					}					
					else if (PlayState.getStage() == 'mallEvil'){
						playAnim('sadSmile');
					}
					else{
						playAnim('idle');
					}

				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}

}
