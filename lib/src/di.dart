import 'package:temp_mail/src/modules/inbox_messages/repo/inbox.repo.dart';
import 'package:temp_mail/src/services/network_service_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton(NetworkApiServices());
  getIt.registerSingleton(InboxRepository(getIt<NetworkApiServices>()));
}
