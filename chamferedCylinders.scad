// Copyright 2025 - Geoff SObering - All Rights Reserved
// Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3

module simpleChamferedCylinder(d, h, cz)
{
  echo("simpleChamferedCylinder...");
  h1 = h - cz;
  cylinder(d=d, h=h1+nothing);
  translate([0,0,h1]) cylinder(d1=d, d2=d-2*cz, h=cz);
}

module simpleChamferedCylinderDoubleEnded(d, h, cz)
{
  h1 = h/2;
  translate([0,0,h1])
    double(0, 0)
      translate([0,0,-nothing]) simpleChamferedCylinder(d=d, h=h1+nothing, cz=cz);
}