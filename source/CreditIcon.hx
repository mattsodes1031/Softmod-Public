package;

import flixel.FlxSprite;

class CreditIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;

	public function new(char:String = 'Crystal Blitz', isPlayer:Bool = false)
	{
		super();
		
		frames = Paths.getPackerAtlas('credits/Spriteshit/sheet');
		
		for (person in CreditsMenu.credits)
		{
			animation.addByPrefix(person, person + " Tile", 0, false, isPlayer);
		}
		
		setGraphicSize(150, 150);
		updateHitbox();

		antialiasing = true;
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
