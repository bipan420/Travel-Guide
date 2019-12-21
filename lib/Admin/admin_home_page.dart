// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tourist_guide/add_package_page.dart';
// import 'package:tourist_guide/package_detail_page.dart';


// //This page shows the list of the packages
// List<ClipRRect> items = [
//     // NetworkImage('https://picsum.photos/id/1015/6000/4000'),
//     // NetworkImage('https://picsum.photos/id/1016/3844/2563'),
//     // NetworkImage('https://picsum.photos/id/1011/5472/3648')

//   ];
// class AdminHomePage extends StatefulWidget {
//   @override
//   _AdminHomePageState createState() => _AdminHomePageState();
// }

// class _AdminHomePageState extends State<AdminHomePage> {
//   //List items;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             color: Colors.lightBlue,
//             child: Text(
//               'Packages List',
//               style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Colors.white),
//             ),
//           ),
//           Expanded(child: PackageStream()),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.lightBlue,
//         child: Icon(
//           FontAwesomeIcons.plusCircle,
//           color: Colors.white,
//         ),
//         onPressed: () {
//           //Navigator.push(context,MaterialPageRoute(builder: (context) => TaskScreen()),
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => AddPackagePage(), fullscreenDialog: true),
//           );
//         },
//       ),
//     );
//   }
// }


// class PackageStream extends StatefulWidget {

// static String name;
//    static String image;
//    static String details;
//    static String duration;
//    static String price;


//   @override
//   _PackageStreamState createState() => _PackageStreamState();
// }

// class _PackageStreamState extends State<PackageStream> {

//   ClipRRect roundedImage(String url){
//     return ClipRRect(  
//                       borderRadius:  BorderRadius.circular(20.0),
//                       child: Image.network(
//                         // 'https://picsum.photos/id/1016/3844/2563'
//                         url,
//                         height: 300,
//                         width: 400,
//                         fit: BoxFit.fill,
//                       ),
//                     );
//   }


//   void handlePackageImage(String packageName){
   
//     switch (packageName) {
//       case 'Langtang Trek':
//       items = [];
//           items.add(roundedImage('https://picsum.photos/id/1016/3844/2563'));
//           items.add(roundedImage('https://picsum.photos/id/1015/6000/4000'));
//           items.add(roundedImage('https://picsum.photos/id/1011/5472/3648'));
//         break;
//          case 'Annapurna':
//          items = [];
//           items.add(roundedImage('https://picsum.photos/id/1016/3844/2563'));
//           items.add(roundedImage('https://picsum.photos/id/1015/6000/4000'));
//           items.add(roundedImage('https://picsum.photos/id/1011/5472/3648'));
//         break;

//       default:
//         print('No package');
//     }

    
//   }

// //this is how to get individual data from firebase
// // void printData()async{
// //   final dataRef =  await Firestore.instance.collection('tourPackage').getDocuments();
// // for (var datas in dataRef.documents){
// //   print(datas['name']);
// // }
// // }
  
//   @override
//   Widget build(BuildContext context) {


//     //return RaisedButton(child:Text('Press me'),onPressed: printData,);



//      return StreamBuilder<QuerySnapshot>(
//         stream: Firestore.instance.collection('tourPackage').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             Center(
//               child: Text('The Package field is empty '),
//             );
//           }
//           // final packages = snapshot.data.documents;
//           // List<MyPackage> packagesList = [];
//           // for (var package in packages) {
//           //   final packageName = package.data['name'];
//           //   final packageDetails = package.data['details'];
//           //   final packageImage = package.data['bgImage'];
//           //   final myPackage = MyPackage(
//           //       name: packageName,
//           //       details: packageDetails,
//           //       image: packageImage);
//           //   packagesList.add(myPackage);
//           // }


//           else {
//             return ListView.builder(
//               itemCount: snapshot.data.documents.length,
//               itemBuilder: (context, index){
                
//                 DocumentSnapshot tourPackage = snapshot.data.documents[index];
                
//                 PackageStream.name = tourPackage['name'];
                
//                 PackageStream.image = tourPackage['image'];
//                 PackageStream.details = tourPackage['details'];
//                 PackageStream.duration = tourPackage['duration'];
//                 PackageStream.price = tourPackage['price'];
//                 //return MyPackage(name: name,image: image,details: details,);
//                 return Padding(
      
//       padding: EdgeInsets.only(bottom:20.0,left: 20.0, right: 20.0),
//       child: Column(
        
//         children: <Widget>[
//           // Container(
//           //   decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(30.0),
//           //       color: Colors.lightBlue,
//           //       image: DecorationImage(image: NetworkImage('$image'))),
//           //   child:
//           GestureDetector(
//             onTap: (){
//           //          items.add(PackageStream().roundedImage('https://picsum.photos/id/1016/3844/2563'));
//           // items.add(PackageStream().roundedImage('https://picsum.photos/id/1015/6000/4000'));
//           // items.add(PackageStream().roundedImage('https://picsum.photos/id/1011/5472/3648'));
//           handlePackageImage(tourPackage['name']);
            
