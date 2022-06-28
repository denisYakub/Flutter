import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/singIn.dart';
import 'home.dart';

/*Route createRouteSignUp() {
  return PageRouteBuilder(
    transitionDuration: Duration(seconds: 3),
    pageBuilder: (context, animation, secondaryAnimation) => const SignUp(),
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

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Registration')),
      backgroundColor: Colors.blue[200],
      body: Center(
          child: Column(
        children: [
          Stack(children: [
            ClipOval(child: Image.asset('assets/person.jpg')),
            ClipOval(
                child: ElevatedButton(
              onPressed: (() {}),
              child: const Icon(Icons.camera),
            ))
          ]),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Name Surname',
            ),
          ),
          TextFormField(
            controller: mailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.mail),
              labelText: 'yourMail@gmail.com',
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
                text: 'Have an account? ',
                style: TextStyle(color: Colors.black)),
            TextSpan(
                text: ' sign in',
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
                        return SignIn();
                      }),
                      (Route<dynamic> route) => false,
                    );
                  })
          ]))
        ],
      )),
    );
  }
}
