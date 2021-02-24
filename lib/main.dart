import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Título Gestor de Janelas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Título Appbar'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;


  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
          child:
          Text(
            'Olá Mundo!!!',
          )
      ),
    );
  }


}

class _HomeScreenState extends State<HomeScreen> {
  int _contador = 0;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text('Olá Mundo!!! $_contador')
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(onPressed: _decrementarContador, tooltip: 'Decrement' ,child: Icon(Icons.remove)),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(onPressed: _incrementarContador, tooltip: 'Increment' ,child: Icon(Icons.add)),
            ),
            Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(onPressed: _resetContador, tooltip: 'Reset' ,child: Icon(Icons.refresh)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextField(
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '123',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(onPressed: _atualizarContador, tooltip: 'Reset' ,child: Icon(Icons.add_box)),
            )
          ],
        ),
      );
    }

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  void _decrementarContador() {
    setState(() {
      _contador--;
    });
  }

  void _resetContador() {
    setState(() {
      _contador = 0;
    });
  }

  void _atualizarContador() {
    setState(() {
      if (myController.text.isEmpty) {
        _contador = 0;
      } else {
        int num = int.tryParse(myController.text) ?? 0;
        _contador = num;
      }
    });
  }

}


@override
State<StatefulWidget> createState() => _HomeScreenState();

