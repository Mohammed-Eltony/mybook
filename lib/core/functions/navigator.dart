import 'package:flutter/material.dart';

navTo(context, Widget newView) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newView,
  ));
}

navToReplacement(context, Widget newView) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => newView,
  ));
}

navToRemoveUntil(context, Widget NewScreen) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => NewScreen),
    (Route<dynamic> route) => false,
  );
}

navPop(context) {
  Navigator.pop(context);
}
