part of 'anggota_cubit.dart';

class AnggotaState extends Equatable {
  final bool isLoading;
  final List<Anggota> anggota;
  final String message;
  final bool isSuccess;

  AnggotaState({
    this.isLoading = false,
    this.anggota = const [],
    this.message = '',
    this.isSuccess = false,
  });

  AnggotaState copyWith({
    bool? isLoading,
    List<Anggota>? anggota,
    String? message,
    bool? isSuccess,
  }) =>
      AnggotaState(
        anggota: anggota ?? this.anggota,
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message,
        isSuccess: isSuccess ?? this.isSuccess,
      );

  @override
  List<Object> get props => [
        isLoading,
        anggota,
        message,
        isSuccess,
      ];
}
