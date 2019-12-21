import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'user_details_page.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:tourist_guide/Inputs/user_home_page1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceSchedule extends StatefulWidget {
  static final id = 'userList';
 
  
  @override
  _PlaceScheduleState createState() => _PlaceScheduleState();
}

class _PlaceScheduleState extends State<PlaceSchedule> {
  bool showSpinner = false;
 @override
  Widget build(BuildContext context) {
    
    if(packageName == 'Langtang Trek'){

    
    return new Scaffold(
      appBar: AppBar(title: Text("Schedule"),),
      body: new ListView.builder(
        itemCount: tourPackage.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 10,
            child: new ExpansionTile(
              
              leading: CircleAvatar(
                  
                  child:
                    Column(children: <Widget>[
                      Text("Day",style: TextStyle(color: Colors.white, fontSize: 16),),
                      Text("${i+1}",style: TextStyle(color: Colors.white, fontSize: 16),)
                    ],)
              //      Text(
              //   'Day ${i + 1}',
              //   style: TextStyle(color: Colors.white, fontSize: 20),
              
              ),
              //trailing: CircleAvatar(child: Icon(Icons.arrow_downward),),
              title: new Text(
                tourPackage[i].title,
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.italic
                    ),
              ),
              children: <Widget>[
                new Column(
                  children: _buildExpandableContent(tourPackage[i]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  else {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: tourPackage1.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 10,
            child: new ExpansionTile(
              leading: CircleAvatar(
                  
                  child:
                    Column(children: <Widget>[
                      Text("Day",style: TextStyle(color: Colors.white, fontSize: 16),),
                      Text("${i+1}",style: TextStyle(color: Colors.white, fontSize: 16),)
                    ],)
              //      Text(
              //   'Day ${i + 1}',
              //   style: TextStyle(color: Colors.white, fontSize: 20),
              
              ),
              //trailing: CircleAvatar(child: Icon(Icons.arrow_downward),),
              title: new Text(
                tourPackage1[i].title,
                style: new TextStyle(
                    fontSize: 15.0,
                    //fontWeight: FontWeight.bold,
                    ),
              ),
              children: <Widget>[
                new Column(
                  children: _buildExpandableContent(tourPackage1[i]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  }

  _buildExpandableContent(TourPackage tourPackage) {
    List<Widget> columnContent = [];

    for (String content in tourPackage.contents)
      columnContent.add(
        new ListTile(
          title: new Text(
            content,
            style: new TextStyle(fontSize: 18.0),
          ),
          leading: new Icon(tourPackage.icon),
        ),
      );

    return columnContent;
  }
}

class TourPackage {
  final String title;
  List<String> contents = [];
  final IconData icon;

  TourPackage(this.title, this.contents, this.icon);
}

List<TourPackage> tourPackage = [
  new TourPackage(
    'Arrived in Kathmandu',
    [
      'This day, you will be taken to the day-long Exploration tour around Kathmandu Valley. Visits include shrines at Pashupatinath, Swayambhunath (also known as Monkey Temple) and Boudhanath and Durbar Squares of Basantapur and other two nearby amazing cities of Patan and Bhaktapur. Most of the sites you will be visiting on the second day are enlisted in the UNESCO world heritage list. You will return to the hotel back in the evening and you will meet your trekking staff for Langtang valley trekking'
    ],
    
    //FontAwesomeIcons.handPointRight,
    Icons.arrow_forward

  ),
  new TourPackage(
    'Explore Kathmandu city/UNESCO World heritage site, Half day',
    ['This day, you will be taken to the day-long Exploration tour around Kathmandu Valley. Visits include shrines at Pashupatinath, Swayambhunath (also known as Monkey Temple) and Boudhanath and Durbar Squares of Basantapur and other two nearby amazing cities of Patan and Bhaktapur. Most of the sites you will be visiting on the second day are enlisted in the UNESCO world heritage list. You will return to the hotel back in the evening and you will meet your trekking staff for Langtang valley trekking'],
    Icons.directions_car,
  ),

  TourPackage('Drive Kathmandu to Syabrubesi 7-8 hours walk',
  ['SyabruBesi is the initial point for trekking in Langtang valley. It takes about 7 to 8 hours’ drive to cover 117 km from Kathmandu to SyabruBesi. En route, we can enjoy the scenic views of the mountain and rice terrains. SyabruBesi bazaar is cramped with lodges and hotels. We will reside for a night in any one of them.'],
  Icons.bubble_chart),

  TourPackage('Drive Kathmandu to Syabrubesi 7-8 hours walk',
  ['SyabruBesi is the initial point for trekking in Langtang valley. It takes about 7 to 8 hours’ drive to cover 117 km from Kathmandu to SyabruBesi. En route, we can enjoy the scenic views of the mountain and rice terrains. SyabruBesi bazaar is cramped with lodges and hotels. We will reside for a night in any one of them.'],
  Icons.bubble_chart),

  TourPackage('Trek Syabrubesi to Lama Hotel, 6 hours walk, 2480m',
  ['We will depart from the main road and lower down to a camping area via the route opposite to the Hotel Village View. The trail further prolongs through the suspension bridge over Bhote Koshi and ascends to Thulo Syabru before crossing a bridge over Langtang Khola. Later the trail leads to set of six lodges at Changthang which goes by the name of Lama Hotel where we will stay overnight.'],
  Icons.bubble_chart),

  TourPackage('Trek Lama Hotel to Langtang valley 6 hours walk, 3420m',
  ['A short ascent up the hill will take us to the trail that opens up in Langtang valley. The valley offers the breathtaking scenery of Langtang Lirung. Later we will pass through a forest to reach the meadow where yak and the wild goats can be seen grazing. We will stay in beautiful Langtang valley overnight'],
  Icons.bubble_chart),

  TourPackage('Trek Langtang valley to Kyanjin Gompa 3880 m, 3 hours walk',
  ['Leaving the Langtang Valley, we will clamber uphill all the way to Sindum and Yamphu. Later the route takes us through Laja Khola to arrive at a viewpoint which provides the panoramic views of Kyanjin Gompa and icefall from Lirung and Kinshung. Below to the viewpoint exists Kyanjin Gompa where we will stay overnight.'],
  Icons.bubble_chart),

  TourPackage('Explore a Kyanjin Gompa/or Tserko Re Hiking around',
  ['On the 7th day, we will take a well-deserved rest from trekking and ease up our stiff muscles. Kyanjin Gompa offers splendid views of Langtang Lirung, Genjempol and Kenga Himal ranges. The cheese factory, Buddhist monastery and Tsergo Ri (5033m) are other sites which you would like visiting. Mostly we recommended for Tsergo Ri Hike, which provides you with a stunning view of mountains and when you be on the top of Tsergo Ri Unbelievable mountains will surround you.'],
  Icons.bubble_chart),

  TourPackage('Trek Kyanjin Gompa to Lama Hotel 6 hours walk',
  ['After having your breakfast you start to get down, this is a day to back Lama Hotel with view of Langtang valley and different escape of mountains'],
  Icons.bubble_chart),

  TourPackage('Trek Lama Hotel to Syabrubesi 5 hours of walking',
  ['This is a day to end your walking in Himalaya wilderness after arrived in Syabrubesi our trekking starting point after 5 hours walk.'],
  Icons.bubble_chart),

  TourPackage('Drive back Syabrubesi to Kathmandu',
  ['Seven hours of driving through the serpentine road enjoying the pleasant views of Majestic Mountain, cascading waterfalls, paddy fields and woods will take us to Kathmandu. We will be conveyed back to our hotel where we will enjoy the evening dinner and head towards our comforting beds.'],
  Icons.bubble_chart),

];


List<TourPackage> tourPackage1 = [
  new TourPackage(
    'Arrival in Kathmandu-Transfer to Hotel',
    [
 'Welcome assistance by Snowy representative at the Tribhuvan International Airport and transfer to hotel in Kathmandu. Rest at the hotel and briefing about the trip. Overnight accommodation is set with BB Plan.'
    ],
    Icons.arrow_forward_ios,
  ),
  new TourPackage(
    'Rest, sightseeing, preparation, assignment and briefing',
    ['Snowy horizon organizes a half day city tour in and around Kathmandu Valley to make you live touch with the monuments, temples and monasteries such as durbar square, Pashupatinath, Bouddhanath or Swoyambhunath etc. and provide you leisure time for rest and preparation for next trip to Annapurna Circuit Trek and evening briefing at your hotel or at the office. Your overnight accommodation is set in BB Plan at same Hotel.'],
    Icons.arrow_forward_ios,
  ),
  new TourPackage(
    'Drive to Bhulbhule via Dumre and Besisahar ',
    [
 'The day begins with drive to Besisahar - Bhulbhule about 5-6 hrs from Kathmandu along to the Prithwi highway. We divert off the highway at the bustling town of Dumre and continue for a further one and half hours to Besisahar. After lunch we complete the short drive to the road head at Bhulbhule (846 meters) in the Marysandi Valley, overnight at lodge/teahouse with dinner.'  ],
    Icons.arrow_forward_ios,
  ),
  new TourPackage(
    'Commence trek Bhulbhule to Shange (1136m)',
    [
      'Commence trek   to Shange  begins after having breakfast and the walk about  5-6 hrs as an easy start and then a taste of things to come - the climb up to Bahun Danda, a picturesque village at the top of this formidable ridge. Then it\'s down, across terraces and over small streams, before rejoining the Marsyangdi and following it upstream for several km to our overnight camp with teahouse/lodge in full board near the village of Shange.'
   ],
    Icons.arrow_forward_ios,
  ),
  new TourPackage(
    'Trek from Shange to Tal (1710m)',
    [
 'A wonderful walk with such changes in scenery and a range of gradients is begins today. From Tal we head across the river and ascend steeply to finally reach the ridge top high above. We cross another suspension bridge before a continued ascent up a narrow and beautiful valley where, after rain, many spectacular waterfalls will flow. Just before camp at Tal the first village in Manang, we come over a small rise and enter a wide, flat valley with a long, silvery waterfall to the right.' ],
    Icons.arrow_forward_ios,
  ),
   new TourPackage(
    'Terk from Tal to Bagarchhap (2160m)',
    [
      'We make a trail verse crossing a wide, flat valley. The trail then climbs a stone stairway to 1860m till another stairway. The journey continues making up and down to Dharapani at 1890m. There we find a stone entrance Chorten typical of the Tibetan influenced villages from here northwards. We then visit the Bagarchhap at 2160m that offers the typical flat roofed stone houses of local Tibetans design although the village which is still in the transition zone before the dry highlands.'
  ],
    Icons.arrow_forward_ios,
  ),


  new TourPackage(
    'Bagarchhap to Chame (2630m)',
    [
      'With often rough and rocky, the trail climbs to Tyanja at 2360m, and then continues through forest, but near the river, to Kopar at 2590m. As we reach the Chame, the headquarters of the Manang district, we are rewarded by the fine views of Annapurna II as you approach Chame and two small hot springs by the town.'
    ],
    Icons.arrow_forward_ios,
  ),

   new TourPackage(
    'Trek from Chame to Pisang (3300m)',
    [
      'The day starts through deep forest in a steep and narrow valley, crosses a river on a long bridge at 2910m. We then cross another bridge at 3040m, from there the view of the soaring Paungda Danda rock face really begins to appear. From there the trail joins to climb to Pisang, which sprawls between 3200m and 3300m.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Pisang to Manang (3500m)',
    [
      'Today we continue through the drier upper part of the Manang district, cut off from the full effect of the monsoon by the Annapurna Range. People of this region, herd yaks and raise crops for part of the year besides, they also continue to enjoy special trading rights gained way back in 1784. Leaving Pisang, we have an alternate trails north and south of the Marsyangdi River which meet up again at Mungji. The southern route by Hongde, with its airstrip, at 3325m involves less climbing than the northern route via Ghyaru, though there are better views on the trail that follows the northern bank of the river. From Mungji, the trail continues past the picturesque but partially hidden village of Bryanga at 3475m to nearby Manang at 3500m'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Acclimatization day at Manang',
    [
      'Today we spend a day acclimatizing in Manang. The whole day we spend by doing some fine day walks and over viewing the magnificent views around the village and the day time is best to gain altitude. At the end of the day, we return back to our accommodation and have a night rest.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Manang to Ledar (4250m)',
    [
      'Today we leave Manang, and the trail makes an ascent of nearly 2000m to the Thorong La pass. We make the climb steadily through Tenki, leaving the Marshyangdi Valley. Continuing along the Jarsang Khola Valley, we reach Ledar at 4250m, there we see the vegetations steadily more sparse.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Ledar to Phedi or High camp (4600m)',
    [
      'The trail descends to cross the river at 4310m we then climb up to Phedi at 4420m. At High Camp on the elevation of 4600m, we can recently found some good Guesthouses built. Your overnight stay will be there.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Phedi or High Camp to Muktinath (3710m)',
    [
      'The journey from Phedi “foot of the hill” or at the foot to the 5416m Thorong La pass, begins the day. We then make the climb steeply that is regularly used and easy to follow. However, the problem may arise due to the altitude and snow. It often causes terrible problem to cross the pass if it is covered by snow. About four hours climb up to the pass marked by the Chortens and prayer flags. As you reach the top, you are rewarded by the magnificent view from the top.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Muktinath to Tukuche (2600m)',
    [
      'Tukuche is also nice settlements of more than 100 houses of Thakali people. It has also 2 monasteries, and one apple brandy factory. If you are interested to see how apple brandy is produced, you will be taken there.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Tukuche to Ghasa (2100m)',
    [
      'From Tukuche the trek begins today downward walk along the Kaligandaki river beach with a trail of motor able road or if tired on self payment basis you can ride a bus or jeep up to Ghasa where your overnight accommodation is set. '
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Ghasa to Tatopani (1200m)',
    [
      'From Ghasa the trek begins today downward walk along the Kaligandaki river beach with a trail of motor able road or if tired on self payment basis you can ride a bus or jeep up to Tatopani where your overnight accommodation is set.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Tatopani to Ghorepani (2850)',
    [
      'Today is a bit hard day for trek up to Ghorepani with about 50-60 degree slope up via Ghara, Shikha and Chitre the Braman and Magar Indigenous habitant. Lunch on the way and overnight at teahouse/lodge at Ghorepani is set.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Explore Poonhill and Trek to Tikhedhunga (1495m)',
    [
      'Early morning trip to Poonhill (3232m.) to enjoy the sunrise view over Mt. Dhaulagiri , Tukuche Peak Nilgiri, Varaha Shikhar , Mt. Annapurna I , Lamjung Himal and other numerous snowcapped mountain peaks of Annapurna and Dhaulagiri ranges. After breakfast trek to Tikhedhunga with 4-5hours walking where the overnight accommodation with dinner is scheduled.'
        ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Trek from Tikhedhunga to Nayapul and Drive to Pokhara',
    [
      'This morning the trek starts after having breakfast in Tikhedhunga toward Nayapul about 4 hours with lunch on the way from where you are taken to Pokhara by private vehicle driving and keep you in Hotel as per agreed category with BB Plan.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Tourist Bus Journey from Pokhara to Kathmandu',
    [
      'After having breakfast your trip starts by drive back from Pokhara to Katmandu by tourist Coach about 6 hours driving and overnight is arranged in Kathmandu as per agreed category with BB Plan.'
    ],
    Icons.arrow_forward_ios,
  ),

  new TourPackage(
    'Kathmandu to Your Port of Destination',
    [
      'With the farewell gift like pashmina or Snowy Horizon T-Shirt, our representative will drop you to the International Airport (TIA) to assist you for your final departure to your home or alternatively the next destination.'
    ],
    Icons.arrow_forward_ios,
  ),




];
