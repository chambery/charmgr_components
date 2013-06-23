library store_test;

import '../web/store.dart';
import "package:unittest/unittest.dart";
//import 'package:logging_handlers/logging_handlers_shared.dart';

const PREFIX = "store_test -- ";

const LOGGER_NAME = "store_test";

main()
{
	test("${PREFIX} put() test", ()
	{
		print("${PREFIX} put() test");
		Store store = new Store();
		store.put('foo', 'bar');
		var o = store.g('foo');
		expect(o, isNotNull);
//	  expect(o, 'bar');
	});
}