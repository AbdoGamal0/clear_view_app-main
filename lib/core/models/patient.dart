class Patient {
  final int id;
  final String name;
  final String imageUrl;
  final String appointmentDate;
  final String appointmentTime;
  final bool isPaid;

  Patient({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.isPaid,
  });
}

List<Patient> patients = [
  Patient(
    id: 1,
    name: 'John Doe',
    imageUrl: 'assets/images/Logo1.png',
    appointmentDate: 'Wed Jun 20',
    appointmentTime: '10:00 AM',
    isPaid: true,
  ),
  Patient(
    id: 2,
    name: 'Jane Doe',
    imageUrl: 'assets/images/Logo1.png',
    appointmentDate: 'Wed Jun 20',
    appointmentTime: '10:30 AM',
    isPaid: false,
  ),
  Patient(
    id: 3,
    name: 'Bob Smith',
    imageUrl: 'assets/images/Logo1.png',
    appointmentDate: 'Wed Jun 20',
    appointmentTime: '11:00 PM',
    isPaid: true,
  ),
];
