blower_w = 59;
blower_h = 55;
blower_length = 55;
walls = 3;

// tee-end
translate([0,0,80]){
	difference(){
		cylinder(r=(26/2), h=10);
		
		// hole
		translate([0,0,-1]){
			cylinder(r=(26/2) - walls, h=10 + 2);
		}
	}
}


// blower-end
difference(){
	resize(newsize=[blower_w + walls, blower_h + walls, blower_length]){
		cylinder(r=(blower_w/2), h=blower_length);
	}

	// blower-end hole
	translate([0,0,-1]){
		resize(newsize=[blower_w, blower_h, blower_length + 2]){
			cylinder(r=(blower_w/2), h=blower_length);
		}
	}
}
