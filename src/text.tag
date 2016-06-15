<text>
  <section show={ is_current }>
    <h2>Text</h2>

    <form>
      <fieldset>
        <legend>詳細説明文</legend>
        <input type="text" name="txtdescription0" onkeyup={ edit } value={ text.txtdescription0 }><br />
        <input type="text" name="txtdescription1" onkeyup={ edit } value={ text.txtdescription1 }><br />
        <input type="text" name="txtdescription2" onkeyup={ edit } value={ text.txtdescription2 }><br />
        <input type="text" name="txtdescription3" onkeyup={ edit } value={ text.txtdescription3 }>
      </fieldset>
      <fieldset>
        <legend>入信時に表示されるメッセージ</legend>
        <textarea name="txtBelieve" onkeyup={ edit } value={ text.txtBelieve }></textarea>
      </fieldset>
      <fieldset>
        <legend>改宗時に表示されるメッセージ</legend>
        <textarea name="txtBetrayal" onkeyup={ edit } value={ text.txtBetrayal }></textarea>
      </fieldset>
      <fieldset>
        <legend>捧げ物を献上した時に表示されるメッセージ</legend>
        <textarea name="txtGive" onkeyup={ edit } value={ text.txtGive }></textarea>
      </fieldset>
      <fieldset>
        <legend>祭壇を乗っ取った時に表示されるメッセージ</legend>
        <textarea name="txtMission" onkeyup={ edit } value={ text.txtMission }></textarea>
      </fieldset>
      <fieldset>
        <legend>祭壇を乗っ取られそうになった時に表示されるメッセージ</legend>
        <textarea name="txtResist" onkeyup={ edit } value={ text.txtResist }></textarea>
      </fieldset>
      <fieldset>
        <legend>神から何かを贈られる時に表示されるメッセージ</legend>
        <textarea name="txtPresent" onkeyup={ edit } value={ text.txtPresent }></textarea>
      </fieldset>
      <fieldset>
        <legend>信仰の深さが何かを貰えるほど深くなった時に表示されるメッセージ</legend>
        <textarea name="txtLike" onkeyup={ edit } value={ text.txtLike }></textarea>
      </fieldset>
      <fieldset>
        <legend>信仰がアーティファクトを貰える深さに逹した時に表示されるメッセージ</legend>
        <textarea name="txtLove" onkeyup={ edit } value={ text.txtLove }></textarea>
      </fieldset>
      <fieldset>
        <legend>神の電波を受信できる場合、たまに表示されるメッセージ</legend>
        <textarea name="txtWhisper" onkeyup={ edit } value={ text.txtWhisper }></textarea>
      </fieldset>
      <fieldset>
        <legend>神の電波を受信できる場合、冒険再開時に表示されるメッセージ</legend>
        <textarea name="txtWelcome" onkeyup={ edit } value={ text.txtWelcome }></textarea>
      </fieldset>
      <fieldset>
        <legend>神の電波を受信できる場合、睡眠時に表示されるメッセージ</legend>
        <textarea name="txtNight" onkeyup={ edit } value={ text.txtNight }></textarea>
      </fieldset>
      <fieldset>
        <legend>神の電波を受信できる場合、他人が死んだ時に表示されるメッセージ</legend>
        <textarea name="txtKilled" onkeyup={ edit } value={ text.txtKilled }></textarea>
      </fieldset>
      <fieldset>
        <legend>降臨した時に表示されるメッセージ</legend>
        <textarea name="txtAdvent" onkeyup={ edit } value={ text.txtAdvent }></textarea>
      </fieldset>
      <fieldset>
        <legend>神技(miracle0.)のメッセージ</legend>
        <textarea name="txtMiracle1" onkeyup={ edit } value={ text.txtMiracle1 }></textarea>
      </fieldset>
      <fieldset>
        <legend>神技(miracle1.)のメッセージ</legend>
        <textarea name="txtMiracle2" onkeyup={ edit } value={ text.txtMiracle2 }></textarea>
      </fieldset>
      <fieldset>
        <legend>神の化身の説明文</legend>
        <textarea name="txtServantDescription" onkeyup={ edit } value={ text.txtServantDescription }></textarea>
      </fieldset>
    </form>
  </section>

  <script>
    this.is_current = false

    this.text = opts.text

    edit(e) {
      this.text[e.target.name] = e.target.value
    }

    var self = this

    opts.tab.on('change', function(params) {
      self.is_current = (params.current === "Text")
      self.update()
    })
  </script>
</text>
