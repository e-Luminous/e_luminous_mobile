import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Widget buildListTile(
      {String title,
        IconData icon,
        BuildContext context,
        Function tapHandler}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Sans',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.only(top: 25.0, left: 15.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'eLuminous 2.0',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Colors.white,
                fontFamily: 'Righteous',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
