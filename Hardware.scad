// Copyright 2025 - Geoff SObering - All Rights Reserved
// Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3

// Metric FH counter-sink helpers:
module metricCounterSink(dia, depth)
{
  zeroDepth = dia/2;
  translate([0,0,depth/2+zeroDepth-5]) cylinder(d1=10, d2=0, h=5);
}
module metricCounterSink1(dia, depth)
{
  zeroDepth = dia/2;
  translate([0,0,depth+zeroDepth-5]) cylinder(d1=10, d2=0, h=5);
}

module nutRecess(d, h)
{
  cylinder(r=d/2, h=h, $fn=6);
}

UNC6_holeDia = 4.0;
UNC6_nutRecessDia = 9.5;
UNC6_PanHeadHeadRecessDia = 8;

//UNC8_holeDia = 5.2; // 8-23 Machine screw in Nylon (Taulman 230)
UNC8_holeDia = 4.4; // 8-23 Machine screw in PLA (MP Mini)
//UNC8_nutRecessDia = 10.7; // 8-32 nut press-fit
UNC8_nutRecessDia = 10.4; //10.7; // 8-32 nut medium fit in PLA (MP Mini)
UNC8_nutRecessDepth=9; // 8-32 nyloc nut
UNC8_BoltDistanceThruNut = 5.8 + 1.7; // full-height nut + extra sticking out
UNC8_PanHeadHeadRecessDia = 8.6;
UNC8_PanHeadHeadRecessDepth = 6;
module UNC8_nutRecess(h=UNC8_nutRecessDepth)
{
  cylinder(r=UNC8_nutRecessDia/2, h=h, $fn=6);
}

UNC10_holeDia = 5.7; // 10-24 Machine screw
UNC10_nutRecessDia = 10.72 * 1.1; // 10-24 nut press-fit
UNC10_nutRecessDepth=6.2; // 10-24 nyloc nut
UNC10_BoltDistanceThruNut = 6.2 + 1.7; // full-height nut + extra sticking out
UNC10_PanHeadRecessDia = 9.8;
UNC10_PanHeadRecessDepth = 3.7;
module UNC10_nutRecess(h=UNC8_nutRecessDepth)
{
  cylinder(r=UNC10_nutRecessDia/2, h=h, $fn=6);
}

Qurtr20_NutDia = 12.8;
Qurtr20_NutRecess = 5.8;
Qurtr20_holeDia = 6.7;
Qurtr20_PhillipsHeadDia = 13;
Qurtr20_PhillipsHeadRecess = 4.7;

M2_holeDia = 2.4;
M2_nutRecessDia = 4.9;
M2_nutRecessDepth = 2.0;
M2_nutThickness = 1.5;
//M2_socketHeadRecesssDia = 5.7;
//M2_socketHeadRecessDepth = 3.6;
M2_buttonHeadRecessDia = 3.7;
module M2_nutRecess(h=M2_nutRecessDepth)
{
  cylinder(r=M2_nutRecessDia/2, h=h, $fn=6);
}

M2R5_holeDia = 3;

M3_holeDia = 3.4; // m3 machine screw
M3_nutRecessDia = 6.6;
M3_nutRecessDepth = 2.4;
M3_nutThickness = 2.4;
M3_squareNutSide = 5.7;
M3_squareNutRecessDepth = 2.4;
M3_FHcounterboreDepth = 1.4;
M3_socketHeadRecesssDia = 5.7;
M3_socketHeadRecessDepth = 3.6;
module M3_nutRecess(h=M3_nutRecessDepth)
{
  cylinder(r=M3_nutRecessDia/2, h=h, $fn=6);
}

M4_holeDia = 4.6; // m4 machine screw
M4_nutRecessDia = 8.6;
M4_nutRecessDepth = 6.5;
module M4_nutRecess(h=M4_nutRecessDepth)
{
  cylinder(r=M4_nutRecessDia/2, h=h, $fn=6);
}

M5_holeDia = 5.6; // m5 machine screw
M5_nutRecessDia = 9.75;
M5_nutRecessDepth = 7.5;
module M5_nutRecess(h=M5_nutRecessDepth)
{
  cylinder(r=M5_nutRecessDia/2, h=h, $fn=6);
}

M6_holeDia = 6.5; // m6 machine screw
M6_nutRecessDia = 12.2;
M6_PanHeadRecessDia = 12.8;
M6_PanHeadRecessDepth = 5;
M6_nutRecessDepth = 7;
module M6_nutRecess(h=M4_nutRecessDepth)
{
  cylinder(r=M6_nutRecessDia/2, h=h, $fn=6);
}
