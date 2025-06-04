import 'dart:io';

void main() {
  final fontDir = Directory('fonts');
  if (!fontDir.existsSync()) {
    print('No fonts directory found.');
    return;
  }

  final files =
      fontDir.listSync().whereType<File>().where((f) => f.path.endsWith('.ttf') || f.path.endsWith('.otf')).toList();

  final Map<String, List<Map<String, String>>> fontFamilies = {};

  for (final file in files) {
    final name = file.uri.pathSegments.last;
    final parts = name.split('-');
    if (parts.length < 2) continue;

    final family = parts[0];
    final stylePart = parts[1].split('.').first.toLowerCase();

    final font = {
      'asset': 'fonts/$name',
      if (stylePart.contains('bold')) 'weight': '700',
      if (stylePart.contains('italic')) 'style': 'italic',
    };

    fontFamilies.putIfAbsent(family, () => []).add(font);
  }

  print('flutter:');
  print('  fonts:');
  fontFamilies.forEach((family, fonts) {
    print('    - family: $family');
    print('      fonts:');
    for (final font in fonts) {
      final attrs = font.entries.map((e) => '          ${e.key}: ${e.value}').join('\n');
      print('        -\n$attrs');
    }
  });
}
