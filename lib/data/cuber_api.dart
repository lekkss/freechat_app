class CyberApi {
  final String? text;
  final String? result;

  CyberApi({
    required this.text,
    required this.result,
  });

  factory CyberApi.fromJson(Map<dynamic, dynamic> json) => CyberApi(
        text: json['Text'] as String?,
        result: json['Result'] as String?,
      );
}
