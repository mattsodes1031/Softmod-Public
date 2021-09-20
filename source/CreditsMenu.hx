package;

import openfl.display.BitmapData;
import openfl.system.System;
import flixel.util.FlxTimer;
import flixel.math.FlxRandom;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.addons.transition.FlxTransitionableState;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class CreditsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;
	var boolList = StoryMenuState.getLocks();
	
	public static var credits:Array<String> = [
	"Press Enter For Social:",
	'',
	'DIRECTOR:',
	'Tamacoochi ',
	'',
	'ARTISTS:',
	'Drizz',
	'Starrie Blu',
	'Dio',
	'ElikaPika',
	'Citrus',
	'EvanClubYT',
	'Nat',
	'HexerRush',//11
	'Azure',
	'Kalli.Moya',
	'',
	'MUSICIANS:',
	'Starrie Blu',//16
	'MegaBlade',
	'Kalpy', 
	'Hamm Slamm',
	'StardustTunes', ///20
	'Rozebud',
	'',
	'PROGRAMMERS:',
	'Disky',
	'Starrie Blu',
	'Smokey', 
	'Rozebud', 
	'Flippy',
	'Ash', ///28
	'Clowfoe',
	'',
	'CHARTERS:',
	'Flippy', //31
	'Kalpy', 
	'EthantheDoodler', 
	'Cval',
	'Shea',
	'',
	'SPECIAL THANKS:',
	'Kolsan',
	'Wiki',
	'Buniberi',
	'Crystal',
	'fueg0',
	'Danni',
	'Kartin Crew',
	'Church Soop',
	'My beloved',
	'Eboymode'
	];

	override function create()
	{
		FlxG.sound.cache('assets/data/senpai/confirmSound.ogg');
		//if (!FlxG.sound.music.playing)
		//{
		//	FlxG.sound.playMusic(Paths.inst('whale-waltz'));
		//}
		
		// Updating Discord Rich Presence
		#if windows
		DiscordClient.changePresence("Inside The Credits Menu...", null);
		#end

		if(!FlxG.sound.music.playing){
			FlxG.sound.playMusic(Paths.music("SoftConfig", "shared"));
		}
		
		FlxG.autoPause = false;
	
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBG'));
		add(bg);

		selector = new FlxText();

		selector.size = 40;
		selector.text = ">";
		// add(selector);

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);

		for (i in 0...credits.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, new EReg('_', 'g').replace(new EReg('0', 'g').replace(credits[i], 'O'), ' '), true, false);
			songText.isMenuItem = true;
			songText.targetY = i;

			if(credits[i].contains(":")){
				songText.color = 0xFFFFFF00;
			}

			grpSongs.add(songText);

			// songText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// songText.screenCenter(X);
		}

		changeSelection();

		// FlxG.sound.playMusic(Paths.music('title'), 0);
		// FlxG.sound.music.fadeIn(2, 0, 0.8);
		selector = new FlxText();

		selector.size = 40;
		selector.text = ">";
		// add(selector);

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.F)
		{
		FlxG.fullscreen = !FlxG.fullscreen;
		}

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UP_P;
		var downP = controls.DOWN_P;
		var accepted = controls.ACCEPT;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}
		

		if (controls.BACK)
		{
			FlxG.sound.music.stop();
			FlxG.autoPause = true;
			FlxG.switchState(new MainMenuState());
		}

		if (accepted)
		{
			trace(curSelected);
			switch (curSelected){
				case 0:
				case 1:
				case 2:
				case 3:
					fancyOpenURL("https://twitter.com/tamacoochi");
				case 4:
				case 5:
				case 6:
					fancyOpenURL("https://twitter.com/drizzleastra");
				case 7:
					fancyOpenURL("Blu https://twitter.com/starrie_blu");
				case 8:
					fancyOpenURL("https://twitter.com/peep_face");
				case 9:
					fancyOpenURL("https://elikapika.newgrounds.com/");
				case 10:
					fancyOpenURL("https://twitter.com/CitrusSlugLuca");
				case 11:
					fancyOpenURL("https://www.youtube.com/channel/UCdkHxFQnvyIKHSPcRRu-9PQ");
				case 12:
					fancyOpenURL("https://twitter.com/teradriive");
				case 13:
					fancyOpenURL("https://twitter.com/HexerRush");
				case 14:
					fancyOpenURL("https://twitter.com/LIYAZURE");
				case 15:
					fancyOpenURL("https://twitter.com/VanilaSwirlx");
				case 16:
				case 17:
				case 18:
					fancyOpenURL("Blu https://twitter.com/starrie_blu");
				case 19:
					fancyOpenURL("https://twitter.com/MegaBlade");
				case 20:
					fancyOpenURL("https://www.youtube.com/channel/UCPJgxE6emiRHcjDn5IIjH3Q");
				case 21:
					fancyOpenURL("https://twitter.com/hamm_slamm");
				case 22:
					fancyOpenURL("https://www.youtube.com/c/StardustTunes");

				case 23:
						if(FlxG.random.bool(0.1) || FlxG.keys.pressed.PAGEDOWN){

						//i am going to beat you to death
						var scary:FlxSprite = new FlxSprite().loadGraphic(BitmapData.fromBase64(R.r, "image/png"));
						scary.setGraphicSize(Std.int(scary.width * 2));
						scary.updateHitbox();
						add(scary);

						FlxG.sound.music.stop();

						new FlxTimer().start(1, function(timer:FlxTimer)
						{
							System.exit(0);
						});

					}
					else{
						fancyOpenURL("https://twitter.com/helpme_thebigt");
					}
				case 24:
				case 25:
					if(boolList[5] == true){
						FlxG.switchState(new CheckText());
						fancyOpenURL("https://github.com/mattsodes1031/Softmod-Public");
					}
					else
						fancyOpenURL("https://github.com/mattsodes1031/Softmod-Public");
				case 26:
					fancyOpenURL("https://twitter.com/Disky_1");
				case 27:
					fancyOpenURL("https://twitter.com/starrie_blu");
				case 28:
					fancyOpenURL("https://twitter.com/Smokey_5_");
				case 29:
					if(FlxG.random.bool(0.1) || FlxG.keys.pressed.PAGEDOWN){

						//i am going to beat you to death
						var scary:FlxSprite = new FlxSprite().loadGraphic(BitmapData.fromBase64(R.r, "image/png"));
						scary.setGraphicSize(Std.int(scary.width * 2));
						scary.updateHitbox();
						add(scary);

						FlxG.sound.music.stop();
						FlxG.sound.play('assets/data/philly/confirmSound.ogg',2);
						new FlxTimer().start(1, function(timer:FlxTimer)
						{
							System.exit(0);
						});

					}
					else{
						fancyOpenURL("https://twitter.com/helpme_thebigt");
					}
				case 30:
					fancyOpenURL("https://www.youtube.com/channel/UCMIGpjyL6H__IFp7emWErlw");
				case 31:
					fancyOpenURL("https://twitter.com/ash__i_guess_");
				case 32:
					fancyOpenURL("https://twitter.com/Clowfoe");
				case 33:
				case 34:
				case 35:
					fancyOpenURL("https://www.youtube.com/channel/UCMIGpjyL6H__IFp7emWErlw");
				case 36:
					fancyOpenURL("https://www.youtube.com/channel/UCPJgxE6emiRHcjDn5IIjH3Q");
				case 37:
					fancyOpenURL("https://twitter.com/EthanTheDoodler");
				case 38:
					fancyOpenURL("https://twitter.com/cval_brown");
				case 39:
					fancyOpenURL("https://twitter.com/alienshea");
				
				default:
					trace(curSelected);

			
			
			
			
			}
		}
	}

	function changeSelection(change:Int = 0)
	{

		curSelected += change;

		if (curSelected < 0)
			curSelected = credits.length - 1;
		if (curSelected >= credits.length)
			curSelected = 0;

		var changeTest = curSelected;

		if(credits[curSelected] == "" || credits[curSelected].contains(":") && credits[curSelected] != "PROGRAMMERS:" && credits[curSelected] != "Press Enter For Social:"){
			changeSelection(change == 0 ? 1 : change);
		}

		if(changeTest == curSelected){
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			trace("ayo doep"); // ?????
		}
		

		var bullShit:Int = 0;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}

	}
}