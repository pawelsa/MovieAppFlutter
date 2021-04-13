import 'package:movie_app_flutter/data/view/content_detail_data.dart';

abstract class GetContentUseCase {
  Future<List<ContentDetailData>> call(int page);
}
