import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:qurani_tukufu/models/book.dart';
import 'package:qurani_tukufu/repositories/book_repository.dart';
import '../../../common/api_client/data_state.dart';
import '../../../common/event/event_bus_mixin.dart';
import '../../../models/pagination.dart';
import 'book_state.dart';

@Injectable()
class BookCubit extends Cubit<BookState> with EventBusMixin {
  late final BookRepository _bookRepository;

  BookCubit({
    required BookRepository bookRepository,
  }) : super(const BookState(books: [])) {
    _bookRepository = bookRepository;
  }


  Future<void> fetchItems() async {
    try {
      final DataState<List<Book>> results =
          await _bookRepository.getBooks();
      if (results is DataSuccess) {
        emit(state.copyWith(
          books: results.data,
          status: (results.data ?? []).isEmpty
              ? DataSourceStatus.empty
              : DataSourceStatus.success,
        ));
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          status: DataSourceStatus.failed, message: e.toString()));
    }
  }
}
