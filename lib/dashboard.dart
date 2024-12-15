import 'package:flutter/material.dart';

import 'comittee.dart';
import 'event.dart';
import 'home.dart';

void main() {
  runApp(const UserDashboardPage());
}

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  int _selectedIndex = 3;  // Track the selected index for BottomNavigationBar

  // Function to handle item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate based on the selected index
    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CommitteesPage()),
      );
    }
    if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Event()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF19284A),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF19284A),
          secondary: const Color(0xFFDA9636),
        ),
      ),
      home: UserDashboardPageBody(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class UserDashboardPageBody extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const UserDashboardPageBody({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0), // Top and bottom padding for AppBar title
          child: const Text(
            'Welcome, [User Name]!',  // User name can be dynamically inserted
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF19284A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // User Activity Section
            const Text(
              'Your Activity',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildActivityItem('Registered for Simulation Models 2024'),
            _buildActivityItem('Downloaded: Circular Economy Guide'),
            const SizedBox(height: 20),

            // Saved Resources Section
            const Text(
              'Saved Resources',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildResourceItem('Circular Economy Guide - Read Later'),
            _buildResourceItem('Sustainable Development Paper - Bookmarked'),
            const SizedBox(height: 20),

            // Notifications Section
            const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildNotificationItem('New updates available for Simulation Models 2024'),
            _buildNotificationItem('Reminder: Circular Economy Guide expires in 3 days'),
          ],
        ),
      ),
      // Add the BottomNavigationBar here
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF19284A),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: selectedIndex,  // Bind it with selectedIndex
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: onItemTapped,  // Handle item tap
      ),
    );
  }

  // Build a widget for an activity item
  Widget _buildActivityItem(String activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        activity,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  // Build a widget for a saved resource item
  Widget _buildResourceItem(String resource) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        resource,
        style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
      ),
    );
  }

  // Build a widget for a notification item
  Widget _buildNotificationItem(String notification) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        notification,
        style: const TextStyle(fontSize: 16, color: Colors.redAccent),
      ),
    );
  }
}
