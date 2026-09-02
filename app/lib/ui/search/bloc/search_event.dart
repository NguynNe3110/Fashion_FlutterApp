import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../base/bloc/base_bloc_event.dart';

part 'search_event.freezed.dart';

abstract class SearchEvent extends BaseBlocEvent {
  const SearchEvent();
}

@freezed
sealed class SearchPageInitiated extends SearchEvent
    with _$SearchPageInitiated {
  const SearchPageInitiated._();
  const factory SearchPageInitiated({
    required String id,
  }) = _SearchPageInitiated;
}
