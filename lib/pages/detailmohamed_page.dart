
import 'package:cv/pages/homemohamed.dart';
import 'package:cv/pages/welcome_page.dart';
import 'package:flutter/material.dart';

import 'package:cv/widgets/app_text.dart';

import 'package:provider/provider.dart';
import 'package:cv/AppState.dart';
import 'package:cv/localization.dart';
import "Mapmohamed.dart";
import "ProfilemohamedPage.dart";
class DetailPageState extends StatefulWidget {
  final int value;
  const DetailPageState({Key? key, required this.value}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState(value);
}

class _DetailPageState extends State<DetailPageState> {
  int value;

  _DetailPageState(this.value);
  List pages = [
    drawer(),WelcomePage(),HomeMohamedPage(),
  ];
  int currentIndex=0;


  void onTap(int index){Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
    return pages.elementAt(index);
  }));
  }
  var back = {
    "fromRGBO(234, 238, 246,1)": "mm",
    "fromRGBO(234, 238, 0,1)": "mm",

  };
  var imagess = {
    "p1.png": "mm",
    "a1.png": "mm",
    "p3.png": "mm",
    "p4.png": "mm",
    "p6.png": "mm",

  };
  var desc1 = {
    "Développement d\'une application desktop\n.NET:Gestion de scolarité avec le \nlangage C#": "mm",
    "Développement d''une application mobile\n avec React \n en consommane l''API de PrestaShop": "mm",
    "Mettre en place un Processus\n de recurettement Odoo\n avec une  modélisation avec \ Bonita": "mm",
    "Gestion de Formation\n Cette description fournit une vue \n succincte du projet de gestion de formation\n en mettant en avant les technologies\n utilisées,les fonctionnalités principales\n et les objectifs visés. ": "mm",
    "Ce site de CV est entièrement réalisé\n avec Flutter.Il se compose de diverses \n sections \navec des widgets personnalisés \ntels que des \nen-têtes animés, des tuiles d\'extension, des \n boutons, etc. Il dépend de plusieurs\n packages de pub.dev": "mm",

  };


  var tdes = {
    "Développement d'une application .Net": "mm",
    "React Native": "mm",
    "Odoo": "mm",
    "Angular": "mm",
    "Flutter": "mm",
  };
  int mode =0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "img/" + imagess.keys.elementAt(value)),
                          fit: BoxFit.cover)
                  ),
                )),
            Positioned(
              top:320,
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(234, 238, 246,1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: Column(
                  children: [
                    Row(children:[
                      AppText(text:tdes.keys.elementAt(value)),
                    ],
                    ),
                    SizedBox(height: 20),
                    Row(children:[
                      AppText(text:desc1.keys.elementAt(value),),
                      SizedBox(height: 20),
                    ],
                    ),
                    SizedBox(height: 20),


                  ],
                ),
              ),
            ),

          ],

        ),

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
      drawer: drawer(),



    );
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
                image: AssetImage("img/mohamed.png"),
                fit: BoxFit.fitHeight,

              ),
            ),
            child: Text('', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(AppLocalization(lang: appState.lang).translation("15"), style: TextStyle(color: Colors.white)),
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
                    return ProfileMohamedPage();
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
                    return HomeMohamedPage();
                  },
                ),
              );
            },

          ),
          ListTile(
            leading: Icon(Icons.map, color: Colors.white),
            title: Text(AppLocalization(lang: appState.lang).translation("18"),style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MapMohamedPage();
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
