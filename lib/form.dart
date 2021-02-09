import 'package:editform/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditableForm extends StatefulWidget {

  String value;

  EditableForm({
    this.value
});

  @override
  _EditableFormState createState() => _EditableFormState();
}

class _EditableFormState extends State<EditableForm> {

  TextEditingController nameController = TextEditingController();
  String UserName = '';
  String name;

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name',UserName);
  }

  Future<void> getDate() async{
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    getDate();
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: widget.value != null ? widget.value : "User name"
                  ),
                  onChanged: (text) {
                    setState(() {
                      UserName = text;
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //UserName = nameController.text;
                    });
                  },
                )),
            SizedBox(height: 15,),
            ElevatedButton(

                onPressed: (){
                  _incrementCounter();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      Home()), (Route<dynamic> route) => false);
                },
                child: Text('Save' , style: TextStyle(color: Colors.white),)
            ),
          ],
        ),
      ),
    );
  }
}
