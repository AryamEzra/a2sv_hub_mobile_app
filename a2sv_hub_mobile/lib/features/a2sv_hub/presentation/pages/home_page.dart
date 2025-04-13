import 'package:a2sv_hub_mobile/features/auth/presentation/bloc/login/login_bloc.dart'; // Keep this if needed elsewhere or for status fallback
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:a2sv_hub_mobile/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/app_drawer.dart'; // Ensure AppDrawer widget is correctly imported

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return CommonAppBar(
                notificationCount: 3,
                profileImageUrl:
                    'https://example.com/profile.jpg', // Replace with actual image URL if available in state
                onMenuPressed: () => Scaffold.of(context).openDrawer(),
              );
            }
            // Provide a default AppBar during loading or error states
            return AppBar(
              title: Text("Loading..."),
              leading: IconButton(
                // Add a dummy leading icon if needed before drawer is ready
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
      ),
      // ****** CORRECTION IS HERE ******
      drawer: BlocBuilder<UserBloc, UserState>(
        // Use UserBloc here
        builder: (context, state) {
          if (state is UserLoaded) {
            // Ensure UserLoaded state has both name and accountStatus
            // If UserLoaded doesn't have accountStatus, you'll need to modify UserBloc
            // or find another way to get it (e.g., from SharedPreferences or LoginBloc if its state persists)
            debugPrint(
              "Drawer - Displaying Name: ${state.name}, Account Status: ${state.accountStatus}", // Make sure state.accountStatus exists!
            );
            return AppDrawer(
              userName: state.name,
              accountStatus:
                  state.accountStatus, // Make sure state.accountStatus exists!
            );
          } else {
            // Provide a default/loading drawer state
            return AppDrawer(
              userName:
                  "Loading...", // Or "Guest" if appropriate for initial/error state
              accountStatus: "...",
            );
          }
        },
      ),
      // ****** END OF CORRECTION ******
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return CircularProgressIndicator();
            } else if (state is UserLoaded) {
              debugPrint("HomePage Body - Displaying Name: ${state.name}");
              return Text(
                "Welcome, ${state.name}!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            } else if (state is UserError) {
              return Text(
                "Error: ${state.message}",
                style: TextStyle(color: Colors.red),
              );
            }
            // Initial state or other states
            return Text("Loading user data...");
          },
        ),
      ),
    );
  }
}

// Reminder: Your AppDrawer definition remains the same
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AppDrawer extends StatelessWidget {
//   final String userName;
//   final String accountStatus;

//   const AppDrawer({
//     super.key,
//     required this.userName,
//     required this.accountStatus,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//        child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//            UserAccountsDrawerHeader(
//              accountName: Text(userName), // Dynamic User Name
//              accountEmail: Text(accountStatus),
//              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
//              decoration: BoxDecoration(color: Colors.green),
//            ),
//            // ... other ListTile items ...
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () async {
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 await prefs.remove('username'); // Clear stored user (consider clearing other relevant data too)
//                 // Optionally dispatch a Logout event to your Auth/Login Bloc
//                 // context.read<LoginBloc>().add(LogoutEvent());
//                 Navigator.pushReplacementNamed(
//                   context,
//                   '/login',
//                 ); // Redirect to Login Page
//               },
//            ),
//          ],
//        ),
//      );
//    }
// }
