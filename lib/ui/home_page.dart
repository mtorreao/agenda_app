import 'package:agenda_app/ui/contact_page.dart';
import 'package:agenda_app/utils/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _contacts = List();

  void _goToContactPage({Contact contact}) {
    if (contact != null)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ContactPage()));
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ContactPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _contacts.length, itemBuilder: (context, index) {}),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToContactPage,
        tooltip: 'Novo Contato',
        child: Icon(Icons.add),
      ),
    );
  }
}
