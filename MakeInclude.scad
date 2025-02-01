// Copyright 2025 - Geoff SObering - All Rights Reserved
// Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3

build_fa = 10;
build_fs = 0.5;
build_angle = 0;
buildRotX = 0;
build_90 = 0;
build_180 = 0;
developmentRender = true;

$fa = build_fa;
$fs = build_fs;

echo(str("$fa = ", $fa));
echo(str("$fs = ", $fs));

nothing = 0.01;

mm_per_inch = 25.4;

// Backwards compatibility...
module tc(t, c) { tcu(t, c); }

module tcu(t, c)
{
  translate(t) cube(c);
}

module tcy(t, d, h)
{
  translate(t) cylinder(d=d, h=h);
}

module tsp(t, d)
{
  translate(t) sphere(d=d);
}

module roundedCornerCube(dim, dia)
{
  r = dia/2;
  x = dim.x - r;
  y = dim.y - r;
  z = dim.z;
  tcy([r, r, 0], d=dia, h=z);
  tcy([r, y, 0], d=dia, h=z);
  tcy([x, r, 0], d=dia, h=z);
  tcy([x, y, 0], d=dia, h=z);

  tcu([0, r, 0], [dim.x,     dim.y-dia, dim.z]);
  tcu([r, 0, 0], [dim.x-dia, dim.y,     dim.z]);
}

module pill(t=[0,0,0], d, h)
{
  translate(t) hull() doubleZ() tsp([0,0,(h-d)/2], d=d);
}

module expand(doMinkowski, minkowskiDia)
{
  if(doMinkowski)
  {
    minkowski()
    {
      children();
      sphere(d=minkowskiDia);
    }
  }
  else
  {
    children();
  }
}

module expand1(doMinkowski)
{
  if(doMinkowski)
  {
    minkowski()
    {
      children(0);
      children(1);
    }
  }
  else
  {
    children(0);
  }
}

module hullc(doHull)
{
  if(doHull)
  {
    hull()
    {
      children();
    }
  }
  else
  {
    children();
  }
}

module mirrorDouble(v)
{
  children();
  mirror(v) children();
}

module doubleX() { mirrorDouble([1,0,0]) children(); }
module doubleY() { mirrorDouble([0,1,0]) children(); }
module doubleZ() { mirrorDouble([0,0,1]) children(); }

module double(c0=0, c1=0)
{
  children(c0);
  mirror([0,0,1]) children(c0);
}

module ghost()
{
  difference(){ %children(); clip(); }
}

module display()
{
  difference()
    {
        children();
        clip();
    }
}

module displayGhost()
{
  %difference()
  {
      children();
      ghostClip();
  }
}

module ghostClip()
{
  clip(nothing);
}
