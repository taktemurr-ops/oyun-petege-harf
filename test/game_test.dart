import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_petege_harf/oyun_petege_harf.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(harfPetegiConfig.title.length, 33);
    expect(harfPetegiConfig.tagline.length, 33);
    for (final s in harfPetegiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(harfPetegiConfig.gameId, harfPetegiId);
    expect(harfPetegiRules.gameId, harfPetegiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(harfPetegiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: harfPetegiId, optionalMechanics: harfPetegiRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      harfPetegiRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(harfPetegiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
