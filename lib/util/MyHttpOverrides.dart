
import 'dart:io';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    HttpClient client= super.createHttpClient(context); //<<--- notice 'super'
    client.badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
    return client;
  }
}