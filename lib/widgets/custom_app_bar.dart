import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/utils_functions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title; // ← 型を String → Widget に変更
  final bool showBackButton;
  final VoidCallback? onProfileIconPressed;
  final List<Widget>? actions;
  final Color statusBarColor;

  const CustomAppBar({
    Key? key,
    required this.title, // ← ここで String ではなく Widget を受け取る
    this.showBackButton = true,
    this.onProfileIconPressed,
    this.actions,
    this.statusBarColor = Colors.cyan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: DefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.bold, // デフォルトで太字
          color: Colors.black, // デフォルトで黒
          fontSize: 24, // 必要ならデフォルトサイズも指定
        ),
        child: title, // ここに渡された Text を適用
      ), // ← これでどんなウィジェットでも受け取れる
      centerTitle: true,

      leading: showBackButton
          ? IconButton(
              icon: Image.asset(
                'assets/images/Prev1.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
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
