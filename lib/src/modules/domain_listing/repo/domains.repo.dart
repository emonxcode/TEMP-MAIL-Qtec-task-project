import '../../../config/api_endpoints.dart';
import '../../../services/network_service_impl.dart';

class DomainsRepository {
  final NetworkApiServices apiService;

  DomainsRepository(this.apiService);

  Future getAvailableDomains() async {
    try {
      var response = await apiService.getApi(Urls.domainsUrl);
     
      return response;
    } catch (ex) {
      rethrow;
    }
  }
}
