import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  bool isPressed2 = false;
  var counter = 999;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            Image.asset('assets/iteso.jpeg'),
            // Image.network('url')
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Row(
                children: [
                  //textos
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('ITESO, Universidad Jesuita de Guadalajara',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          Text('San Pedro Tlaquepaque', 
                          style: TextStyle(
                            color: Color(0xFF808080)
                          ),
                          )
                        ],
                      ),
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up, color: isPressed ? Colors.blue: Colors.black,), 
                    onPressed: (){
                      isPressed = !isPressed;
                      counter++;
                      setState(() {});
                    }),
                  IconButton(
                    icon:Icon(Icons.thumb_down, color: isPressed2 ? Colors.red: Colors.black,), 
                    onPressed: (){
                      isPressed2 = !isPressed2;
                      counter--;
                      setState(() {});
                    }),
                  Text('$counter')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //botones
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.mail, size: 60), 
                              onPressed: (){
                                final snackbar = SnackBar(
                                  content: Text('Llamar'),
                                  action: SnackBarAction(
                                    label: 'Dismiss', 
                                    onPressed: (){
                                      // Scaffold.of(context).hideCurrentSnackBar();
                                    }),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text('Correo'),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.add_call, size: 60), 
                              onPressed: (){
                                final snackbar = SnackBar(
                                  content: Text('Mandando correo'),
                                  action: SnackBarAction(
                                    label: 'Dismiss', 
                                    onPressed: (){
                                      // Scaffold.of(context).hideCurrentSnackBar();
                                    }),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text('Llamar'),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
                        child: IconButton(
                          icon: Icon(Icons.directions, size: 60), 
                          onPressed: (){
                                final snackbar = SnackBar(
                                  content: Text('Abriendo maps'),
                                  action: SnackBarAction(
                                    label: 'Dismiss', 
                                    onPressed: (){
                                      // Scaffold.of(context).hideCurrentSnackBar();
                                    }),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          }),
                      ),
                      Text('Ruta')
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.'),
            ),
            ElevatedButton(onPressed: (){
              DateTime now = DateTime.now();
              var isPair = (counter%2==0)? 'El contador de likes es par' : now;
              var wasPair = (counter%2==0) ? 'Contador de likes' : 'Fecha y Hora';
              return showDialog(
                context: context,
                builder: (ctx)=> AlertDialog(
                  title: Text('$wasPair'),
                  content: Text('$isPair'),
                  actions: <Widget> [
                    TextButton(
                      onPressed: (){
                        //close the pop up alert text
                        Navigator.pop(ctx);
                      }, 
                      child: Text('Cerrar'))
                  ],
                ));


            }, 
            child: Text('Par/Impar'))
          ],
        ),
      ),
    );
  }
}