import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:paymongo_sdk/paymongo_sdk.dart';

/// {@template create_payment_response}
/// {@endtemplate}
class CreatePaymentResponse extends Equatable {
  /// {@macro create_payment_response}
  const CreatePaymentResponse({
    this.id,
    this.source,
    this.type,
  });

  /// {@macro create_payment_response}
  factory CreatePaymentResponse.fromMap(Map<String, dynamic> map) {
    return CreatePaymentResponse(
      id: map['id']?.toString(),
      source: map['source'] != null
          ? SourceResult.fromMap(map['source'] as Map<String, dynamic>)
          : null,
      type: map['type']?.toString(),
    );
  }

  /// {@macro create_payment_response}
  factory CreatePaymentResponse.fromJson(String source) =>
      CreatePaymentResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  ///
  final String? id;

  ///
  final SourceResult? source;

  ///
  final String? type;

  /// {@macro create_payment_response}

  CreatePaymentResponse copyWith({
    String? id,
    SourceResult? source,
    String? type,
  }) {
    return CreatePaymentResponse(
      id: id ?? this.id,
      source: source ?? this.source,
      type: type ?? this.type,
    );
  }

  /// {@macro create_payment_response}
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'source': source?.toMap(),
      'type': type,
    };
  }

  /// {@macro create_payment_response}
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, source, type];
}
