import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:crud_flutter_cubit_project/services/anggota_service.dart';

import '../models/anggota.dart';

part 'anggota_state.dart';

class AnggotaCubit extends Cubit<AnggotaState> {
  AnggotaCubit() : super(AnggotaState());

  void init() {
    getAnggota();
  }

  void getAnggota() async {
    emit(state.copyWith(isLoading: true));
    List<Anggota> anggota = await AnggotaService.fetchAllProducts();
    emit(state.copyWith(anggota: anggota));
    emit(state.copyWith(isLoading: false));
  }

  void addAnggota(Anggota anggota) async {
    emit(state.copyWith(isLoading: true));
    await AnggotaService.addAnggota(anggota: anggota);
    getAnggota();
    emit(state.copyWith(isLoading: false));
  }

  void updateAnggota(Anggota anggota) async {
    emit(state.copyWith(isLoading: true));
    await AnggotaService.updateAnggota(anggota: anggota);
    getAnggota();
    emit(state.copyWith(isLoading: false));
  }

  void deleteAnggota(Anggota anggota) async {
    emit(state.copyWith(isLoading: true));
    await AnggotaService.deleteAnggota(anggota: anggota);
    getAnggota();
    emit(state.copyWith(isLoading: false));
  }
}
