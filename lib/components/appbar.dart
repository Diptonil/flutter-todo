import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo/services/database.dart';


class Appbar extends StatefulWidget implements PreferredSizeWidget {
  final Database database;

  const Appbar({super.key, required this.database});

  @override
  State<Appbar> createState() => _AppbarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<Appbar> {
  void handleClick(String value) {
    switch (value) {
      case "Clear All":
        setState(() {
          widget.database.addListener(() {
            widget.database.deleteAllTodos();
          });
        });
        break;
      case "Close":
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Tasks"),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Clear All', 'Close'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
