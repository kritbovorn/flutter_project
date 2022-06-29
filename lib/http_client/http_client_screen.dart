import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpClientScreen extends StatelessWidget {
  const HttpClientScreen({Key? key}) : super(key: key);

  request() async {
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient
          .getUrl(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

      request.headers.add('token', 'secureTokenString');
      HttpClientResponse response = await request.close();

      var text = await response.transform(utf8.decoder).join();
      httpClient.close();
      debugPrint(text);
    } catch (e) {
      debugPrint('Failure ... : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HttpClient'),
      ),
      body: Center(  
        child: ElevatedButton(  
          onPressed: request,
          child: const Text('Send Request by Http Client'),
        ),
      ),
    );
  }
}
