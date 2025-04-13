// lib/common_app_bar.dart (or lib/presentation/widgets/common_app_bar.dart)

import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount;
  final String profileImageUrl;
  final VoidCallback? onMenuPressed; // Callback for the menu icon
  final VoidCallback? onSearchPressed;
  final VoidCallback? onSparklePressed;
  final VoidCallback? onNotificationPressed;
  // Add callbacks for other buttons if needed

  const CommonAppBar({
    super.key,
    required this.notificationCount,
    required this.profileImageUrl,
    this.onMenuPressed, // Use this for opening the drawer
    this.onSearchPressed,
    this.onSparklePressed,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      // Use the leading property for the menu button
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black54),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      // Title can be used for centered content if needed, otherwise leave null
      // title: Text("Page Title"), // Example if you needed a title
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black54),
          onPressed:
              onSearchPressed ??
              () {
                print("Search pressed (default)");
              },
          tooltip: "Search", // Accessibility
        ),
        IconButton(
          icon: const Icon(Icons.auto_awesome, color: Colors.orangeAccent),
          onPressed:
              onSparklePressed ??
              () {
                print("Sparkle pressed (default)");
              },
          tooltip: "Sparkle", // Accessibility
        ),
        // Removed the large fixed SizedBox(width: 133) - let elements flow naturally
        const SizedBox(width: 8), // Consistent spacing
        // Notification Icon with Badge
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black54),
              onPressed:
                  onNotificationPressed ??
                  () {
                    print("Notification pressed (default)");
                  },
              tooltip: "Notifications", // Accessibility
            ),
            if (notificationCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 8), // Spacing before profile
        // Profile Picture Area
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(profileImageUrl),
                backgroundColor: Colors.grey[200], // Fallback color
                // Optional: Handle image loading errors
                onBackgroundImageError: (exception, stackTrace) {
                  print("Error loading profile image: $exception");
                  // You could show a placeholder icon here if the image fails
                },
                child:
                    profileImageUrl
                            .isEmpty // Show placeholder if URL is empty
                        ? const Icon(Icons.person, color: Colors.grey)
                        : null,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green, // Online indicator
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      // DO NOT PUT THE DRAWER HERE
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
