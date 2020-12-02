import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Constant/Constant.dart';
import 'Screens/ProfilePage.dart';
import 'TodoModel.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        builder: (context) => TodoModel(),
        child: MyHomePage(),
      )

    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        /*backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Todo Application", style: TextStyle(color: Colors.white),),
        leading: IconButton(icon: Icon(Icons.menu, color: Colors.white70,), onPressed: () {  },),*/
        title: Text('My App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              Provider.of<TodoModel>(context).addTaskInList();

            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(

              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(60)), color: Colors.white),
              child: Consumer<TodoModel>(
                builder: (context, todo, child){
                  return ListView.builder(
                      itemCount: todo.taskList.length,
                      itemBuilder: (context, index){
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                            title: Text(todo.taskList[index].title, style : TextStyle(color: Colors.black87,
                                fontWeight: FontWeight.bold),),
                            subtitle: Text(todo.taskList[index].detail, style: TextStyle(color: Colors.black45,
                                fontWeight: FontWeight.bold),),

                            trailing: Icon(Icons.delete, color: Colors.black54,),
                            leading: Icon(Icons.person, color: Colors.black54,),
                          ),
                          margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                        );
                      }
                  );
                },
              )


            ),
          )

        ],
      ),



    );
  }
}

