import 'package:app1/domain/Entities/message.dart';
import 'package:app1/infraestructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class getYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
