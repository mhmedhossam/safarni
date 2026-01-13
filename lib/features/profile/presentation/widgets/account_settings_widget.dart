import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:round_8_mobile_safarni_team3/features/profile/presentation/widgets/setting_item.dart';

class AccountSettingsWidget extends StatelessWidget {
  const AccountSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SettingsItem(
                title: 'Device Management',
                subtitle: 'Manage your account on the various devices you own.',
                onTap: () {
                  // Handle Device Management navigation
                  log('Device Management tapped');
                },
              ),
              const SizedBox(height: 16),
              SettingsItem(
                title: 'Deactivate Account',
                subtitle:
                    'Temporarily deactivate your account. Easily reactivate when you\'re ready.',
                onTap: () {
                  // Handle Deactivate Account navigation
                  log('Deactivate Account tapped');
                },
              ),
              const SizedBox(height: 16),
              SettingsItem(
                title: 'Delete Account',
                subtitle:
                    'Permanently remove your account and data from Tripmate. Proceed with caution.',
                titleColor: Colors.red,
                onTap: () {
                  // Handle Delete Account navigation
                  log('Delete Account tapped');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
