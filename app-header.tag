<app-header>
  <header>
    <nav>
      <ul>
        <li><a href="#" onclick={ changeTab }>Spec</a></li>
        <li><a href="#" onclick={ changeTab }>Optional</a></li>
        <li><a href="#" onclick={ changeTab }>Text</a></li>
    </ul>
    </nav>
  </header>
  <script>
    changeTab(e) {
      opts.change({
        current: e.target.text
      })
    }
  </script>
</app-header>