import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:bots_app/src/services/services.dart';

import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  final Client httpClient;
  final Widget child;
  AppProvider({@required this.httpClient, @required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: AppService(httpClient),
        ),
      ],
      child: child,
    );
  }
}
