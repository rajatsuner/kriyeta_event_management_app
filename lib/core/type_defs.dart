import 'package:fpdart/fpdart.dart';
import 'package:kriyeta_event_manage/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
