import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case/services/participants_service.dart';
import 'package:voco_case/utils/constant.dart';

final ParticipantProvider = FutureProvider.autoDispose((_) {
  final Service = ParticipantsService.instance;
  return Service.getParticipants();
});
