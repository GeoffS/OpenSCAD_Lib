// Copyright 2025 - Geoff SObering - All Rights Reserved
// Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3

include <torus.scad>

nothing = 0.01;

module simpleChamferedCylinder(d, h, cz, flip=true)
{
  echo("simpleChamferedCylinder... flip=", flip);
  if(flip) translate([0,0,h]) mirror([0,0,1])simpleChamferedCylinderCore(d=d, h=h, cz=cz);
  else simpleChamferedCylinderCore(d=d, h=h, cz=cz);
}

module simpleChamferedCylinderCore(d = d, h = h, cz = cz)
{
  h1 = h - cz;
  cylinder(d=d, h=h1+nothing);
  translate([0,0,h1]) cylinder(d1=d, d2=d-2*cz, h=cz);
}

module simpleChamferedCylinderDoubleEnded(d, h, cz)
{
  h1 = h/2;
  translate([0,0,h1])
    double(0, 0)
      translate([0,0,-nothing]) simpleChamferedCylinderCore(d=d, h=h1+nothing, cz=cz);
}

module radiusedChamferedCylinderDoubleEnded(d, h, r=-1, cz)
{
  h1 = h/2 + nothing;
  translate([0,0,h1])
    double(0, 1)
      translate([0,0,-nothing]) radiusedChamferedCylinder(d=d, h=h1, r=r, cz=cz);
}

module radiusedChamferedCylinder(d, h, r=-1, cz)
{
  if(r>0) radiusedChamferedCylinderFullParams(d, h, r, cz);
  else if(r==0) simpleChamferedCylinder(d, h, cz);
  else radiusedChamferedCylinderBasic(d, h, cz);
}

module radiusedChamferedCylinderFullParams(d, h, r, cz)
{
  echo("radiusedChamferedCylinderFullParams:");
  h1 = h - cz;

  dz1 = tan(22.5) * r;
  z1 = h1 - dz1;
  dz2 = cos(45) * r;
  z2 = z1 + dz2;

  echo(str("dz1 = ", dz1));
  echo(str("dz2 = ", dz2));

  dz2a = dz2 - dz1;
  echo(str("dz2a = ", dz2a));

  f2 = 1-cz/(d/2);
  echo(str("f2 = ", f2));
  d2 = d * f2;
  echo(str("d2 = ", d2));

  f1 = 1-dz2a/(d/2);
  echo(str("f1 = ", f1));
  d1 = d * f1;
  echo(str("d1 = ", d1));

  cylinder(d=d, h=z1+nothing);
  translate([0,0,z2]) cylinder(d1=d1, d2=d2, h=cz-dz2a);
  if(r>0) difference()
  {
    hull() translate([0,0,z1]) torus3(d, 2*r);

    dclip = d*1.3;
    tcy([0,0,z1-200], d=dclip, h=200);
    tcy([0,0,h], d=dclip, h=200);
  }
}