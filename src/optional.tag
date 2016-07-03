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
      <fieldset>
      <legend>Type</legend>
        <select name="type" onChange={ changeMiracle }>
          <option each={ TYPES } value={ id } selected={ id == parent.current_miracle.type }>{ label }</option>
        </select>
      </fieldset>
      <fieldset>
      <legend>Stamina cost</legend>
        <input type="number" name="stamina" onChange={ editMiracle } min="1" max="100" value={ current_miracle.stamina }>
      </fieldset>
      <fieldset>
      <legend>Target</legend>
        <select name="target" onChange={ changeMiracle }>
          <option each={ TARGET.filter(targetFilter) } value={ id } selected={ id == parent.current_miracle.target }>{ label }</option>
        </select>
        <input type="number" name="range" onChange={ editMiracle } min="1" max="9" value={ current_miracle.range } show={ is_range }>
      </fieldset>
      <fieldset>
      <legend>Power</legend>
        <input type="text" name="power" onkeyup={ editMiracle } value={ current_miracle.power }>
        <dl>
          <dt>\{attb\}</dt>
          <dd>関連主能力の値</dd>
          <dt>\{faith\}</dt>
          <dd>信仰の深さ(100で信仰スキル1レベル相当)</dd>
        </dl>
      </fieldset>
      <fieldset>
      <legend>Number of dice</legend>
        <input type="text" name="dice" onkeyup={ editMiracle } value={ current_miracle.dice }>
        <dl>
          <dt>\{attb\}</dt>
          <dd>関連主能力の値</dd>
          <dt>\{faith\}</dt>
          <dd>信仰の深さ(100で信仰スキル1レベル相当)</dd>
        </dl>
      </fieldset>
      <fieldset>
      <legend>Dice sided</legend>
        <input type="text" name="dice_sided" onkeyup={ editMiracle } value={ current_miracle.dice_sided }>
        <dl>
          <dt>\{attb\}</dt>
          <dd>関連主能力の値</dd>
          <dt>\{faith\}</dt>
          <dd>信仰の深さ(100で信仰スキル1レベル相当)</dd>
        </dl>
      </fieldset>
      <fieldset>
      <legend>Damage bonus</legend>
        <input type="text" name="dmg_bonus" onkeyup={ editMiracle } value={ current_miracle.dmg_bonus }>
        <dl>
          <dt>\{attb\}</dt>
          <dd>関連主能力の値</dd>
          <dt>\{faith\}</dt>
          <dd>信仰の深さ(100で信仰スキル1レベル相当)</dd>
        </dl>
      </fieldset>
      <fieldset>
      <legend>Element</legend>
        <select name="element" onChange={ changeMiracle }>
          <option each={ ELEMENT } value={ id } selected={ id == parent.current_miracle.element }>{ label }</option>
        </select>
      </fieldset>
      <fieldset>
      <legend>Element power</legend>
        <input type="text" name="element_power" onkeyup={ editMiracle } value={ current_miracle.element_power }>
        <dl>
          <dt>\{attb\}</dt>
          <dd>関連主能力の値</dd>
          <dt>\{faith\}</dt>
          <dd>信仰の深さ(100で信仰スキル1レベル相当)</dd>
        </dl>
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
    this.TYPES = [
			{id: 0, label: ""},
      {id: 1, label: "ボルト"},
      {id: 2, label: "アロー"},
      {id: 3, label: "ボール"},
      {id: 4, label: "キュア"},
      {id: 11, label: "メテオ"},
      {id: 1001, label: "聖なる盾"},
      {id: 1002, label: "沈黙の霧"},
      {id: 1003, label: "リジェネレーション"},
      {id: 1004, label: "元素保護"},
      {id: 1005, label: "加速"},
      {id: 1006, label: "鈍足"},
      {id: 1007, label: "英雄"},
      {id: 1008, label: "脆弱の霧"},
      {id: 1009, label: "元素の傷跡"},
      {id: 1010, label: "ホーリーヴェイル"},
      {id: 1011, label: "ナイトメア"},
      {id: 1012, label: "知者の加護"},
      {id: 1018, label: "契約"}
    ]
    this.TARGET = [
      {id: 0, label: ""},
      {id: 2006, label: "任意の対象"},
      {id: 3000, label: "自分"},
      {id: 8000, label: "任意の方向"},
      {id: 9006, label: "ボルト"},
      {id: 10000, label: "メテオ"}
    ]
    this.ELEMENT = [
			{id: 0, label: ""},
  		{id: 50, label: "火炎"},
  		{id: 51, label: "冷気"},
  		{id: 52, label: "電撃"},
  		{id: 53, label: "暗黒"},
  		{id: 54, label: "幻惑"},
  		{id: 55, label: "毒"},
  		{id: 56, label: "地獄"},
  		{id: 57, label: "音"},
  		{id: 58, label: "神経"},
  		{id: 59, label: "混沌"},
  		{id: 60, label: "魔法"},
  		{id: 61, label: "出血"}
    ]

    this.is_current = false

    this.optional = opts.optional
    this.current_miracle = null
    this.is_range = false

    addMiracle(e) {
      if (this.optional.miracle.length >= 2) {
        return;
      }
      this.optional.miracle.push({
        name_en: "God's work",
        name_ja: "神技",
        attribute: 0,
        type: 0,
        stamina: 1,
        target: 0,
        range: 0,
        power: "0",
        dice: "0",
        dice_sided: "0",
        dmg_bonus: "0",
        element: 0,
        element_power: "0"
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

      if (e.target.name == "type") {
        this.current_miracle.target = 0
        this.current_miracle.range = 0
        this.is_range = false;
      } else if (e.target.name == "target") {
        if (selectedItem.value == 3000) {
          this.is_range = true;
        } else {
          this.is_range = false;
          this.current_miracle.range = 0
        }
      }
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

    targetFilter(item) {
      if (item.id == 0) {
        return true
      }

      var selectedType = this.current_miracle.type

      if (selectedType != 1 && selectedType != 2 && selectedType != 3 && selectedType != 11) {
        if (item.id == 2006 || item.id == 3000 || item.id == 8000) {
          return true
        } else {
          return false
        }
      }
      if ((selectedType == 1 && item.id == 9006) || (selectedType == 2 && item.id == 2006) || (selectedType == 3 && item.id == 3000) || (selectedType == 11 && item.id == 10000)) {
        return true
      }

      return false
    }

    var self = this

    opts.tab.on('change', function(params) {
      self.is_current = (params.current === "Optional")
      self.update()
    })
  </script>
</optional>
