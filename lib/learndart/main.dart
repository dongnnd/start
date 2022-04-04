

/*void main() {
  Doctor doctor = Doctor('dong', 16, 'hihi');
  print(doctor.name);
  print(doctor.age);
  doctor.about();
}*/

mixin Human {
  String name = '';
  int age = 0;

  void about();
}

class Doctor with Human {
  String specialization = '';

  Doctor(String doctorName, int doctorAge, String specialization) {
    name = doctorName;
    age = doctorAge;
    this.specialization = specialization;
  }


  @override
  void about() {
    print('$name is $age years old. He is $specialization specialist.');
  }

}