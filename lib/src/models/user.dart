
//-En cubit si es normal que las clases sean finales ya que siempre se entrega una nueva instancia
class User {
  final String name;
  final DateTime? birthday;
  final List<String> professions;

  const User({required this.name, this.birthday, this.professions = const []});

  int? _calculateAge(DateTime? birthDate) {
    if(birthDate != null){
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      int month1 = currentDate.month;
      int month2 = birthDate.month;
      if (month2 > month1) {
        age--;
      } else if (month1 == month2) {
        int day1 = currentDate.day;
        int day2 = birthDate.day;
        if (day2 > day1) {
          age--;
        }
      }
      return age;
    } else {
      return null;
    }   
  }

  int? get age => _calculateAge(birthday);

  User copyWith({String? name, DateTime? birthday, List<String>? professions}){
    return User(
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      professions: professions ?? this.professions
    );
  }
}