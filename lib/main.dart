import 'package:flutter/material.dart';

import 'second_screen.dart';

void main() => runApp(RootRestorationScope(restorationId: 'root', child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Give your RootRestorationScope an id, defaults to null.
      restorationScopeId: 'root',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Our state should be mixed-in with RestorationMixin
class _HomePageState extends State<HomePage> with RestorationMixin {

  RestorableTextEditingController _firstNameController = RestorableTextEditingController();
  RestorableBool isChecked = RestorableBool(false);


  @override
  void initState(){
    super.initState();
  }

  static Route<void> _secondScreenNavigation(context, arguments) => MaterialPageRoute(builder: (context)=>SecondScreen());

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('State Restoration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _firstNameController.value,
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                Row(
                  children: <Widget>[
                    Text('Is Developer'),
                    Checkbox(value: isChecked.value, onChanged: (newValue){
                      setState(() {
                        isChecked.value = newValue ?? false;
                      });
                    }

                    )
                  ],
                ),
                MaterialButton(
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    Navigator.restorablePush(context,_secondScreenNavigation);
                  },
                  child: Text(
                    'Second Screen',
                    style: TextStyle(color: Colors.white),
                  ),

                )
              ],
            ),
          ),
        ),
        
      ),
    );
  }

  @override
  // TODO: implement restorationId
  String? get restorationId => 'home_Screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_firstNameController, 'first_name');
    registerForRestoration(isChecked, 'is_developer');
  }

  }