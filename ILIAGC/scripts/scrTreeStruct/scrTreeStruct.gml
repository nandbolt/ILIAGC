/// @func	Tree();
/// @desc	Creates a tree structure.
function Tree() constructor
{
	// Init tree
	root = noone;
	
	/// @func	printTree({TreeNode} node);
	static printTree = function(_node)
	{
		if (_node != noone)
		{
			printTree(_node.leftChild);
			show_debug_message(string(_node))
			printTree(_node.rightChild);
		}
	}
}