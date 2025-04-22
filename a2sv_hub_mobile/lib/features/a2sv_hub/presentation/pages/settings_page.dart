import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Notifications Toggle
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.green),
            title: const Text("Notifications"),
            trailing: Switch(
              value: true, // Replace with actual state
              onChanged: (value) {
                print("Notifications toggled: $value");
                // Add logic to handle notification toggle
              },
            ),
          ),
          const Divider(),
          // Theme Selection
          ListTile(
            leading: const Icon(Icons.color_lens, color: Colors.green),
            title: const Text("Theme"),
            trailing: DropdownButton<String>(
              value: "Light", // Replace with actual theme state
              items: const [
                DropdownMenuItem(value: "Light", child: Text("Light")),
                DropdownMenuItem(value: "Dark", child: Text("Dark")),
              ],
              onChanged: (value) {
                print("Theme changed to: $value");
                // Add logic to handle theme change
              },
            ),
          ),
          const Divider(),
          // Account Settings
          ListTile(
            leading: const Icon(Icons.person, color: Colors.green),
            title: const Text("Account Settings"),
            onTap: () {
              print("Account Settings tapped");
              // Add navigation to account settings page
            },
          ),
          const Divider(),
          // Privacy Policy
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.green),
            title: const Text("Privacy Policy"),
            onTap: () {
              print("Privacy Policy tapped");
              // Add navigation to privacy policy page
            },
          ),
          const Divider(),
          // Logout Button
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () {
              print("Logout tapped");
              // Add logout logic here
            },
          ),
        ],
      ),
    );
  }
}