//              // print('Image: ${PackageStream().items}');
//               print('Say Hello:  $items');
//               //Here grab the details of the package(eg. name, images,desc) to display in the package_details page
//               Navigator.push(context, MaterialPageRoute(builder: (context) => PackageDetailPage()));
//               //PackageStream().handlePackageImage(PackageStream.name);
              
           

              

//             },
//                       child: Container(
//               height: MediaQuery.of(context).size.width,
//               width: 400.0,
              
//               decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(30.0)),
//               child: Stack(
                
//                 //alignment: Alignment.center,
//                 children: <Widget>[
//                   Container(
//                     // height: 300,
//                     // width: 200,
//                     child: ClipRRect(
                      
//                       borderRadius: new BorderRadius.circular(20.0),
//                       child: Image.network(
//                         '${PackageStream.image}',
//                         height: MediaQuery.of(context).size.width,
//                         width: 400,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   Positioned(
                    
//                     top: 50.0,
//                     left: 10.0,
//                     child: Text(
//                       '${PackageStream.name}',
//                       style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Positioned(
                   
//                     top: 100.0,
//                     right: 10,
//                     left: 20,
//                     child: Text(
//                       '${PackageStream.details}',
//                       style: TextStyle(color: Colors.white, fontSize: 20.0),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 0.8,width: MediaQuery.of(context).size.width,),

//         ],
//       ),
//     );
                
//               },
//             );
//           }

//           // return ListView(
//           //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           //   children: packagesList,
//           // );
//         });
//   }
// }









































import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourist_guide/Inputs/add_user_page.dart';
import 'package:tourist_guide/add_package_page.dart';

var pkgName = '';
var pkgDays = 0;
var pkgImage = '';
var pkgRoute = '';
String pkgPrice = '';

class AdminHomePage extends StatefulWidget {
  static final id = 'AdminHomePage';
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.blueAccent,
            title: Text(' Package List'),
            actions: <Widget>[
              // FlatButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     //child: Text('Cancel',style: TextStyle(color: Colors.pink[200],fontSize: 18),),
              //     child: Icon(
              //       Icons.close,
              //       color: Colors.white,
              //     )),
            ],
          ),
            floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(
          FontAwesomeIcons.plusCircle,
          color: Colors.white,
        ),
        onPressed: () {
          //Navigator.push(context,MaterialPageRoute(builder: (context) => TaskScreen()),
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddPackagePage(), fullscreenDialog: true),
          );
        },
      ),
          body:
              //  ListView.builder(
              //   itemBuilder: (context, index) {
              //     return TileItem(num: index);
              //   },
              // ),

              StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('tourPackage').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot tourPackage =
                        snapshot.data.documents[index];
                    return TileItem(
                      name: tourPackage['name'],
                      image: tourPackage['image'],
                      duration: tourPackage['duration'],
                      price: tourPackage['price'],
                      details: tourPackage['details'],
                      route: tourPackage['route'],
                    );
                  },
                );
              }
            },
          )),
    );
  }
}

class TileItem extends StatelessWidget {
  //final int num;
  final String name;
  final String image;
  final int duration;
  final String price;
  final String details;
  final String route;

  const TileItem(
      {this.name, this.image, this.duration, this.price, this.details,this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'card$name',
                  child: Card(
                    shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
                    child: AspectRatio(
                  aspectRatio: 485.0 / 384.0,
                  child: FittedBox(child: Image.network("$image"),fit: BoxFit.fill,),
                ),),
                ),
                
                Material(
                  child: ListTile(
                    title: Text("$name tour"),
                    subtitle: Text("This is  $name tour "),
                  ),
                )
              ],
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 200));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return new PackageDetail(
                            name: name,
                            details: details,
                            duration: duration,
                            image: image,
                            price: price,
                            route: route,
                          );
                        },
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageDetail extends StatelessWidget {
  final String name;
  final String image;
  final int duration;
  final String price;
  final String details;
  final String route;

  const PackageDetail(
      {this.name, this.image, this.duration, this.price, this.details,this.route});

  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(
      primary: false,
      leading: IconTheme(
          data: IconThemeData(color: Colors.white), child: CloseButton()),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Colors.black.withOpacity(0.4),
            //     Colors.black.withOpacity(0.1),
            //   ],
            // ),
            ),
      ),
      backgroundColor: Colors.transparent,
    );
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
          body:
           Stack(children: <Widget>[

       Column(
           children: <Widget>[
             Hero(
                 tag: 'card$name',
                 child: Card(child: AspectRatio(
                 aspectRatio: 485.0 / 384.0,
                 child: FittedBox(child: Image.network("$image"),fit: BoxFit.fill,),
               ),),
               ),
             Container(
               decoration: BoxDecoration(
           image: DecorationImage(
             image:AssetImage('images/background.jpg'),
             fit: BoxFit.cover,
             colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
           )
         ),
               child: Column(
                 children: <Widget>[
                   Material(
         child: ListTile(
           title: Text("$name Trek",style: TextStyle(fontSize: 20),),
           subtitle: Text("Starting at just Rs $price"),
         ),
                   ),
                 ],
               ),
             ),
             Expanded(
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: SingleChildScrollView(child: Text("$details",style: TextStyle(fontSize: 18),))),
             ),
        //      SafeArea(
        //          child: RaisedButton(
        //            onPressed: () {
        //  pkgName = "$name";
        //  pkgPrice = price;
        //  pkgImage = image;
        //  pkgRoute = route;
        //  pkgDays = duration;
        //  Navigator.push(context,
        //      MaterialPageRoute(builder: (context) => AddUserPage()));
        //            },
        //            color: Colors.blue,
        //            child: Text(
        //  'Choose',
        //  style: TextStyle(color: Colors.white),
        //            ),
        //          ),
        //        )
           ],
       ),
            
            Column(
      children: <Widget>[
        Container(
            height: mediaQuery.padding.top,
        ),
        ConstrainedBox(
            constraints: BoxConstraints(maxHeight: appBar.preferredSize.height),
            child: appBar,
        )
      ],
            ),
        ],
        ),
    );
  }
}

// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AdminHomePage extends StatefulWidget {
//   static final id ='AdminHomePage';
//   @override
//   _AdminHomePageState createState() => _AdminHomePageState();
// }

// class _AdminHomePageState extends State<AdminHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         //backgroundColor: Colors.lightBlue,
//         appBar: AppBar(
//           backgroundColor: Colors.lightBlue,
//           leading: GestureDetector(onTap: (){
//             Navigator.of(context).pop();
//           },
//           child: Icon(Icons.close),),
//         ),
//         body: StreamBuilder(
//           stream: Firestore.instance.collection('tourPackage').snapshots(),
//           builder: (context, snapshot) {
//             if(!snapshot.hasData){
//               return Center(child: Text('The package field is empty'),);
//             }

//             return ListView.builder(
//               itemCount: snapshot.data.documents.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot packageInfo = snapshot.data.documents[index];
//                  return TileItem(num: index, name: packageInfo['name'],image: packageInfo['image'],);
//               },
//             );

//           }
//         ),
//       ),
//     );
//   }
// }

// Color colorFromNum(int num) {
//   var random = Random(num);
//   var r = random.nextInt(256);
//   var g = random.nextInt(256);
//   var b = random.nextInt(256);
//   return Color.fromARGB(255, r, g, b);
// }

// class TileItem extends StatelessWidget {
//   final int num;
//   final String name;
//   final String image;

//   TileItem({this.num,this.name,this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//             tag: "card$num",
//             child: Card(
//               color: Colors.lightBlue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(8.0),
//                 ),
//               ),
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               child: Stack(
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       AspectRatio(
//                         aspectRatio: 485.0 / 384.0,
//                         child: Image.network("$image"),
//                         //child: Image.network("https://picsum.photos/485/384?image=$num"),
//                       ),
//                       Material(
//                         type: MaterialType.transparency,
//                         child: ListTile(
//                           title: Text("$name",style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),),
//                           //subtitle: Text("This is item #$num"),
//                         ),
//                       )
//                     ],
//                   ),
//                   Positioned(
//                     left: 0.0,
//                     top: 0.0,
//                     bottom: 0.0,
//                     right: 0.0,
//                     child: Material(
//                       type: MaterialType.transparency,
//                       child: InkWell(
//                         onTap: () async {
//                           await Future.delayed(Duration(milliseconds: 200));
//                           Navigator.push(
//                             context,
//                             SlowMaterialPageRoute(
//                               builder: (context) {
//                                 return new PackageDetail(num: num,image: image,);
//                               },
//                               fullscreenDialog: true,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//         );
//       }

// }

// class PackageDetail extends StatelessWidget {
//   final int num;
//   final String image;

//   PackageDetail({this.num,this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: "card$num",
//       child: Scaffold(
//         backgroundColor: Colors.lightBlue,
//         appBar: AppBar(
//           backgroundColor: Colors.lightBlue.withOpacity(0.2),
//         ),
//         body: Container(
//           child:
//            //Image.network("https://picsum.photos/485/384?image=$num")
//           Image.network('$image')
//           ,),),

//     );
//   }
// }

// class SlowMaterialPageRoute<T> extends MaterialPageRoute<T> {
//   SlowMaterialPageRoute({
//     WidgetBuilder builder,
//     RouteSettings settings,
//     bool maintainState = true,
//     bool fullscreenDialog = false,
//   }) : super(builder: builder, settings: settings, fullscreenDialog: fullscreenDialog);

//   @override
//   Duration get transitionDuration => const Duration(seconds: 1);
// }


































































