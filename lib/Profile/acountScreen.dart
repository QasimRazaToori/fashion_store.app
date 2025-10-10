import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Handle edit action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/profile.jpg'), // Replace with your image
            ),
            const SizedBox(height: 10),
            const Text('JohnDoe123',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('johndoe@example.com',
                style: TextStyle(color: Colors.grey)),
            const Divider(height: 30),
            _buildInfoTile('Full Name', 'John Doe'),
            _buildInfoTile('Phone Number', '+92 300 1234567'),
            _buildInfoTile('Date of Birth', '10 Oct 1990'),
            _buildInfoTile('Address', 'Peshawar, Pakistan'),
            const Divider(height: 30),
            _buildSettingsTile(Icons.lock, 'Change Password'),
            _buildSettingsTile(Icons.email, 'Update Email'),
            _buildSettingsTile(Icons.devices, 'Manage Devices'),
            _buildSettingsTile(Icons.language, 'Language Preferences'),
            const Divider(height: 30),
            _buildInfoTile('Plan', 'Premium'),
            _buildInfoTile('Renewal Date', '10 Nov 2025'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Upgrade')),
                OutlinedButton(onPressed: () {}, child: const Text('Cancel')),
              ],
            ),
            const Divider(height: 30),
            _buildSettingsTile(Icons.help, 'Help Center'),
            _buildSettingsTile(Icons.phone, 'Contact Us'),
            _buildSettingsTile(Icons.description, 'Terms & Privacy'),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Handle logout
              },
              icon: const Icon(Icons.logout),
              label: const Text('LOG OUT'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return ListTile(
      title: Text(title),
      subtitle: Text(value),
    );
  }

  Widget _buildSettingsTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle navigation
      },
    );
  }
}
