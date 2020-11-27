import 'package:freezed_annotation/freezed_annotation.dart';

/// JsonKey that makes fields required and not nullable
const requiredNotNull = JsonKey(required: true, disallowNullValue: true);

/// JsonKey that ignores serialization of null fields
const doNotIncludeIfNull = JsonKey(includeIfNull: false);

/// Serialize [DateTime] object
int dateTimeToJson(DateTime d) => d?.millisecondsSinceEpoch;

/// Deserialize [DateTime] object
DateTime dateTimeFromJson(int ms) =>
    ms == null ? null : DateTime.fromMillisecondsSinceEpoch(ms);
