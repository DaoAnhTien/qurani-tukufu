import 'package:injectable/injectable.dart';
import 'package:qurani_tukufu/data/remote/surah/surah_service.dart';
import 'package:qurani_tukufu/models/ayah.dart';
import 'package:qurani_tukufu/models/surah.dart';

import '../common/api_client/data_state.dart';
import '../data/remote/ayah/ayah_service.dart';

abstract class AyahRepository {
  Future<DataState<List<Ayah>>> getAyahs({String? keyword});
}

@LazySingleton(as: AyahRepository)
class AyahRepositoryImpl implements AyahRepository {
  final AyahService _ayahService;

  AyahRepositoryImpl({required AyahService ayahService})
      : _ayahService = ayahService;

  @override
  Future<DataState<List<Ayah>>> getAyahs({String? keyword}) {
    return _ayahService.getAyahs(keyword: keyword);
  }
}
