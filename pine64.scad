$fn=30;

x=129;
y=81.5;
offset=2;

module x(size=[0,0,0], r=0) {
    minkowski() {
        cube([size[0],size[1],.001], center=true);
        cylinder(r=r, h=size[2]);
    }
}

module pine64_case_bottom() {
    difference() {
        union() {
            difference() {
                x([x,y,12.49+offset], r=2);
                translate([0,0,3]) x([x-4,y-4,12.49+offset], r=2);
                translate([(x/2)+1,21.75,10+offset]) cube([4,10,10], center=true);
                translate([(x/2)+1,-.25,11+offset]) cube([4,17.6,10], center=true);
                translate([(x/2)+1,-21.26,11+offset]) cube([4,18.7,10], center=true);
                translate([-(x/2)-1,-22.8,11+offset]) cube([4,14,10], center=true);
                translate([-(x/2)-1,25.7,8.5+offset]) cube([4,5,10], center=true);
                translate([-40.5,(y/2)+1,11+offset]) cube([16,4,10], center=true);
            }
            for(i=[-1,1]) for(j=[-1,1]) translate([i*((x/2)-5.15),j*((y/2)-5.15),2+offset]) cylinder(d=7.5, h=2, center=true);
        }
        for(i=[-1,1]) for(j=[-1,1]) translate([i*((x/2)-5.15),j*((y/2)-5.15),1]) {
            cylinder(d=3, h=10, center=true);
            translate([0,0,-4+2.5]) cylinder(d=7.1, h=6, center=true, $fn=6);
        }
    }
}

module pine64_case_top() {
    difference() {
        union() {
            translate([(x/2)+1,-21.75,10.5]) cube([2,10,10], center=true);
            translate([-40.5,-(y/2)-1,11]) cube([16,2,10], center=true);
            translate([-(x/2)-1,-25.7,12]) cube([2,5,10], center=true);

            difference() {
                x([x,y,12.49], r=2);
                translate([0,0,2]) x([x-4,y-4,12.49], r=2);
                translate([-(x/2)-1,22.8,9]) cube([4,14,10], center=true);
                translate([(x/2)+1,.25,10]) cube([4,17.6,10], center=true);
                translate([(x/2)+1,21.26,16]) cube([4,18.7,10], center=true);

                translate([8,0,-2]) {
                    cylinder(r=40/2-1, h=10, $fn=40);
                    for(a=[0:90:359]) rotate(a=a) translate([15.9,15.9,0]) cylinder(d=3, h=10.6+2, center=true);
                }
            }

            translate([8,0,1]) {
                honeycomb();
                for(a=[0:60:360-1]) rotate(a=a) translate([0,20-1,0]) cylinder(d=3, h=2, center=true);
            }



            for(i=[-1,1]) for(j=[-1,1]) translate([i*((x/2)-5.15),j*((y/2)-5.15),((22-1.2)/2)]) cylinder(d=7.5, h=(22-1.2), center=true);
        }
        for(i=[-1,1]) for(j=[-1,1]) translate([i*((x/2)-5.15),j*((y/2)-5.15),1]) {
            translate([0,0,8]) cylinder(d=3, h=30, center=true);
            translate([0,0,-4+3]) cylinder(d=6, h=6, center=true);
        }
    }

    // % translate([8,0,5.3+2]) fan();
}

module fan() {
    difference() {
        cube([40,40,10.6], center=true);
        cylinder(d=38, h=10.6+2, center=true);
        for(a=[0:90:359]) rotate(a=a) translate([15.9,15.9,0]) cylinder(d=3.5, h=10.6+2, center=true);
    }
}

module honeycomb(h=2) {
    difference() {
        translate([0,0,-h/2]) cylinder(r=42/2-1, h=h, $fn=40);
        translate([-24,-20.8,(2+4)/-2]) for (i=[0:9-1]) {
            translate([(i%2)*6/2, 6*i*sqrt(3)/2,0]) {
                for (j=[0:9-1]) {
                    translate([j*6,0,0]) rotate([0,0,30]) cylinder(r=(6-1.5)/sqrt(3), h=2+4, $fn=6);
                }
            }
        }
    }
}

// translate([0,0,27]) rotate([180,0,0]) pine64_case_top();
pine64_case_top();
// pine64_case_bottom();
