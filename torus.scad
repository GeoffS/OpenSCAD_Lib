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