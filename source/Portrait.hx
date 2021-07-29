package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Portrait extends FlxSprite
{

    private var refx:Float;
    private var refy:Float;
    public var animOffsets:Map<String, Array<Dynamic>>;

    private var resize = 0.35;

    private var characters:Array<String> = ["narrator", "bf", "bfxmas", "gf", "dad", "dadxmas", "mom", "momxmas", "pico", "picoxmas", "monster", "monsterxmas", "skidnpump", "ogbf", "oggf", "shadows"];

	var posTween:FlxTween;
    var alphaTween:FlxTween;
	
    public function new(_x:Float, _y:Float, _character:String)
	{

        super(_x, _y);

        animOffsets = new Map<String, Array<Dynamic>>();

        defineCharacter(_character);
		/*
		if(_character =="pico"){
        setGraphicSize(Std.int(width * .35));
		}
		*/
		flipX = true;
		switch(_character){
			case "narrator":
				setGraphicSize(Std.int(width * .33));
			case "bf":
				setGraphicSize(Std.int(width * .40));
				flipX = false;
			case "bfxmas":
                setGraphicSize(Std.int(width * .33));
                flipX = false;
			case "gf":
                setGraphicSize(Std.int(width * .33)); 
			case "dad":
                setGraphicSize(Std.int(width * .40));
			case "dadxmas":
                setGraphicSize(Std.int(width * .33));
			case "mom":
                setGraphicSize(Std.int(width * .33));
			case "momxmas":
                setGraphicSize(Std.int(width * .33)); 
			case "pico":
				setGraphicSize(Std.int(width * .40));
			case "picoxmas":
                setGraphicSize(Std.int(width * .33));
			case "monster":
                setGraphicSize(Std.int(width * .16));
			case "monsterxmas":
                setGraphicSize(Std.int(width * .33));
			case "skidnpump":
                setGraphicSize(Std.int(width * .43)); 
			case "ogbf":
                setGraphicSize(Std.int(width * .40));  
            case "oggf":
                setGraphicSize(Std.int(width * .29)); 
            case "shadows":
                setGraphicSize(Std.int(width * .38));
		}
        updateHitbox();
        scrollFactor.set();
        antialiasing = true;

        refx = x;
        refy = y + height;

        playFrame();
        posTween = FlxTween.tween(this, {x: x}, 0.1);
        alphaTween = FlxTween.tween(this, {alpha: alpha}, 0.1);
        //hide();

    }

    function defineCharacter(_character)
	{

        _character = characters.contains(_character) ? _character : "bf";


        frames = Paths.getSparrowAtlas("portrait/" + _character);

        switch(_character){

            case "narrator":
                addAnim("default", "noChar.png");
				addAnim("tama", "tama.png");
				addAnim("tamashadow", "tama_shadow.png");
				animation.play("default");
            case "bf":
                addAnim("default", "B1.png");
                addAnim("b2", "B2.png");
                addAnim("b3", "B3.png");
                addAnim("b4", "B4.png");
                addAnim("b5", "B5.png");
                addAnim("b6", "B6.png");
                addAnim("b7", "B7.png");
				addAnim("b8", "B8.png");
				addAnim("b9", "B9.png");
				addAnim("b10", "B10.png");
				addAnim("b11", "B11.png");
				addAnim("b12", "B12.png");
				addAnim("b13", "B13.png");
				addAnim("b14", "B14.png");
				addAnim("b15", "B15.png");
				addAnim("b16", "B16.png");
				addAnim("b17", "B17.png");
                addAnim("b18", "B18.png");
                addAnim("b19", "B19.png");
                addAnim("b20", "B20.png");
                addAnim("b21", "B21.png");
                addAnim("b22", "B22.png");
                addAnim("b23", "B23.png");
                addAnim("b24", "B24.png");
                addAnim("b25", "B25.png");
				addAnim("b26", "B26.png");
                animation.play("default");
				
			case "bfxmas":
                addAnim("default", "B11xmas.png");
				addAnim("bx12", "B12xmas.png");
				addAnim("bx14", "B14xmas.png");
				addAnim("bx15", "B15xmas.png");
				addAnim("bx17", "B17xmas.png");
				addAnim("bx18", "B18xmas.png");
				addAnim("bx19", "B19xmas.png");
				addAnim("bx20", "B20xmas.png");
				addAnim("bx24", "B24xmas.png");
				addAnim("bx3", "B3xmas.png");
				addAnim("bx5", "B5xmas.png");
				addAnim("bx6", "B6xmas.png");
				addAnim("bx7", "B7xmas.png");
				addAnim("bx9", "B9xmas.png");
                animation.play("default");
                
            case "gf":
                addAnim("default", "G1.png");
                addAnim("g2", "G2.png");
                addAnim("g3", "G3.png");
                addAnim("g4", "G4.png");
                addAnim("g5", "G5.png");
                addAnim("g6", "G6.png");
                addAnim("g7", "G7.png");
				addAnim("g8", "G8.png");
				addAnim("g9", "G9.png");
				addAnim("g10", "G10.png");
				addAnim("g11", "G11.png");
				addAnim("g12", "G12.png");
				addAnim("g13", "G13.png");
				addAnim("g14", "G14.png");
				addAnim("g15", "G15.png");
				addAnim("g16", "G16.png");
				addAnim("g17", "G17.png");
                addAnim("g18", "G18.png");
                addAnim("g19", "G19.png");
                addAnim("g20", "G20.png");

                animation.play("default");
            case "dad":
                addAnim("default", "D1.png");
                addAnim("d2", "D2.png");
				addAnim("d3", "D3.png");
				addAnim("d4", "D4.png");
				addAnim("d5", "D5.png");
				addAnim("d6", "D6.png");
				addAnim("d7", "D7.png");
				addAnim("d8", "D8.png");
				addAnim("d9", "D9.png");
				addAnim("d10", "D10.png");
                animation.play("default");
			case "dadxmas":
                addAnim("default", "D1xmas.png");
                addAnim("dx3", "D3xmas.png");
				addAnim("dx4", "D4xmas.png");
				addAnim("dx6", "D6xmas.png");
				addAnim("dx8", "D8xmas.png");
                animation.play("default");
			case "mom":
                addAnim("default", "M1.png");
                addAnim("m2", "M2.png");
				addAnim("m3", "M3.png");
				addAnim("m4", "M4.png");
				addAnim("m5", "M5.png");
				addAnim("m6", "M6.png");
				addAnim("m7", "M7.png");
				addAnim("m8", "M8.png");
				addAnim("m9", "M9.png");
				addAnim("m10", "M10.png");
				addAnim("m11", "M11.png");
                animation.play("default");
			case "momxmas":
                addAnim("default", "M10xmas.png");
                addAnim("mx11", "M11xmas.png");
				addAnim("mx1", "M3xmas.png");
				addAnim("mx3", "M4xmas.png");
				addAnim("mx5", "M5xmas.png");
                animation.play("default");
            case "pico":
                addAnim("default", "P1");
				addAnim("p2", "P2");
				addAnim("p3", "P3");
				addAnim("p4", "P4");
				addAnim("p5", "P5");
				addAnim("p6", "P6");
				addAnim("p7", "P7");
				addAnim("p8", "P8");
				addAnim("p9", "P9");
				addAnim("p10", "P10");
				addAnim("p11", "P11");
				addAnim("p12", "P12");
                animation.play("default");
			case "picoxmas":
                addAnim("default", "P10xmas.png");
				addAnim("px11", "P11xmas.png");
				addAnim("px4", "P4xmas.png");
				addAnim("px6", "P6xmas.png");
                addAnim("yougotitbabe", "yougotitbabe.png");
                animation.play("default");
			case "monster":
				addAnim("default", "monster_neutral.png");
				addAnim("angy", "monster_angry.png");
				animation.play("default");
			case "monsterxmas":
				addAnim("default", "MoXmas1.png");
				addAnim("angy2", "MoXmas2.png");
				animation.play("default");
			case "skidnpump":
				addAnim("default", "pump_looks_into_your_soul.png");
				addAnim("pnm", "pump_nightmare.png");
				addAnim("pn", "pump_normal.png");
				addAnim("sl", "skid_looks_into_your_soul.png");
				addAnim("snm", "skid_nightmare.png");
				addAnim("sn", "pump_normal.png");
				animation.play("default");
			case "ogbf":
				addAnim("default", "BF.png");
				addAnim("bf2", "BF2.png");
				animation.play("default");
			case "oggf":
				addAnim("default", "GF.png");
				animation.play("default");
			case "shadows":
				addAnim("default", "BF.png");
				addAnim("gfshadow", "GF..png");
				addAnim("dadshadow", "dad.png");
				addAnim("momshadow", "mom.png");
				addAnim("monstershadow", "monster.png");
				addAnim("skidshadow", "skid.png");
				addAnim("pumpshadow", "pump.png");
				animation.play("default");
        }
    }
    
    function addAnim(anim:String, prefix:String){
        animation.addByPrefix(anim,prefix, 0, false);
    }    
    
  
    public function playFrame(?_frame:String = "default"){


        visible = true;
		
        animation.play(_frame);
       // flipX = false;
        updateHitbox();
        //This lets you change the induvidual portrait x/y
        switch(_frame){
            default:
                x = refx;
                y = refy - height;
            case "g6":
                x = refx;
                y = (refy - height)+17;
            case "g5":
                x = refx;
                y = (refy - height)+17;
            case "g4":
                x = refx;
                y = (refy - height)+10;
            case "g3":
                x = refx;
                y = (refy - height)+10;
            case "mx5":
                x = refx+10;
                y = (refy - height);
            case "bx18":
                x = refx;
                y = (refy - height)+10;
            case "bx11":
                x = refx;
                y = (refy - height)+4;
            case "bx5":
                x = refx;
                y = (refy - height)+3;
            case "bx7":
                x = refx;
                y = (refy - height)+4;
            case "angy2":
                x = refx - 50;
                y = (refy - height);
           

        }

    }
	
	public function hide(){

        alphaTween.cancel();
        posTween.cancel();
        alpha = 1;
        visible = false;

    }
	public function effectFadeOut(?time:Float = 1){

        alphaTween.cancel();
        alpha = 1;
        alphaTween = FlxTween.tween(this, {alpha: 0}, time);

    }

    public function effectFadeIn(?time:Float = 1){

        alphaTween.cancel();
        alpha = 0;
        alphaTween = FlxTween.tween(this, {alpha: 1}, time);

    }

    public function effectExitStageLeft(?time:Float = 1){

        posTween.cancel();
        posTween = FlxTween.tween(this, {x: 0 - width}, time, {ease: FlxEase.circIn});

    }

    public function effectExitStageRight(?time:Float = 1){

        posTween.cancel();
        posTween = FlxTween.tween(this, {x: FlxG.width}, time, {ease: FlxEase.circIn});

    }

    public function effectFlipRight(){

        x = FlxG.width - refx - width;
        y = refy - height;

    }

    public function effectFlipDirection(){
        
        flipX = true;

    }

    public function effectEnterStageLeft(?time:Float = 1){
        
        posTween.cancel();
        var finalX = x;
        x = 0 - width;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.circOut});

    }

    public function effectEnterStageRight(?time:Float = 1){
        
        posTween.cancel();
        var finalX = x;
        x = FlxG.width;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.circOut});
    }

    public function effectToRight(?time:Float = 1){
        
        posTween.cancel();
        var finalX = FlxG.width - refx - width;
        x = refx;
        y = refy - height;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.quintOut});
    }

    public function effectToLeft(?time:Float = 1){
        
        posTween.cancel();
        var finalX = refx;
        x = FlxG.width - refx - width;
        y = refy - height;
        posTween = FlxTween.tween(this, {x: finalX}, time, {ease: FlxEase.quintOut});
    }


	
}