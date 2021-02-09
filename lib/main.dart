import 'package:editform/form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Edit Form",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String name;

  Future<void> getDate() async{
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
  }

  @override
  void initState() {
    getDate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditableForm(value: name,)),);
                },
                child: Icon(Icons.add , color: Colors.blue,),
              ),
            ),
            SizedBox(height: 15,),
            name == null ? Text('') : Text(name)
          ],
        ),
      ),
    );
  }
}
