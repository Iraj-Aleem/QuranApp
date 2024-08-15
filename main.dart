import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:quranepak/firebase_options.dart';
import 'package:quranepak/homescreen.dart';
//import 'firebase_options.dart';
import 'package:quranepak/firebaseauthenticationscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'random_verse.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LogoScreen(),
    
  ));
}

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    // Delayed navigation to the login screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.black, // Set background color to black
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 192, // Adjust the width of the container
                height: 204, // Adjust the height of the container
                child: Image.asset(
                    'images/logo.png'), // Replace 'images/logo.png' with the path to your logo image
              ),
              SizedBox(height: 20), // Add some space between the logo and text
              Text(
                'Welcome to \nTalawat-e-Quran App',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 148, 180, 5),
          title: Text(
            'Talawat-e-Quran\nRegistration Form',
            textAlign: TextAlign.center,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/logo.png', // Adjust the path to your logo image
                  ),
                ),
              ),
              width: 40, // Adjust the width of the container
              height: 40, // Adjust the height of the container
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _valueFirst = TextEditingController();
  TextEditingController _valueLast = TextEditingController();
  TextEditingController _valueAddress = TextEditingController();
  TextEditingController _valueEmail = TextEditingController();
  TextEditingController _valuePassword = TextEditingController();
  TextEditingController _valueCity = TextEditingController();

  String _selectedCity = 'Islamabad';
  bool _isChecked = false;
  String _gender = 'Male';
  String _province = 'Punjab';

  final _cityList = [
    'Islamabad',
    'Karachi',
    'Lahore',
    'Peshawar',
    'Quetta',
    'Faisalabad',
    'Rawalpindi',
    'Multan',
    'Sialkot',
    'Hyderabad'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _valueFirst,
            decoration: InputDecoration(labelText: 'First Name'),
          ),
          TextFormField(
            controller: _valueLast,
            decoration: InputDecoration(labelText: 'Last Name'),
          ),
          TextFormField(
            controller: _valueEmail,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextFormField(
            obscureText: true,
            controller: _valuePassword,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 10),
          Text('Gender'),
          Row(
            children: [
              Radio(
                value: 'Male',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              Text('Male'),
              Radio(
                value: 'Female',
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              Text('Female'),
            ],
          ),
          Text('Province'),
          Row(
            children: [
              Radio(
                value: 'Punjab',
                groupValue: _province,
                onChanged: (value) {
                  setState(() {
                    _province = value!;
                  });
                },
              ),
              Text('Punjab'),
              Radio(
                value: 'KPK',
                groupValue: _province,
                onChanged: (value) {
                  setState(() {
                    _province = value!;
                  });
                },
              ),
              Text('KPK'),
              Radio(
                value: 'Sindh',
                groupValue: _province,
                onChanged: (value) {
                  setState(() {
                    _province = value!;
                  });
                },
              ),
              Text('Sindh'),
              Radio(
                value: 'Balochistan',
                groupValue: _province,
                onChanged: (value) {
                  setState(() {
                    _province = value!;
                  });
                },
              ),
              Text('Balochistan'),
              Radio(
                value: 'Gilgit-Baltistan',
                groupValue: _province,
                onChanged: (value) {
                  setState(() {
                    _province = value!;
                  });
                },
              ),
              Text('Gilgit-Baltistan'),
              Radio(
                value: 'Azad Jammu and Kashmir',
                groupValue: _province,
                onChanged: (value) {
                  setState(() {
                    _province = value!;
                  });
                },
              ),
              Text('Azad Jammu and Kashmir'),
            ],
          ),
          SizedBox(height: 10),
          Text('City'),
          DropdownButtonFormField(
            value: _selectedCity,
            items: _cityList.map((city) {
              return DropdownMenuItem(
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCity = value!;
              });
            },
            decoration: InputDecoration(labelText: 'Select City'),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
              Text('I agree to the terms and conditions'),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your login logic here
              String firstName = _valueFirst.text; // Get first name
              String lastName = _valueLast.text; // Get last name
              String email = _valueEmail.text; // Get email
              String password = _valuePassword.text; // Get password
              String gender = _gender; // Get gender
              String province = _province; // Get province
              String city = _selectedCity; // Get city
              bool agreedToTerms = _isChecked; // Get agreement status

              // Print or use the obtained values
              print('First Name: $firstName');
              print('Last Name: $lastName');
              print('Email: $email');
              print('Password: $password');
              print('Gender: $gender');
              print('Province: $province');
              print('City: $city');
              print('Agreed to Terms: $agreedToTerms');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text(
              'Submit',
              style: TextStyle(
                color: const Color.fromARGB(255, 2, 70, 4),
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to Audio Recitation screen
             
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              
            },
            child: Text(
              'Signin',
              style: TextStyle(
                color: const Color.fromARGB(255, 2, 70, 4),
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // Uses the system theme by default
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpScreen(),
        '/auth': (context) => AuthScreen(),
      },
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('User registered: ${userCredential.user?.uid}');
    } catch (e) {
      print('Error during registration: $e');
      // Handle registration errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 148, 180, 5),
        title: Text(
          'Talawat-e-Quran\nSignIn',
          textAlign: TextAlign.center,
        ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),

            ),
          ],
        ),
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print('User registered: ${userCredential.user?.uid}');
      Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => LoginScreen()),
             );
    } catch (e) {
      print('Error during registration: $e');
      // Handle registration errors here
      Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => LoginScreen()),
             );
    }
  }

  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      print('User signed in: ${userCredential.user?.uid}');
Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );    } catch (e) {
      Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => HomeScreen()),
             );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
