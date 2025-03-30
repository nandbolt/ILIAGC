function coolmathCallStart()
{
	if (typeofparent.cmgGameEvent === "function") {
		try {
			parent.cmgGameEvent("start");
		} catch (e) {}
	}
	console.log("game start event");
}

function coolmathCallLevelStart(level)
{
	if (typeofparent.cmgGameEvent === "function") {
		try {
			parent.cmgGameEvent("start", String(level));
		} catch(e) {}
	}
	console.log("level start" + level);
}

function coolmathCallLevelRestart(level)
{
	if (typeofparent.cmgGameEvent === "function") {
		try {
			parent.cmgGameEvent("replay", String(level));
		} catch(e) {}
	}
	console.log("level restart" + level);
}

var shouldUnlockAll = false;

function unlockAllLevels()
{
	shouldUnlockAll = true;
}

function coolMathShouldUnlockAll()
{
	return shouldUnlockAll;
}

//trigger mid-roll ad break on level complete
function coolmathAdBreak() {
	if ( !parentExists() ) {
		console.log("ERROR! parent.cmgGameEvent not found...");
		return -1;
	}
	try {
		cmgAdBreak();
		console.log("triggering ad break");
		return 1;
	} catch (e) {
		console.log(e);
		return -1;
	}
}

//utility function to verify existence of iframe parent
//(will fail when testing in GM:S rather than on the cmg site)
function parentExists() {
	if (typeof parent.cmgGameEvent === "function") {
		return true;
	}
	return false;
}