import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:bots_app/src/app.dart';
import 'package:bots_app/src/providers/providers.dart';

void main() => runApp(AppProvider(

      httpClient: Client(),
      child: MyApp(),

    ));
