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
  List<Contact> _contacts = List();
  final helper = ContactHelper();

  @override
  initState() {
    super.initState();
    helper.getAllContacts().then(_updateContactList);
  }

  _updateContactList(contacts) {
    setState(() {
      _contacts = contacts;
      print(_contacts);
    });
  }

  void _goToContactPage({Contact contact}) {
    if (contact != null)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ContactPage()));
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ContactPage()));
  }

  Future<void> _refreshContactList() async {
    List<Contact> contacts = await helper.getAllContacts();
    setState(() {
      _contacts = contacts;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshContactList,
        child: ListView.builder(
            itemCount: _contacts.length,
            itemBuilder: (context, index) {
              Contact contact = _contacts[index];
              return GestureDetector(
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 100.0,
                        child: Image.asset('images/profile-placeholder.png')),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          contact.name ?? '',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(contact.email ?? ''),
                        Text(contact.phone ?? ''),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToContactPage,
        tooltip: 'Novo Contato',
        child: Icon(Icons.add),
      ),
    );
  }
}
