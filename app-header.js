riot.tag('app-header', '<header> <nav> <ul> <li><a href="#" onclick="{ changeTab }">Spec</a></li> <li><a href="#" onclick="{ changeTab }">Optional</a></li> <li><a href="#" onclick="{ changeTab }">Text</a></li> </ul> </nav> </header>', function(opts) {
    this.changeTab = function(e) {
      opts.change({
        current: e.target.text
      })
    }.bind(this);
  
});