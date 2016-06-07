<app-header>
  <header>
    <nav>
      <btn-group>
        <btn each={ TABS } onclick={ parent.changeTab }>
          { name }
        </btn>
      </btn-group>
    </nav>
  </header>
  <script>
    this.TABS = [
			{ name: "Spec" },
      { name: "Text" }
    ]

    changeTab(e) {
      opts.change({
        current: e.item.name
      })
    }
  </script>
</app-header>
