library store;
import "dart:html";
import "dart:json";
//import 'package:logging_handlers/logging_handlers_shared.dart';

class Store
{
	Map cookies = {
	};

	Store()
	{
		print('Store()');
		String cookie_data = window.document.cookie;
		print('cookie data: "${cookie_data}", ${cookie_data.length}, ${cookie_data.length > 0}');
		cookie_data.split(';').forEach((cookie)
		{
			if (cookie != '')
			{
				print('cookie data: in loop: "${cookie}"');
				var keyval = cookie.split("=");
				var value = keyval[1];
				try
				{
					value = parse(value);
				}
				catch(e)
				{
					print('cookie was not parsable JSON');
				}
				print('${keyval[0]} : ${keyval[1]}');
				cookies[keyval[0]] = keyval[1];
			}
		});
	}

	put(var key, var value)
	{
		try
		{
			value = parse(value);
		}
		catch(e)
		{
			print('cookie was not parsable JSON');
		}
		cookies[key] = value;
		var asString = '';
		var iter = cookies.keys.iterator;
		var hasMore = iter.moveNext();
		while (hasMore)
		{
			key = iter.current;
			asString += '${key}=${cookies[key]}';
			hasMore = iter.moveNext();
			if (hasMore)
			{
				asString += ';';
			}
		}
		window.document.cookie = asString;
	}

	g(var key)
	{
		return cookies[key];
	}
}


