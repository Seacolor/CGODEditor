<app-navigator>
    <nav>
        <btn-group>
            <btn each={ TABS } onclick={ parent.changeTab }>{ name }</btn>
        </btn-group>
    </nav>
    <script>
        this.TABS = [
            { name: "Spec" },
            { name: "Optional" },
            { name: "Text" }
        ]

        changeTab(e) {
          opts.tab.change({
            current: e.item.name
          })
        }
    </script>
</app-navigator>