import 'package:flutter/material.dart';
import 'layanan_kami_button.dart';
import '../../routes/app_routes.dart';

class LayananKami extends StatelessWidget {
  const LayananKami({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        LayananKamiButton(
          image: Image.asset('assets/images/Chat1.png'),
          label: 'Konsultasi',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.konsultasi);
          },
        ),
        LayananKamiButton(
          image: Image.asset('assets/images/community.png'),
          label: 'Komunitas',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.komunitas);
          },
        ),
        LayananKamiButton(
          image: Image.asset('assets/images/Chat1.png'),
          label: 'Opini Lain',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.opini_lain);
          },
        ),
        LayananKamiButton(
          image: Image.asset('assets/images/cart.png'),
          label: 'Pesan',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.pesan_obat);
          },
        ),
      ],
    );
  }
}
