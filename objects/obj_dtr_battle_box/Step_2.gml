if (keep == 1)
{
    if (instance_exists(obj_dtr_battle_soul))
    {
        lborder = x - (sprite_width) + 40;
        rborder = x + (sprite_width) - 21;
        uborder = y - (sprite_height) + 39;
        dborder = y + (sprite_height) - 21;
            
        if (obj_dtr_battle_soul.x < (lborder + 5))
            obj_dtr_battle_soul.x = lborder + 5;
            
        if (obj_dtr_battle_soul.x > (rborder - 22))
            obj_dtr_battle_soul.x = rborder - 22;
            
        if (obj_dtr_battle_soul.y < (uborder + 5))
            obj_dtr_battle_soul.y = uborder + 5;
            
        if (obj_dtr_battle_soul.y > (dborder - 22))
            obj_dtr_battle_soul.y = dborder - 22;
    }
}
