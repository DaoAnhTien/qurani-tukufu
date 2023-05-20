import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurani_tukufu/configs/build_config.dart';
import 'package:qurani_tukufu/configs/language_config.dart';
import 'package:qurani_tukufu/generated/l10n.dart';
import 'package:qurani_tukufu/modules/language/widgets/language_item.dart';
import 'package:qurani_tukufu/widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerApp(),
        appBar: AppBarUI(title: S.of(context).contactUs, isEnableDrawer: true)
            .build(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicButton(
                label: S.of(context).forEnquiries,
                width: double.infinity,
                onPressed: () {
                  _launchUrl(Uri.parse(
                      'mailto:${BuildConfig.kContactUsForEnquiries}'));
                },
              ),
              const SizedBox(height: 20),
              BasicButton(
                label: S.of(context).forTechnical,
                width: double.infinity,
                onPressed: () {
                  _launchUrl(Uri.parse(
                      'mailto:${BuildConfig.kContactUsForTechnical}'));
                },
              )
            ],
          ),
        ));
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
