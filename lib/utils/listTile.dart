import 'package:flutter/material.dart';

class listTile extends StatelessWidget {
  const listTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/card_pic.png"),
      title: const Text(
        "ArticleTitle",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "Article excerpt description that runs two lines long shown here.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
