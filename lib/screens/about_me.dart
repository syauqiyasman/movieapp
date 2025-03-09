import 'package:flutter/material.dart';
import 'package:movieapp/providers/app_provider.dart';
import 'package:movieapp/widget/about_me_details.dart';
import 'package:movieapp/widget/about_me_form.dart';
import 'package:provider/provider.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: appProvider.fullname == ""
        ? AboutMeForm()
          :
          AboutMeDetails()
    );
  }
}
