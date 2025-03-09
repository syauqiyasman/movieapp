import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/providers/app_provider.dart';
import 'package:movieapp/widget/button.dart';
import 'package:movieapp/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class AboutMeForm extends StatefulWidget {
  final String fullname;
  final String nickname;
  final String hobbies;
  final String instagram;

  const AboutMeForm({
    super.key,
    this.fullname = "",
    this.nickname = "",
    this.hobbies = "",
    this.instagram = "",
  });

  @override
  State<AboutMeForm> createState() => _AboutMeFormState();
}

class _AboutMeFormState extends State<AboutMeForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _hobbiesController = TextEditingController();
  final _instagramController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullnameController.text = widget.fullname;
    _nicknameController.text = widget.nickname;
    _hobbiesController.text = widget.hobbies;
    _instagramController.text = widget.instagram;
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          CustomTextField(
            controller: _fullnameController,
            hintText: "e.g. Syauqi Yasman",
            labelText: "Fullname",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Fullname cannot be null!";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _nicknameController,
            hintText: "e.g. syauqiyasman",
            labelText: "Nickname",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Nickname cannot be null!";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _hobbiesController,
            hintText: "e.g. Playing game",
            labelText: "Hobbies",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Hobbies cannot be null!";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: _instagramController,
            hintText: "e.g. syauqiyasman",
            labelText: "Instagram",
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Instagram cannot be null!";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Button(
            label: "Save",
            icon: Icons.save,
            onPressed: () {
              HapticFeedback.lightImpact();
              _onSubmit(context, appProvider);
            }
          ),
        ],
      ),
    );
  }

  void _onSubmit(BuildContext context, AppProvider appProvider) async {
    if (_formKey.currentState?.validate() ?? false) {
      String fullname = _fullnameController.text;
      String nickname = _nicknameController.text;
      String hobbies = _hobbiesController.text;
      String instagram = _instagramController.text;

      appProvider.fullname = fullname;
      appProvider.nickname = nickname;
      appProvider.hobbies = hobbies;
      appProvider.instagram = instagram;

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Success!"),
          ),
        );
      }
    }
  }
}
