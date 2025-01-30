import 'package:notifier_provider_lewagon/model/activity.dart';
import 'package:notifier_provider_lewagon/pages/enum_async_activity/enum_async_activity_state.dart';
import 'package:notifier_provider_lewagon/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enum_async_activity_provider.g.dart';

@riverpod
class EnumAsyncActivity extends _$EnumAsyncActivity {
  int _errorCounter = 0;

  EnumAsyncActivity() {
    print('[enumAsyncActivity] initialized');
  }

  @override
  EnumAsyncActivityState build() {
    ref.onDispose(() => print('[enumAsyncActivity] disposed'));
    print('hashCode: $hashCode');
    state = EnumAsyncActivityState.initial();
    fetchActivity(activityTypes[0]);
    return EnumAsyncActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    print('hashCode: $hashCode');
    state = state.copyWith(status: AsyncActivityStatus.loading);
    try {
      if (_errorCounter++ % 2 != 1) {
        await Future.delayed(Duration(microseconds: 500));
        throw 'Fail to fetch activity';
      }

      final response = await ref.read(dioProvider).get('?type=$activityType');
      final activity = Activity.fromJson(response.data);
      state = state.copyWith(
          status: AsyncActivityStatus.success, activity: activity);
    } catch (e) {
      state = state.copyWith(
          error: e.toString(), status: AsyncActivityStatus.failure);
    }
  }
}
