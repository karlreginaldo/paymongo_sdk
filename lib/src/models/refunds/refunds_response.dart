import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:paymongo_sdk/paymongo_sdk.dart';

class RefundResponse extends Equatable {
  const RefundResponse({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory RefundResponse.fromMap(Map<String, dynamic> map) {
    return RefundResponse(
      id: map['id']?.toString() ?? '',
      type: map['type']?.toString() ?? '',
      attributes: RefundResponseAttributes.fromMap(
        map['attributes'] as Map<String, dynamic>,
      ),
    );
  }

  factory RefundResponse.fromJson(String source) =>
      RefundResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String type;
  final RefundResponseAttributes attributes;

  RefundResponse copyWith({
    String? id,
    String? type,
    RefundResponseAttributes? attributes,
  }) {
    return RefundResponse(
      id: id ?? this.id,
      type: type ?? this.type,
      attributes: attributes ?? this.attributes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'attributes': attributes.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'RefundResponse(id: $id, type: $type, attributes: $attributes)';

  @override
  List<Object> get props => [id, type, attributes];
}

class RefundResponseAttributes extends Equatable {
  const RefundResponseAttributes({
    required this.amount,
    required this.currency,
    required this.livemode,
    required this.paymentId,
    required this.reason,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
    this.payoutId,
    this.balanceTransactionId,
  });

  factory RefundResponseAttributes.fromMap(Map<String, dynamic> map) {
    return RefundResponseAttributes(
      amount: map['amount'] as int? ?? 0,
      currency: map['currency']?.toString() ?? '',
      livemode: map['livemode'] as bool? ?? false,
      notes: map['notes']?.toString(),
      paymentId: map['payment_id']?.toString() ?? '',
      payoutId: map['payout_id']?.toString(),
      reason: map['reason']?.toString() ?? '',
      status: map['status']?.toString() ?? '',
      createdAt: fromTimeStamp(map['created_at'] as int),
      updatedAt: fromTimeStamp(map['updated_at'] as int),
      balanceTransactionId: map['balance_transaction_id']?.toString(),
    );
  }

  factory RefundResponseAttributes.fromJson(String source) =>
      RefundResponseAttributes.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final int amount;
  final String currency;
  final bool livemode;
  final String? notes;
  final String paymentId;
  final String? payoutId;
  final String reason;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? balanceTransactionId;
  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'currency': currency,
      'livemode': livemode,
      'notes': notes,
      'payment_id': paymentId,
      'payout_id': payoutId,
      'reason': reason,
      'status': status,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'balance_transaction_id': balanceTransactionId,
    };
  }

  String toJson() => json.encode(toMap());

  RefundResponseAttributes copyWith({
    int? amount,
    String? currency,
    bool? livemode,
    String? notes,
    String? paymentId,
    String? payoutId,
    String? reason,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? balanceTransactionId,
  }) {
    return RefundResponseAttributes(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      livemode: livemode ?? this.livemode,
      notes: notes ?? this.notes,
      paymentId: paymentId ?? this.paymentId,
      payoutId: payoutId ?? this.payoutId,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      balanceTransactionId: balanceTransactionId ?? this.balanceTransactionId,
    );
  }

  @override
  List<Object?> get props {
    return [
      amount,
      currency,
      livemode,
      notes,
      paymentId,
      payoutId,
      reason,
      status,
      createdAt,
      updatedAt,
      balanceTransactionId,
    ];
  }
}
