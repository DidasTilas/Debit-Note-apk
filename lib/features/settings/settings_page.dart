import 'package:flutter/material.dart';
import '../../core/theme/denibook_theme.dart';
import '../screens/login_screen/login_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 12),
          _SettingTile(
            icon: Icons.storefront_outlined,
            title: 'Business Profile',
            onTap: () {},
          ),
          _SettingTile(
            icon: Icons.backup_outlined,
            title: 'Backup & Restore',
            onTap: () {},
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: DeniBookColors.surfaceCard,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode_outlined, color: DeniBookColors.yellow),
              title: const Text(
                'Appearance (Dark Mode)',
                style: TextStyle(color: DeniBookColors.textWhite, fontSize: 15),
              ),
              activeColor: DeniBookColors.yellow,
              value: _darkMode,
              onChanged: (val) => setState(() => _darkMode = val),
            ),
          ),
          _SettingTile(
            icon: Icons.attach_money_outlined,
            title: 'Currency',
            subtitle: 'TZS (Tanzania Shilling)',
            onTap: () {},
          ),
          _SettingTile(
            icon: Icons.info_outline,
            title: 'About App',
            onTap: () {},
          ),
          _SettingTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          _SettingTile(
            icon: Icons.logout,
            title: 'Logout',
            textColor: Colors.redAccent,
            iconColor: Colors.redAccent,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const DeniBookLoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;

  const _SettingTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: DeniBookColors.surfaceCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: iconColor ?? DeniBookColors.yellow),
        title: Text(
          title,
          style: TextStyle(
            color: textColor ?? DeniBookColors.textWhite,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle != null
            ? Text(subtitle!, style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 12))
            : null,
        trailing: Icon(Icons.chevron_right, color: textColor ?? DeniBookColors.textMuted),
      ),
    );
  }
}
