import 'package:provider/provider.dart';

import '../controller/cast_controller.dart';
import '../controller/show_controller.dart';

getProviders() {
  return [
    ChangeNotifierProvider(create: (_) => ShowController()),
    ChangeNotifierProvider(create: (_) => CastController()),
  ];
}