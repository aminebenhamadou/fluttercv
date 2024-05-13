import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cv/AppState.dart';
import 'package:cv/localization.dart';
import 'Mapmohamed.dart';
import 'package:url_launcher/url_launcher.dart';
import 'homemohamed.dart';
import 'welcome_page.dart'; // Assuming you have this file

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(), // Assuming AppState is a ChangeNotifier
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileMohamedPage(),
    );
  }
}

class ProfileMohamedPage extends StatefulWidget {
  @override
  _ProfileMohamedPageState createState() => _ProfileMohamedPageState();
}

class _ProfileMohamedPageState extends State<ProfileMohamedPage> {
  int currentIndex = 0;


  final List<Widget> pages = [
    DrawerPage(),
    WelcomePage(),
    HomeMohamedPage(),
  ];

  void onTap(BuildContext context, int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return pages.elementAt(index);
      }),
    );
  }



  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context); // Use AppState

    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF17203A),
        onTap: (index) => onTap(context, index),
        currentIndex: currentIndex,
        selectedItemColor: Colors.grey.withOpacity(0.5),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(
              label: "My", icon: Icon(Icons.arrow_back_ios_new)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(),
              child: Text(
                  AppLocalization(lang: appState.lang).translation("19")),
            ),
            _buildTitle(AppLocalization(lang: appState.lang).translation("3"),),
            const SizedBox(height: 10.0),
            _buildSkillRow(AppLocalization(lang: appState.lang).translation("4"), 1),
            const SizedBox(height: 5.0),
            _buildSkillRow(AppLocalization(lang: appState.lang).translation("5"), 0.8),
            const SizedBox(height: 5.0),
            _buildSkillRow(AppLocalization(lang: appState.lang).translation("6"), 0.4),
            const SizedBox(height: 30.0),
            _buildTitle(AppLocalization(lang: appState.lang).translation("8")),
            _buildExperienceRow(
              company: "Front-End",
              position: "HTML5 ,CSS3 ,JavaScript ,XML , React Native, Bootstrap",
            ),
            _buildExperienceRow(
              company: "Back-end",
              position: "PHP, Laravel Java ,JavaScript ,C++",
            ),
            _buildExperienceRow(
              company: AppLocalization(lang: appState.lang).translation("9"),
              position: "UML SQL",
            ),
            _buildExperienceRow(
              company: AppLocalization(lang: appState.lang).translation("10"),
              position: "Intelligence Artificielle,  Data Mining ",
            ),
            _buildExperienceRow(
              company:  AppLocalization(lang: appState.lang).translation("11"),
              position: "LPI 101 Cisco CCNA 1",
            ),
            const SizedBox(height: 20.0),
            _buildTitle(AppLocalization(lang: appState.lang).translation("12")),
            const SizedBox(height: 5.0),
            _buildExperienceRow(
              company: "Sports",
              position: "Football",
            ),
            _buildExperienceRow(
              company:AppLocalization(lang: appState.lang).translation("133"),
              position: "Belote",
            ),
            const SizedBox(height: 20.0),
            _buildTitle("Contact"),
            const SizedBox(height: 5.0),
            Row(
              children:  <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.home,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Text(
                    AppLocalization(lang: appState.lang).translation("14"),
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.mail,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () async {
                    final Uri params = Uri(
                      scheme: 'mailto',
                      path: 'benhamadou2@gmail.com',
                      query: 'subject=Recrutement', // Sujet du mail
                    );
                    String email = 'mailto:benhamadou2@gmail.com?subject=Recrutement';
                    if (await canLaunch(email)) {
                      await launch(email);
                    } else {
                      throw 'Impossible d\'ouvrir le lien $email';
                    }
                  },
                  child: Text(
                    "mohamedchaabouni95@gmail.com",
                    style: TextStyle(
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                      color: Colors.blue, // Couleur du lien
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                Icon(
                  Icons.phone,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () async {
                    final Uri params = Uri(
                      scheme: 'tel',
                      path: '+21650403208',
                    );
                    String phoneNumber = 'tel:+21650403208';
                    if (await canLaunch(phoneNumber)) {
                      await launch(phoneNumber);
                    } else {
                      throw 'Impossible d\'ouvrir le numéro $phoneNumber';
                    }
                  },
                  child: Text(
                    "+216-50 403 208",
                    style: TextStyle(
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                      color: Colors.blue, // Couleur du lien
                    ),
                  ),
                ),
              ],
            ),

            _buildSocialsRow(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),

      ),
    );
  }

  Row _buildSocialsRow() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 20.0),
        IconButton(
          color: Colors.indigo,
          icon: const Icon(FontAwesomeIcons.github),
          onPressed: () async {
            // Ouvrir le lien LinkedIn ici
            const url = 'https://github.com/chaaa3';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Impossible d\'ouvrir le lien $url';
            }
          },
        ),

        const SizedBox(width: 5.0),
        IconButton(
          color: Colors.indigo,
          icon: const Icon(FontAwesomeIcons.linkedin),
          onPressed: () async {
            // Ouvrir le lien LinkedIn ici
            const url = 'https://www.linkedin.com/in/chaabouni-mohamed-b980b120a/';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Impossible d\'ouvrir le lien $url';
            }
          },
        ),

        const SizedBox(width: 10.0),
        const SizedBox(width: 10.0),
      ],
    );
  }

  Row _buildHeader(BuildContext context) {
    final appState = Provider.of<AppState>(context); // Use AppState

    return Row(
      children: <Widget>[
        const SizedBox(width: 20.0),
        Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/mohamed.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Mohamed Chaabouni",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              AppLocalization(lang: Provider.of<AppState>(context).lang).translation("1"),
            ),
            const SizedBox(height: 5.0),
            Row(
              children: const <Widget>[
                Icon(
                  FontAwesomeIcons.school,
                  size: 12.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  "IIT",
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  ListTile _buildExperienceRow({required String company, String? position}) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          FontAwesomeIcons.solidCircle,
          size: 12.0,
        ),
      ),
      title: Text(
        company,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position "),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: const TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.black54,
          ),
        ],
      ),
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
          ),
        ),
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
}

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

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
            child: Text('', style: TextStyle(color: Colors.indigo)),
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
            title:
            Text(AppLocalization(lang: appState.lang).translation("17"), style: TextStyle(color: Colors.white)),
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
            title: Text(AppLocalization(lang: appState.lang).translation("18"), style: TextStyle(color: Colors.white)),
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
          ListTile(
            onTap: () {
              _showLanguageSelectionDialog(context);
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization(lang: appState.lang).translation("99"),
                  style: TextStyle(
                    color: Colors.white, // Couleur du texte en blanc
                  ),
                ),
                Icon(Icons.language), // Icône pour indiquer le choix de la langue
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final appState = Provider.of<AppState>(context);
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildLanguageOption(context, 'Français', 'fr', 'img/fr.usa.png'),
              _buildLanguageOption(context, 'Anglais', 'en', 'img/usa.png'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(BuildContext context, String language, String value, String flagImage) {
    final appState = Provider.of<AppState>(context);
    return ListTile(
      onTap: () {
        appState.changeLang(value);
        Navigator.of(context).pop();
      },
      leading: Image.asset(flagImage, width: 30),
      title: Text(language),
    );
  }
}