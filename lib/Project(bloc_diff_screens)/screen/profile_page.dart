import 'package:flutter/material.dart';
import '../models/login_model.dart';


class ProfileScreen extends StatelessWidget {
  final LoginModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.2,
                    width: size.height * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/profile_image.webp"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "XYZ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "xyz123@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildInfoTile(
                    icon: Icons.phone,
                    title: "Phone",
                    value: "+91 9876543210",
                  ),
                  const SizedBox(height: 10),
                  _buildInfoTile(
                    icon: Icons.location_on,
                    title: "Address",
                    value: "New Delhi, India",
                  ),
                  const SizedBox(height: 10),
                  _buildInfoTile(
                    icon: Icons.work_outline,
                    title: "Occupation",
                    value: "Flutter Developer",
                  ),
                  const SizedBox(height: 10),
                  _buildInfoTile(
                    icon: Icons.calendar_today,
                    title: "Joined",
                    value: "Oct 2024",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.deepPurple.withOpacity(0.1),
            child: Icon(icon, color: Colors.deepPurple),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, color: Colors.black54)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
