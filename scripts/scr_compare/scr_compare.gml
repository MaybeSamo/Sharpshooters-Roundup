function scr_compare(value, comparison, numbertocheck) {
    switch (comparison) {
        case "==": if (value == numbertocheck) return true; break;
        case "!=": if (value != numbertocheck) return true; break;
        case ">":  if (value > numbertocheck) return true; break;
        case "<":  if (value < numbertocheck) return true; break;
        case ">=": if (value >= numbertocheck) return true; break;
        case "<=": if (value <= numbertocheck) return true; break;
    }
    return false;
}
