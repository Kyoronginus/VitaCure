import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool showBackButton;
  final VoidCallback? onProfileIconPressed;
  final List<Widget>? actions;
  final Color statusBarColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.onProfileIconPressed,
    this.actions,
    this.statusBarColor = Colors.cyan, // Default status bar color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the status bar color when the AppBar is built
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor, // Cyan status bar
      statusBarIconBrightness:
          Brightness.dark, // Dark icons for better contrast
    ));

    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: Image.asset(
                'assets/images/Prev1.png', // Ensure the path is correct
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      title: title,
      backgroundColor: Colors.white, // Keep AppBar background white
      actions: actions ??
          [
            if (onProfileIconPressed != null)
              IconButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.cyan,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                onPressed: onProfileIconPressed,
              ),
          ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
