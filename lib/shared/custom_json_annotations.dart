import 'package:freezed_annotation/freezed_annotation.dart';

/// JsonKey that makes fields required and not nullable
const requiredNonNull = JsonKey(required: true, disallowNullValue: true);

/// JsonKey that ignores serialization of null fields
const doNotIncludeIfNull = JsonKey(includeIfNull: false);
