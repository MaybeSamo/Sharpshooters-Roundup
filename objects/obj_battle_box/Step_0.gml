// Define the step size for the linear transition
var step_width = 20; // Adjust this for faster/slower changes
var step_height = 7;

// Handle width adjustment
if (current_width < global.border_width) {
    current_width = min(current_width + step_width, global.border_width); // Increment, but don't exceed the target
} else if (current_width > global.border_width) {
    current_width = max(current_width - step_width, global.border_width); // Decrement, but don't go below the target
}

// Handle height adjustment
if (current_height < global.border_height) {
    current_height = min(current_height + step_height, global.border_height); // Increment, but don't exceed the target
} else if (current_height > global.border_height) {
    current_height = max(current_height - step_height, global.border_height); // Decrement, but don't go below the target
}
