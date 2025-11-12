// Copyright 2025 - Geoff SObering - All Rights Reserved
// Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3

module torus2(radius, translation)
{
  echo("2 radius, translation", radius, translation);
  rotate_extrude(convexity = 4)
    translate([translation, 0, 0])
      difference()
      {
        circle(r = radius);
        translate([-2*radius,-radius-1]) square(2*[radius, radius+2]);
      }
}

module torus3(outsideDiameter, circleDiameter)
{
  circleRadius = circleDiameter/2;
  torus2(circleRadius, outsideDiameter/2-circleRadius);
}

module torus2fn(outsideDiameter, outsideFN, circleDiameter)
{
  circleRadius = circleDiameter/2;
  // torus2(circleRadius, outsideDiameter/2-circleRadius);
  rotate_extrude(convexity = 10, $fn=outsideFN)
    translate([outsideDiameter/2-circleRadius, 0, 0])
      difference()
      {
        circle(r = circleRadius, $fn=120);
        translate([-2*circleRadius,-circleRadius-1]) square(2*[circleRadius, circleRadius+2]);
      }
}

module torus2a(radius, translation)
{
  echo("2a radius, translation", radius, translation);
  rotate_extrude(convexity = 4)
    translate([translation, 0, 0]) circle(r = radius);
}

module torus3a(outsideDiameter, circleDiameter)
{
  echo("3a outsideDiameter, circleDiameter", outsideDiameter, circleDiameter);
  circleRadius = circleDiameter/2;
  torus2a(circleRadius, outsideDiameter/2-circleRadius);
}

module cheeseWheel(OD, arcRadius, thickness)
{
  echo("cheeseWheel: OD, radius, thickness = ", OD, arcRadius, thickness);
  rotate_extrude(convexity = 8, $fn=360)
      difference()
      {
        union()
        {
          x = OD/2 - arcRadius;
          y = 2* arcRadius;
          translate([OD/2 - arcRadius, 0, 0]) circle(r = arcRadius);
          if(x > 0) translate([0, -y/2]) square([x, y]);
        }
        s2 = 4*arcRadius;
        translate([-s2, -s2/2]) square(s2);
        translate([0,    thickness/2]) square(s2);
        translate([0, -s2-thickness/2]) square(s2);
      }
}