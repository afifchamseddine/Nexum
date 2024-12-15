import 'package:flutter/material.dart';
import 'event.dart'; // Import Event.dart for navigation
import 'comittee.dart';
import 'dashboard.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Function to handle bottom navigation item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to event page when 'Search' is tapped (index 1)
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Event()),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CommitteesPage()),
      );
    }
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserDashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Make the content scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Welcome User',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                textAlign: TextAlign.left,
              ),
            ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF19284A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Your STEM Journey Starts Here',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),

            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),

            const Text(
              'Access resources, stay updated, and connect with the global STEM community.',
              style: TextStyle(fontSize: 16, color: Color(0xFFDA9636)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Latest from The STEMinist Blog Card
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: const Text('Latest from The STEMinist Blog'),
                subtitle: const Text(
                  'Check out the latest articles and updates from The STEMinist blog.',
                ),
                trailing: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color(0xFFDA9636),
                  ),
                  onPressed: () {
                    // Add navigation to blog page or URL
                  },
                  child: const Text('Read More'),
                ),
              ),
            ),

            // Upcoming Event Card
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: const Text('Upcoming Event: The Nexum Simulation Models'),
                subtitle: const Text('Dec 20-22'),
                trailing: Container(
                  height: 120,
                  width: 150,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: const Color(0xFFDA9636),
                          ),
                          onPressed: () {
                            // Add navigation to event details page
                          },
                          child: const Text('Learn More'),
                        ),
                        const SizedBox(height: 6),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: const Color(0xFFDA9636),
                          ),
                          onPressed: () {
                            // Add event registration functionality
                          },
                          child: const Text('Register Now'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Quick Links Section
            const SizedBox(height: 30),
            const Text(
              'Quick Links',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: const Text('Committees & Agendas'),
                onTap: () {
                  // Add navigation to committees and agendas page
                },
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: const Text('Resources'),
                onTap: () {
                  // Add navigation to resources page
                },
              ),
            ),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: const Text('Contact Us'),
                onTap: () {
                  // Add navigation to contact page
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF19284A),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.blueGrey,
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
        onTap: _onItemTapped, // Handle bottom nav item taps
      ),
    );
  }
}
