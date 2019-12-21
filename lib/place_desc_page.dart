import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'user_details_page.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tourist_guide/Inputs/user_home_page1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPackageDetailsPage extends StatefulWidget {
  static final id = 'userList';
 
  
  @override
  _UserPackageDetailsPageState createState() => _UserPackageDetailsPageState();
}

class _UserPackageDetailsPageState extends State<UserPackageDetailsPage> {
  bool showSpinner = false;
 @override
  Widget build(BuildContext context) {
    
    if(packageName == 'Langtang Trek'){

    
    return new Scaffold(
      appBar: AppBar(title: Text("Langtang Trek Description"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text("Langtang Trek",style: TextStyle(fontSize: 30),)),
            AspectRatio(
              aspectRatio: 485.0 / 384.0,
              child: FittedBox(child: Image.asset('images/langtang1.jpg'),fit: BoxFit.fill,),),
              Text("The Langtang trek is a trek with real heart. The Langtang Valley is one of the most beautiful places in Nepal and was once the darling of trekkers seeking stunning landscapes and authentic culture along with heartwarming hospitality in delightful homestay guest houses — all within easy reach of Kathmandu.  However, the Langtang Valley is almost devoid of visitors these days as the people of Langtang are continuing to rebuild their lives after the 2015 earthquake. Survivors of the landslides caused by the earthquake were forced to leave the valley, but now they have come back to reclaim their homeland, rebuild their homes and re-establish their farms.  Trekking in this beautiful valley will support the people of Langtang by providing much-needed income to rebuild in a sustainable and secure way. This is not charity; this is the business end of sustainable travel, where your travel choices can respectfully support local people while preserving their dignity, their culture and their way of life. ",textAlign: TextAlign.justify,),
              AspectRatio(
              aspectRatio: 485.0 / 384.0,
              child: FittedBox(child: Image.asset('images/langtang2.jpg'),fit: BoxFit.fill,),),
              Text("Be wowed by nature, be humbled by the human spirit and be a part of local solutions when you choose to trek in Langtang.  The trek starts at the small town of Syabru Besi. You will trek through magnificent forests to the high alpine meadows and yak pastures around Kyangjin Gompa (a Buddhist monastery). After an (optional) day hike up to the top of Kyangjin Ri (peak), where the 360-degree views of the Himalayan mountains are truly spectacular, you retrace your route back down the valley and drive back to Kathmandu.",textAlign:TextAlign.justify)

          ],),
        ),
      )
    );
  }
  else {
    return new Scaffold(
      appBar: AppBar(title: Text("Annapurna Trek Description"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text("Annapurna Trek",style: TextStyle(fontSize: 30),)),
            AspectRatio(
              aspectRatio: 485.0 / 384.0,
              child: FittedBox(child: Image.asset('images/annapurna1.jpg'),fit: BoxFit.fill,),),
              Text("The Annapurna Circuit is a trek within the mountain ranges of central Nepal.[1] The total length of the route varies between 160–230 km (100-145 mi), depending on where motor transportation is used and where the trek is ended. This trek crosses two different river valleys and encircles the Annapurna Massif. The path reaches its highest point at Thorung La pass (5416m/17769 ft), touching the edge of the Tibetan plateau. Practically all trekkers hike the route anticlockwise, as this way the daily altitude gain is slower, and crossing the high Thorong La pass is easier and safer.[2] The mountain scenery, seen at close quarters includes the Annapurna Massif (Annapurna I-IV), Dhaulagiri, Machhapuchhre, Manaslu, Gangapurna, Tilicho Peak, Pisang Peak, and Paungda Danda. ",textAlign: TextAlign.justify,),
              AspectRatio(
              aspectRatio: 485.0 / 384.0,
              child: FittedBox(child: Image.asset('images/annapurna2.jpg'),fit: BoxFit.fill,),),
              Text("Numerous other peaks of 6000-8000m in elevation rise from the Annapurna range. The trek begins at Besisahar or Bhulbhule in the Marshyangdi river valley and concludes in the Kali Gandaki Gorge. Besisahar can be reached after a seven-hour drive from Kathmandu. The trail passes along paddy fields and into subtropical forests, several waterfalls and gigantic cliffs, and various villages",textAlign:TextAlign.justify)

          ],),
        ),
      )
    );
  }


  }

}

