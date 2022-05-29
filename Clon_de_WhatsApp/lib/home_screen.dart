import 'package:flutter/material.dart';
import 'call_screen.dart';
import 'chats_screen.dart';
import 'status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  // controla el indice seleccinado para mostrar la vista correspondiente
  int _indiceSeleccionado = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // Lista de widgets que se van a mostrar
  static const List<Widget> _opciones = <Widget>[
    ChatScreen(),
    StatusScreen(),
    CallScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _indiceSeleccionado = index;
    });
  }

  Widget floatingActionButton(Icon icon) {
    return new FloatingActionButton(
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).accentColor,
      child: icon,
      onPressed: () {},
    );
  }

  Widget floatingActionButtonEdit(Icon editIcon, Icon cameraIcon) {
    return new Column(
      children: <Widget>[
        new FloatingActionButton(
          foregroundColor: new Color(0xff49646c),
          backgroundColor: new Color(0xffebf4fc), // #128C7E
          child: editIcon,
          onPressed: () {},
        ),
        SizedBox(height: 10),
        floatingActionButton(cameraIcon),
      ],
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
      ),
      body: Center(
        child: _opciones.elementAt(_indiceSeleccionado),
      ),
      floatingActionButton: _indiceSeleccionado == 0
          ? floatingActionButton(Icon(Icons.message))
          : _indiceSeleccionado == 1
              ? floatingActionButtonEdit(Icon(Icons.edit), Icon(Icons.camera_alt))
              : _indiceSeleccionado == 2
                  ? floatingActionButton(Icon(Icons.add_call))
                  : new Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'CHATS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'ESTADOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'LLAMADAS',
          ),
        ],
        currentIndex: _indiceSeleccionado,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
