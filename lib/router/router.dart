import 'package:app_landing_page/router/router_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    //Rutas
    router.define('/:page', handler: homeHandler);


    //404
    router.notFoundHandler = homeHandler;
  }
}
