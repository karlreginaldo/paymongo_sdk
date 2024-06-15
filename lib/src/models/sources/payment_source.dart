import 'dart:convert';

import 'package:equatable/equatable.dart';

/// payment attribute source
class PaymentAttributeSourceResponse extends Equatable {
  ///
  const PaymentAttributeSourceResponse({
    required this.id,
    required this.type,
    required this.brand,
    required this.country,
    required this.last4,
  });

  ///
  factory PaymentAttributeSourceResponse.fromMap(Map<String, dynamic> map) {
    return PaymentAttributeSourceResponse(
      id: map['id']?.toString() ?? '',
      type: map['type']?.toString() ?? '',
      brand: map['brand']?.toString() ?? '',
      country: map['country']?.toString() ?? '',
      last4: map['last4']?.toString() ?? '',
    );
  }

  ///
  factory PaymentAttributeSourceResponse.fromJson(String source) =>
      PaymentAttributeSourceResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  ///
  final String id;

  ///
  final String type;

  ///
  final String brand;

  ///
  final String country;

  ///
  final String last4;

  ///
  String toJson() => json.encode(toMap());

  ///
  PaymentAttributeSourceResponse copyWith({
    String? id,
    String? type,
    String? brand,
    String? country,
    String? last4,
  }) {
    return PaymentAttributeSourceResponse(
      id: id ?? this.id,
      type: type ?? this.type,
      brand: brand ?? this.brand,
      country: country ?? this.country,
      last4: last4 ?? this.last4,
    );
  }

  ///
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'brand': brand,
      'country': country,
      'last4': last4,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      type,
      brand,
      country,
      last4,
    ];
  }
}
