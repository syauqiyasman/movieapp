import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/providers/app_provider.dart';
import 'package:movieapp/widget/about_me_form.dart';
import 'package:movieapp/widget/button.dart';
import 'package:provider/provider.dart';

class AboutMeDetails extends StatelessWidget {
  const AboutMeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56.0),
          Text(
            appProvider.fullname,
            style: const TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          Text(
            appProvider.nickname,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8.0),
          Text(
            "Hobbies: ${appProvider.hobbies}",
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Icon(Icons.group, color: Colors.grey[600]),
              const SizedBox(width: 4.0),
              Text(
                "@${appProvider.instagram}",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Button(
            label: "Edit Profile",
            icon: Icons.edit,
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(),
                    body: AboutMeForm(
                      fullname: appProvider.fullname,
                      nickname: appProvider.nickname,
                      hobbies: appProvider.hobbies,
                      instagram: appProvider.instagram,
                    ),
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
