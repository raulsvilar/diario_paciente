import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.time,
    required this.subtitle,
    required this.onPressedDelete,
    required this.onTapped,
  }) : super(key: key);

  final TimeOfDay time;
  final String subtitle;
  final VoidCallback onPressedDelete;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        onTap: onTapped,
        trailing: IconButton(
            onPressed: onPressedDelete,
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            )),
        contentPadding: const EdgeInsets.all(16),
        title: Text(time.format(context)),
        subtitle: Text(
          subtitle,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
