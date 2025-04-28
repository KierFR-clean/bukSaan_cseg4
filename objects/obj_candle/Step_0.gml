if (collision_circle(x, y, 15, obj_emilio, true, true)) {
	image_alpha = .25;
}
else {
	image_alpha = 1;
}

// Update depth every step to ensure proper layering
depth = obj_diningtbl_orng.depth - 1;