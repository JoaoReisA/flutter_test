import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/data/repositories/yelp_repository.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository_contract.dart';

import '../../utils/mocks.dart';

void main() {
  late YelpRepositoryContract yelpRepository;
  late Dio dio;

  setUp(() {
    dio = MockDio();
    yelpRepository = YelpRepository(dio: dio);
  });

  group(
    YelpRepository,
    () {
      test('Should get a list of restaurants', () async {
        //Arrange
        when(() => dio.post(any(), data: any(named: 'data'))).thenAnswer(
          (_) async => Response(
            data: {},
            requestOptions: RequestOptions(),
          ),
        );
        //Act
        final result = await yelpRepository.getRestaurants();
        //Assert
        expect(result, []);
        verify(() => dio.get(any())).called(1);
      });
    },
  );
}
