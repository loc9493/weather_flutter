import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/city_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        builder: (context) => CityModel(),
        child: MyHomePage(
          title: 'best',
        ),
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<CityModel>(builder: (context, model, _) {
                  if (model.city != null) {
                    return Text("${model.city.name}");
                  }
                  return Text("Please Input City Name");
                }),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "City, Country"),
                  onSubmitted: (text) {},
                  onChanged: (text) {
                    Provider.of<CityModel>(context).textDidChange(text);
                    // print("Hell");
                  },
                  onTap: () {
                    Provider.of<CityModel>(context).didSelectTextField();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
