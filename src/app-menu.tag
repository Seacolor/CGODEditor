<app-menu>
    <p id="header_fixed">
        <button type="button" class="btn-sm btn-primary" onclick={ openLoadFile }>読み込み</button>
        <button type="button" class="btn-sm btn-primary" onclick={ saveFile }>保存</button>
    </p>

  <script>
    const fs = require('fs')
    const remote = require('electron').remote
    const dialog = remote.require('electron').dialog
    const browserWindow = remote.require('electron').BrowserWindow
    const iconv = require('iconv-lite')
    const self = this

    saveFile() {
      let win = browserWindow.getFocusedWindow()
      dialog.showSaveDialog(
          win,
          {
              properties: ['openFile'],
              filters: [{
                  name: 'Documents',
                  extensions: ['txt', 'text', 'html', 'js']
              }]
          },
          function (fileName) {
              if (fileName) {
                  let data = '%Elona Custom God\r\n'
                  data += '\r\n'
                  data += 'author.\t\t\t"' + spec.author + '"\r\n'
                  data += 'name.\t\t\t"' + spec.name_en + ',' + spec.name_ja + '"\r\n'
                  data += 'shortname.\t\t"' + spec.id + ',' + spec.nickname + '"\r\n'
                  data += 'filter.\t\t\t""\r\n'
                  let gives = ""
                  spec.give.forEach(function(give) {
                        gives += give.id + ','
                  })
                  data += 'give.\t\t\t"' + gives.slice(0, -1) + '"\r\n'
                  let bonuses = ""
                  spec.bonus.forEach(function(bonus) {
                        bonuses += (bonus.id * 1000 + Number(bonus.value)) + ','
                  })
                  data += 'bonus.\t\t\t"' + bonuses.slice(0, -1) + '"\r\n'
                  data += 'specialpower.\t\t"' + spec.specialpower.id + ',' + spec.specialpower.value + '"\r\n'
                  let foodBonuses = ""
                  spec.foodbonus.forEach(function(foodbonus) {
                        foodBonuses += (foodbonus.id * 100 + Number(foodbonus.value)) + ','
                  })
                  data += 'foodbonus.\t\t"' + foodBonuses.slice(0, -1) + '"\r\n'
                  let specialFoodBonuses = ""
                  spec.specialfoodbonus.forEach(function(specialfoodbonus) {
                        specialFoodBonuses += (specialfoodbonus.id * 10000 + Number(specialfoodbonus.value)) + ','
                  })
                  data += 'specialfoodbonus.\t"' + specialFoodBonuses.slice(0, -1) + '"\r\n'
                  data += 'specialpoweralias.\t"' + spec.specialpoweralias + '"\r\n'
                  for (let i = 0;i < optional.miracle.length;i++) {
                      let miracle =  optional.miracle[i]
                      data += 'miracle' + i + '.\t\t"' + miracle.name_en + ',' + miracle.name_ja + ',' + miracle.attribute + ',' + miracle.type + ',' + miracle.stamina + ',' + (Number(miracle.target) + Number(miracle.range)) + ',' + miracle.power + ',' + miracle.dice + ',' + miracle.dice_sided + ',' + miracle.dmg_bonus + ',' + miracle.element + ',' + miracle.element_power + '"\r\n'
                  }
                  data += '\r\n'
                  data += '%txtdescription0,JP\r\n'
                  data += text.txtdescription0 + '\r\n'
                  data += '%txtdescription1,JP\r\n'
                  data += text.txtdescription1 + '\r\n'
                  data += '%txtdescription2,JP\r\n'
                  data += text.txtdescription2 + '\r\n'
                  data += '%txtdescription3,JP\r\n'
                  data += text.txtdescription3 + '\r\n'
                  data += '%txtBelieve,JP\r\n'
                  data += text.txtBelieve + '\r\n'
                  data += '%txtBetrayal,JP\r\n'
                  data += text.txtBetrayal + '\r\n'
                  data += '%txtGive,JP\r\n'
                  data += text.txtGive + '\r\n'
                  data += '%txtMission,JP\r\n'
                  data += text.txtMission + '\r\n'
                  data += '%txtResist,JP\r\n'
                  data += text.txtResist + '\r\n'
                  data += '%txtPresent,JP\r\n'
                  data += text.txtPresent + '\r\n'
                  data += '%txtLike,JP\r\n'
                  data += text.txtLike + '\r\n'
                  data += '%txtLove,JP\r\n'
                  data += text.txtLove + '\r\n'
                  data += '%txtWhisper,JP\r\n'
                  data += text.txtWhisper + '\r\n'
                  data += '%txtWelcome,JP\r\n'
                  data += text.txtWelcome + '\r\n'
                  data += '%txtNight,JP\r\n'
                  data += text.txtNight + '\r\n'
                  data += '%txtKilled,JP\r\n'
                  data += text.txtKilled + '\r\n'
                  data += '%txtAdvent,JP\r\n'
                  data += text.txtAdvent + '\r\n'
                  data += '%txtMiracle1,JP\r\n'
                  data += text.txtMiracle1 + '\r\n'
                  data += '%txtMiracle2,JP\r\n'
                  data += text.txtMiracle2 + '\r\n'
                  data += '%txtServantDescription,JP\r\n'
                  data += text.txtServantDescription + '\r\n'
                  data += '%endTxt\r\n'
                  writeFile(fileName, data)
              }
          }
      )
    }

    writeFile(path, data) {
      let str = iconv.encode(data, 'CP932')
      fs.writeFile(path, str, function (error) {
        if (error != null) {
          alert('error : ' + error)
        }
      })
    }

    openLoadFile() {
      let win = browserWindow.getFocusedWindow()

      dialog.showOpenDialog(
        win,
        {
           properties: ['openFile'],
           filters: [
               {
                   name: 'Documents',
                   extensions: ['txt']
               }
           ]
         },
         function (filenames) {
           if (filenames) {
             self.readFile(filenames[0])
           }
         }
      )
    }

    readFile(path) {
      spec.author = "プレイヤー"
      loader.load({ spec: spec })
/*      currentPath = path
      fs.readFile(path, function (error, fileContent) {
        if (error != null) {
            alert('error : ' + error)
            return 
        }
        let fileText = iconv.decode(fileContent, 'CP932')
        spec.author = self.getFileValue(fileText, 'author.')
        loader.load({ spec: spec })
      })
*/    }

    getFileValue(fileContent, key) {
        let keyIndex = fileContent.indexOf(key)
        if (keyIndex == -1) {
            return ""
        }
        let fromIndex = fileContent.indexOf('"', keyIndex) + 1
        let toIndex = fileContent.indexOf('"', fromIndex)
        return fileContent.substring(fromIndex, toIndex)
    }
    </script>
</app-menu>