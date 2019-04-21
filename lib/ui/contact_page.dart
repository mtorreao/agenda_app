import 'package:agenda_app/utils/contact.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  @override
  _ContactPageState createState() => _ContactPageState();

  ContactPage({this.contact});
}

class _ContactPageState extends State<ContactPage> {
  String title;

  @override
  void initState() {
    super.initState();
//    this.title = 'Alfredo';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? 'Novo Contato',
        ),
        centerTitle: true,
      ),
    );
  }
}
