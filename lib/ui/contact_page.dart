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

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  var submittingForm = false;

  var _nomeController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();

  var helper = ContactHelper();

  var _editedContact = Contact();

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      setState(() {
        _editedContact = widget.contact;
        title = _editedContact.name;
        _nomeController.text = _editedContact.name;
        _emailController.text = _editedContact.email;
        _phoneController.text = _editedContact.phone;
      });
    }
  }

  bool _isValid() {
    return _nomeController.text.isNotEmpty &&
        _emailController.text.isNotEmpty && _phoneController.text.isNotEmpty;
  }

  _saveContact() async {
    if (!submittingForm && _isValid()) {
      _editedContact.name = _nomeController.text;
      _editedContact.email = _emailController.text;
      _editedContact.phone = _phoneController.text;
      helper.saveContact(_editedContact).then((contact) {
        Navigator.pop(context);
        _scaffoldkey.currentState
            .showSnackBar(
            SnackBar(content: Text('Contato salvo com sucesso!')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(
          title ?? 'Novo Contato',
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: _saveContact),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 160.0,
                  child: Image(
                    image: AssetImage('images/profile-placeholder.png'),
                  ),
                ),
                onTap: () {},
              ),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (text) {},
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {},
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                onChanged: (text) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
