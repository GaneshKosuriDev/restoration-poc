import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget{
  const SecondScreen({Key? key}):super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();

}


class _SecondScreenState extends State<SecondScreen> with RestorationMixin{
  RestorableTextEditingController _professionController = RestorableTextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Screen 2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
            children: [
              TextField(
                controller: _professionController.value,
                decoration: InputDecoration(hintText: 'Profession'),
              )
            ],
          ),
        )
      ),
    );
  }

  @override
  String? get restorationId => 'second_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_professionController, 'profession');
  }

}