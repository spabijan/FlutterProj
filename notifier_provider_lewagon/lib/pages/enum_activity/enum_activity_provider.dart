import 'package:notifier_provider_lewagon/model/activity.dart';
import 'package:notifier_provider_lewagon/pages/enum_activity/enum_activity_state.dart';
import 'package:notifier_provider_lewagon/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enum_activity_provider.g.dart';

@riverpod
class EnumActivity extends _$EnumActivity {
  int _errorCounter = 0;

  @override
  EnumActivityState build() {
    ref.onDispose(() => print('[enumActivity] disposed'));
    print('hashCode: $hashCode');
    return EnumActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    print('hashCode: $hashCode');
    state = state.copyWith(status: ActivityStatus.initial);
    try {
      if (_errorCounter++ % 2 != 1) {
        await Future.delayed(Duration(microseconds: 500));
        throw 'Fail to fetch activity';
      }

      final response = await ref.read(dioProvider).get('?type=$activityType');
      final activity = Activity.fromJson(response.data);
      state =
          state.copyWith(status: ActivityStatus.success, activity: activity);
    } catch (e) {
      state =
          state.copyWith(error: e.toString(), status: ActivityStatus.failure);
    }
  }
}
