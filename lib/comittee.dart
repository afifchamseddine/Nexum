import 'package:flutter/material.dart';
import 'package:globalstemnexus/home.dart';
import 'dashboard.dart';
import 'event.dart';

void main() {
  runApp(const CommitteesPage());
}

class CommitteesPage extends StatelessWidget {
  const CommitteesPage({Key? key}) : super(key: key);

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
      home: const CommitteesPageBody(),
    );
  }
}

class CommitteesPageBody extends StatefulWidget {
  const CommitteesPageBody({Key? key}) : super(key: key);

  @override
  _CommitteesPageBodyState createState() => _CommitteesPageBodyState();
}

class _CommitteesPageBodyState extends State<CommitteesPageBody> {
  int _selectedIndex = 2;

  // Function to handle navigation based on the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    // Navigate to other pages based on the index
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Committees Header
            const Text(
              'Explore Our Committees and Their Agendas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            // Expandable Cards for Committees
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
            _buildCommitteeCard(
              context,
              'United Nations Industrial Development Organization (UNIDO)',
              'Leveraging Industry 4.0 Technologies for Sustainable Manufacturing and Decentralized Renewable Energy.',
            ),
            _buildCommitteeCard(
              context,
              'World Health Organization (WHO)',
              'Strengthening Health Systems Resilience in the Face of Global Health Security Threats and Zoonotic Disease Emergence.',
            ),
            _buildCommitteeCard(
              context,
              'United Nations Environment Programme (UNEP)',
              'Implementing a Global Framework for Circular Economy Practices and Eliminating Persistent Organic Pollutants (POPs).',
            ),
            _buildCommitteeCard(
              context,
              'United Nations Educational, Scientific and Cultural Organization (UNESCO)',
              'Preserving World Heritage Sites and Intangible Cultural Heritage in the Context of Climate-Induced Disasters.',
            ),
            _buildCommitteeCard(
              context,
              'International Telecommunication Union (ITU)',
              'Fostering International Collaboration in Quantum Communication Research and Secure 6G Network Development.',
            ),
            _buildCommitteeCard(
              context,
              'Food and Agriculture Organization (FAO)',
              'Adopting Climate-Resilient Agroecological Practices to Ensure Global Food Security and Biodiversity Conservation.',
            ),
            _buildCommitteeCard(
              context,
              'World Meteorological Organization (WMO)',
              'Advancing Earth System Predictability and Ensemble Forecasting for Extreme Weather Event Preparedness.',
            ),
          ],
        ),
      ),
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

  // Build an expandable card for each committee
  Widget _buildCommitteeCard(BuildContext context, String committeeName, String agenda) {
    return Card(
      elevation: 5,
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
}
