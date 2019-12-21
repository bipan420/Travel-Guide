// import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'Admin/admin_home_page.dart';

// class PackageDetailPage extends StatefulWidget {
//   @override
//   _PackageDetailPageState createState() => _PackageDetailPageState();
// }

// class _PackageDetailPageState extends State<PackageDetailPage> {
//   String pacakgeDetail = PackageStream.details;
//   String packageName = PackageStream.name;
//   String packageDuration = PackageStream.duration;
//   String packagePrice = PackageStream.price;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Package Details'),),
//       body:  Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: <Widget>[
//             Container(
//               child: Text('$packageName',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
//             ),
//             Container(
//                 height: 300,
//                 width: 400.0,
//                 //decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(30.0)),
//                 child: Carousel(
//                   //boxFit: BoxFit.cover,
//                   autoplay: true,
//                   animationCurve: Curves.easeInCirc,
//                   animationDuration: Duration(milliseconds: 1000),
//                   dotSize: 4.0,
//                   dotIncreasedColor: Colors.blueAccent,
//                   dotBgColor: Colors.transparent,
//                   dotPosition: DotPosition.bottomCenter,
//                   dotVerticalPadding: 10.0,
//                   showIndicator: true,
//                   indicatorBgPadding: 7.0,
//                   images: items,
//                 ),
//               ),

              
//               Divider(height: 1.0, color: Colors.blueAccent),
//               SizedBox(height: 10,),

//               Container(child: Text('Details:$pacakgeDetail'),),

//               Divider(height: 1.0, color: Colors.blueAccent),
//               SizedBox(height: 8,),

//               Container(child: Row(children: <Widget>[
//                 Text('Duration of trip'),
//                 Text('$packageDuration'),
//               ],),),

//               Container(child: Row(children: <Widget>[
//                 Text('Price:'),
//                 Text('$packagePrice')
//               ],),)

//           ],
//         ),
//       ),
//     );
//   }
// }
