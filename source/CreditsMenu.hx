package;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.addons.transition.FlxTransitionableState;

import Discord.DiscordClient;

using StringTools;

class CreditsMenu extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;
	
	private var iconArray:Array<CreditIcon> = [];
	
	public static var credits:Array<String> = [
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
	'',
	'PROGRAMMERS:',
	'Disky',
	'Starrie Blu',
	'Smokey', 
	'Clowfoe', 
	'Ash', 
	'Flippy', ///28
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
	'Rozebud',
	'Wiki',
	'Crystal',
	'Danni',
	'Kartin Crew',
	'Church Soop',
	'My beloved',
	'Eboymode'
	];

	override function create()
	{
		//if (!FlxG.sound.music.playing)
		//{
		//	FlxG.sound.playMusic(Paths.inst('whale-waltz'));
		//}
		
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Inside The Credits Menu...", null);
	
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
			grpSongs.add(songText);

			var icon:CreditIcon = new CreditIcon(credits[i]);
			icon.sprTracker = songText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);

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
			FlxG.switchState(new MainMenuState());
		}

		if (accepted)
		{
			trace(curSelected);
			switch (curSelected){

				case 0:
				case 1:
					fancyOpenURL("https://twitter.com/tamacoochi");
				case 2:
				case 3:
				case 4:
					fancyOpenURL("https://twitter.com/drizzleastra");
				case 5:
					fancyOpenURL("Blu https://twitter.com/starrie_blu");
				case 6:
					fancyOpenURL("https://twitter.com/peep_face");
				case 7:
					fancyOpenURL("https://elikapika.newgrounds.com/");
				case 8:
					fancyOpenURL("https://twitter.com/CitrusSlugLuca");
				case 9:
					fancyOpenURL("https://www.youtube.com/channel/UCdkHxFQnvyIKHSPcRRu-9PQ");
				case 10:
					fancyOpenURL("https://twitter.com/teradriive");
				case 11:
					fancyOpenURL("https://twitter.com/HexerRush");
				case 12:
					trace("No social media found");
				case 13:
					fancyOpenURL("https://twitter.com/VanillaSwirlx");
				case 14:
				case 15:
				case 16:
					fancyOpenURL("Blu https://twitter.com/starrie_blu");
				case 17:
					fancyOpenURL("https://twitter.com/MegaBlade");
				case 18:
					fancyOpenURL("https://www.youtube.com/channel/UCPJgxE6emiRHcjDn5IIjH3Q");
				case 19:
					fancyOpenURL("https://twitter.com/hamm_slamm");
				case 20:
					fancyOpenURL("https://www.youtube.com/c/StardustTunes");
				case 21:
				case 22:
					fancyOpenURL("https://github.com/mattsodes1031/Softmod-Public");
				case 23:
					fancyOpenURL("https://twitter.com/Disky_1");
				case 24:
					fancyOpenURL("https://twitter.com/starrie_blu");
				case 25:
					fancyOpenURL("https://twitter.com/Smokey_5_");
				case 26:
					fancyOpenURL("https://twitter.com/Clowfoe");
				case 27:
					fancyOpenURL("https://twitter.com/ash__i_guess_");
				case 28:
					fancyOpenURL("https://www.youtube.com/channel/UCMIGpjyL6H__IFp7emWErlw");
				case 29:
				case 30:
				case 31:
					fancyOpenURL("https://www.youtube.com/channel/UCMIGpjyL6H__IFp7emWErlw");
				case 32:
					fancyOpenURL("https://www.youtube.com/channel/UCPJgxE6emiRHcjDn5IIjH3Q");
				case 33:
					fancyOpenURL("https://twitter.com/EthanTheDoodler");
				case 34:
					fancyOpenURL("https://twitter.com/cval_brown");
				case 35:
					fancyOpenURL("https://twitter.com/alienshea");
				
				default:
					trace(curSelected);

			
			
			
			
			}
		}
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = credits.length - 1;
		if (curSelected >= credits.length)
			curSelected = 0;

		var bullShit:Int = 0;
		
		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

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