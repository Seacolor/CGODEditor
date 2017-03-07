<name-field>
  <fieldset>
  <legend>Name</legend>
    <label for="name_en">English: </label>
    <input type="text" name="name_en" onkeyup={ edit } value={ this.spec.name_en }>
    <label for="name_ja">Japanese: </label>
    <input type="text" name="name_ja" onkeyup={ edit } value={ this.spec.name_ja }>
  </fieldset>
  
  <script>
    this.spec = opts.spec

    edit(e) {
      this.spec[e.target.name] = e.target.value
    }
  </script>
</name-field>