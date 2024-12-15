import 'package:flutter/material.dart';
import 'home.dart';
import 'comittee.dart';
import 'dashboard.dart';
void main() {
  runApp(const Event());
}

class Event extends StatelessWidget {
  const Event({Key? key}) : super(key: key);

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
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
        ),
      ),
      home: const SimulationEventPage(),
    );
  }
}

class SimulationEventPage extends StatefulWidget {
  const SimulationEventPage({Key? key}) : super(key: key);

  @override
  _SimulationEventPageState createState() => _SimulationEventPageState();
}

class _SimulationEventPageState extends State<SimulationEventPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
    if (_selectedIndex == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserDashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Simulation Models Event',
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
                'The Nexum Simulation Models: December 20–22, 2024',
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

            // Event Overview
            const Text(
              'Event Overview',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Delegates will participate in a three-day competitive simulation, solving real-world STEM challenges across 10 specialized committees. Showcase your skills, collaborate, and innovate!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Key Event Details
            const Text(
              'Key Event Details',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildEventDetailCard('Dates', 'December 20–22, 2024'),
            _buildEventDetailCard('Location', 'Virtual Event'),
            _buildEventDetailCard('Structure',
                'Delegate-led discussions and proposal drafting. Live evaluations and feedback by STEM experts. Prizes for best innovation and collaboration.'),
            const SizedBox(height: 30),

            // Committees and Agendas
            const Text(
              'Committees and Agendas',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildCommitteeCard(
              context,
              'United Nations Scientific Committee on the Effects of Atomic Radiation (UNSCEAR)',
              'Quantifying the Multi-Generational Health Impacts of Low-Dose Ionizing Radiation Exposure.',
            ),
            _buildCommitteeCard(
              context,
              'United Nations Committee on the Peaceful Uses of Outer Space (COPUOS)',
              'Developing a Comprehensive Legal Framework for Space Resource Utilization and Space Traffic Management.',
            ),
            _buildCommitteeCard(
              context,
              'United Nations Framework Convention on Climate Change (UNFCCC)',
              'Enhancing Nationally Determined Contributions (NDCs) to Limit Global Warming to 1.5°C and Achieving Carbon Neutrality.',
            ),
            // More committee cards here...

            const SizedBox(height: 30),

            // Registration Form
            const Text(
              'Registration Form',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildFormField('Full Name'),
            _buildFormField('Email'),
            _buildRoleDropdown(),
            _buildFormField('Institution/Organization'),
            _buildProfilePictureUpload(),
            const SizedBox(height: 10),
            CheckboxListTile(
              value: false,
              onChanged: (bool? value) {},
              title: const Text('I confirm all information provided is accurate.'),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDA9636)),
              child: const Text('Submit Registration', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF19284A),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedIndex,
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
        onTap: _onItemTapped,
      ),
    );
  }

  // Event detail card
  Widget _buildEventDetailCard(String title, String subtitle) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }

  // Committee card
  Widget _buildCommitteeCard(BuildContext context, String committeeName, String agenda) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Text(committeeName),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(agenda),
          ),
        ],
      ),
    );
  }

  // Form field
  Widget _buildFormField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }

  // Role dropdown
  Widget _buildRoleDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: DropdownButtonFormField<String>(
        items: const [
          DropdownMenuItem(child: Text('Delegate'), value: 'Delegate'),
          DropdownMenuItem(child: Text('Observer'), value: 'Observer'),
          DropdownMenuItem(child: Text('Mentor'), value: 'Mentor'),
        ],
        onChanged: (value) {},
        decoration: const InputDecoration(
          labelText: 'Role',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  // Profile picture upload widget
  Widget _buildProfilePictureUpload() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('Upload Profile Picture (Optional)', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
