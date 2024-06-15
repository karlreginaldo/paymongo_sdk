import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:paymongo_sdk/paymongo_sdk.dart';

/// {@template billing}
/// customer billing
/// {@endtemplate }
class PayMongoBilling extends Equatable {
  ///{@macro billing}
  const PayMongoBilling({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  ///{@macro billing}
  factory PayMongoBilling.fromMap(Map<String, dynamic> map) {
    return PayMongoBilling(
      name: map['name']?.toString() ?? '',
      phone: map['phone']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      address: PayMongoAddress.fromMap(map['address'] as Map<String, dynamic>),
    );
  }

  ///{@macro billing}
  factory PayMongoBilling.fromJson(String source) =>
      PayMongoBilling.fromMap(json.decode(source) as Map<String, dynamic>);

  ///
  final String name;

  ///
  final String phone;

  ///
  final String email;

  ///
  final PayMongoAddress address;

  ///{@macro billing}
  PayMongoBilling copyWith({
    String? name,
    String? phone,
    String? email,
    PayMongoAddress? address,
  }) {
    return PayMongoBilling(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  ///{@macro billing}
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address.toMap(),
    };
  }

  ///{@macro billing}
  String toJson() => json.encode(toMap());

  @override
  List<Object> get props => [name, phone, email, address];
}
