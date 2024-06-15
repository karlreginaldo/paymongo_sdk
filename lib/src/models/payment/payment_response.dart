import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:paymongo_sdk/paymongo_sdk.dart';

/// {@template payment_methd_resource}
/// https://developers.paymongo.com/reference/payment-source
/// {@endtemplate}

class PaymentAttributesResponse extends Equatable {
  ///
  const PaymentAttributesResponse({
    required this.accessUrl,
    required this.amount,
    required this.balanceTransactionId,
    required this.billing,
    required this.currency,
    required this.description,
    required this.disputed,
    required this.fee,
    required this.foreignFee,
    required this.livemode,
    required this.netAmount,
    required this.origin,
    required this.payout,
    required this.source,
    required this.statementDescriptor,
    required this.status,
    required this.refunds,
    required this.taxes,
    required this.availableAt,
    required this.createdAt,
    required this.paidAt,
    required this.updatedAt,
    required this.paymentIntentId,
    this.externalReferenceNumber,
    this.taxAmount,
  });

  ///
  factory PaymentAttributesResponse.fromJson(String source) =>
      PaymentAttributesResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  ///
  factory PaymentAttributesResponse.fromMap(Map<String, dynamic> map) {
    return PaymentAttributesResponse(
      accessUrl: map['access_url']?.toString(),
      amount: (map['amount'] as num?)?.toInt() ?? 0,
      balanceTransactionId: map['balance_transaction_id']?.toString() ?? '',
      billing: map['billing'] != null
          ? PayMongoBilling.fromMap(map['billing'] as Map<String, dynamic>)
          : null,
      currency: map['currency']?.toString() ?? '',
      description: map['description']?.toString() ?? '',
      disputed: map['disputed'] as bool? ?? false,
      externalReferenceNumber: map['external_reference_number']?.toString(),
      fee: map['fee'] as int? ?? 0,
      foreignFee: map['foreign_fee'] as int? ?? 0,
      livemode: map['livemode'] as bool? ?? false,
      netAmount: map['net_amount'] as int? ?? 0,
      origin: map['origin']?.toString() ?? '',
      paymentIntentId: map['payment_intent_id']?.toString() ?? '',
      payout: map['payout']?.toString() ?? '',
      source: map['source'] != null
          ? PaymentAttributeSourceResponse.fromMap(
              map['source'] as Map<String, dynamic>,
            )
          : null,
      statementDescriptor: map['statement_descriptor']?.toString() ?? '',
      status: map['status']?.toString() ?? '',
      taxAmount: map['tax_amount'] as int?,
      availableAt: map['available_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['available_at'] as int)
          : null,
      createdAt: fromTimeStamp(map['created_at'] as int),
      updatedAt: fromTimeStamp(map['updated_at'] as int),
      paidAt: fromTimeStamp(map['paid_at'] as int),
      refunds: map['refunds'] != null
          ? List<Map<String, dynamic>>.from(
              map['refunds'] as List? ?? [],
            ).map(PaymentRefundResponse.fromMap).toList()
          : null,
      taxes: map['taxes'] != null
          ? List<Map<String, dynamic>>.from(
              map['taxes'] as List,
            ).map(PaymentTaxResponse.fromMap).toList()
          : null,
    );
  }

  ///
  final String? accessUrl;

  ///
  final int amount;

  ///
  final String balanceTransactionId;

  ///
  final PayMongoBilling? billing;

  ///
  final String currency;

  ///
  final String description;

  ///
  final bool disputed;

  ///
  final String? externalReferenceNumber;

  ///
  final int fee;

  ///
  final int foreignFee;

  ///
  final bool livemode;

  ///
  final int netAmount;

  ///
  final String origin;

  ///
  final String paymentIntentId;

  ///
  final String payout;

  ///
  final PaymentAttributeSourceResponse? source;

  ///
  final String statementDescriptor;

  ///
  final String status;

  ///
  final int? taxAmount;

  /// object not final
  final List<PaymentRefundResponse>? refunds;

  ///
  final List<PaymentTaxResponse>? taxes;

  ///
  final DateTime? availableAt;

  ///
  final DateTime? createdAt;

  ///
  final DateTime? paidAt;

  ///
  final DateTime? updatedAt;

  ///
  PaymentAttributesResponse copyWith({
    String? accessUrl,
    int? amount,
    String? balanceTransactionId,
    PayMongoBilling? billing,
    String? currency,
    String? description,
    bool? disputed,
    String? externalReferenceNumber,
    int? fee,
    int? foreignFee,
    bool? livemode,
    int? netAmount,
    String? origin,
    String? paymentIntentId,
    String? payout,
    PaymentAttributeSourceResponse? source,
    String? statementDescriptor,
    String? status,
    int? taxAmount,
    List<PaymentRefundResponse>? refunds,
    List<PaymentTaxResponse>? taxes,
    DateTime? availableAt,
    DateTime? createdAt,
    DateTime? paidAt,
    DateTime? updatedAt,
  }) {
    return PaymentAttributesResponse(
      accessUrl: accessUrl ?? this.accessUrl,
      amount: amount ?? this.amount,
      balanceTransactionId: balanceTransactionId ?? this.balanceTransactionId,
      billing: billing ?? this.billing,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      disputed: disputed ?? this.disputed,
      externalReferenceNumber:
          externalReferenceNumber ?? this.externalReferenceNumber,
      fee: fee ?? this.fee,
      foreignFee: foreignFee ?? this.foreignFee,
      livemode: livemode ?? this.livemode,
      netAmount: netAmount ?? this.netAmount,
      origin: origin ?? this.origin,
      paymentIntentId: paymentIntentId ?? this.paymentIntentId,
      payout: payout ?? this.payout,
      source: source ?? this.source,
      statementDescriptor: statementDescriptor ?? this.statementDescriptor,
      status: status ?? this.status,
      taxAmount: taxAmount ?? this.taxAmount,
      refunds: refunds ?? this.refunds,
      taxes: taxes ?? this.taxes,
      availableAt: availableAt ?? this.availableAt,
      createdAt: createdAt ?? this.createdAt,
      paidAt: paidAt ?? this.paidAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  ///
  Map<String, dynamic> toMap() {
    return {
      'accessUrl': accessUrl,
      'amount': amount,
      'balanceTransactionId': balanceTransactionId,
      'billing': billing?.toMap(),
      'currency': currency,
      'description': description,
      'disputed': disputed,
      'externalReferenceNumber': externalReferenceNumber,
      'fee': fee,
      'foreignFee': foreignFee,
      'livemode': livemode,
      'netAmount': netAmount,
      'origin': origin,
      'paymentIntentId': paymentIntentId,
      'payout': payout,
      'source': source?.toMap(),
      'statementDescriptor': statementDescriptor,
      'status': status,
      'taxAmount': taxAmount,
      'refunds': refunds?.map((x) => x.toMap()).toList(),
      'taxes': taxes?.map((x) => x.toMap()).toList(),
      'availableAt': availableAt?.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'paidAt': paidAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  ///
  String toJson() => json.encode(toMap());
  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      accessUrl,
      amount,
      balanceTransactionId,
      billing,
      currency,
      description,
      disputed,
      externalReferenceNumber,
      fee,
      foreignFee,
      livemode,
      netAmount,
      origin,
      payout,
      source,
      statementDescriptor,
      status,
      taxAmount,
      refunds,
      taxes,
      availableAt,
      createdAt,
      paidAt,
      updatedAt,
      paymentIntentId,
    ];
  }
}

///
class PaymentTaxResponse extends Equatable {
  ///
  const PaymentTaxResponse({
    required this.amount,
    required this.inclusive,
    required this.name,
    required this.type,
    required this.value,
    this.currency = 'PHP',
  });

  ///
  factory PaymentTaxResponse.fromMap(Map<String, dynamic> map) {
    return PaymentTaxResponse(
      amount: (map['amount'] as num?)?.toInt() ?? 0.0,
      currency: map['currency']?.toString() ?? '',
      inclusive: map['inclusive'] as bool? ?? false,
      name: map['name']?.toString() ?? '',
      type: map['type']?.toString() ?? '',
      value: map['value']?.toString() ?? '',
    );
  }

  ///
  factory PaymentTaxResponse.fromJson(String source) =>
      PaymentTaxResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  ///
  final num amount;

  /// defaults to PHP
  final String currency;

  ///
  final bool inclusive;

  ///
  final String name;

  ///
  final String type;

  ///
  final String value;

  ///
  PaymentTaxResponse copyWith({
    double? amount,
    String? currency,
    bool? inclusive,
    String? name,
    String? type,
    String? value,
  }) {
    return PaymentTaxResponse(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      inclusive: inclusive ?? this.inclusive,
      name: name ?? this.name,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  ///

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'currency': currency,
      'inclusive': inclusive,
      'name': name,
      'type': type,
      'value': value,
    };
  }

  ///
  String toJson() => json.encode(toMap());
  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      amount,
      currency,
      inclusive,
      name,
      type,
      value,
    ];
  }
}

/// refund resource object
class PaymentRefundResponse extends Equatable {
  ///
  const PaymentRefundResponse({
    required this.id,
    required this.attributes,
    required this.availableAt,
    required this.createdAt,
    required this.paidAt,
    required this.updatedAt,
    this.type = 'refund',
  });

