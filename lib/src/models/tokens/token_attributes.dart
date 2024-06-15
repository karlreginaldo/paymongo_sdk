import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:paymongo_sdk/paymongo_sdk.dart';

///
class PayMongoTokenAttributes extends Equatable {
  ///
  const PayMongoTokenAttributes({
    required this.number,
    required this.expireMonth,
    required this.expireYear,
    required this.cvc,
    this.billing,
    this.name,
    this.email,
    this.phone,
  });

  ///
  factory PayMongoTokenAttributes.fromMap(Map<String, dynamic> map) {
    return PayMongoTokenAttributes(
      number: map['number']?.toString() ?? '',
      expireMonth: map['expireMonth'] as int? ?? 0,
      expireYear: map['expireYear'] as int? ?? 0,
      cvc: map['cvc']?.toString() ?? '',
      billing: PayMongoBilling.fromMap(map['billing'] as Map<String, dynamic>),
      name: map['name']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      phone: map['phone']?.toString() ?? '',
    );
  }

  ///
  factory PayMongoTokenAttributes.fromJson(String source) =>
      PayMongoTokenAttributes.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  ///
  final String number;

  ///
  final int expireMonth;

  ///
  final int expireYear;

  ///
  final String cvc;

  ///
  final PayMongoBilling? billing;

  ///
  final String? name;

  ///
  final String? email;

  ///
  final String? phone;

  ///
  PayMongoTokenAttributes copyWith({
    String? number,
    int? expireMonth,
    int? expireYear,
    String? cvc,
    PayMongoBilling? billing,
    String? name,
    String? email,
    String? phone,
  }) {
    return PayMongoTokenAttributes(
      number: number ?? this.number,
      expireMonth: expireMonth ?? this.expireMonth,
      expireYear: expireYear ?? this.expireYear,
      cvc: cvc ?? this.cvc,
      billing: billing ?? this.billing,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  ///
  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'expireMonth': expireMonth,
      'expireYear': expireYear,
      'cvc': cvc,
      'billing': billing!.toMap(),
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  ///

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      number,
      expireMonth,
      expireYear,
      cvc,
      billing,
      name,
      email,
      phone,
    ];
  }
}
