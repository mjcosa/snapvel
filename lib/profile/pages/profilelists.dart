import 'package:flutter/material.dart';
import 'package:travel_app/theme/main_theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  final Color? textColor;

  const ProfileMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.textColor,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: ProfileAppColors.menuBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: icon),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 16,
                      color: textColor ?? ProfileAppColors.text,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: ProfileAppColors.secondaryText,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
