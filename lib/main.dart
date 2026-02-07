import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'main_dev.dart' as dev;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  dev.main();
}
