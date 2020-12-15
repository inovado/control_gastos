import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(MyApp());
}
//-----------------------------------------------------------------------------------------------------------------
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
//-----------------------------------------------------------------------------------------------------------------
class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//-----------------------------------------------------------------------------------------------------------------
class _MyHomePageState extends State<MyHomePage> {
  
  Widget _botoomAction(IconData icon){
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: (){},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _botoomAction(FontAwesomeIcons.history),
            _botoomAction(FontAwesomeIcons.chartPie),
            SizedBox(width: 48.0,),
            _botoomAction(FontAwesomeIcons.wallet),
            _botoomAction(Icons.settings),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
        
        ),
    );
  }
}
//-----------------------------------------------------------------------------------------------------------------