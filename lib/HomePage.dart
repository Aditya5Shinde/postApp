

import 'package:flutter/material.dart';
import 'Detailspage.dart';

class Homepage extends StatefulWidget {
  final Reciveddata;

  Homepage(this.Reciveddata);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    super.initState();
    print("Henlo");
    // datafetch();
  }

  // void datafetch() async {
  //   Network data = new Network();
  //
  //   Postdata = await data.getInfo();
  //   // Map jsonData;
  //   // jsonData = jsonDecode(Postdata) ;
  //   // print('Here is the issue');
  //   // print(jsonData.length);
  //   print(Postdata.length);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
              child: const Text(
                'Twitter',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: Colors.white,
            leading: Container(
              margin: const EdgeInsets.all(7.0),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://twirpz.files.wordpress.com/2015/06/twitter-avi-gender-balanced-figure.png',
                scale:0.5,
                ),
              ),
            ),
          ),
          body: ListView.builder(
              itemCount:widget.Reciveddata.length != 0 ? widget.Reciveddata.length  : 1,
              itemBuilder: (context, index) {
                return  Post(index,widget.Reciveddata);
              }),
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  final int No;
 late var Neededdata;
  Post(this.No , this.Neededdata);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(Neededdata[No]['link'])));

        // });
      },
      leading: const CircleAvatar(),
      title: Column(),
      subtitle: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
           Text('${Neededdata[No]['title']['rendered']}'),
          const SizedBox(
            height: 5,
          ),
          Image.network('${Neededdata[No]['jetpack_featured_media_url']}') ,
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.chat_bubble_outline,
                color: Colors.grey,
              ),
              Icon(
                Icons.repeat,
                color: Colors.grey,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              Icon(
                Icons.share,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
