import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/network/api_client.dart';
import 'home_service.dart';
import 'home_model.dart';

// Provider for HomeService dependency
final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(ref.read(apiClientProvider));
});

// ViewModel Provider
final homeViewModelProvider =
AsyncNotifierProvider<HomeViewModel, MovieResponse>(HomeViewModel.new);

class HomeViewModel extends AsyncNotifier<MovieResponse> {
  @override
  Future<MovieResponse> build() async {
    final service = ref.read(homeServiceProvider);
    return await service.fetchNowPlayingData();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(homeServiceProvider);
      return await service.fetchNowPlayingData();
    });
  }
}

// Provide ApiClient globally
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
