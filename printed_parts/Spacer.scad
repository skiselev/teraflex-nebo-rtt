// TeraFlex Nebo Roof Rack - Roofnest Spacers
// Copyright (C) Sergey Kiselev - skiselev@gmail.com
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

corner_radius = 2;
$fn = 60;
width=120;
depth=40;
thick=25.4;
tolerance=0.2;
hole_diameter=9;
indent1_width=6-tolerance;
indent2_width=10-tolerance;
indent_depth=3;
render_spacer();

module render_spacer() {
    difference() {
        // base plate
        rounded_box(depth,width,thick);
        //hole 1
        translate([depth/2,25,thick/2]) {
            cylinder(d=hole_diameter,h=thick+tolerance,center=true);
        }
        //hole 2
        translate([depth/2,95,thick/2]) {
            cylinder(d=hole_diameter,h=thick+tolerance,center=true);
        }
    }
    // indentation 1
    translate([0,10-indent1_width/2,thick]) {
        cube([depth,indent1_width,indent_depth]);
    }
    // indentation 2
    translate([0,60-indent2_width/2,thick]) {
        cube([depth,indent2_width,indent_depth]);
    }
    // indentation 2
    translate([0,110-indent1_width/2,thick]) {
        cube([depth,indent1_width,indent_depth]);
    }

}

////////////////////////////////////////////////////////////////////////////////
// Rounded Box
module rounded_box(w,l,h,cr=corner_radius)
{
    translate([cr,cr,0]) {
        minkowski() {
            cube([w-cr*2,l-cr*2,h/2]);
            cylinder(r=cr,h=h/2,center=false);
        }
    }
}