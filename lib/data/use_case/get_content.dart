import 'package:movie_app_flutter/pages/detail/detail_page.dart';

abstract class GetContentUseCase {
  Future<List<ContentDetailData>> call(int page);
}
