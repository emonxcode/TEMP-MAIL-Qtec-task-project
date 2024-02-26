import 'package:temp_mail/src/local/sqflite_db_helper.dart';
import 'package:temp_mail/src/modules/authentication/repo/auth.repo.dart';
import 'package:temp_mail/src/modules/domain_listing/repo/domains.repo.dart';
import 'package:temp_mail/src/modules/inbox_messages/repo/messages.repo.dart';
import 'package:temp_mail/src/services/network_service_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton(NetworkApiServices());
  getIt.registerSingleton(MessagesRepository(getIt<NetworkApiServices>()));
  getIt.registerSingleton(DomainsRepository(getIt<NetworkApiServices>()));
  getIt.registerSingleton(AuthRepository(getIt<NetworkApiServices>()));
  getIt.registerSingleton(SqfliteDatabaseHelper());
}
