import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/utils/network/INetworkInfo.dart';
import 'package:template/core/utils/network/NetworkInfo.dart';

class ConnectivityMock extends Mock implements Connectivity {}

void main() {
  late INetworkInfo networkInfo;
  Connectivity? connectivity;

  setUp(() {
    connectivity = ConnectivityMock();
    networkInfo = NetworkInfo(connectivity);
  });
  
  tearDown(() {});
  
  group('isConnected', () {
    test('If there is internet connection, it should be return true', () async {
      when(connectivity!.checkConnectivity())
          .thenAnswer((_) => Future.value(ConnectivityResult.wifi));

      final result = await networkInfo.isConnected();

      verify(connectivity!.checkConnectivity());
      expect(result, true);

    });
  });
}
