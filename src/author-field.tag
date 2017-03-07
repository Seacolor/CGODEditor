<author-field>
  <fieldset>
    <label for="author">Author: </label>
    <input type="text" name="author" onkeyup={ edit } value={ this.spec.author }>
  </fieldset>
  
  <script>
    this.spec = opts.spec

    edit(e) {
      this.spec.author = e.target.value
    }
  </script>
</author-field>