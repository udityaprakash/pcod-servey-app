import 'dart:developer';
// import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pcos_survey_app/google_api.dart';

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

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final Map<int, Map<String, dynamic>> _questions = {
    0: {
      'question': 'Do you often feel stressed, anxious, or down?',
      'options': ['Always','Very Often', 'Sometimes', 'Never']
    },
    1: {
      'question': 'I rarely feel stressed, anxious, or down.',
      'options': ['Yes', 'No']
    },
    2: {
      'question': 'I generally feel calm and relaxed.',
      'options': ['Yes', 'No']
    },
    3: {
      'question': 'I do not frequently experience anxiety, stress, or low mood. ',
      'options': ['Yes', 'No']
    },
    4: {
      'question': 'Do you frequently have trouble concentrating or feel mentally foggy? ',
      'options': ['Yes', 'No']
    },
    5: {
      'question': 'I rarely have trouble concentrating or feel mentally foggy.',
      'options': ['Yes', 'No']
    },
    6: {
      'question': 'I usually find it easy to concentrate.',
      'options': ['Yes', 'No']
    },
    7: {
      'question': 'I do not experience mental fogginess.',
      'options': ['Yes', 'No']
    },
    8: {
      'question': 'Do you often feel emotionally drained or notice mood swings before or during your period?',
      'options': ['1 (Never)','2 (Rarely)', '3 (Sometimes)', '4 (Often)', '5 (Always)']
    },
    9: {
      'question': 'I do not feel emotionally drained before or during my period.',
      'options': ['Yes', 'No']
    },
    10: {
      'question': 'I rarely experience mood swings related to my period.',
      'options': ['Yes', 'No']
    },
    11: {
      'question': 'I feel emotionally stable during my period.',
      'options': ['Yes', 'No']
    },
    12: {
      'question': 'Do you tend to eat more when you are stressed or emotionally upset? ',
      'options': ['Yes', 'No']
    },
    13: {
      'question': 'I do not eat more when I am stressed or emotionally upset.',
      'options': ['Yes', 'No']
    },
    14: {
      'question': 'I rarely increase my food intake during stress or emotional upset.',
      'options': ['Yes', 'No']
    },
    15: {
      'question': 'I usually maintain my regular eating habits, regardless of stress or emotions.',
      'options': ['Yes', 'No']
    },
    16: {
      'question': 'How would you rate the quality of your sleep on a scale of 1 to 10?',
      'options': ['0-2', '2-4', '4-6', '6-8', '8-10']
    },
    17: {
      'question': 'I often feel my sleep quality is poor.',
      'options': ['Yes', 'No']
    },
    18: {
      'question': 'I am generally unsatisfied with my sleep quality.', 
      'options': ['Yes', 'No']
    },
    19: {
      'question': 'I rarely feel well-rested after sleep.',
      'options': ['Yes', 'No']
    },
    20: {
      'question': 'I generally feel fresh after waking up.',
      'options': ['Yes', 'No']
    },
    21: {
      'question': 'I generally feel energetic and happy after waking up.',
      'options': ['Yes', 'No']
    },
    22: {
      'question': 'I rarely feel irritable after waking up.',
      'options': ['Yes', 'No']
    },
    23: {
      'question': 'Do you frequently have trouble falling asleep or staying asleep?',
      'options': ['Yes', 'No']
    },
    24: {
      'question': 'I generally fall asleep quickly and stay asleep through the night. ',
      'options': ['Yes', 'No']
    },
    25: {
      'question': 'I rarely have trouble with falling asleep or staying asleep. ',
      'options': ['Yes', 'No']
    },
    26: {
      'question': 'I do not experience insomnia or disrupted sleep.',
      'options': ['Yes', 'No']
    },
    27: {
      'question': 'How many times do I wake up in the middle of the night? ',
      'options': ['Yes', 'No']
    },



  };
    // 39: {
    //   'question': 'I generally feel calm and relaxed.',
    //   'options': [
    //     '2-4 Hr Sleep',
    //     '4-6 Hr Sleep',
    //     '6-9 Hr Sleep',
    //     'more then 9Hr Sleep'
    //   ]
    // },

  int _currentQuestionIndex = 0;
  String? _selectedAnswer;

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
      });
    } else {
      Navigator.pushReplacementNamed(context, '/thankyou');
    }
  }

  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // setState(() {
      if (attempt != 1) {
        Navigator.pushReplacementNamed(context, '/splash');
      }
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex]!;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Question ${_currentQuestionIndex + 1}/${_questions.length}'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion['question'] as String,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...(currentQuestion['options'] as List<String>).map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OptionButton(
                  text: option,
                  isSelected: _selectedAnswer == option,
                  onPressed: () => setState(() => _selectedAnswer = option),
                ),
              );
            }),
            const Spacer(),
            Center(
              child: CustomButton(
                text: _currentQuestionIndex == _questions.length - 1
                    ? 'Finish'
                    : 'Next Question',
                onPressed: _selectedAnswer != null ? _nextQuestion : null,
              ),
            ),
          ],
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

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
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

class OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const OptionButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity > 400 ? 400 : double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          side: const BorderSide(color: Colors.black),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
