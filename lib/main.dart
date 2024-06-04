import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './question1/manual_modeling.dart';
import './question1/json_serializable.dart';
import './question1/ai_modeling.dart';
import './question1/freezed.dart';
import 'question2/lazy_loading.dart';
import 'question3/get_user.dart';
import './user_screen.dart';
import './list_screen.dart';
import 'dart:convert';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/*
mulham
i have written this code just for test 
and i have written it quickly
*/
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget customContainer({required Color color, required String text}) =>
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(5),
        child: Center(child: Text(text)),
      );
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _index == 2
            ? ListView.builder(
                itemBuilder: (context, _index) => InkWell(
                    onTap: () {
                      final user = UsersInfo.getInstance().getUserIfno(_index);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => User(
                                firstName: user['first_name'],
                                lastName: user['last_name'],
                                image: user['image'],
                                about: user['about']),
                          ));
                    },
                    child:
                        customContainer(color: Colors.blue, text: "$_index")),
                itemCount: 11,
              )
            : _index == 1
                ? ListView.builder(
                    itemBuilder: (context, _index) => InkWell(
                        onTap: () async {
                          var temp;
                          if (_index == 2) {
                            temp =
                                await LazyLoading.getInstance().loadLanguages();
                          }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            if (_index == 0) {
                              return ListScreen(
                                  list:
                                      LazyLoading.getInstance().loadCategories);
                            }
                            if (_index == 1) {
                              return ListScreen(
                                  list: LazyLoading.getInstance().loadVenues);
                            }
                            return ListScreen(list: temp);
                          }));
                        },
                        child: customContainer(
                            color: Colors.red,
                            text: _index == 0
                                ? "categories"
                                : _index == 1
                                    ? "venues"
                                    : "languages")),
                    itemCount: 3,
                  )
                : ListView.builder(
                    itemBuilder: (context, _index) => InkWell(
                        onTap: () async {
                          final file = jsonDecode(
                              await rootBundle.loadString("assets/test1.json"));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ListScreen(list: [
                              jsonEncode(_index == 0
                                  ? Manual.fromJson(file).toJson()
                                  : _index == 1
                                      ? QuickType.fromJson(file).toJson()
                                      : _index == 2
                                          ? Serializable.fromJson(file).toJson()
                                          : Freeze.fromJson(file).toJson()),
                              _index == 0
                                  ? Manual.fromJson(file)
                                      .company
                                      .localTimeWithFormat
                                  : _index == 1
                                      ? QuickType.fromJson(file)
                                          .company
                                          .localTimeWithFormat
                                      : _index == 2
                                          ? Serializable.fromJson(file)
                                              .company
                                              .localTimeWithFormat
                                          : Freeze.fromJson(file)
                                              .company
                                              .localTimeWithFormat
                            ]);
                          }));
                        },
                        child: customContainer(
                            color: Colors.green,
                            text: _index == 0
                                ? "manual"
                                : _index == 1
                                    ? "ai"
                                    : _index == 2
                                        ? "jsonSerializable"
                                        : "freezed")),
                    itemCount: 4,
                  ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          indicatorColor: Colors.green,
          onDestinationSelected: (value) {
            setState(() {
              _index = value;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.info), label: "model"),
            NavigationDestination(icon: Icon(Icons.list), label: "Lists"),
            NavigationDestination(icon: Icon(Icons.person), label: "Users"),
          ],
        ),
      ),
    );
  }
}
