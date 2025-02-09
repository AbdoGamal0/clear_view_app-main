import 'package:flutter/material.dart';

import 'bookdoctor.dart';

class Doctor {
  final String name;
  final String specialization;
  final String imageUrl;
  final int yearsExperience;
  final String nextAvailable;
  final bool isFavorite;
  final int patientStories;
  final double rating;

  Doctor({
    required this.name,
    required this.specialization,
    required this.imageUrl,
    required this.yearsExperience,
    required this.nextAvailable,
    this.isFavorite = false,
    required this.patientStories,
    required this.rating,
  });
}

class DoctorsListingPage extends StatefulWidget {
  const DoctorsListingPage({super.key});

  @override
  State<DoctorsListingPage> createState() => _DoctorsListingPageState();
}

class _DoctorsListingPageState extends State<DoctorsListingPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Tranquilli',
      specialization: 'Specialist medicine',
      imageUrl: 'assets/images/img_user.png',
      yearsExperience: 6,
      nextAvailable: '10:00 AM tomorrow',
      patientStories: 45,
      rating: 4.5,
    ),
    Doctor(
      name: 'Dr. Bonebrake',
      specialization: 'Specialist Dentist',
      imageUrl: 'assets/images/img_user.png',
      yearsExperience: 8,
      nextAvailable: '12:00 AM tomorrow',
      isFavorite: true,
      patientStories: 52,
      rating: 4.8,
    ),
  ];

  void _toggleFavorite(Doctor doctor) {
    setState(() {
      final index = doctors.indexOf(doctor);
      doctors[index] = Doctor(
        name: doctor.name,
        specialization: doctor.specialization,
        imageUrl: doctor.imageUrl,
        yearsExperience: doctor.yearsExperience,
        nextAvailable: doctor.nextAvailable,
        isFavorite: !doctor.isFavorite,
        patientStories: doctor.patientStories,
        rating: doctor.rating,
      );
    });
  }

  void _bookAppointment(Doctor doctor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectTimePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFA3CAF8), // Light blue
            Color(0xFFE6D5F7), // Light purple
            Color(0xFFB8E5FF), // Another light blue shade
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'My Doctors',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white.withOpacity(0.9),
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.clear),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return DoctorCard(
                    doctor: doctor,
                    onFavoriteToggle: () => _toggleFavorite(doctor),
                    onBook: () => _bookAppointment(doctor),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onBook;

  const DoctorCard({
    super.key,
    required this.doctor,
    required this.onFavoriteToggle,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(doctor.imageUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        doctor.specialization,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Wrap(
                        spacing: 8,
                        children: [
                          Text(
                            '${doctor.yearsExperience} Years experience',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star,
                                  size: 16, color: Colors.amber),
                              Text(
                                '${doctor.rating}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Text(
                            '${doctor.patientStories} Patient Stories',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    doctor.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: doctor.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Available',
                      style: TextStyle(fontSize: 12, color: Colors.blue[600]),
                    ),
                    Text(
                      doctor.nextAvailable,
                      style: TextStyle(fontSize: 12, color: Colors.blue[600]),
                    ),
                  ],
                ),
                InkWell(
                  onTap: onBook,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFA3CAF8), // Light blue
                          Color(0xFFE6D5F7), // Light purple
                          Color(0xFFB8E5FF), // Another light blue shade
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
