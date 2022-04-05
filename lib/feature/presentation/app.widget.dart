import 'package:flutter/material.dart';
import 'package:movieapp/feature/presentation/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinema App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.grey,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color(0xffffffff),
                displayColor: const Color(0xff22215B),
              )),
      home: const MyHomePage(title: 'Cinema Booking'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: HomePage(),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
