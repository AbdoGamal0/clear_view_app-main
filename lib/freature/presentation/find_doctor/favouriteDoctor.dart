import 'package:flutter/material.dart';

import 'ListOfDoctor.dart';

class FavoriteDoctorsPage extends StatelessWidget {
  final List<Doctor> favoriteDoctors;

  const FavoriteDoctorsPage({super.key, required this.favoriteDoctors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Favorite Doctors',
            style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: favoriteDoctors.length,
        itemBuilder: (context, index) {
          final doctor = favoriteDoctors[index];
          return DoctorCard(
            doctor: doctor,
            onFavoriteToggle: () {},
            onBook: () {}, // لا يوجد تغيير في المفضل هنا
          );
        },
      ),
    );
  }
}
