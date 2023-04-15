/// @func	TreeNode();
/// @desc	Creates a tree node structure.
function TreeNode(_data=noone,_leftChild=noone,_rightChild=noone) constructor
{
	// Init node
	data = _data;
	leftChild = _leftChild;
	rightChild = _rightChild;
	
	/// @func	toString();
	static toString = function()
	{
		var _leftChildData = "", _rightChildData = "";
		if (leftChild != noone) _leftChildData = string(leftChild.data);
		else _leftChildData = "noone";
		if (rightChild != noone) _rightChildData = string(rightChild.data);
		else _rightChildData = "noone";
		return "[Data: "+string(data)+", LChild Data: "+_leftChildData+", RChild Data: "+_rightChildData+"]";
	}
}