
import 'package:flutter/material.dart';
import 'package:shared_preference/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: sharedpreference(),
    );
  }
}

class sharedpreference extends StatefulWidget {
  const sharedpreference({Key? key}) : super(key: key);

  @override
  State<sharedpreference> createState() => _sharedpreferenceState();
}

class _sharedpreferenceState extends State<sharedpreference> {

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;


  void initState(){
    super.initState();
    check_user();
  }
  void check_user() async{
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NewPage()));
    }
  }
  @override
  void dispose(){
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("niyguyfutdjufjhyfjyf"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Login Here",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),

            ),

            Padding(padding: const EdgeInsets.all(15),
              child: TextField(
                controller: username_controller,
                decoration:  const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'USERNAME',
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(15),
              child: TextField(
                controller: password_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PASSWORD',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String username = username_controller.text;
                  String password = password_controller.text;

                  if (username != '' && password != ''){
                    print("successfull");
                    logindata.setBool('login', false);
                    logindata.setString('username', username);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => NewPage()));
                  }
                },
                 child: const Text("LOGIN"),
            ),

          ],
        ),
      ),
    );
  }
}



