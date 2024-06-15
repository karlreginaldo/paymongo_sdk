import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:paymongo_sdk/paymongo_sdk.dart';

class LinkResponse extends Equatable {
  const LinkResponse({
    this.id,
    this.type,
    this.attributes,
  });

  factory LinkResponse.fromMap(Map<String, dynamic> map) {
    return LinkResponse(
      id: map['id']?.toString(),
      type: map['type']?.toString(),
      attributes: map['attributes'] != null
          ? LinkResponseAttributes.fromMap(
              map['attributes'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  factory LinkResponse.fromJson(String source) =>
      LinkResponse.fromMap(json.decode(source) as Map<String, dynamic>);
  final String? id;
  final String? type;
  final LinkResponseAttributes? attributes;

  LinkResponse copyWith({
    String? id,
    String? type,
    LinkResponseAttributes? attributes,
  }) {
    return LinkResponse(
      id: id ?? this.id,
      type: type ?? this.type,
      attributes: attributes ?? this.attributes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'attributes': attributes?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, type, attributes];
}

class LinkResponseAttributes extends Equatable {
  const LinkResponseAttributes({
    required this.taxes,
    required this.createdAt,
    required this.updatedAt,
    required this.payments,
    this.amount,
    this.archived,
    this.currency,
    this.description,
    this.livemode,
    this.fee,
    this.status,
    this.taxAmount,
    this.checkoutUrl,
    this.referenceNumber,
  });
  factory LinkResponseAttributes.fromJson(String source) =>
      LinkResponseAttributes.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory LinkResponseAttributes.fromMap(Map<String, dynamic> map) {
    return LinkResponseAttributes(
      amount: (map['amount'] as int?) ?? 0,
      archived: map['archived'] as bool? ?? false,
      currency: map['currency']?.toString(),
      description: map['description']?.toString(),
      livemode: map['livemode'] as bool? ?? false,
      fee: map['fee'] as int?,
      status: map['status']?.toString(),
      taxAmount: map['taxAmount'] as int,
      taxes: List<PaymentTaxResponse?>.from(
        (map['taxes'] as List<Map<String, dynamic>>?)
                ?.map(PaymentTaxResponse.fromMap) ??
            const [],
      ),
      checkoutUrl: map['checkoutUrl']?.toString(),
      referenceNumber: map['referenceNumber']?.toString(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      payments: List<PaymentListAllResponse>.from(
        (map['payments'] as List<Map<String, dynamic>>?)
                ?.map(PaymentListAllResponse.fromMap) ??
            const [],
      ),
    );
  }
  final int? amount;
  final bool? archived;
  final String? currency;
  final String? description;
  final bool? livemode;
  final int? fee;
  final String? status;
  final int? taxAmount;
  final List<PaymentTaxResponse?> taxes;
  final String? checkoutUrl;
  final String? referenceNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<PaymentListAllResponse> payments;

  LinkResponseAttributes copyWith({
    int? amount,
    bool? archived,
    String? currency,
    String? description,
    bool? livemode,
    int? fee,
    String? status,
    int? taxAmount,
    List<PaymentTaxResponse?>? taxes,
    String? checkoutUrl,
    String? referenceNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<PaymentListAllResponse>? payments,
  }) {
    return LinkResponseAttributes(
      amount: amount ?? this.amount,
      archived: archived ?? this.archived,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      livemode: livemode ?? this.livemode,
      fee: fee ?? this.fee,
      status: status ?? this.status,
      taxAmount: taxAmount ?? this.taxAmount,
      taxes: taxes ?? this.taxes,
      checkoutUrl: checkoutUrl ?? this.checkoutUrl,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      payments: payments ?? this.payments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'archived': archived,
      'currency': currency,
      'description': description,
      'livemode': livemode,
      'fee': fee,
      'status': status,
      'taxAmount': taxAmount,
      'taxes': taxes.map((x) => x?.toMap()).toList(),
      'checkoutUrl': checkoutUrl,
      'referenceNumber': referenceNumber,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'payments': payments.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      amount,
      archived,
      currency,
      description,
      livemode,
      fee,
      status,
      taxAmount,
      taxes,
      checkoutUrl,
      referenceNumber,
      createdAt,
      updatedAt,
      payments,
    ];
  }
}
