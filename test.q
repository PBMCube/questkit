title: Test Game

command:
pattern: say #text#
script:
	function(text) {
		msg ("You say '" + text + "', but nobody replies.");
	}

location: lounge
description: This is quite a plain lounge with an old beige carpet and peeling wallpaper.
south: kitchen

object: TV
switchable: true
alt:
	["television", "telly"]
look: The TV is an old model, possibly 20 years old. {if TV.switchedon:It is currently showing an old western.}{else:It is currently switched off.}
watch: You watch for a few minutes. As your will to live slowly ebbs away, you remember that you’ve always hated watching westerns.

character: Bob
type: male
look: {if Bob.alive:Bob is sitting up, appearing to feel somewhat under the weather.}{else:Bob is lying on the floor, a lot more still than usual.}
use[defibrillator]:
	function() {
		if (get("Bob.alive")) {
			msg ("Bob is alive so you don't need to use the defibrilltor again.")
		}
		else {
			msg ("Miraculously, the defibrillator lived up to its promise, and Bob is now alive again. He says his head feels kind of fuzzy.");
			set ("Bob.alive", true);
		}
	}

object: table
surface: true

object: newspaper
parent: table
take: true
takemsg: You fold the newspaper and place it neatly under your arm.

object: defibrillator
look: A heart defibrillator can magically revive a dead person, if all those hospital dramas are to be believed.
take: true

location: kitchen
description: Just an ordinary kitchen.

object: eggs
weight: 250
prefix: some
look:
	function() {
		msg ("A box of eggs, weighing " + get("eggs.weight") + " grams.");
	}

command:
pattern: weigh #object#
script:
	function(object) {
		msg ("It weighs " + get(object, "weight") + " grams.");
	}

object: fridge
container: true
closed: true

object: milk
parent: fridge
prefix: some

object: cheese
parent: fridge
prefix: some

object: beer
parent: fridge
prefix: some