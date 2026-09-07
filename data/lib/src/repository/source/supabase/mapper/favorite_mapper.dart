import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FavoriteMapper extends BaseDataMapper<FavoriteResponseDto, FavoriteEntity> {
  @override
  FavoriteEntity mapToEntity(FavoriteResponseDto? data) {
    return FavoriteEntity(
      id: data?.id ?? '',
      userId: data?.userId ?? '',
      productId: data?.productId ?? '',
      createdAt: DateTime.tryParse(data?.createAt ?? ''),
    );
  }
}
