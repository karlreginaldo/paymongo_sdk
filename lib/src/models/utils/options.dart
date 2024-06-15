import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@protected

///
class PayMongoOptions extends Equatable {
  ///
  const PayMongoOptions({
    required this.path,
    this.data,
    this.params,
  });

  ///
  factory PayMongoOptions.fromMap(Map<String, dynamic> map) {
    return PayMongoOptions(
      data: Map<String, dynamic>.from(
        map['data'] as Map<String, dynamic>? ?? const {},
      ),
      path: map['path']?.toString() ?? '',
      params: map['params'] as Map<String, dynamic>?,
    );
  }

  ///
  factory PayMongoOptions.fromJson(String source) =>
      PayMongoOptions.fromMap(json.decode(source) as Map<String, dynamic>);

  ///
  final Map<String, dynamic>? data;

  ///
  final String path;

  ///
  final Map<String, dynamic>? params;

  ///
  PayMongoOptions copyWith({
    Map<String, dynamic>? data,
    String? method,
    String? path,
    String? secret,
    Map<String, dynamic>? params,
  }) {
    return PayMongoOptions(
      data: data ?? this.data,
      path: path ?? this.path,
      params: params as Map<String, String>? ?? this.params,
    );
  }

  ///
  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'path': path,
      'params': params,
    };
  }

  ///
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [data, path, params];
}
