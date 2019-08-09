import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/city_model.dart';
import 'package:weather_app/widget/autocomplete_textfield.dart';
import 'package:weather_app/widget/city_cell.dart';

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
        appBar: AppBar(
          title: Text("Weather App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "City, Country"),
                onSubmitted: (text) {
                  Provider.of<CityModel>(context).textDidChange(text);
                },
                onChanged: (text) {
                  Provider.of<CityModel>(context).textDidChange(text);
                },
                onTap: () {
                  Provider.of<CityModel>(context).didSelectTextField();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<CityModel>(
                builder: (context, model, _) {
                  if (model.items.isEmpty) {
                    return Text("Please input city name");
                  }
                  return Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CityCell(model.items[index]);
                    },
                    itemCount: model.items.length,
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
