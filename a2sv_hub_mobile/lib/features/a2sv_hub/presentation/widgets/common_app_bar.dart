import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/bloc/common_app_bar/common_app_bar_bloc.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/pages/settings_page.dart';
import 'package:a2sv_hub_mobile/features/user/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String profileImageUrl;

  const CommonAppBar({super.key, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommonAppBarBloc()..add(FetchUserEmail()),
      child: BlocBuilder<CommonAppBarBloc, CommonAppBarState>(
        builder: (context, state) {
          return AppBar(
            backgroundColor: Colors.white,
            elevation: 1.0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black54),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black54),
                onPressed: () {
                  print("Search pressed");
                },
                tooltip: "Search",
              ),
              const SizedBox(width: 125),
              IconButton(
                icon: const Icon(
                  Icons.auto_awesome,
                  color: Colors.orangeAccent,
                ),
                onPressed: () {
                  print("Sparkle pressed");
                },
                tooltip: "Sparkle",
              ),
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      print("Notification pressed");
                    },
                    tooltip: "Notifications",
                  ),
                  if (state.notificationCount > 0)
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
                          '${state.notificationCount}',
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
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == "Home") {
                      try {
                        Navigator.pushNamed(
                          context,
                          '/home',
                        ); // Ensure route exists
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error navigating to home: $e'),
                          ),
                        );
                      }
                    } else if (value == "Profile") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    } else if (value == "Settings") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    } else if (value == "Sync leetcode") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error syncing leetcode')),
                      );
                    } else if (value == "Logout") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Logout'),
                            content: const Text(
                              'Are you sure you want to logout?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Logout'),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.remove('username');
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/login',
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<String>>[
                        // Email displayed above the Home button
                        PopupMenuItem<String>(
                          value: "EmailDisplay",
                          enabled: false, // Non-clickable
                          child: Text(
                            state.userEmail ?? "Loading...",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const PopupMenuDivider(),
                        PopupMenuItem<String>(
                          value: "Home",
                          child: Text("Home"),
                        ),

                        PopupMenuItem<String>(
                          value: "Profile",
                          child: Text("Profile"),
                        ),
                        PopupMenuItem<String>(
                          value: "Settings",
                          child: Text("Settings"),
                        ),
                        const PopupMenuDivider(),
                        PopupMenuItem<String>(
                          value: "Sync leetcode",
                          child: Text("Sync leetcode"),
                        ),
                        const PopupMenuDivider(),
                        PopupMenuItem<String>(
                          value: "Logout",
                          child: Text(
                            "Logout",
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(profileImageUrl),
                          backgroundColor: Colors.grey[200],
                          onBackgroundImageError: (exception, stackTrace) {
                            print("Error loading profile image: $exception");
                          },
                          child:
                              profileImageUrl.isEmpty
                                  ? const Icon(Icons.person, color: Colors.grey)
                                  : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.green, // Online indicator color
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ), // Border around the circle
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
