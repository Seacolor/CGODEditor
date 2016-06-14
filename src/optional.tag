<optional>
  <section show={ is_current }>
    <h2>Optional</h2>
    
    <h3>Works</h3>
    
    <button type="button" onclick={ addMiracle }>Add</button>
    
    <ul>
      <li each={ optional.miracle }>
        <button  type="button" list-name="miracle" onclick={ parent.removeMiracle }>Remove</button> <a href="#" onclick={ parent.switchMiracle }>{ name_ja }</a>
      </li>
    </ul>
    
    <form if={ current_miracle !== null }>
      <fieldset>
      <legend>Name</legend>
        <label for="name_en">English: </label>
        <input type="text" name="name_en" onkeyup={ editMiracle } value={ current_miracle.name_en }>
        <label for="name_ja">Japanese: </label>
        <input type="text" name="name_ja" onkeyup={ editMiracle } value={ current_miracle.name_ja }>
      </fieldset>
      <fieldset>
      <legend>Attribute</legend>
        <select name="attribute" onChange={ changeMiracle }>
          <option each={ ATTRIBUTES } value={ id } selected={ id == parent.current_miracle.attribute }>{ label }</option>
        </select>
      </fieldset>
    </form>
  </section>
  
  <script>
    this.ATTRIBUTES = [
			{id: 0, label: ""},
  		{id: 10, label: "筋力"},
  		{id: 11, label: "耐久"},
  		{id: 12, label: "器用"},
  		{id: 13, label: "感覚"},
  		{id: 14, label: "習得"},
  		{id: 15, label: "意思"},
  		{id: 16, label: "魔力"},
  		{id: 17, label: "魅力"}
    ]

    this.is_current = false
    
    this.optional = {
      miracle: []
    }
    this.current_miracle = null
    
    addMiracle(e) {
      this.optional.miracle.push({
        name_en: "God's work",
        name_ja: "神技",
        attribute: 0
      })
    }
    
    removeMiracle(e) {
      this.current_miracle = null
      this.remove(e)
    }
    
    switchMiracle(e) {
      this.current_miracle = e.item
    }
    
    editMiracle(e) {
      this.current_miracle[e.target.name] = e.target.value
    }
    
    changeMiracle(e) {
      var selectedItem = e.target.options[e.target.selectedIndex]
      
      if (selectedItem.value == 0) {
        return
      }
      
      this.current_miracle[e.target.name] = selectedItem.value
    }
    
    remove(e) {
      var list = this.optional[e.target.getAttribute("list-name")]
      var item = e.item
      var index = list.indexOf(item)
      list.splice(index, 1)
    }
    
    var self = this
    
    opts.on('change', function(params) {
      self.is_current = (params.current === "Optional")
      self.update()
    })
  </script>
</optional>