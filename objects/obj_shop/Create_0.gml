background_sprite = spr_shopbg1;
shopkeeper_sprite = spr_seam_idle;
shopkeeper_talking_sprite = spr_seam_talk;

shopkeeper_object = instance_create_depth(160, 69, -99999, obj_animation);
shopkeeper_object.sprite_index = shopkeeper_sprite;

shopkeeper_xto = 160;
shopkeeper_yto = 69;

item_info_y = 182;
item_info_yto = 182;

welcome_message = ["* Hee hee...^1\n* Welcome, travellers."];
exit_message = ["* See you again...^1\n* Or not.^1\n* Ha ha ha ha...", ""];
browsing_message = ["What do\nyou like\nto buy?"];
intermediate_message = ["* Take your time...^1\n* Ain't like it's\n  better spent."];
purchase_message = ["Preciate\nit twin."];
ignore_message = ["What,^1\nnot good\nenough?"];
cant_sell_message = ["* Items aren't added to the engine yet...^1\n* So this doesn't work yet :("];
talk_messages = [[
"* The Hog Rider card is unlocked\n  from the Spell Valley (Arena 5).^1\n  He is a very fast building-targeting,\n  melee troop with moderately high\n  hitpoints and damage.^1:He appears just like his Clash of Clans\n  counterpart;\na man with brown eyebrows, a beard, a mohawk, and a golden body piercing in his left ear who is riding a hog. A Hog Rider card costs 4 Elixir to deploy. Strategy His fast move speed can boost forward mini tanks like\nan Ice Golem in a push. At the same time, he can also function as a tank\nfor lower hitpoint troops such as Goblins as he still has a fair amount of health. Most cheap swarms complement the Hog Rider well, as they are nearly as fast as him and usually\nforce more than one card out of the opponent's hand. The Hog Rider struggles with swarms, as they can damage him down and defeat him quickly while obstructing his path. Barbarians in particular can fully counter him without very strict timing on the defender's part, though be wary of spells. A Hunter can kill the Hog Rider in 2 hits if placed right on top of it. However, if you place something in front of the Hog Rider, the Hunter's splash will damage the Hog Rider and hit the card in front of it more. The Hog Rider in conjunction with the Freeze can surprise the opponent and allow the Hog Rider to deal much more damage than anticipated, especially if the opponent's go-to counter is a swarm, or swarms are their only effective counter to him. Skeletons and Bats will immediately be defeated by the spell, while Spear Goblins, Goblins, and Minions will be at low enough health to be defeated by a follow up Zap or Giant Snowball. However, this strategy isn't very effective against buildings as the Hog Rider will take a while to destroy the building, giving the opponent ample time to articulate another counter. Against non-swarm troops, it can deal a lot of damage during the freeze time, but this can allow the opponent to set up a massive counterpush. For this reason, players should either only go for a Hog Rider + Freeze when they have other units backing it up from a counterattack, or if the match is about to end and they need to deal as much damage as possible. It is not a good idea to send in a Hog Rider simply to destroy a building, especially if it is the only building targeting unit available, as defeating Crown Towers becomes substantially more difficult. Spells or simply waiting out the lifetime of the building are more effective. The exception to this is an Elixir Collector placed in front of the King's Tower. If a Hog Rider placed at the bridge, he can destroy the Collector for a positive Elixir trade, though the damage from both Princess Towers will usually mean he does not survive to deal any damage to them. However, if the opponent sends in defending troops, it can be an opportunity to gain spell damage value. In a deck with several low-cost cards, it might be worth it to simply send the Hog Rider against one building. These decks shuffle their card rotation quick enough, that they will arrive to their next Hog Rider before the next building arrives in the opponent's card rotation. Long-ranged troops like Musketeer and Flying Machine can snipe those buildings, preserving some of the Hog Rider's health, possibly allowing it to get some Tower damage. When there are buildings placed in the middle to counter the Hog Rider, understanding the placement of the Hog Rider and the type of building placed can help the Hog Rider to bypass certain buildings. Passive buildings such as spawners and Elixir Collector have a larger hitbox than defensive buildings; which means that if a passive building was placed 3 tiles away from the river in the middle of the opponent's side, then it is impossible for the Hog Rider to bypass that placement as the Hog Rider will get pulled to that building. Defensive buildings have a smaller hitbox than a passive building, which means if that if a defensive building was placed three tiles away from the river in the middle of the opponent's side, a Hog Rider placed at the very left or right side of the Arena may be able to bypass it due to its smaller hitbox. If the player has a building already placed down in the center of the arena, and the opponent tries to bypass it with a Hog Rider at the edge of the arena, they can use certain air troops to push the Hog Rider towards the building as it jumps over the river, effectively denying the bypass attempt. They must be already hovering over the correct placement, as very quick reflexes are required to correctly perform this technique. For Bats, Skeleton Dragons, and Minion Horde, they should be placed right in front of the Hog Rider as soon as it is deployed. For Minions, Skeleton Barrel, Mega Minion, Flying Machine, Electro Dragon, Baby Dragon, Inferno Dragon, Balloon, and Lava Hound, stagger the above placement one tile to the right if the Hog Rider is placed on the left side of the arena, and vice versa. They can also use ground troops to achieve the same result. Something like an Ice Golem deployed at the Hog Rider’s landing spot will obstruct his path and force him to go around the unit, which causes him to be closer to the building instead of the Crown Tower. The Hog Rider can kite Very Fast non-building targeting troops due to his own Very Fast speed and building only targeting if he is placed on the fourth tile from the bridge, slightly into the opposite lane. He can also stall grounded units when placed right at the bridge. He will pull them towards him while deploying, and then be untargetable by them when he jumps over the bridge. After landing, he will pull them back. This can be useful when the player needs to deal damage in the same lane they are defending. It will also help separate troops behind a tank in a large push. A Tornado placed on the second tile front of the player's King's Tower and staggered two tiles towards the Princess Tower will activate it without any damage dealt to the Princess Tower, helping them in defending future pushes. This can also be a method of mitigating all damage dealt to a Princess Tower, but doing this more than three times may result in the King's Tower's health being low enough to be targeted directly, opening up the possible threat of a back door three crown. A better alternative is to pull the Hog away from the Princess Tower into the attacking range of all three Crown Towers, which will negate all damage as long as none of them are already distracted A very powerful combo is the Hog Rider, the Musketeer, and the Valkyrie, typically referred to as the Trifecta. The Musketeer will defend against most troops, while the Valkyrie can protect her and the Hog Rider from swarms or high damage units. The Hog Rider is used to deal damage to the tower. This can be effectively countered by Lightning, one-shotting the Musketeer and severely damaging both the Valkyrie and Hog Rider. The "
]]
can_sell = true;
only_one_talk = true;


//== Max of 4 items per shop, each item needs a string name, a price, a description, and an item object ==
shop_items = [["Dark Candy", 40, "ITEM\nStar-shape\ncandy that\nheals 40HP", obj_item],["Darkburger", 70, "ITEM\nMysterious\nhamburger\nheals 70HP", obj_item],
["Amber Card", 100, "ARMOR\nDefensive\ncharm", obj_item],["Spookysword", 200, "WEAPON\nBlack-and\norange", obj_item]];

writer = instance_create_depth(20, 137, -999999, obj_writer);
writer.can_accept = false
writer.text = welcome_message;
writer.line_sep = 2;
writer.snd = snd_nosound;

writer_buy = instance_create_depth(230, 132, -99999, obj_writer);
writer_buy.can_accept = false;
writer_buy.text = ["What do\nyou like\nto buy?"];
writer_buy.visible = true;
writer_buy.paused = true;
writer_buy.line_sep = 3;
writer_buy.snd = snd_nosound;

soul_pos_x = 235;
soul_pos_y = 143;

shop_state = 0;
shop_sub_state = 0;
ui_selection = 0;
ui_sub_selection = 0;
ui_delayed = false;

delay = function() {
    ui_delayed = true;
    alarm[0] = 5;
}