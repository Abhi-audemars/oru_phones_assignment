class SearchResponse {
  List<String> makes;
  List<String> models;
  String message;

  SearchResponse({required this.makes, required this.models, required this.message});

  
  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      makes: List<String>.from(json['makes']),
      models: List<String>.from(json['models']),
      message: json['message'],
    );
  }
}
