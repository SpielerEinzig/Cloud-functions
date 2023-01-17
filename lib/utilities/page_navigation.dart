import 'package:flutter/material.dart';

class PageNavigation {
  pushPage({required context, required Widget destination}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  replacePage({required context, required Widget destination}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }
}
