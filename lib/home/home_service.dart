import '../../../core/network/api_client.dart';
import 'home_model.dart';

class HomeService {
  final ApiClient apiClient;

  HomeService(this.apiClient);

  Future<List<HomeItem>> fetchHomeData() async {
    final data = await apiClient.get('movie/now_playing?language=en-US&page=1'); // Example endpoint
    final List<dynamic> jsonList = data;
    return jsonList.map((e) => HomeItem.fromJson(e)).toList();
  }
}