  ///
  factory PaymentRefundResponse.fromMap(Map<String, dynamic> map) {
    return PaymentRefundResponse(
      id: map['id']?.toString() ?? '',
      type: map['type']?.toString() ?? 'refund',
      attributes: PaymentRefundResponseAttributes.fromMap(
        map['attributes'] as Map<String, dynamic>,
      ),
      availableAt: map['available_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['available_at'] as int)
          : null,
      createdAt: fromTimeStamp(map['created_at'] as int),
      updatedAt: fromTimeStamp(map['updated_at'] as int),
      paidAt: fromTimeStamp(map['paid_at'] as int),
    );
  }

  ///
  factory PaymentRefundResponse.fromJson(String source) =>
      PaymentRefundResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  ///
  final String id;

  ///
  final String type;

  ///
  final PaymentRefundResponseAttributes attributes;

  ///
  final DateTime? availableAt;

  ///
  final DateTime? createdAt;

  ///
  final DateTime? paidAt;

  ///
  final DateTime? updatedAt;

  ///
  PaymentRefundResponse copyWith({
    String? id,
    String? type,
    PaymentRefundResponseAttributes? attributes,
    DateTime? availableAt,
    DateTime? createdAt,
    DateTime? paidAt,
    DateTime? updatedAt,
  }) {
    return PaymentRefundResponse(
      id: id ?? this.id,
      type: type ?? this.type,
      attributes: attributes ?? this.attributes,
      availableAt: availableAt ?? this.availableAt,
      createdAt: createdAt ?? this.createdAt,
      paidAt: paidAt ?? this.paidAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  ///
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'attributes': attributes.toMap(),
      'available_at': availableAt?.millisecondsSinceEpoch,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'paid_at': paidAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  ///
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      type,
      attributes,
      availableAt,
      createdAt,
      paidAt,
      updatedAt,
    ];
  }
}

///
class PaymentRefundResponseAttributes extends Equatable {
  ///
  const PaymentRefundResponseAttributes({
    required this.amount,
    required this.balanceTransactionId,
    required this.currency,
    required this.livemode,
    required this.notes,
    required this.paymentId,
    required this.payoutId,
    required this.reason,
    required this.status,
    required this.availableAt,
    required this.createdAt,
    required this.updatedAt,
    this.metadata,
  });

