import 'package:flutter/material.dart';
import 'singIn.dart';
import 'home.dart';
import '_currentUser.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckAuth();
}

class _CheckAuth extends State<CheckAuth> {
  final CurUser currentUser = UtilCurUser.getuser();
  late Widget retVal;

  @override
  Widget build(BuildContext context) {
    switch (currentUser.stat) {
      case AuthStat.notlogged:
        retVal = const SignIn();
        break;
      case AuthStat.logged:
        retVal = const HomePage();
        break;
      default:
    }
    return retVal;
  }
}
