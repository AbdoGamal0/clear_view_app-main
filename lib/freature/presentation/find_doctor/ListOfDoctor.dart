import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'book_doctor_with_map.dart';
import 'favouriteDoctor.dart';

// تعريف نموذج الطبيب
class Doctor {
  final String name;
  final String specialization;
  final String imageUrl;
  final int yearsExperience;
  final String nextAvailable;
  bool isFavorite;
  final int patientStories;
  final double rating;
  final String location;

  Doctor({
    required this.name,
    required this.specialization,
    required this.imageUrl,
    required this.yearsExperience,
    required this.nextAvailable,
    this.isFavorite = false, // تعيين المفضل كـ false بشكل افتراضي
    required this.patientStories,
    required this.rating,
    required this.location,
  });
}

// صفحة عرض الأطباء
class DoctorsListingPage extends StatefulWidget {
  const DoctorsListingPage({super.key});
  static const String routeName = '/DoctorsListingPage';
  @override
  State<DoctorsListingPage> createState() => _DoctorsListingPageState();
}

class _DoctorsListingPageState extends State<DoctorsListingPage> {
  final TextEditingController _searchController = TextEditingController();

  // قائمة الأطباء
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Tranquilli',
      specialization: 'Specialist medicine',
      imageUrl: 'assets/images/img_user.png',
      yearsExperience: 6,
      nextAvailable: '10:00 AM ',
      patientStories: 45,
      rating: 4.5,
      location: 'Cairo',
    ),
    Doctor(
      name: 'Dr. Bonebrake',
      specialization: 'Specialist Dentist',
      imageUrl: 'assets/images/img_user.png',
      yearsExperience: 8,
      nextAvailable: '12:00 AM ',
      patientStories: 52,
      rating: 4.8,
      location: 'Alexandria',
    ),
    Doctor(
      name: 'Dr. Bone',
      specialization: 'Specialist Dentist',
      imageUrl: 'assets/images/img_user.png',
      yearsExperience: 8,
      nextAvailable: '10:00 AM ',
      patientStories: 52,
      rating: 3.8,
      location: 'Alexandria',
    ),
  ];

  List<Doctor> favoriteDoctors = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // دالة لتحميل الأطباء المفضلين من SharedPreferences
  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteNames = prefs.getStringList('favoriteDoctors') ?? [];

    setState(() {
      favoriteDoctors = doctors
          .where((doctor) => favoriteNames.contains(doctor.name))
          .toList();
    });
  }

  // دالة لحفظ الأطباء المفضلين في SharedPreferences
  void _saveFavorite(Doctor doctor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteNames = prefs.getStringList('favoriteDoctors') ?? [];

    if (!favoriteNames.contains(doctor.name)) {
      favoriteNames.add(doctor.name);
      await prefs.setStringList('favoriteDoctors', favoriteNames);
    }
  }

  // دالة لتغيير حالة المفضل
  void _toggleFavorite(Doctor doctor) {
    setState(() {
      doctor.isFavorite = !doctor.isFavorite;

      if (doctor.isFavorite) {
        _saveFavorite(doctor); // حفظ الطبيب في المفضلة
      } else {
        _removeFavorite(doctor); // إزالة الطبيب من المفضلة
      }
    });
  }

  // دالة لإزالة الطبيب من المفضلة
  void _removeFavorite(Doctor doctor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteNames = prefs.getStringList('favoriteDoctors') ?? [];

    favoriteNames.remove(doctor.name);
    await prefs.setStringList('favoriteDoctors', favoriteNames);
  }

  // دالة لتصفية الأطباء بناءً على البحث
  List<Doctor> _getFilteredDoctors() {
    final query = _searchController.text.toLowerCase();
    return doctors.where((doctor) {
      final nameMatch = doctor.name.toLowerCase().contains(query);
      final locationMatch = doctor.location.toLowerCase().contains(query);
      return nameMatch || locationMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Doctors', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.black87),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoriteDoctorsPage(favoriteDoctors: favoriteDoctors),
                ),
              );
            }, // الانتقال إلى صفحة المفضلة
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or location',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {}); // إعادة بناء الصفحة عند تغيير النص
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _getFilteredDoctors().length,
              itemBuilder: (context, index) {
                final doctor = _getFilteredDoctors()[index];
                return DoctorCard(
                  doctor: doctor,
                  onFavoriteToggle: () => _toggleFavorite(doctor),
                  onBook: () => _bookAppointment(context, doctor),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// صفحة عرض المفضلة

// صفحة عرض الطبيب
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                    radius: 30, backgroundImage: AssetImage(doctor.imageUrl)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctor.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(doctor.specialization,
                          style: TextStyle(color: Colors.grey[600])),
                      Wrap(
                        spacing: 8,
                        children: [
                          Text('${doctor.yearsExperience} Years experience',
                              style: const TextStyle(fontSize: 12)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star,
                                  size: 16, color: Colors.amber),
                              Text('${doctor.rating}',
                                  style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                          Text('${doctor.patientStories} Patient Stories',
                              style: const TextStyle(fontSize: 12)),
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
                    Text('Next Available: ${doctor.nextAvailable}',
                        style: TextStyle(color: Colors.grey[600])),
                    Text('Location: ${doctor.location}',
                        style: TextStyle(color: Colors.grey[600])),
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

void _bookAppointment(BuildContext context, Doctor doctor) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const DoctorDetailsPage(),
    ),
  );
}
