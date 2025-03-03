import 'package:flutter/material.dart';
import 'package:flutter_ureekaphase2_kesehatan/widgets/text_styles.dart';

class HealthDataCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Color color;
  final VoidCallback onEdit;

  const HealthDataCard({
<<<<<<< HEAD
    super.key,
=======
    Key? key,
>>>>>>> b24713d121cf3f74bb62c8e729c95b3e7f578162
    required this.title,
    required this.value,
    required this.color,
    required this.unit,
    required this.onEdit,
<<<<<<< HEAD
  });
=======
  }) : super(key: key);
>>>>>>> b24713d121cf3f74bb62c8e729c95b3e7f578162

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RobotoText(title,
                    fontSize: 10, color: const Color.fromARGB(255, 0, 0, 0)),
                SizedBox(height: 10),
                RobotoText(value,
                    fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0)),
                SizedBox(height: 5),
                RobotoText(unit,
                    fontSize: 10, color: const Color.fromARGB(255, 0, 0, 0)),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.white, size: 20),
                onPressed: onEdit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
