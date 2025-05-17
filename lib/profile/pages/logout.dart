
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/auth/presentation/cubits/auth_cubit.dart';


class LogoutButton extends StatefulWidget {
  final void Function()? onTap;

  const LogoutButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LogoutButton> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutButton> {

  void logout(){

    final authCubit = context.read<AuthCubit>();

      authCubit.logout();
    }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: (){
                    logout();
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: ProfileAppColors.logout),
                  ),
                ),
              ],
            ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: ProfileAppColors.menuBackground,
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(double.infinity, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout_outlined,
              color: ProfileAppColors.logout,
              size: 24,
            ),
            SizedBox(width: 12),
            Text(
              'Logout',
              style: TextStyle(
                color: ProfileAppColors.logout,
                fontSize: 16,
                fontFamily: 'Sen',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}