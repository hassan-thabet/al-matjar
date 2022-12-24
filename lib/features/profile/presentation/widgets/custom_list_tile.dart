import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap;

  const CustomListTile(this.leadingIcon, this.title, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(
        leadingIcon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 12,
        color: Theme.of(context).indicatorColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: onTap,
    );
  }
}
