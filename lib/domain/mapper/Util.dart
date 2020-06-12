import 'package:moor/moor.dart';

Value<T> objectToDbValueOrAbsent<T>(T object) {
  if(object == null) {
    return Value.absent();
  } else {
    return Value(object);
  }
}
