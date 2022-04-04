import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Header',
              style: textTheme.headline6,
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Item 1'),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text('Item 2'),

          ),
          const ListTile(
            leading: Icon(Icons.label),
            title: Text('Item 3'),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Label',
            ),
          ),
          const ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Item A'),
          ),
        ],
      ),
    );
  }
}
