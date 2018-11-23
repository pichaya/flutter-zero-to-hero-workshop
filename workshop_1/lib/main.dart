import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Inbox'),
    );
  }
}

class Email {
  Email(
      {@required this.sender,
      @required this.title,
      @required this.content,
      @required this.image});

  String sender;
  String image;
  String title;
  String content;
}

class EmailCard extends StatelessWidget {
  EmailCard(this.email);

  final Email email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            child: SizedBox(
              child: CircleAvatar(
                backgroundImage: NetworkImage(email.image),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 15.0, right: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    email.title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "${email.sender} - ${email.content}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Email> emails = List<Email>();

  void _composeEmail() {}

  @override
  void initState() {
    super.initState();
    emails.add(Email(
        sender: "Mark Zuckerberg",
        image:
            "https://www.biography.com/.image/t_share/MTQyMDA0NDgwMzUzNzcyNjA2/mark-zuckerberg_gettyimages-512304736.jpg",
        title: "CNN Business interview",
        content:
            "After spending much of this year apologizing for Facebook's many missteps, CEO Mark Zuckerberg was defiant in an exclusive interview with CNN Business on Tuesday."));

    emails.add(Email(
        sender: "Bill Gates",
        image:
            "https://pbs.twimg.com/profile_images/988775660163252226/XpgonN0X_400x400.jpg",
        title: "Birthday gift",
        content: "I want iPad Pro!"));

    emails.add(Email(
        sender: "Steve Jobs",
        image:
            "https://specials-images.forbesimg.com/imageserve/5b8576db31358e0429c734e3/416x416.jpg?background=000000&cropX1=211&cropX2=2381&cropY1=900&cropY2=3072",
        title: "2018 iPad Pro redesign is both brilliant and stupid",
        content:
            "Apple appears poised to unveil the most significant redesign of the iPad in years. Renders of 2018’s iteration of the 12.9-inch iPad Pro have leaked out, showing that this model will include changes that will make it the best tablet Apple ever released."));

    emails.add(Email(
        sender: "Tony Stark",
        image:
            "https://cdn.comicsverse.com/wp-content/uploads/2017/11/facebook-Linked_Image___tony-stark-header.jpg",
        title: "Avengers 4",
        content:
            "The Independent's complete collection of articles and commentary on Tony Stark."));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/google.png"),
                backgroundColor: Colors.white,
              ),
              accountName: Text("Mr. Flutter Thai"),
              accountEmail: Text("contect@flutter.io"),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.inbox,
                    color: Colors.redAccent,
                  ),
                  title: Text("Inbox"),
                ),
                ListTile(
                  leading: Icon(Icons.send),
                  title: Text("Outbox"),
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Trash"),
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: emails.length,
            itemBuilder: (buildContext, position) {
              return EmailCard(emails[position]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _composeEmail,
        tooltip: 'Compose Email',
        child: Icon(Icons.add),
      ),
    );
  }
}
