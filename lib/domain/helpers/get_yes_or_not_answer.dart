import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/yes_or_not_response.dart';
import '../entities/Message.dart';

class GetYesOrNotAnswer {
  static final _dio = Dio();

  static Message _processResponse(YesOrNotResponse yesOrNotResponse) {
    var message = Message(text: yesOrNotResponse.answer, fromWho: FromWho.her, imageUrl: yesOrNotResponse.image);

    return message;
  }

  static Future<Message?> getAnswer() async {
    try {
      var response = await _dio.get('https://yesno.wtf/');
      final yesOrNotResponse = YesOrNotResponse.fromJsonMap(response.data);
      return _processResponse(yesOrNotResponse);
    } catch (e) {
      return null;
    }
  }
}
