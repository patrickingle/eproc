function addRowReq(table) {
	var rowNum = table.getElementByTagName('tr').length;
	rowNum++;
	
	var newRow = document.createElement('tr');
	
	var col1 = document.createElement('td');
	var col1html = document.createTextNode('');
}