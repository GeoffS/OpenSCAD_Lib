// Copyright 2025 - Geoff SObering - All Rights Reserved
// Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3

module torus2a(radius, translation)
{
  echo("2a radius, translation", radius, translation);
  rotate_extrude(convexity = 4)
    translate([translation, 0, 0]) circle(r = radius);
}