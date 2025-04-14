// tracks_page.dart
import 'package:a2sv_hub_mobile/core/routes/app_routes.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/app_drawer.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/common_app_bar.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/progress_card.dart';
import 'package:a2sv_hub_mobile/features/a2sv_hub/presentation/widgets/stats_card.dart';
import 'package:a2sv_hub_mobile/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Import the new AppBar widget // Adjust path if needed

class TracksPage extends StatefulWidget {
  const TracksPage({super.key});

  @override
  State<TracksPage> createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> {
  final int notificationCount = 8; // Data lives here
  final String profileImageUrl =
      'https://via.placeholder.com/150/92c952'; // Data lives here

  // Define callback functions for AppBar actions (optional)
  void _handleMenuPress() {
    Scaffold.of(context).openDrawer();
    // Add actual logic here
  }

  void _handleSearchPress() {
    print("Search button pressed (handled in TracksPage)");
    // Add actual logic here
  }

  void _handleSparklePress() {
    print("Sparkle button pressed (handled in TracksPage)");
    // Add actual logic here
  }

  void _handleNotificationPress() {
    print("Notification button pressed (handled in TracksPage)");
    // Add actual logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replace the old AppBar definition with the new widget
      appBar: CommonAppBar(
        notificationCount: notificationCount, // Pass the data
        profileImageUrl: profileImageUrl, // Pass the data
        onMenuPressed: _handleMenuPress, // Pass the callback function
        onSearchPressed: _handleSearchPress, // Pass the callback function
        onSparklePressed: _handleSparklePress,
        onNotificationPressed: _handleNotificationPress,
        // Pass other callbacks if defined
      ),
      drawer: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            debugPrint(
              "Drawer - Displaying Name: ${state.name}, Account Status: ${state.accountStatus}",
            );
            return AppDrawer(
              userName: state.name,
              accountStatus: state.accountStatus,
            );
          } else {
            return AppDrawer(userName: "Loading...", accountStatus: "...");
          }
        },
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: <Widget>[
          Text(
            "Tracks",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Text(
            "All",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
          ),
          const SizedBox(height: 20.0),

          // Add Navigation to Progress Card
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.trackDetails,
              ); // ✅ Use AppRoutes
            },
            child: const ProgressCard(),
          ),
          const SizedBox(height: 16.0),

          // Add Navigation to Stats Card
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.statsDetails,
              ); // ✅ Use AppRoutes
            },
            child: const StatsCard(),
          ),
        ],
      ),
    );
  }
}
