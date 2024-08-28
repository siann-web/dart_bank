import '../lib/models/premium_account.dart';
import '../lib/models/simple_account.dart';
import '../lib/services/transfer_service.dart';
import 'package:test/test.dart';
import '../lib/models/account.dart';

void main() {
  group('transferService', () {
    late Account account1;
    late Account account2;

    setUp(() {
      account1 = SimpleAccount('Diego', 1001, 1000.0);
      account2 = PremiumAccount(
        'Arthur',
        1002,
        500.0,
        cashBack: 10.0,
      );
    });

    test('should transfer money from one simple account to premium account',
        () {
      transferService(account1, account2, 1100.00);

      expect(account1.getBalance(), -100.0);
      expect(account2.getBalance(), 1600.0);
    });
  });
}
