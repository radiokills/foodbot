# encoding: UTF-8
class BonApetit
  def self.random
    sayings = [
      ["بالهنا و الشفاء (bil hana wish shifa’)", "Arabic (Egyptian)"],
      ["食飯 (sihk faahn)", "Cantonese"],
      ["Bon profit!", "Catalan"],
      ["Dobar tek!", "Croatian"],
      ["Smakelijk eten!", "Dutch"],
      ["Hyvää ruokahalua!", "Finnish"],
      ["Bon appétit!", "French"],
      ["Guten appetit!", "German"],
      ["Καλή όρεξη! (kalí óreksi)", "Greek"],
      ["בתיאבון (b’tayavon)", "Hebrew"],
      ["Jó étvágyat!", "Hungarian"],
      ["Buon appetito!", "Italian"],
      ["잘 먹겠습니다 (jal meokkesseumnida)", "Korean"],
      ["Gero apetito!", "Lithuanian"],
      ["Пријатно јадење (priyatno yadenye)", "Macedonian"],
      ["Сайхан хооллоорой (saihan hoollooroi)", "Mongolian"],
      ["Приятного аппетита! (prijatnovo appetita)", "Russian"],
      ["¡Buen provecho!", "Spanish"],
      ["ขอให้เจริญอาหาร! (kŏr hâi jà-rern aa-hăan!)", "Thai"],
      ["Afiyet olsun!", "Turkish"]
    ]

    saying, lang = sayings.sample

    "#{saying} (Bon Apetit in #{lang})"
  end
end
