import '../../../config/api_endpoints.dart';
import '../../../services/network_service_impl.dart';

class AuthRepository {
  final NetworkApiServices apiService;

  AuthRepository(this.apiService);

  Future createAccount(data) async {
    try {
      var response = await apiService.postApi(data, Urls.accountUrl);

      return response;
    } catch (ex) {
      rethrow;
    }
  }

    Future login(data) async {
    try {
      var response = await apiService.postApi(data, Urls.loginUrl);

      return response;
    } catch (ex) {
      rethrow;
    }
  }
}
