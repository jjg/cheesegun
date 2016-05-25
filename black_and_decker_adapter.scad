blower_w = 60;
blower_h = 56;
blower_length = 55;
walls = 3;
tee_depth = 19;

difference(){

	union(){

		// tee-end connector	
		difference(){
			translate([0,0,70]){
				cylinder(r=(26/2), h=tee_depth, $fn=100);	
			}
			translate([0,0,70]){
				cylinder(r=(26/2) - walls, h=tee_depth + 2, $fn=100);
			}
		}

		hull(){
			// tee-end opening
			translate([0,0,60]){
				cylinder(r=(26/2), h=10, $fn=100);
			}

			// blower-end
			resize(newsize=[blower_w + walls, blower_h + walls, blower_length]){
				cylinder(r=(blower_w/2), h=blower_length, $fn=100);
			}
		}
	}

	hull(){
		// tee-end hole
		translate([0,0,60]){
			cylinder(r=(26/2) - walls, h=10 + 2, $fn=100);
		}

		// blower-end hole
		translate([0,0,-1]){
			resize(newsize=[blower_w, blower_h, blower_length + 2]){
				cylinder(r=(blower_w/2), h=blower_length, $fn=100);
			}
		}
	}
}

difference(){
	// deflector
	translate([0,-11,72]){
		cylinder(r1=1,r2=(26/3), h=tee_depth-2, $fn=100);
	}

	difference(){
		translate([0,0,71]){
			cylinder(r=(26/2)+10, h=tee_depth, $fn=100);	
		}
		translate([0,0,70]){
			cylinder(r=(26/2), h=tee_depth+2, $fn=100);	
		}
	}

}
	