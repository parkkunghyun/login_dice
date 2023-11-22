import 'package:flutter/material.dart';

import 'dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}
// builder 순한맛1819
class LogIn extends StatefulWidget {

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController(); // dispose도 필요!

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                ),
                Form(
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.teal, // 텍스트 필드 눌렀을때
                      inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.teal,
                            fontSize: 15.0),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              labelText: "Enter dice",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: controller2,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Enter password",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 40.0,),
                          ButtonTheme(
                            minWidth: 100.0,
                            height: 50.0,
                            child: ElevatedButton(
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 35.0,
                                color: Colors.orangeAccent,),
                              onPressed: () {
                                if (controller.text == 'dice' &&
                                    controller2.text == '1234') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Dice()));
                                }
                                else if (controller.text != 'dice' &&
                                    controller2.text == '1234') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('아이디 입력 이상'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                }
                                else if (controller.text == 'dice' &&
                                    controller2.text != '1234') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                   const  SnackBar(content: Text('비번 입력 이상'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );

                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('다시 입력하세요'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );

                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}



