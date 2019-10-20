/// @description rotate the sprite

image_angle += 2;

if (y < startY && !isFalling) {
	y += (startY - y) / fallSpeedFromTop;
}

if (isFalling && y < endY) {
	y += fallSpeedToBottom / (endY - y);
}