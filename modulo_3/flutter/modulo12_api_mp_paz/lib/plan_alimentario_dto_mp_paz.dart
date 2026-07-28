import 'plan_alimentario_mp_paz.dart';

class PlanAlimentarioDto {
  final int     id;
  final String  name;
  final String  price;
  final bool    isActive;
  final String? categoryName;

  const PlanAlimentarioDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory PlanAlimentarioDto.fromJson(Map<String, dynamic> json) => PlanAlimentarioDto(
    id:           json['id']            as int,
    name:         json['name']          as String,
    price:        json['price']         as String,
    isActive:     json['is_active']     as bool? ?? false,
    categoryName: json['category_name'] as String?,
  );

  PlanAlimentario toDomain() => PlanAlimentario(
    id:        id,
    nombre:    name,
    precio:    double.tryParse(price) ?? 0,
    activo:    isActive,
    categoria: categoryName,
  );
}