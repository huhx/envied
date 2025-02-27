import 'package:envied/envied.dart';
import 'package:source_gen_test/annotations.dart';

@ShouldThrow('`@Envied` can only be used on classes.')
@Envied()
const foo = 'bar';

@ShouldThrow("Environment variable file doesn't exist at `.env`.")
@Envied(requireEnvFile: true)
abstract class Env1 {}

@ShouldThrow('Environment variable not found for field `foo`.')
@Envied(path: 'test/.env.example')
abstract class Env2 {
  @EnviedField()
  static const dynamic foo = null;
}

@ShouldThrow(
  'Envied can only handle types such as `int`, `double`, `num`, `bool` and `String`. Type `Symbol` is not one of them.',
)
@Envied(path: 'test/.env.example')
abstract class Env3 {
  @EnviedField()
  static const Symbol? testString = null;
}

@ShouldThrow('Type `int` do not align up to value `testString`.')
@Envied(path: 'test/.env.example')
abstract class Env4 {
  @EnviedField()
  static const int? testString = null;
}

@ShouldThrow('Type `double` do not align up to value `testString`.')
@Envied(path: 'test/.env.example')
abstract class Env5 {
  @EnviedField()
  static const double? testString = null;
}

@ShouldThrow('Type `num` do not align up to value `testString`.')
@Envied(path: 'test/.env.example')
abstract class Env6 {
  @EnviedField()
  static const num? testString = null;
}

@ShouldThrow('Type `bool` do not align up to value `testString`.')
@Envied(path: 'test/.env.example')
abstract class Env7 {
  @EnviedField()
  static const bool? testString = null;
}

@ShouldGenerate('''
final class _Env8 {
  static const String testString = 'testString';

  static const int testInt = 123;

  static const double testDouble = 1.23;

  static const bool testBool = true;

  static const testDynamic = '123abc';
}
''')
@Envied(path: 'test/.env.example')
abstract class Env8 {
  @EnviedField()
  static const String? testString = null;
  @EnviedField()
  static const int? testInt = null;
  @EnviedField()
  static const double? testDouble = null;
  @EnviedField()
  static const bool? testBool = null;
  @EnviedField()
  static const testDynamic = null;
}

@ShouldGenerate('''
final class _Env9 {
  static const String testString = 'test_string';
}
''')
@Envied(path: 'test/.env.example')
abstract class Env9 {
  @EnviedField(varName: 'test_string')
  static const String? testString = null;
}

@ShouldGenerate('''
final class _Env10 {
  static const String systemVar = 'system_var';
}
''')
@Envied(path: 'test/.env.example')
abstract class Env10 {
  @EnviedField(varName: 'SYSTEM_VAR')
  static const String? systemVar = null;
}

@ShouldGenerate('''
final class _Foo {
  static const String testString = 'test_string';
}
''')
@Envied(path: 'test/.env.example', name: 'Foo')
abstract class Env11 {
  @EnviedField(varName: 'test_string')
  static const String? testString = null;
}

@ShouldGenerate('static const List<int> _enviedkeytestString', contains: true)
@ShouldGenerate('static const List<int> _envieddatatestString', contains: true)
@ShouldGenerate('''
  static final String testString = String.fromCharCodes(List<int>.generate(
    _envieddatatestString.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatatestString[i] ^ _enviedkeytestString[i]));
''', contains: true)
@Envied(path: 'test/.env.example', obfuscate: true)
abstract class Env12 {
  @EnviedField()
  static const String? testString = null;
}

@ShouldGenerate('static const List<int> _enviedkeytestString', contains: true)
@ShouldGenerate('static const List<int> _envieddatatestString', contains: true)
@ShouldGenerate('''
  static final String testString = String.fromCharCodes(List<int>.generate(
    _envieddatatestString.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatatestString[i] ^ _enviedkeytestString[i]));
''', contains: true)
@Envied(path: 'test/.env.example', obfuscate: false)
abstract class Env13 {
  @EnviedField(obfuscate: true)
  static const String? testString = null;
}

@ShouldThrow('Environment variable not found for field `testDefaultParam`.')
@Envied(path: 'test/.env.example')
abstract class Env14 {
  @EnviedField(defaultValue: null)
  static const String? testDefaultParam = null;
}

