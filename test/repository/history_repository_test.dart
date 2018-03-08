import 'package:flutter_test/flutter_test.dart';
import 'package:quicka/repository/history_repository.dart';
import 'package:quicka/model/history.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  HistoryRepository _historyRepository;

  setUp(() {
    // @see: https://stackoverflow.com/questions/44357053/flutter-test-missingpluginexception
    SharedPreferences.setMockInitialValues({});
    _historyRepository = new HistoryRepository(debug: true);
  });

  test('findAll', () async {
    await _historyRepository.findAll().then((histories) {
      expect(histories, []);
    });

    await _historyRepository.add(new History('History 1'));

    await _historyRepository.findAll().then((histories) {
      expect(histories, hasLength(1));
      expect(histories.first.name, 'History 1');
    });

    await _historyRepository.add(new History('History 2'));

    await _historyRepository.findAll().then((histories) {
      expect(histories, hasLength(2));
      expect(histories.last.name, 'History 2');
    });

    await _historyRepository.clear();

    await _historyRepository.findAll().then((histories) {
      expect(histories, []);
    });
  });
}
