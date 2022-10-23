import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/help_model.dart';

const getHelpUrl = "/getHelp";

class GetHelpRequest {
  static Future<List<HelpModel>> getHelp() async {
    final response = await DioHelper.getData(url: getHelpUrl, query: {});
    List<dynamic> encodedHelpList = response.data['help'];
    final helpList = encodedHelpList
        .map((helpItem) => HelpModel.fromJson(helpItem))
        .toList();
    return helpList;
  }
}
