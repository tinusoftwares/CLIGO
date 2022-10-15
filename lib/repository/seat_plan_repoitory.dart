


import 'package:http/http.dart' as http;

class SeatPlanRepository {

  Future seatPlanDynamicRepo(String tripId,String journeydate) async {

    Uri url = Uri.parse('http://159.223.61.171/backend/modules/api/v1/tickets/seat/$tripId/$journeydate');
    try {
      final response = await http.get(url);
      print('seatPlanDynamicRepo code :' + response.statusCode.toString());
      return response;

    } on Exception catch (exception) {
      throw (exception);
    } catch (error) {
      throw Exception(error);
    }
  }

}