@ShouldGenerate('''
final class _Env15 {
  static const String testDefaultParam = 'test_';

  static const String testString = 'testString';

  static const int testInt = 123;

  static const double testDouble = 1.23;

  static const bool testBool = true;

  static const testDynamic = '123abc';
}
''')
@Envied(path: 'test/.env.example')
abstract class Env15 {
  @EnviedField(defaultValue: 'test_')
  static const String? testDefaultParam = null;
  @EnviedField()
  static const String testString = 'testString';
  @EnviedField()
  static const int testInt = 123;
  @EnviedField()
  static const double testDouble = 1.23;
  @EnviedField()
  static const bool testBool = true;
  @EnviedField()
  static const dynamic testDynamic = '123abc';
}

@ShouldGenerate('''
final class _Env16 {
  static const String testDefaultParam = 'test_';
}
''')
@Envied(path: 'test/.env.example')
abstract class Env16 {
  @EnviedField(defaultValue: 'test_')
  static const String? testDefaultParam = null;
}

@ShouldGenerate('static const List<int> _enviedkeytestString', contains: true)
@ShouldGenerate('static const List<int> _envieddatatestString', contains: true)
@ShouldGenerate('''
  static final String testString = String.fromCharCodes(List<int>.generate(
    _envieddatatestString.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatatestString[i] ^ _enviedkeytestString[i]));
''', contains: true)
@Envied(path: 'test/.env.example', obfuscate: true)
abstract class Env17 {
  @EnviedField(defaultValue: 'test_')
  static const String? testString = null;
}

@ShouldGenerate('static const List<int> _enviedkeytestString', contains: true)
@ShouldGenerate('static const List<int> _envieddatatestString', contains: true)
@ShouldGenerate('''
  static final String testString = String.fromCharCodes(List<int>.generate(
    _envieddatatestString.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatatestString[i] ^ _enviedkeytestString[i]));
''', contains: true)
@Envied(path: 'test/.env.example', obfuscate: false)
abstract class Env18 {
  @EnviedField(obfuscate: true, defaultValue: 'test_')
  static const String? testString = null;
}

@ShouldGenerate('static final int _enviedkeytestInt', contains: true)
@ShouldGenerate(
  'static final int testInt = _enviedkeytestInt ^',
  contains: true,
)
@Envied(path: 'test/.env.example')
abstract class Env19 {
  @EnviedField(obfuscate: true)
  static const int testInt = 123;
}

@ShouldGenerate('static final bool _enviedkeytestBool', contains: true)
@ShouldGenerate(
  'static final bool testBool = _enviedkeytestBool ^',
  contains: true,
)
@Envied(path: 'test/.env.example')
abstract class Env20 {
  @EnviedField(obfuscate: true)
  static const bool testBool = true;
}

@ShouldGenerate('static const List<int> _enviedkeytestDynamic', contains: true)
@ShouldGenerate('static const List<int> _envieddatatestDynamic', contains: true)
@ShouldGenerate('''
  static final testDynamic = String.fromCharCodes(List<int>.generate(
    _envieddatatestDynamic.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatatestDynamic[i] ^ _enviedkeytestDynamic[i]));
''', contains: true)
@Envied(path: 'test/.env.example')
abstract class Env21 {
  @EnviedField(obfuscate: true)
  static const dynamic testDynamic = '123abc';
}

@ShouldThrow(
  'Obfuscated envied can only handle types such as `int`, `bool` and `String`. Type `Symbol` is not one of them.',
)
@Envied(path: 'test/.env.example')
abstract class Env22 {
  @EnviedField(obfuscate: true)
  static const Symbol? testString = null;
}

@ShouldThrow('Type `int` does not align up to value `testString`.')
@Envied(path: 'test/.env.example')
abstract class Env23 {
  @EnviedField(obfuscate: true)
  static const int? testString = null;
}

@ShouldThrow('Type `bool` does not align up to value `testString`.')
@Envied(path: 'test/.env.example')
abstract class Env24 {
  @EnviedField(obfuscate: true)
  static const bool? testString = null;
}

@ShouldThrow('Environment variable not found for field `foo`.')
@Envied(path: 'test/.env.example')
abstract class Env25 {
  @EnviedField(obfuscate: true)
  static const dynamic foo = null;
}
