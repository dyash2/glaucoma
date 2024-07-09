import 'package:flutter/material.dart';

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Define the clipping path here
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7839806, size.height * 0.1258206);
    path_0.lineTo(size.width * 0.8325243, size.height * 0.1039387);
    path_0.lineTo(size.width * 0.9077670, size.height * 0.0908096);
    path_0.lineTo(size.width * 0.9587379, size.height * 0.0875274);
    path_0.lineTo(size.width * 0.9951456, size.height * 0.0853392);
    path_0.lineTo(size.width * 1.0364078, size.height * 0.0940919);
    path_0.lineTo(size.width * 1.0533981, size.height * 0.1269147);
    path_0.lineTo(size.width * 1.0728155, size.height * 0.1641138);
    path_0.lineTo(size.width * 1.0825243, size.height * 0.2100656);
    path_0.lineTo(size.width * 1.0825243, size.height * 0.2516411);
    path_0.lineTo(size.width * 1.0412621, size.height * 0.2921225);
    path_0.lineTo(size.width * 0.9733010, size.height * 0.3533917);
    path_0.lineTo(size.width * 0.8713592, size.height * 0.3402626);
    path_0.lineTo(size.width * 0.7742718, size.height * 0.3140044);
    path_0.lineTo(size.width * 0.7208738, size.height * 0.3063457);
    path_0.lineTo(size.width * 0.6553398, size.height * 0.2691466);
    path_0.lineTo(size.width * 0.6359223, size.height * 0.2089716);
    path_0.lineTo(size.width * 0.7354369, size.height * 0.1652079);
    path_0.lineTo(size.width * 0.7645631, size.height * 0.1378556);
    path_0.lineTo(size.width * 0.7839806, size.height * 0.1258206);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Custom clipper to clip the shape
class ShapeClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Define the clipping path here
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3956311, size.height * 0.0525164);
    path_1.lineTo(size.width * 0.4708738, size.height * 0.0328228);
    path_1.lineTo(size.width * 0.6237864, size.height * 0.0295405);
    path_1.lineTo(size.width * 0.7402913, size.height * 0.0284464);
    path_1.lineTo(size.width * 0.8422330, size.height * 0.0284464);
    path_1.lineTo(size.width * 0.9174757, size.height * 0.0339168);
    path_1.lineTo(size.width * 0.9441748, size.height * 0.0557987);
    path_1.lineTo(size.width * 0.9490291, size.height * 0.0809628);
    path_1.lineTo(size.width * 0.9441748, size.height * 0.1039387);
    path_1.lineTo(size.width * 0.9441748, size.height * 0.1247265);
    path_1.lineTo(size.width * 0.9101942, size.height * 0.1444201);
    path_1.lineTo(size.width * 0.8470874, size.height * 0.1706783);
    path_1.lineTo(size.width * 0.7645631, size.height * 0.1925602);
    path_1.lineTo(size.width * 0.7038835, size.height * 0.2100656);
    path_1.lineTo(size.width * 0.6262136, size.height * 0.2166302);
    path_1.lineTo(size.width * 0.4733010, size.height * 0.2056893);
    path_1.lineTo(size.width * 0.3567961, size.height * 0.1903720);
    path_1.lineTo(size.width * 0.2791262, size.height * 0.1608315);
    path_1.lineTo(size.width * 0.2572816, size.height * 0.1115974);
    path_1.lineTo(size.width * 0.3082524, size.height * 0.0820569);
    path_1.lineTo(size.width * 0.3616505, size.height * 0.0656455);
    path_1.lineTo(size.width * 0.3956311, size.height * 0.0525164);
    path_1.close();

    return path_1;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
