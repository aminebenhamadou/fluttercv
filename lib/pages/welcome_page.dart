import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cv/pages/ProfileFourPage.dart';
import 'package:cv/pages/ProfilemohamedPage.dart';
import 'package:cv/misc/colors.dart';
import 'package:cv/widgets/app_large_text.dart';
import 'package:cv/widgets/responsive_button.dart';
import 'package:cv/DarkThemeProvider.dart'; // Importez DarkThemeProvider

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return ProfileFourPage();
          }),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return ProfileMohamedPage();
          }),
        );
        break;
    }
  }

  var images = {
    "welcome-one.png": "Amine",
    "welcome-two.png": "Mohamed",
  };

  var text = {
    "welcome-one.png": "",
    "welcome-two.png": "",
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>( // Utilisez Consumer pour écouter les changements de DarkThemeProvider
      builder: (context, darkThemeProvider, child) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                onPageChanged: (index) {},
                scrollDirection: Axis.vertical,
                itemCount: images.length,
                itemBuilder: (_, index) {
                  return Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("img/" + images.keys.elementAt(index)),
                            fit: BoxFit.cover)),
                    child: Container(
                        margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: images.values.elementAt(index),
                                  size: 60,
                                  color: Colors.black,
                                ),
                                SizedBox(height: 20,),
                                SizedBox(height: 40,),
                                GestureDetector(
                                  onTap: () {
                                    onTap(index);
                                  },
                                  child: Container(
                                    width: 200,
                                    child: Row(children: [ResponsiveButton(width: 120,)]),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: List.generate(2, (indexDots) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 2),
                                  width: 8,
                                  height: index == indexDots ? 25 : 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: index == indexDots
                                          ? AppColors.mainColor
                                          : AppColors.mainColor.withOpacity(0.3)),
                                );
                              }),
                            )
                          ],
                        )),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Basculer le mode sombre
              darkThemeProvider.toggleDarkMode();
            },
            child: Icon(Icons.lightbulb),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        );
      },
    );
  }
}
