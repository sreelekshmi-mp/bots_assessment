// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json, List json_user) {
  return UsersResponse(
    page: 1,//json['page'] as int,
    totalPages: 1,//json['total_pages'] as int,
    totalResults: 10,//json['total_results'] as int,
    //users: (json as List).map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    users: (json_user as List).map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    //UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);
  );
}

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.users,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    address: json['address'] != null ? new Address.fromJson(json['address']) : null as Address,
    phone: json['phone'] as String,
    company: json['company'] != null ? new Company.fromJson(json['company']) : null as Company,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'address': instance.address.toJson(),
  'phone': instance.phone,
  'company': instance.company.toJson,
};
