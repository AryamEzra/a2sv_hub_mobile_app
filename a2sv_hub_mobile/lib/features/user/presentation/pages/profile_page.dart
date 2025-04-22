import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String profileImageUrl =
      "https://via.placeholder.com/150"; // Replace with actual image URL
  final String userName = "John Doe"; // Replace with actual user name
  final String userEmail =
      "johndoe@example.com"; // Replace with actual user email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileImageUrl),
              backgroundColor: Colors.grey[200],
              onBackgroundImageError: (exception, stackTrace) {
                print("Error loading profile image: $exception");
              },
              child:
                  profileImageUrl.isEmpty
                      ? const Icon(Icons.person, size: 50, color: Colors.grey)
                      : null,
            ),
            const SizedBox(height: 16.0),
            // User Name
            Text(
              userName,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            // User Email
            Text(
              userEmail,
              style: const TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 24.0),
            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {
                print("Edit Profile button pressed");
                // Add navigation to Edit Profile page here
              },
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Logout Button
            OutlinedButton.icon(
              onPressed: () {
                print("Logout button pressed");
                // Add logout logic here
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
