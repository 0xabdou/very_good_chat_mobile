import 'package:freezed_annotation/freezed_annotation.dart';

const requiredNonNull = JsonKey(required: true, disallowNullValue: true);
const doNotIncludeIfNull = JsonKey(includeIfNull: false);
