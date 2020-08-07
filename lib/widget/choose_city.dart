import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCityWidget extends StatefulWidget {
  @override
  _ChooseCityWidgetState createState() => _ChooseCityWidgetState();
}

class _ChooseCityWidgetState extends State<ChooseCityWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Seç"),
      ),
      body: Form(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: "Şehir",
                      hintText: "Şehir Seçin",
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.search),onPressed: (){
              Navigator.pop(context,_textController.text);
            },)
          ],
        ),
      ),
    );
  }
}
