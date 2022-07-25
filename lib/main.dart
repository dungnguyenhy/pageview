import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter PageView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(() {});
    super.initState();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   leading: IconButton(
      //       icon: Icon(
      //         Icons.menu,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {}),
      // ),
      body: SafeArea(
          child: PageView(
        controller: _pageController,
        children: [
          makePageView('assets/images/1.jpg', 1),
          makePageView('assets/images/2.jpg', 2),
          makePageView('assets/images/3.jpg', 3),
        ],
      )),
    );
  }

  Widget makePageView(image, page) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
          .1,
          .9
        ], colors: [
          Colors.black.withOpacity(.1),
          Colors.black.withOpacity(.7)
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    page.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    '/3',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Yor',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Text(
                        '4.0',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        '(2300)',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                     
                    ],
                  ),
                   Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          'New York, often called New York City (NYC) to distinguish it from the State of New York, is the most populous city in the United States',
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(padding: EdgeInsets.only(top: 10),child: Text('READ MORE',style: TextStyle(color: Colors.white),),)
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
