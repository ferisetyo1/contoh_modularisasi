import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

@InjectableInit(
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureInjection(String env) async =>
    init(getIt, environment: env);
