function get_action_priority(action) {
    switch (action) {
        case 0: // fight
            return 2;
        case 6: // magic
            return 3;
        default:
            return 1;
    }
}