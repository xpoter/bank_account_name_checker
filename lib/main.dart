import 'package:bvn_lookup/controllers/dropdown_controller.dart';
import 'package:bvn_lookup/services/api_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final JsonReader jsonReader = JsonReader();
    return Scaffold(
      backgroundColor: Color(0xFFFafafa),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
            ),
            child: Center(
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Search Account",
                          suffixIcon: Icon(
                            Icons.search_off_outlined,
                            size: 30,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //dropdown for bank code

          SizedBox(
            height: 100,
            width: 300,
            child: FutureBuilder(
                future: jsonReader.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Map<String, dynamic>> data = snapshot.data as List<Map<String, dynamic>>;
                    List<String> names = data.map((item) => item['name'] as String).toList();
                    return  SizedBox(
                      width: 300,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 0.0, right: 0.0, bottom: 8, top: 0),
                        child: DropDownFancy(items: names),
                      ),
                    );

                  }
                }),
          ),

          //
          Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'LookUo',
                  style: TextStyle(color: Colors.white70),
                )),
          )
        ],
      ),
    );
  }
}
