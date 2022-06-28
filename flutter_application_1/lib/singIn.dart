import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/signUp.dart';
import 'home.dart';
import 'signUp.dart';

/*Route createRouteSignIn() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SignIn(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}*/

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: const Text('Registration')),
        backgroundColor: Colors.blue[200],
        body: Center(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                controller: mailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'yourMail@gmail.com',
                ),
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: 'yourPassword',
              ),
            ),
            ElevatedButton(
                onPressed: (() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Welcome ${mailController.text}!'),
                    ),
                  );
                  Navigator.of(context).pushAndRemoveUntil(
                      createRouteHomePage(), (route) => false);
                }),
                child: const Text('Войти')),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Dont have an account? ',
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: ' sign up',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var tween =
                              Tween(begin: 0.0, end: 1.0).animate(animation);

                          return FadeTransition(
                            opacity: tween,
                            child: child,
                          );
                        }, pageBuilder: (context, animation, animationTime) {
                          return SignUp();
                        }),
                        (Route<dynamic> route) => false,
                      );
                    })
            ]))
          ]),
        ));
  }
}
