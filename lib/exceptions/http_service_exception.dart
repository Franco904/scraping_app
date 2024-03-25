import 'package:scraping_app/exceptions/app_exception.dart';

class HttpServiceException extends AppException {
  const HttpServiceException(String message) : super(message);
}
