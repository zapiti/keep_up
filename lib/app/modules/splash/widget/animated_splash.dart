import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';

Function _customFunction;
String _imagePath;
String _versionCode = "v-0.0.1-Alpha";
int _duration;

class AnimatedSplash extends StatefulWidget {
  AnimatedSplash(
      {@required String imagePath, Function customFunction, int duration}) {
    assert(duration != null);

    assert(imagePath != null);

    _duration = duration;
    _customFunction = customFunction;
    _imagePath = imagePath;
  }

  @override
  _AnimatedSplashState createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    if (_duration < 1000) _duration = 2000;
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInCirc));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    !kIsWeb
        ? Future.delayed(Duration(milliseconds: 800)).then((value) {
            Future.delayed(Duration(milliseconds: _duration)).then((value) {
              _customFunction();
            });
          })
        : Future.delayed(Duration.zero).then((value) {
            _customFunction();
          });

    return Scaffold(
        body: Container(
          color: AppThemeUtils.colorPrimary,
            child: Stack(
              children: [
                FadeTransition(
                    opacity: _animation,
                    child: Center(
                        child: Container(
                            height: 250.0,padding:EdgeInsets.symmetric(horizontal: 40) ,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Image.asset(_imagePath)))),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        _versionCode ?? "",
                        style: AppThemeUtils.normalSize(
                            fontSize: 16, color: AppThemeUtils.whiteColor),
                      ),
                    )),
              ],
            )));
  }
}
