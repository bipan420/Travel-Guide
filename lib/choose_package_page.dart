import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/Inputs/add_user_page.dart';

var pkgName = '';
var pkgDays = 0;
var pkgImage = '';
var pkgRoute = '';
String pkgPrice = '';

class ChoosePackage extends StatefulWidget {
  static final id = 'choosePackage';
  @override
  _ChoosePackageState createState() => _ChoosePackageState();
}

class _ChoosePackageState extends State<ChoosePackage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.blueAccent,
            title: Text('Choose Package'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  //child: Text('Cancel',style: TextStyle(color: Colors.pink[200],fontSize: 18),),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ],
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
             SafeArea(
                 child: RaisedButton(
                   onPressed: () {
         pkgName = "$name";
         pkgPrice = price;
         pkgImage = image;
         pkgRoute = route;
         pkgDays = duration;
         Navigator.push(context,
             MaterialPageRoute(builder: (context) => AddUserPage()));
                   },
                   color: Colors.blue,
                   child: Text(
         'Choose',
         style: TextStyle(color: Colors.white),
                   ),
                 ),
               )
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

// class ChoosePackage extends StatefulWidget {
//   static final id ='choosePackage';
//   @override
//   _ChoosePackageState createState() => _ChoosePackageState();
// }

// class _ChoosePackageState extends State<ChoosePackage> {
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
