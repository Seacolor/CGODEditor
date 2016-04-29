<app-header>
  <header>
    <nav>
      <ul>
        <li each={ TABS }>
          <a href="#" onclick={ parent.changeTab }>{ name }</a>
        </li>
      </ul>
    </nav>
  </header>
  <script>
    this.TABS = [
			{ name: "Spec" },
      { name: "Optional" },
      { name: "Text" }
    ]
    
    changeTab(e) {
      opts.change({
        current: e.target.text
      })
    }
  </script>
</app-header>