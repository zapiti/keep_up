import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:keep_up/app/modules/login/login_module.dart';

import 'modules/init/init_module.dart';
import 'modules/profile/profile_module.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CupertinoTabController _tabController = CupertinoTabController();

  final GlobalKey<NavigatorState> _timelineTabNavKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _pointTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _hollerithTabNavKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _menuTabNavKey = GlobalKey<NavigatorState>();

  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentNavigatorKey().currentState.canPop()) {
          return !await currentNavigatorKey().currentState.maybePop();
        } else {
          return await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text("Fechar o aplicativo?"),
                      actions: [
                        CupertinoButton(
                          child: Text("Não"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        CupertinoButton(
                          child: Text(
                            "Sim",
                            style: TextStyle(color: CupertinoColors.systemRed),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    );
                  }) ??
              false;
        }
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          onTap: (index) {
            if (_currentTab == index) {
              switch (index) {
                case 0:
                  _timelineTabNavKey.currentState
                      .popUntil((route) => route.isFirst);
                  break;
                case 1:
                  _pointTabNavKey.currentState
                      .popUntil((route) => route.isFirst);
                  break;
                case 2:
                  _hollerithTabNavKey.currentState
                      .popUntil((route) => route.isFirst);
                  break;
                case 3:
                  _menuTabNavKey.currentState
                      .popUntil((route) => route.isFirst);
                  break;
              }
            }

            _currentTab = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.list_bullet,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
            )
          ],
        ),
        controller: _tabController,
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return RouterOutlet(
              module: InitModule(),
              navigatorKey: _timelineTabNavKey,
            );
          }

          if (index == 1) {
            return RouterOutlet(
              module: InitModule(),
              navigatorKey: _pointTabNavKey,
            );
          }

          if (index == 2) {
            return RouterOutlet(
              module: InitModule(),
              navigatorKey: _hollerithTabNavKey,
            );
          }

          return RouterOutlet(
            module: ProfileModule(),
            navigatorKey: _menuTabNavKey,
          );
        },
      ),
    );
  }

  GlobalKey<NavigatorState> currentNavigatorKey() {
    switch (_tabController.index) {
      case 0:
        return _timelineTabNavKey;
        break;
      case 1:
        return _pointTabNavKey;
        break;
      case 2:
        return _hollerithTabNavKey;
        break;
      case 3:
        return _menuTabNavKey;
        break;
    }

    return null;
  }

  //Ids dos banner do ADMob
  final bannerAdIdAndroid = "ca-app-pub-5954339580493142/2212672162";
  final bannerAdIdIos =
      "ca-app-pub-5954339580493142/2212672162"; //TODO: Ver isso
  String getBannerId() => Platform.isIOS ? bannerAdIdIos : bannerAdIdAndroid;

//  BannerAd myBanner;

  @override
  void dispose() {
   // myBanner?.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // FirebaseAdMob.instance.initialize(appId: getBannerId());
    //
    // startBanner();
    // displayBanner();
  }

  // // Configuração dos banners que deverão ser exibido
  // MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  //   keywords: <String>['flutterio', 'beautiful apps'],
  //   contentUrl: 'https://flutter.io',
  //   childDirected: false,
  //   testDevices: <String>[],
  // );

  // void startBanner() {
  //   myBanner = BannerAd(
  //     adUnitId: BannerAd.testAdUnitId,
  //     size: AdSize.banner,
  //     targetingInfo: targetingInfo,
  //     listener: (MobileAdEvent event) {
  //       print("BannerAd event is $event");
  //     },
  //   );
  // }
  //
  // void displayBanner() {
  //   myBanner = buildBannerAd()..load();
  // }

  // BannerAd buildBannerAd() {
  //   return BannerAd(
  //       adUnitId: BannerAd.testAdUnitId,
  //       size: AdSize.banner,
  //       listener: (MobileAdEvent event) {
  //         if (event == MobileAdEvent.loaded) {
  //           myBanner..show(anchorType: AnchorType.bottom, anchorOffset: 50);
  //         }
  //       });
  // }
}
