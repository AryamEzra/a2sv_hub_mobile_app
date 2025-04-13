import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String accountStatus;

  const AppDrawer({
    super.key,
    required this.userName,
    required this.accountStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName), // Dynamic User Name
            accountEmail: Text(accountStatus),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Tracks'),
            onTap: () => Navigator.pushReplacementNamed(context, '/tracks'),
          ),
          ListTile(
            leading: Icon(Icons.lightbulb_outline),
            title: Text('Problems'),
            onTap: () {
              print("Problems selected");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Roadmap'),
            onTap: () {
              print("Roadmap selected");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Users'),
            onTap: () {
              print("Users selected");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Groups'),
            onTap: () {
              print("Groups selected");
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('username'); // Clear stored user
              Navigator.pushReplacementNamed(
                context,
                '/login',
              ); // Redirect to Login Page
            },
          ),
        ],
      ),
    );
  }
}
