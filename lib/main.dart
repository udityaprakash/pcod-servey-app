import 'dart:developer';
// import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pcos_survey_app/google_api.dart';
import 'package:pcos_survey_app/questions_screen.dart';

void main() {
  runApp(const MyApp());
}

var name = '';
var email = '';
var attempt = 0;

bool checkPlatform() {
  if (kIsWeb) {
    print("Running on Web");
    return false;
  } else {
    print("Running on Mobile");
    return true;
  }
  // if (Platform.isAndroid) {
  //   print("Running on Android");
  //   return true;
  // } else if (Platform.isIOS) {
  //   print("Running on iOS");
  //   return true;
  // } else {
  //   print("Running on another platform");
  //   return false;
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Survey App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
          primary: Colors.black,
          secondary: Colors.white,
        ),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashSignUpScreen(),
        // '/signup': (context) => const SignUpScreen(),
        '/display': (context) => displaysomething(),
        '/questions': (context) => const QuestionScreen(),
        '/thankyou': (context) => const ThankYouScreen(),
      },
    );
  }
}

class SplashSignUpScreen extends StatefulWidget {
  const SplashSignUpScreen({super.key});

  @override
  _SplashSignUpScreenState createState() => _SplashSignUpScreenState();
}

class _SplashSignUpScreenState extends State<SplashSignUpScreen> {
  bool showButton = false;
  double logoPosition = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        logoPosition = -50;
        showButton = true;
      });
    });
  }

  // Future<void> _handleSignIn(BuildContext context) async {
  //   try {
  //     if (!checkPlatform()) {
  //       await googleapiweb.signIn();
  //       log(googleapiweb.userinfo().toString());
  //       name = googleapiweb.userinfo()!.displayName!;
  //       email = googleapiweb.userinfo()!.email;
  //       attempt = 1;
  //       Navigator.pushReplacementNamed(
  //         context,
  //         '/display',
  //         arguments: {'name': name},
  //       );
  //       // Navigator.pushReplacementNamed(context, '/questions');
  //     } else {
  //       await googleapi.signIn();
  //       log(googleapi.userinfo().toString());
  //       name = googleapi.userinfo()!.displayName!;
  //       email = googleapi.userinfo()!.email;
  //       attempt = 1;
  //       Navigator.pushReplacementNamed(context, '/questions');
  //     }
  //   } catch (error) {
  //     log(error.toString());
  //     Navigator.pushNamed(
  //         context,
  //         '/display',
  //         arguments: {'name': error.toString()},
  //       );
  //   }
  // }

  Future<void> _handleSignIn(BuildContext context) async {
    try {
      await GoogleApi.signIn();
      log(GoogleApi.displayName.toString());

      name = GoogleApi.displayName ?? 'Unknown User';
      email = GoogleApi.email ?? 'No Email';
      attempt = 1;

      Navigator.pushReplacementNamed(
        context,
        '/display',
        arguments: {'name': name},
      );
    } catch (error) {
      log(error.toString());
      Navigator.pushNamed(
        context,
        '/display',
        arguments: {'name': error.toString()},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              top: MediaQuery.of(context).size.height / 3 + logoPosition,
              child: Image.asset(
                'assets/images/pcosSurveyLogo.png',
                width: 350,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: showButton ? 1.0 : 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 400),
                  CustomButton(
                    text: 'Continue with Google',
                    onPressed: () {
                      _handleSignIn(context);
                      // Navigator.pushNamed(context, '/questions');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class googleapi {
//   static final _googleSignIn = GoogleSignIn();
//   static Future<GoogleSignInAccount?> signIn() => _googleSignIn.signIn();
//   static GoogleSignInAccount? userinfo() => _googleSignIn.currentUser;
//   static Future<void> signOut() => _googleSignIn.signOut();
// }

// class googleapiweb {
//   static final _googleSignIn = GoogleSignIn(
//     clientId: '710390705852-r4tfotgabfcr4iqpbqjrnu04hkceh17m.apps.googleusercontent.com'
//     );
//   static Future<GoogleSignInAccount?> signIn() => _googleSignIn.signIn();
//   static GoogleSignInAccount? userinfo() => _googleSignIn.currentUser;
//   static Future<void> signOut() => _googleSignIn.signOut();
// }

class displaysomething extends StatefulWidget {
  const displaysomething({super.key});

  @override
  State<displaysomething> createState() => _displaysomethingState();
}

class _displaysomethingState extends State<displaysomething> {
  void initState() {
    super.initState();
    if (attempt == 1) {
      Future.delayed(const Duration(seconds: 3), () {
        // setState(() {
        Navigator.pushReplacementNamed(context, '/questions');
        // });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    String name = args?['name'] ?? 'Guest';

    return Scaffold(
      appBar: AppBar(title: Text("Info Screen")),
      body: Center(
        child: Text(
          "Welcome, $name!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}



class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Thank you for attempting this!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  // final bool? isWeb;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed
    // this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}

// class OptionButton extends StatelessWidget {
//   final String text;
//   final bool isSelected;
//   final VoidCallback onPressed;

//   const OptionButton({
//     super.key,
//     required this.text,
//     required this.isSelected,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity > 400 ? 400 : double.infinity,
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//           backgroundColor: isSelected ? Colors.black : Colors.white,
//           foregroundColor: isSelected ? Colors.white : Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(7),
//           ),
//           side: const BorderSide(color: Colors.black),
//         ),
//         onPressed: onPressed,
//         child: Text(text),
//       ),
//     );
//   }
// }
