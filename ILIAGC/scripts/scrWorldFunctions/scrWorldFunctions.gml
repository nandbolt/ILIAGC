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
		case TokenIndexs.UNDERSCORE:
			return "_";
		case TokenIndexs.SPACE:
			return " ";
		case TokenIndexs.NUM0:
			return "0";
		case TokenIndexs.NUM1:
			return "1";
		case TokenIndexs.NUM2:
			return "2";
		case TokenIndexs.NUM3:
			return "3";
		case TokenIndexs.NUM4:
			return "4";
		case TokenIndexs.NUM5:
			return "5";
		case TokenIndexs.NUM6:
			return "6";
		case TokenIndexs.NUM7:
			return "7";
		case TokenIndexs.NUM8:
			return "8";
		case TokenIndexs.NUM9:
			return "9";
		case TokenIndexs.X:
			return "x";
		case TokenIndexs.Y:
			return "y";
		case TokenIndexs.EQUAL_SIGN:
			return "=";
		case TokenIndexs.PLUS:
			return "+";
		case TokenIndexs.MINUS:
			return "-";
		case TokenIndexs.ASTERISK:
			return "*";
		case TokenIndexs.SLASH:
			return "/";
		case TokenIndexs.CARROT:
			return "^";
		case TokenIndexs.OPEN_PARENTHESIS:
			return "(";
		case TokenIndexs.CLOSE_PARENTHESIS:
			return ")";
		case TokenIndexs.SINE:
			return "s";
		case TokenIndexs.COSINE:
			return "c";
		case TokenIndexs.TANGENT:
			return "t";
		case TokenIndexs.LOG:
			return "l";
		case TokenIndexs.ROOT:
			return "r";
		case TokenIndexs.PI:
			return "p";
		case TokenIndexs.E:
			return "e";
		case TokenIndexs.DECIMAL:
			return ".";
		default:
			return "";
	}
}

/// @func	convertTokenStringToIndex({string} _token);
function convertTokenStringToIndex(_token)
{
	switch (_token)
	{
		case "_":
			return TokenIndexs.UNDERSCORE;
		case " ":
			return TokenIndexs.SPACE;
		case "0":
			return TokenIndexs.NUM0;
		case "1":
			return TokenIndexs.NUM1;
		case "2":
			return TokenIndexs.NUM2;
		case "3":
			return TokenIndexs.NUM3;
		case "4":
			return TokenIndexs.NUM4;
		case "5":
			return TokenIndexs.NUM5;
		case "6":
			return TokenIndexs.NUM6;
		case "7":
			return TokenIndexs.NUM7;
		case "8":
			return TokenIndexs.NUM8;
		case "9":
			return TokenIndexs.NUM9;
		case "x":
			return TokenIndexs.X;
		case "y":
			return TokenIndexs.Y;
		case "=":
			return TokenIndexs.EQUAL_SIGN;
		case "+":
			return TokenIndexs.PLUS;
		case "-":
			return TokenIndexs.MINUS;
		case "*":
			return TokenIndexs.ASTERISK;
		case "/":
			return TokenIndexs.SLASH;
		case "^":
			return TokenIndexs.CARROT;
		case "(":
			return TokenIndexs.OPEN_PARENTHESIS;
		case ")":
			return TokenIndexs.CLOSE_PARENTHESIS;
		case "s":
			return TokenIndexs.SINE;
		case "c":
			return TokenIndexs.COSINE;
		case "t":
			return TokenIndexs.TANGENT;
		case "l":
			return TokenIndexs.LOG;
		case "r":
			return TokenIndexs.ROOT;
		case "p":
			return TokenIndexs.PI;
		case "e":
			return TokenIndexs.E;
		case ".":
			return TokenIndexs.DECIMAL;
		default:
			return -1;
	}
}

/// @func	tokenIsConstant({int} tokenIdx);
function tokenIsConstant(_tokenIdx)
{
	return (_tokenIdx > TokenIndexs.SPACE && _tokenIdx < TokenIndexs.X) || _tokenIdx == TokenIndexs.PI || _tokenIdx == TokenIndexs.E;
}

/// @func	tokenIsOperator({int} tokenIdx);
function tokenIsOperator(_tokenIdx)
{
	return (_tokenIdx > TokenIndexs.EQUAL_SIGN && _tokenIdx < TokenIndexs.OPEN_PARENTHESIS) || (_tokenIdx > TokenIndexs.CLOSE_PARENTHESIS && _tokenIdx < TokenIndexs.PI);
}

/// @func	tokenStringIsOperator({string} token);
function tokenStringIsOperator(_token)
{
	return _token == "+" || _token == "-" || _token == "*" || _token == "/" || _token == "^" ||
		   _token == "s" || _token == "c" || _token == "t" || _token == "l" || _token == "r";
}

/// @func	tokenStringIsConstant({string} token);
function tokenStringIsConstant(_token)
{
	var _idx = convertTokenStringToIndex(_token);
	return tokenIsConstant(_idx);
}

/// @func	tokenIsNumber({int} tokenIdx);
function tokenIsNumber(_tokenIdx)
{
	return _tokenIdx > TokenIndexs.SPACE && _tokenIdx < TokenIndexs.X;
}

/// @func	tokenIsTrigOperator({int} tokenIdx);
function tokenIsTrigOperator(_tokenIdx)
{
	return _tokenIdx > TokenIndexs.CLOSE_PARENTHESIS && _tokenIdx < TokenIndexs.LOG;
}

/// @func	pointVisible({real} x, {real} y);
function pointVisible(_x, _y)
{
	return _x >= 0 && _x <= 176 && _y >= 0 && _y <= 208;
}