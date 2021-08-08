package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import lime.app.Application;
import openfl.Assets;


import Discord.DiscordClient;

#if cpp
import sys.thread.Thread;
#end

using StringTools;

class CheckText extends MusicBeatState
{   

    
	var dropText:FlxText;

    override  function create():Void
	{
        DiscordClient.changePresence("Inside The Credits Menu", null);


        var pic:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('menuGB'));
		pic.setGraphicSize(Std.int(pic.width * 1.0));
		add(pic);
        var icon:FlxSprite = new FlxSprite(325, 200).loadGraphic(Paths.image('disky Tile'));
		icon.setGraphicSize(Std.int(icon.width * .4));
		add(icon);

        dropText = new FlxText(-175, 75, Std.int(FlxG.width * 1.2), "", 20);
		dropText.font = 'DK Inky Fingers';
		dropText.color = 0xFFD89894;
        dropText.alignment = FlxTextAlign.CENTER;
		add(dropText);


        
       
    }


    override function update(elapsed:Float)
	{
        dropText.text = "This is Disky, the main  programmer for this mod, and you found a secret menu.
        I just wanted to say how great it has been to work on this mod, 
        Tama and Ren especially I love and am grateful to have met.
        Making this mod helped me through a really tramatizing realtionship and i am very thankful for that.
        Thank you for playing, and reading this, I hope to add even more cool features to this mod in the future.
        You can press any key to return to the credits";
        dropText.visible = true;
         if (FlxG.keys.justPressed.ANY)
		{
            //FlxG.sound.music.stop();
            FlxG.switchState(new CreditsMenu());
		}
       
    }
}