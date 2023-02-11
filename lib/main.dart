import 'package:flutter/material.dart';
import 'package:twittertypeapp/HomePage.dart';

import 'Queryhelp.dart';

void main() {
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  Future <void> Fakedata() async{
    Network network = new Network();
    var data = await network.getInfo();
    print(data);
    WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(data)));

    });
  }




  //
  // Navigator.push(
  // context,
  // MaterialPageRoute(builder: (context) => Home(ProductList: jsonDecode(prefs.getString('Productlist')!),)),
  // );




  @override
  void initState() {
    print("Henlo");
    Fakedata();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1611605698335-8b1569810432?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dHdpdHRlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
                  )
              ),
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );

  }
}
