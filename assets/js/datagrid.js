/**
*	dataGrid
*
*
*/

function dataGrid(options)
{
	this.data = new Object();
	
	for(var i in options){
		this.data[i] = options[i];
	}
	
	this.filters = new Object();
	this.tr = undefined;
	
	this.interval = null;
	
	this.listener = new Object();
	this.listener._scope = this;
	this.listener.onClose = function()
	{
		this._scope.clearHilite();
	}
	this.listener.onAddNew = function()
	{
		this._scope.clearHilite();
	}
	
	this.listener.onComplete = function()
	{
		this._scope.getUpdate();
	}
	
	
	var obj = $(this.data['name_space'] + '_search');
	var scope = this;
	
	Event.observe(obj,'keyup', function()
	{
		scope.kickSearch();
	}, true);
	
	Event.observe(obj,'change', function()
	{
		scope.search();
	}, true);
	
	//Cookie
	this.Cookie = {};
	if (tmp = readCookie('Blackbird_Datagrid')) this.Cookie = tmp.evalJSON();
	
	//if cookie table is === this table... use the data
	if(this.Cookie.table == this.data.table){
		//dump standard vars over
		for(var i in this.Cookie){
			this.data[i] = this.Cookie[i];
		}
		//now deal with filters special
		var imax = this.Cookie.filters.length;
		if(imax > 0){
			for(var i=0;i<imax;i++){
				var item = this.Cookie.filters[i];
				this.filters[item.name] = item.value;
			}
		}
	}
	
	this.getUpdate();
	
}

/**
*	clearHilite
*
*
*/

dataGrid.prototype.clearHilite = function()
{
	if($(this.tr)){
		$(this.tr).removeClassName('active');
	}
}

/**
*	setFilter
*
*
*/

dataGrid.prototype.setFilter = function(prop,obj)
{
	this.filters[prop] = obj.value;
	this.getUpdate();
}

dataGrid.prototype.setLimit = function(elem)
{
	this.setProperty('limit',elem.value);
}

/**
*	setProperty
*
*
*/

dataGrid.prototype.setProperty = function(prop,value)
{
	this.data[prop] = value;
	this.getUpdate();
}

/**
*	sortColumn
*
*
*/

dataGrid.prototype.sortColumn = function(col,dir)
{
	this.data.sort_col = col;
	this.data.sort_dir = dir;
	this.getUpdate();
}

/**
*	search
*
*
*/

dataGrid.prototype.search = function()
{
	clearInterval(this.interval);
	this.interval = null;
	if($(this.data.name_space + '_search').value != 'Search...'){
		this.data.search = $(this.data.name_space + '_search').value;
		this.getUpdate();
	}
}

dataGrid.prototype.kickSearch = function()
{
	clearInterval(this.interval);
	this.interval = setInterval(this.search.bind(this),500);	
}

/**
*	editRecord
*
*
*/

dataGrid.prototype.editRecord = function(id,elem)
{
		
	//var p = elem.parentNode
	var p = $(elem).up('tr');
	$(p).addClassName('active');
	
	blackbird.recordHandler(this.data.table,id,this.data.name_space,'edit',blackbird.processEdit,'update');
	
	if(this.tr != undefined && this.tr == p){	
		
	}else{
		this.clearHilite();
	}
	
	this.tr = p;
	
}

dataGrid.prototype.onUpdate = function()
{
	this.getUpdate();
}

/**
*	getUpdate
*
*
*/

dataGrid.prototype.getUpdate = function()
{
	var sendVars = new Object();
		
	for(var i in this.data){
		sendVars[i] = this.data[i];
	}
	this.Cookie = sendVars;	
	this.Cookie.filters = [];
	
	for(var i in this.filters){
		this.Cookie.filters.push({name:i,value:this.filters[i]});
		sendVars['filter_' + i] = this.filters[i];
	}
	
	sendVars.action = 'getDataGrid';
		
	var tA = $('section_' + this.data.name_space).select('.table');
	var obj = tA[0];
			
	var myAjax = new Ajax.Updater(
		obj,
		this.data.base + 'table/datagrid', 
		{
			method		: 'post', 
			parameters	: formatPost(sendVars),
			evalScript	: true			
		}
	);
		
	//write state to cookie
	
	createCookie('Blackbird_Datagrid',Object.toJSON(this.Cookie).replace(/\s+/g,''),365);

}

/**
*	reset
*
*
*/

dataGrid.prototype.reset = function()
{
	//this.data.sort_col = 'id';
	this.data.sort_dir = 'DESC';
	this.data.sort_index = '0';
	//this.data.limit = '';
	this.data.search = '';
	$(this.data['name_space'] + '_search').value = 'Live search...';
	this.filters = new Object();
	this.getUpdate();
}