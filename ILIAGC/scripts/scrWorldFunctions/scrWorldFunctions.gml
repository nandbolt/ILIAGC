/// @func convertXToGraphX({real} x);
function convertXToGraphX(_x)
{
	return _x * 0.0625 - 1;
}

/// @func convertYToGraphY({real} y);
function convertYToGraphY(_y)
{
	return _y * -0.0625 + 11;
}

/// @func convertGraphXToX({real} graphX);
function convertGraphXToX(_graphX)
{
	return _graphX * 16 + 16;
}

/// @func convertGraphYToY({real} graphY);
function convertGraphYToY(_graphY)
{
	return _graphY * -16 + 176;
}

/// @func	convertTokenIndexToString({int} idx);
function convertTokenIndexToString(_idx)
{
	switch (_idx)
	{
		case 0:
			return "_";
		case 1:
			return " ";
		case 2:
			return "0";
		case 3:
			return "1";
		case 4:
			return "2";
		case 5:
			return "3";
		case 6:
			return "4";
		case 7:
			return "5";
		case 8:
			return "6";
		case 9:
			return "7";
		case 10:
			return "8";
		case 11:
			return "9";
		case 12:
			return "x";
		case 13:
			return "y";
		case 14:
			return "=";
		case 15:
			return "+";
		case 16:
			return "-";
		case 17:
			return "*";
		case 18:
			return "/";
		case 19:
			return "^";
		case 20:
			return "(";
		case 21:
			return ")";
		default:
			return "";
	}
}

/// @func	convertTokenIndexToString({string} _token);
function convertTokenStringToIndex(_token)
{
	switch (_token)
	{
		case "_":
			return 0;
		case " ":
			return 1;
		case "0":
			return 2;
		case "1":
			return 3;
		case "2":
			return 4;
		case "3":
			return 5;
		case "4":
			return 6;
		case "5":
			return 7;
		case "6":
			return 8;
		case "7":
			return 9;
		case "8":
			return 10;
		case "9":
			return 11;
		case "x":
			return 12;
		case "y":
			return 13;
		case "=":
			return 14;
		case "+":
			return 15;
		case "-":
			return 16;
		case "*":
			return 17;
		case "/":
			return 18;
		case "^":
			return 19;
		case "(":
			return 20;
		case ")":
			return 21;
		default:
			return -1;
	}
}