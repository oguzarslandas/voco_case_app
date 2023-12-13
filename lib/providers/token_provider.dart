import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case/utils/constant.dart';

final tokenProvider = Provider<String>((ref) {
  return token;
});