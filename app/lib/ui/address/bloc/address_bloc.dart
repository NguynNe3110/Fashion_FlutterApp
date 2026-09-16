import 'dart:async';

import 'package:collection/collection.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/bloc/base_bloc.dart';
import 'address.dart';

@injectable
class AddressBloc extends BaseBloc<AddressEvent, AddressState> {
  AddressBloc(
    this._getAddressesUseCase,
    this._deleteAddressUseCase,
    this._updateAddressUseCase,
    this._getMeUseCase,
  ) : super(const AddressState()) {
    on<AddressPageInitiated>(_onAddressPageInitiated);
    on<DeleteAddressPressed>(_onDeleteAddressPressed);
    on<SetDefaultAddressPressed>(_onSetDefaultAddressPressed);
  }

  final GetAddressesUseCase _getAddressesUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  final GetMeUseCase _getMeUseCase;

  FutureOr<void> _onAddressPageInitiated(
    AddressPageInitiated event,
    Emitter<AddressState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        emit(state.copyWith(loadException: null));
        final user = await _getMeUseCase.execute(const GetMeUseCaseInput());
        final userId = user.profile.id.toString();

        final output = await _getAddressesUseCase.execute(GetAddressesUseCaseInput(userId: userId));
        emit(state.copyWith(addresses: output.addresses));
      },
      doOnSubscribe: () async => emit(state.copyWith(isShimmerLoading: true)),
      doOnSuccessOrError: () async => emit(state.copyWith(isShimmerLoading: false)),
      doOnError: (e) async => emit(state.copyWith(loadException: e)),
      handleLoading: false,
    );
  }

  FutureOr<void> _onDeleteAddressPressed(
    DeleteAddressPressed event,
    Emitter<AddressState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        await _deleteAddressUseCase.execute(DeleteAddressUseCaseInput(id: event.id));
        add(const AddressPageInitiated());
      },
    );
  }

  FutureOr<void> _onSetDefaultAddressPressed(
    SetDefaultAddressPressed event,
    Emitter<AddressState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        final address = state.addresses.firstWhereOrNull((a) => a.id == event.id);
        if (address == null) return;

        await _updateAddressUseCase.execute(
          UpdateAddressUseCaseInput(address: address.copyWith(isDefault: true)),
        );
        add(const AddressPageInitiated());
      },
    );
  }
}