  ///
  factory PaymentRefundResponseAttributes.fromJson(String source) =>
      PaymentRefundResponseAttributes.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  ///
  factory PaymentRefundResponseAttributes.fromMap(Map<String, dynamic> map) {
    return PaymentRefundResponseAttributes(
      amount: (map['amount'] as num?)?.toInt() ?? 0,
      balanceTransactionId: map['balance_transaction_id']?.toString() ?? '',
      currency: map['currency']?.toString() ?? 'PHP',
      livemode: map['livemode'] as bool? ?? false,
      metadata: map['metadata'] != null
          ? Map<String, dynamic>.from(map['metadata'] as Map<String, dynamic>)
          : null,
      notes: map['notes']?.toString() ?? '',
      paymentId: map['payment_id']?.toString() ?? '',
      payoutId: map['payout_id']?.toString() ?? '',
      reason: map['reason']?.toString() ?? '',
      status: map['status']?.toString() ?? '',
      availableAt:
          DateTime.fromMillisecondsSinceEpoch(map['available_at'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
    );
  }

  ///
  final num amount;

  ///
  final String balanceTransactionId;

  /// defaults to 'PHP'
  final String currency;

  ///
  final bool livemode;

  ///
  final Map<String, dynamic>? metadata;

  ///
  final String notes;

  ///
  final String paymentId;

  ///
  final String payoutId;

  ///
  final String reason;

  ///
  final String status;

  ///
  final DateTime availableAt;

  ///
  final DateTime createdAt;

  ///
  final DateTime updatedAt;

  @override
  List<Object?> get props {
    return [
      amount,
      balanceTransactionId,
      currency,
      livemode,
      metadata,
      notes,
      paymentId,
      payoutId,
      reason,
      status,
      availableAt,
      createdAt,
      updatedAt,
    ];
  }

  ///
  PaymentRefundResponseAttributes copyWith({
    double? amount,
    String? balanceTransactionId,
    String? currency,
    bool? livemode,
    Map<String, dynamic>? metadata,
    String? notes,
    String? paymentId,
    String? payoutId,
    String? reason,
    String? status,
    DateTime? availableAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentRefundResponseAttributes(
      amount: amount ?? this.amount,
      balanceTransactionId: balanceTransactionId ?? this.balanceTransactionId,
      currency: currency ?? this.currency,
      livemode: livemode ?? this.livemode,
      metadata: metadata ?? this.metadata,
      notes: notes ?? this.notes,
      paymentId: paymentId ?? this.paymentId,
      payoutId: payoutId ?? this.payoutId,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      availableAt: availableAt ?? this.availableAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  ///
  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'balanceTransactionId': balanceTransactionId,
      'currency': currency,
      'livemode': livemode,
      'metadata': metadata,
      'notes': notes,
      'paymentId': paymentId,
      'payoutId': payoutId,
      'reason': reason,
      'status': status,
      'availableAt': availableAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  ///
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
}
