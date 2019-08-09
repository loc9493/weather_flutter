import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/view_model/city_model.dart';

class AutoCompleteTextField extends StatefulWidget {
  AutoCompleteTextField({Key key}) : super(key: key);

  _AutoCompleteTextFieldState createState() => _AutoCompleteTextFieldState();
}

class _AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
  final FocusNode _focusNode = FocusNode();
  OverlayEntry _overlayEntry;
  final LayerLink layerLink = LayerLink();
  City city;
  @override
  void initState() {
    _focusNode.addListener(() {
      print(_focusNode.hasFocus.toString());
      if (_focusNode.hasFocus) {
        this._overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });

    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    print("OverlayEntry: " + context.toString());
    return OverlayEntry(builder: (context1) {
      print("OverlayEntry111: " + context1.toString());

      return Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: Offset(0, size.height + 5.0),
          child: Text(city.name),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print("StateFulContext: " + context.toString());
    var model = Provider.of<CityModel>(context);
    print("StateFulContext: " + model.city.name);
    setState(() {
      city = model.city;
    });
    return Container(
      child: CompositedTransformTarget(
        link: layerLink,
        child: TextField(
          focusNode: _focusNode,
          decoration: InputDecoration(labelText: "City, Country"),
          onSubmitted: (text) {},
          onChanged: (text) {
            Provider.of<CityModel>(context).textDidChange(text);
          },
          onTap: () {
            Provider.of<CityModel>(context).didSelectTextField();
          },
        ),
      ),
    );
  }
}
