class YesOrNotResponse {
  String answer;
  String image;
  bool forced;

  YesOrNotResponse({
    required this.answer,
    required this.forced,
    required this.image
  });

  factory YesOrNotResponse.fromJsonMap(Map<String, dynamic> json) =>
      YesOrNotResponse(answer: json['answer'], forced: json['forced'], image: json['image']);

}