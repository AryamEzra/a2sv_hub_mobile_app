import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final String quote;
  final String author;
  final String username;
  final VoidCallback onProblemsPressed; // Callback for the button press

  const WelcomeCard({
    super.key, // Use super parameters
    required this.quote,
    required this.author,
    required this.username,
    required this.onProblemsPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Define colors (you might want to move these to a central theme/constants file later)
    const cardBackgroundColor = Color(
      0xFFE0F2E9,
    ); // Adjust the green shade as needed
    const buttonColor = Color(0xFF008037); // Adjust the green shade as needed
    const textColor = Colors.black87; // Adjust text color as needed

    return Card(
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust corner radius
      ),
      elevation: 2.0, // Optional: Add a slight shadow
      margin: const EdgeInsets.all(16.0), // Add margin around the card
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ), // Inner padding
        child: Column(
          mainAxisSize: MainAxisSize.min, // Take minimum space needed
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center items horizontally
          children: [
            // Quote Text
            Text(
              '"$quote"', // Add quotes
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500, // Slightly bolder
                color: textColor,
              ),
            ),
            const SizedBox(height: 8.0), // Spacing
            // Author Text
            Text(
              "— $author",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14.0, color: textColor),
            ),
            const SizedBox(height: 24.0), // More spacing
            // Welcome Message
            Text(
              "Welcome back,\n$username!", // Added newline for potential wrapping
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 24.0), // Spacing before button
            // Problems Button
            ElevatedButton(
              onPressed: onProblemsPressed, // Use the callback function
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor, // Button background color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 12.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ), // Button corner radius
                ),
              ),
              child: const Text('Problems', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
