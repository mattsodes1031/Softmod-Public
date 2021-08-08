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

#if windows
import Discord.DiscordClient;
#end

#if cpp
import sys.thread.Thread;
#end

using StringTools;

class WarningState extends MusicBeatState
{   

    
	var dropText:FlxText;

    override  function create():Void
	{
        DiscordClient.changePresence("Inside The Opening Menu", null);

        FlxG.sound.music.stop();
        FlxG.sound.playMusic(Paths.music("SoftConfig", "shared"));

        var pic:FlxSprite = new FlxSprite(-150, -50).loadGraphic(Paths.image('Not_Safe_Warning'));
		pic.setGraphicSize(Std.int(pic.width * .9));
        pic.alpha = 0;
		add(pic);

        dropText = new FlxText(-150, 0, Std.int(FlxG.width * 1.2), "", 22);
		dropText.font = 'DK Inky Fingers';
		dropText.color = FlxColor.WHITE;
        dropText.alignment = FlxTextAlign.CENTER;
        dropText.alpha = 0;
		add(dropText);
        FlxTween.tween(pic, {alpha: 1}, 1.2, {ease: FlxEase.circOut});
        FlxTween.tween(dropText, {alpha: 1}, 1.2, {ease: FlxEase.circOut});
       
    }


    override function update(elapsed:Float)
	{
        dropText.text = "Warning!
This mod handles topics that some may find triggering.
It is possible to play the mod safely by pressing Shift to skip dialogue.
Triggers may include:
Implied domestic abuse,
Physical signs of domestic abuse,
PTSD,
Mentions of Pico’s School,
If you are a victim of domestic violence, remember that you aren’t alone.
If you have any questions regarding the mod, contact @SoftModFNF on Twitter.
Enjoy the story.
(Press any key to continue)";
        dropText.visible = true;
         if (FlxG.keys.justPressed.ANY)
		{
            FlxG.switchState(new MainMenuState());
		}
       
    }
}