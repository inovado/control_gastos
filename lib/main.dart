import 'package:control_gastos/graph_widget.dart';
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

  PageController _controller; // Controlador para movimiento de los meses(_selector) en la parte superior de la pantalla
  int currentPage = 9;

  @override 
  void initState(){
    _controller = PageController(
      initialPage: currentPage, // inicia en el mes de septiembre
      viewportFraction: 0.33, // 30% de la pantalla para colocar cada elemento

    );
  }
  
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
        body:
          _body(),
          
    );
  }
  Widget _body(){
    return SafeArea(
      child: Column(
        children: <Widget>[
          _selector(),
          _expenses(),
          _graph(),
          Container(color: Colors.blueAccent.withOpacity(0.15),height: 24.0,),
          _list(),
        ],
      ),
    );
  }

  Widget _pageItem(String nombre, int posicion){ // funcion para acomodar los nombre de los meses en la parte sup de la pantalla
    var _aligment;

    if (posicion == currentPage) {
      _aligment = Alignment.center;
      
    }else if(posicion >currentPage){
      _aligment = Alignment.centerRight;
    }else{
      _aligment = Alignment.centerLeft;
    }
    return Align(
      alignment: _aligment,
      child: Text(nombre)
      );
  }

  Widget _selector(){
    return SizedBox.fromSize(
      size: Size.fromHeight(70.0),
      child: PageView(  
        controller: _controller,
        children: <Widget>[
         _pageItem("Enero", 0),
          _pageItem("Febrero",1),
          _pageItem("Marzo",2),
          _pageItem("Abril",3),
          _pageItem("Mayo",4),
          _pageItem("Junio",5),
          _pageItem("Julio",6),
          _pageItem("Agosto",7),
          _pageItem("Septiembre",8),
          _pageItem("Octubre",9),
          _pageItem("Noviembre",10),
          _pageItem("Diciembre",11),
        ],
      ),
    );
  }




  Widget _expenses() { 
    return Column(
      
      children: <Widget>[
        
        Text("\$2361.41",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0,),),
        Text("Total expenses",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.blueGrey),)
      ],

    );
    
  }

  Widget _graph(){
    return Container(
      height: 250.0,
      child: GraphWidget());
  }

  Widget _item(IconData icon, String nombre, int percent, double value){
    return ListTile(
      leading: Icon(icon, size: 32.0),
      title: Text(nombre, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
      subtitle: Text("$percent% of expenses",style: TextStyle(fontSize: 16.0,),),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("\$$value",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,),),
        )),

    );
  }
  
  Widget _list(){
    return Expanded(
            child: ListView.separated(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => _item(FontAwesomeIcons.shoppingCart, "Shopping",14, 145.12),
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.blueAccent.withOpacity(0.15),
                  height: 8.0,

                );
              },
              // children: <Widget>[
              //   _item(FontAwesomeIcons.shoppingCart, "Shopping",14, 145.12),
              //   _item(Icons.local_drink, "Drinks",5, 75.57),
              //   _item(FontAwesomeIcons.shoppingCart, "Shopping",14, 145.12),
        //],

      ),
    );
  }



}
//-----------------------------------------------------------------------------------------------------------------