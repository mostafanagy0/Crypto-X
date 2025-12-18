import 'package:crypto_x/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, Paramters> {
  Future<Either<Failure, T>> call(Paramters paramters);
}

class NoParamters extends Equatable {
  const NoParamters();
  @override
  List<Object?> get props => [];
}
