class NutriologoDto {
  final int id;
  final String name;
  final String email;

  const NutriologoDto({
    required this.id,
    required this.name,
    required this.email,
  });

  factory NutriologoDto.fromJson(Map<String, dynamic> json) => NutriologoDto(
    id:    json['id']    as int,
    name:  json['name']  as String,
    email: json['email'] as String,
  );
}