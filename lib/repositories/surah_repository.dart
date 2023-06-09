
import 'package:injectable/injectable.dart';
import 'package:qurani_tukufu/data/remote/surah/surah_service.dart';
import 'package:qurani_tukufu/models/surah.dart';

import '../common/api_client/data_state.dart';
abstract class SurahRepository {
  Future<DataState<List<Surah>>> getSurah() ;
}

@LazySingleton(as: SurahRepository)
class SurahRepositoryImpl implements SurahRepository {
  final SurahService _surahService;

  SurahRepositoryImpl({required SurahService surahService})
      : _surahService = surahService;

  @override
  Future<DataState<List<Surah>>> getSurah()  {
    return _surahService.getSurah();
  }
}
