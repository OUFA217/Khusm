import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khusm/core/language/lang.dart';
import 'package:khusm/core/network/shared_prefrences.dart';
import 'package:khusm/features/main/cubit/states.dart';
import 'package:logger/logger.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  String lang = CacheHelper.getActualData(key: 'lang') ?? 'en';

  void changeLang(value) {
    // lang == 'en' ? lang = 'ar' : lang = 'en';

    if (CacheHelper.getActualData(key: 'lang') == 'ar') {
      CacheHelper.saveDate(key: 'lang', value: 'en');
      lang = CacheHelper.getActualData(key: 'lang');

      appLang = CacheHelper.getActualData(key: 'lang');
    } else {
      CacheHelper.saveDate(key: 'lang', value: 'ar');
      lang = CacheHelper.getActualData(key: 'lang');
      appLang = CacheHelper.getActualData(key: 'lang');
    }
    // value ? lang = 'en' : lang = 'ar';
    // value ? appLang = 'en' : appLang = 'ar';
    emit(MainLanguageState());
    Logger().e(lang.toString());
  }
}
