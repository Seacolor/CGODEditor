<text>
  <section show={ is_current }>
    <h2>Text</h2>
  </section>
  
  <script>
    this.is_current = false
    
    var self = this
    
    opts.on('change', function(params) {
      self.is_current = (params.current === "Text")
      self.update()
    })
  </script>
</text>