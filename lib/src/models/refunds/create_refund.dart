import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateRefundAttributes extends Equatable {
  const CreateRefundAttributes({
    required this.amount,
    required this.paymentId,
    required this.reason,
    required this.metadata,
    this.notes,
  });
  factory CreateRefundAttributes.fromMap(Map<String, dynamic> map) {
    return CreateRefundAttributes(
      amount: (map['amount'] as int?) ?? 0,
      notes: map['notes']?.toString(),
      paymentId: map['payment_id']?.toString() ?? '',
      reason: map['reason']?.toString() ?? '',
      metadata: Map<String, dynamic>.from(
        map['metadata'] as Map<String, dynamic>? ?? const {},
      ),
    );
  }

  factory CreateRefundAttributes.fromJson(String source) =>
      CreateRefundAttributes.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final int amount;
  final String? notes;
  final String paymentId;
  final String reason;
  final Map<String, dynamic> metadata;

  CreateRefundAttributes copyWith({
    int? amount,
    String? notes,
    String? paymentId,
    String? reason,
    Map<String, dynamic>? metadata,
  }) {
    return CreateRefundAttributes(
      amount: amount ?? this.amount,
      notes: notes ?? this.notes,
      paymentId: paymentId ?? this.paymentId,
      reason: reason ?? this.reason,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'notes': notes,
      'payment_id': paymentId,
      'reason': reason,
      'metadata': metadata,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      amount,
      notes,
      paymentId,
      reason,
      metadata,
    ];
  }
}
