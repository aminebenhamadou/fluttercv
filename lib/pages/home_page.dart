import 'package:cv/pages/detail_page.dart';
import 'package:cv/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cv/misc/colors.dart';
import 'package:provider/provider.dart';
import 'package:cv/AppState.dart';
import 'package:cv/localization.dart';
import 'package:cv/widgets/app_large_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'Map.dart';
import 'ProfileFourPage.dart';

class HomePage extends StatefulWidget {
int value=0;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  void onTap(int index) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return pages.elementAt(index);
    }));
  }

  List pages = [
    drawer(),
    WelcomePage(),
    WelcomePage(),
  ];

  var images = {
    "p1.png": "mm",
    "p2.png": "mm",
    "p3.png": "mm",
    "p4.png": "mm",
    "p6.png": "mm",


  };
  var imagess = {
    "1.png": "mm",
    "2.png": "mm",
    "3.png": "mm",
    "4.jpg": "mm",
    "5.png": "mm",
    "6.png": "mm",
    "7.png": "mm",


  };
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type:BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF17203A),
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.grey.withOpacity(0.5),
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items:[
            BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label:"Bar",icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label:"My",icon: Icon(Icons.arrow_back_ios_new)),
          ]
      ),
      //backgroundColor: Color.fromRGBO(234, 238, 246, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: AppLocalization(lang: appState.lang).translation("20"),),
          ),
          SizedBox(
            height: 20,
          ),
          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(text:AppLocalization(lang: appState.lang).translation("21"),),
                    Tab(text: "Education"),
                    Tab(text: AppLocalization(lang: appState.lang).translation("17"),),
                  ]),
            ),
          ),
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return DetailPage(value: index);
                        }));
                        // MaterialPageRoute(builder: (context) => const HomePage());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, left: 40, top: 10),
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage(
                                    "img/" + images.keys.elementAt(index)),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                ),


                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                   color: Color.fromRGBO(234, 238, 246, 1),
                  child:SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildExperienceRow(
                          company: AppLocalization(lang: appState.lang).translation("22"),
                          position: AppLocalization(lang: appState.lang).translation("23"),
                          duration: "2023-2024"),
                      _buildExperienceRow(
                          company: AppLocalization(lang: appState.lang).translation("24"),
                          position: AppLocalization(lang: appState.lang).translation("25"),
                          duration: " 2019-2022"),
                      _buildExperienceRow(
                          company: AppLocalization(lang: appState.lang).translation("26"),
                          position: "Lycée Ibn Rachik Sfax",
                          duration: "2015 - 2019"),

                    ],
                  ),),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  color: Color.fromRGBO(234, 238, 246, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildExperienceRow(
                          company: AppLocalization(lang: appState.lang).translation("27"),
                          position: "Sifast",
                          duration: AppLocalization(lang: appState.lang).translation("28"),),
                      _buildExperienceRow(
                          company: AppLocalization(lang: appState.lang).translation("29"),
                          position: "Clinisys",
                          duration:  AppLocalization(lang: appState.lang).translation("30"),),
                      _buildExperienceRow(
                          company: AppLocalization(lang: appState.lang).translation("31"),
                          position: "Clinisys",
                          duration: AppLocalization(lang: appState.lang).translation("32"),),

                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text:  AppLocalization(lang: appState.lang).translation("8"),
                  size: 22,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(

            height: 90,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "img/" + imagess.keys.elementAt(index)),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
      drawer: drawer(),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 16.0),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            )),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 5,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        const SizedBox(width: 16.0),
      ],
    );
  }

  ListTile _buildExperienceRow(
      {required String company, String? position, String? duration}) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          FontAwesomeIcons.solidCircle,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }
}



class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

class drawer extends StatelessWidget {
  drawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/amine.png"),
                fit: BoxFit.fitHeight,

              ),
            ),
            child: Text('', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(AppLocalization(lang: appState.lang).translation("15"),style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return WelcomePage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box, color: Colors.white),
            title: Text(AppLocalization(lang: appState.lang).translation("16"), style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ProfileFourPage();
                  },
                ),
              );
            },

          ),
          ListTile(
            leading: Icon(Icons.work, color: Colors.white),
            title: Text(AppLocalization(lang: appState.lang).translation("17"), style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomePage();
                  },
                ),
              );
            },

          ),
          ListTile(
            leading: Icon(Icons.map, color: Colors.white),
            title: Text(AppLocalization(lang: appState.lang).translation("18"), style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MapPage();
                  },
                ),
              );
            },

          ),
        ],
      ),

    );
  }
}