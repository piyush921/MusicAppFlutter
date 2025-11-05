import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../core/network/api_client.dart';
import 'home_model.dart';

class HomeService {
  final ApiClient apiClient;

  HomeService(this.apiClient);

  Future<MovieResponse> fetchHomeData() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${dotenv.env['API_READ_ACCESS_TOKEN']}',
    };

    final data = await apiClient.get(
        'movie/now_playing?language=en-US&page=1',
        headers: headers
    );
    return MovieResponse.fromJson(data);
  }
}
