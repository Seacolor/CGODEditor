riot.tag('app-header', '<header> <nav> <ul> <li each="{ TABS }"> <a href="#" onclick="{ parent.changeTab }">{ name }</a> </li> </ul> </nav> </header>', function(opts) {
    this.TABS = [
			{ name: "Spec" },
      { name: "Optional" },
      { name: "Text" }
    ]
    
    this.changeTab = function(e) {
      opts.change({
        current: e.target.text
      })
    }.bind(this);
  
});