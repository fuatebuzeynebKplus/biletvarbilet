import 'package:bamobile1/common/data/models/token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asynchronous_results.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AsynchronousResults {
  String SearchId;
  String ReturnNewResult;
  Token token;

  AsynchronousResults({
    required this.SearchId,
    required this.ReturnNewResult,
    required this.token,
  });

  factory AsynchronousResults.fromJson(Map<String, dynamic> json) =>
      _$AsynchronousResultsFromJson(json);

  Map<String, dynamic> toJson() => _$AsynchronousResultsToJson(this);
}

class AsynchronousResultsJson {
  AsynchronousResults request;

  AsynchronousResultsJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
