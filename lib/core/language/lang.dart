import 'package:intl/intl.dart';

String appLang = isArabic() ? 'ar' : 'en';
bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
