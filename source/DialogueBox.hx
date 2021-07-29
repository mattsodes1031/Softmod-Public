package;

import flixel.system.FlxSound;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.display.BitmapData;
import openfl.media.Sound;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;
    var skipText:FlxText;
	var curCharacter:String = '';
	
	var curAnim:String = '';
	var prevChar:String = '';
	var effectQue:Array<String> = [""];
	var effectParamQue:Array<String> = [""];
	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;
	//
	var cutsceneImage:FlxSprite;
	var sound:FlxSound;
	var hide:Bool = false;


	public var finishThing:Void->Void;
	
	var portraitBF:Portrait;
	var portraitBFXMAS:Portrait;
	var portraitGF:Portrait;
	var portraitPICO:Portrait;
	var portraitPICOXMAS:Portrait;
	var portraitDAD:Portrait;
	var portraitDADXMAS:Portrait;
	var portraitMOM:Portrait;
	var portraitMOMXMAS:Portrait;
	var portraitNOCHAR:Portrait;
	var portraitSKIDPUMP:Portrait;
	var portraitMONSTER:Portrait;
	var portraitMONSTERXMAS:Portrait;
	var portraitOGBF:Portrait;
	var portraitOGGF:Portrait;
	var portraitSHADOWS:Portrait;
	var portraitNARRATOR:Portrait;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;

	//var handSelect:FlxSprite;
	var bgFade:FlxSprite;
	var blackBG:FlxSprite;
	public static var count:Int = 0;
	
	var canAdvance = false;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		new FlxTimer().start(0.5, function(tmr:FlxTimer)
		{
				canAdvance = true;
		});
		
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}


		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			canAdvance = true;
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 385);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('bawks', 'shared');
				box.animation.addByPrefix('normalOpen', 'dialogue_box.png', 24, false);
				box.animation.addByIndices('normal', 'dialogue_box.png', [1], "", 24);
				trace('Bawks loaded');
				count+=1;
				
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
			
			//case 'preface':
			
				//hasDialog = true;
				//box.frames = Paths.getSparrowAtlas('bawks');
				//box.animation.addByPrefix('normalOpen', 'dialogue_box.png', 24, false);
				//box.animation.addByIndices('normal', 'dialogue_box.png', [11], "", 24);
			//case 'playdate':
				
				//hasDialog = true;
				
				//box.frames = Paths.getSparrowAtlas('bawks');
				//box.animation.addByPrefix('normalOpen', 'dialogue_box.png', 24, false);
				//box.animation.addByIndices('normal', 'dialogue_box.png', [11], "", 24);
				//FlxG.watch.add(box, "x");
				//FlxG.watch.add(box, "y");
			//case 'genesis':
			
				//hasDialog = true;
				//box.frames = Paths.getSparrowAtlas('bawks');
				//box.animation.addByPrefix('normalOpen', 'dialogue_box.png', 24, false);
				//box.animation.addByIndices('normal', 'dialogue_box.png', [11], "", 24);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
			trace('Dialog returned');
		if (PlayState.SONG.song.toLowerCase() == 'senpai'
			|| PlayState.SONG.song.toLowerCase() == 'roses'
			|| PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft = new FlxSprite(-20, 40);
			portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
			portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
			portraitLeft.animation.addByIndices('idle', 'Senpai Portrait Enter', [3], "", 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}
		else
		{
		
			portraitBF = new Portrait (850, 235, "bf");
			add(portraitBF);
			
			portraitBFXMAS = new Portrait (190, 190, "bfxmas");
			add(portraitBFXMAS);

			portraitPICO = new Portrait (190, 190, "pico");
			add(portraitPICO);
			
			portraitPICOXMAS = new Portrait (190, 228, "picoxmas");
			add(portraitPICOXMAS);
	
			portraitDAD = new Portrait (180, 180, "dad");
			add(portraitDAD);
			
			portraitDADXMAS = new Portrait (180, 180, "dadxmas");
			add(portraitDADXMAS);
			
			portraitMOM = new Portrait (170, 210, "mom");
			add(portraitMOM);
			
			portraitMOMXMAS = new Portrait (170, 210, "momxmas");
			add(portraitMOMXMAS);
			
			portraitMONSTER = new Portrait (190, 145, "monster");
			add(portraitMONSTER);
			
			portraitMONSTERXMAS = new Portrait (170, 90, "monsterxmas");
			add(portraitMONSTERXMAS);
			
			portraitGF = new Portrait (170, 200, "gf");
			add(portraitGF);
			
			portraitOGBF = new Portrait (170, 220, "ogbf");
			add(portraitOGBF);
			
			portraitOGGF = new Portrait (180, 235, "oggf");
			add(portraitOGGF);
			
			portraitSKIDPUMP = new Portrait (220, 240, "skidnpump");
			add(portraitSKIDPUMP);
			
			portraitSHADOWS = new Portrait (180, 260, "shadows");

			add(portraitSHADOWS);

			portraitNOCHAR = new Portrait (0, 9999, "noChar");
			add(portraitNOCHAR);

			portraitNARRATOR =  new Portrait (210, 130, "narrator");
			add(portraitNARRATOR);
			
			trace('Portraits here');
		}
		//portraitLeft = new FlxSprite(-20, 190);
		
		//portraitLeft.frames = Paths.getSparrowAtlas('p4');
		//portraitLeft.animation.addByPrefix('enter', 'P4.png', 24, false);
		//portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.077));
		//portraitLeft.updateHitbox();
		//portraitLeft.scrollFactor.set();
		//add(portraitLeft);
		//portraitLeft.flipX = true;
		//FlxG.watch.add(portraitLeft, "x");
		//FlxG.watch.add(portraitLeft, "y");
		//portraitLeft.visible = false;
		
		
		portraitRight = new FlxSprite(0, 190);
		
		
		portraitRight.frames = Paths.getSparrowAtlas('b3');
		portraitRight.animation.addByPrefix('enter', 'B3.png', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.077));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		
		add(portraitRight);
		portraitRight.visible = false;
		FlxG.watch.add(portraitRight, "x");
		FlxG.watch.add(portraitRight, "y");
		
		
		//box.animation.play('normalOpen');
		//box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.15));
		//box.updateHitbox();
		//add(box);
		switch PlayState.SONG.song.toLowerCase(){
		case 'senpai' | 'roses' | 'thorns':
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);	
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * 0.9));
		box.updateHitbox();
		add(box);
		box.animation.play('normalOpen'); 
		box.setGraphicSize(Std.int(box.width * 0.9));
		box.updateHitbox();
		add(box);
	
		
		default:
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * 0.9));
		box.updateHitbox();
		add(box);
		trace('Box default');
		/*
		if(count == 1){
		blackBG = new FlxSprite(-256, -256).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
		add(blackBG);
		trace(blackBG.x);
		}
		else if(blackBG.x == -256){
		blackBG.setGraphicSize(Std.int(width * .01));
		}
		*/
		trace("num ="+count);
		}

		box.screenCenter(X);
	//	portraitLeft.screenCenter(X);
		portraitRight.screenCenter(X);
	//	portraitLeft.x -= 220;
		portraitRight.x += 270;


		//handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('hand_textbox'));
		//add(handSelect);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'DK Inky Fingers';
		dropText.color = 0xFFD89494;
		add(dropText);
		trace('Font loaded');

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'DK Inky Fingers';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;
		
		
		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
			trace('DIALOGUE IS FUCKING STARTED');
		}

		if(FlxG.keys.justPressed.SPACE && !isEnding){

			isEnding = true;
			endDialogue();

		}
		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true && canAdvance && !isEnding)
		{
			remove(dialogue);
			canAdvance = false;
			
			new FlxTimer().start(0.15, function(tmr:FlxTimer)
			{
				canAdvance = true;
			});

				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);
			//trace('STILL WORKING');

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;
					endDialogue();
					
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
				//trace('You better work');
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function endDialogue(){
		hideAll();
		
		new FlxTimer().start(1.2, function(tmr:FlxTimer)
		{
			finishThing();
			kill();
			FlxG.sound.music.stop();
		});

	}
	function runEffectsQue(){
	
		for(i in 0...effectQue.length){

			switch(effectQue[i]){

				case "fadeOut":
					effectFadeOut(Std.parseFloat(effectParamQue[i]));
				case "fadeIn":
					effectFadeIn(Std.parseFloat(effectParamQue[i]));
				case "exitStageLeft":
					effectExitStageLeft(Std.parseFloat(effectParamQue[i]));
				case "exitStageRight":
					effectExitStageRight(Std.parseFloat(effectParamQue[i]));
				case "enterStageLeft":
					effectEnterStageLeft(Std.parseFloat(effectParamQue[i]));
				case "enterStageRight":
					effectEnterStageRight(Std.parseFloat(effectParamQue[i]));
				case "rightSide":
					effectFlipRight();
				case "flip":
					effectFlipDirection();
				case "toLeft":
					effectToLeft();
				case "toRight":
					effectToRight();
				//case "shake":
					//effectShake(Std.parseFloat(effectParamQue[i]));
				default:

			}

		}

		effectQue = [""];
		effectParamQue = [""];

	}

	function startDialogue():Void
	{
		hideAll();
		var setDialogue = false;
		var skipDialogue = false;
		cleanDialog();
		
		box.visible = true;
		box.flipX = false;
		swagDialogue.visible = true;
		dropText.visible = true;
		
		switch (curCharacter)
		{
			case "effect":
				switch(curAnim){
					case "hidden":
						swagDialogue.visible = false;
						dropText.visible = false;
						box.visible = false;
						setDialogue = true;
						swagDialogue.resetText("");
					default:
						effectQue.push(curAnim);
						effectParamQue.push(dialogueList[0]);
						skipDialogue = true;
				}
			case "bf":
				portraitBF.playFrame(curAnim);
			case "bfxmas":
				portraitBFXMAS.playFrame(curAnim);
			case "dad":
				portraitDAD.playFrame(curAnim);
			case "dadxmas":
				portraitDADXMAS.playFrame(curAnim);
			case "pico":
				portraitPICO.playFrame(curAnim);
			case "picoxmas":
				portraitPICOXMAS.playFrame(curAnim);
			case "gf":
				portraitGF.playFrame(curAnim);
			case "mom":
				portraitMOM.playFrame(curAnim);
			case "momxmas":
				portraitMOMXMAS.playFrame(curAnim);
			case "monster":
				portraitMONSTER.playFrame(curAnim);
			case "monsterxmas":
				portraitMONSTERXMAS.playFrame(curAnim);
			case "skidnpump":
				portraitSKIDPUMP.playFrame(curAnim);
			case "ogbf":
				portraitOGBF.playFrame(curAnim);
			case "oggf":
				portraitOGGF.playFrame(curAnim);
			case "shadows":
				portraitSHADOWS.playFrame(curAnim);
			case "narrator":
				portraitNARRATOR.playFrame(curAnim);
				
			
			default:
				trace("default dialogue event");
				portraitBF.playFrame();
		}
		
		prevChar = curCharacter;

		if(!skipDialogue){
			if(!setDialogue){
				swagDialogue.resetText(dialogueList[0]);
			}

			swagDialogue.start(0.04, true);
			runEffectsQue();
			
		}
		else{

			dialogueList.remove(dialogueList[0]);
			startDialogue();
			
		}
	}
	
	function cleanDialog():Void
	{
		while(dialogueList[0] == ""){
			dialogueList.remove(dialogueList[0]);
		}

		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		curAnim = splitName[2];
	
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + splitName[2].length  + 3).trim();
	}
	

	function hideAll():Void
	{ 
		portraitNARRATOR.hide();
		portraitBF.hide();
		portraitBFXMAS.hide();
		portraitGF.hide();
		portraitPICO.hide();
		portraitPICOXMAS.hide();
		portraitDAD.hide();
		portraitDADXMAS.hide();
		portraitMOM.hide();
		portraitMOMXMAS.hide();
		portraitNOCHAR.hide();
		portraitSKIDPUMP.hide();
		portraitMONSTER.hide();
		portraitMONSTERXMAS.hide();
		portraitOGBF.hide();
		portraitOGGF.hide();
		portraitSHADOWS.hide();
		for (i in 0...portraitArray().length)
			portraitArray()[i].hide();
		
		

	}
	function effectFadeOut(?time:Float = 1):Void{
		for(i in 0...portraitArray().length){
		portraitArray()[i].effectFadeOut(time);
		}
	}

	function effectFadeIn(?time:Float = 1):Void{
		for(i in 0...portraitArray().length){
		portraitArray()[i].effectFadeIn(time);
		}
	}

	function effectExitStageLeft(?time:Float = 1):Void{
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectExitStageLeft(time);
			}
	}

	function effectExitStageRight(?time:Float = 1):Void{
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectExitStageRight(time);
			}
	}

	function effectFlipRight(){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectFlipRight();
			}
			box.flipX = false;
		
	}
	
	function effectFlipDirection(){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectFlipDirection();
			}
		
	}

	function effectEnterStageLeft(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectEnterStageLeft(time);
			}
		
	}

	function effectEnterStageRight(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectEnterStageRight(time);
			}
	
	}

	function effectToRight(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectToRight(time);
			}
		
		box.flipX = false;
	}

	function effectToLeft(?time:Float = 1){
		for(i in 0...portraitArray().length){
			portraitArray()[i].effectToLeft(time);
			}
		
	}


	function portraitArray(){
	var portraitArray =[
		portraitNARRATOR,
		portraitBF,
		portraitBFXMAS,
		portraitGF,
		portraitPICO,
		portraitPICOXMAS,
		portraitDAD,
		portraitDADXMAS,
		portraitMOM,
		portraitMOMXMAS,
		portraitNOCHAR,
		portraitSKIDPUMP,
		portraitMONSTER,
		portraitMONSTERXMAS,
		portraitOGBF,
		portraitOGGF,
		portraitSHADOWS];
		return portraitArray;
	}

}