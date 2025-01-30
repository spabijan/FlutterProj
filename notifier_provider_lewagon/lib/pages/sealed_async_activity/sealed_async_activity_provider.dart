import 'package:notifier_provider_lewagon/model/activity.dart';
import 'package:notifier_provider_lewagon/pages/sealed_activity/sealed_activity_state.dart';
import 'package:notifier_provider_lewagon/pages/sealed_async_activity/sealed_async_activity_state.dart';
import 'package:notifier_provider_lewagon/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sealed_async_activity_provider.g.dart';

@riverpod
class SealedActivity extends _$SealedActivity {
  int _errorCounter = 0;

  @override
  SealedAsyncActivityState build() {
    ref.onDispose(() => print('[enumActivity] disposed'));
    return SealedAsyncActivityLoading();
  }

  Future<void> fetchActivity(String activityType) async {
    print('hashCode: $hashCode');
    state = SealedAsyncActivityLoading();
    try {
      if (_errorCounter++ % 2 != 1) {
        await Future.delayed(Duration(microseconds: 500));
        throw 'Fail to fetch activity';
      }

      final response = await ref.read(dioProvider).get('?type=$activityType');
      final activity = Activity.fromJson(response.data);
      state = SealedAsyncActivitySuccess(activity: activity);
    } catch (e) {
      state = SealedAsyncActivityFailure(error: e.toString());
    }
  }
}
