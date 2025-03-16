// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Countrystatemodel {
  final String countryName;
  final String countryAbbreviation;
  final String stateCode;
  final String stateName;
  Countrystatemodel({
    required this.countryName,
    required this.countryAbbreviation,
    required this.stateCode,
    required this.stateName,
  });

  Countrystatemodel copyWith({
    String? countryName,
    String? countryAbbreviation,
    String? stateCode,
    String? stateName,
  }) {
    return Countrystatemodel(
      countryName: countryName ?? this.countryName,
      countryAbbreviation: countryAbbreviation ?? this.countryAbbreviation,
      stateCode: stateCode ?? this.stateCode,
      stateName: stateName ?? this.stateName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countryName': countryName,
      'countryAbbreviation': countryAbbreviation,
      'stateCode': stateCode,
      'stateName': stateName,
    };
  }

  factory Countrystatemodel.fromMap(Map<String, dynamic> map) {
    return Countrystatemodel(
      countryName: map['countryName'] as String,
      countryAbbreviation: map['countryAbbreviation'] as String,
      stateCode: map['stateCode'] as String,
      stateName: map['stateName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Countrystatemodel.fromJson(String source) => Countrystatemodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Countrystatemodel(countryName: $countryName, countryAbbreviation: $countryAbbreviation, stateCode: $stateCode, stateName: $stateName)';
  }

 @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Countrystatemodel &&
          runtimeType == other.runtimeType &&
          countryAbbreviation == other.countryAbbreviation;

@override
  int get hashCode => countryAbbreviation.hashCode;

}
