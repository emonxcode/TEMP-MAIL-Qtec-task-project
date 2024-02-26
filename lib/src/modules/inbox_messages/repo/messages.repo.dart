import '../../../config/api_endpoints.dart';
import '../../../services/network_service_impl.dart';

class MessagesRepository {
  final NetworkApiServices apiService;

  MessagesRepository(this.apiService);

  Future getMessages() async {
    try {
      var response = await apiService.getApi(Urls.messagesUrl);

      return response;
    } catch (ex) {
      rethrow;
    }
  }
}
