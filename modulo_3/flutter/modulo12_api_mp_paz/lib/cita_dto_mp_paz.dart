class CitaDto {
  final int id;
  final String title;
  final bool completed;

  const CitaDto({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory CitaDto.fromJson(Map<String, dynamic> json) => CitaDto(
    id:        json['id']        as int,
    title:     json['title']     as String,
    completed: json['completed'] as bool,
  );
}