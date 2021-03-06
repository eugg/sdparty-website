# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FIRST_TIME = false

if FIRST_TIME

  Article.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(Article.table_name)

  ActiveRecord::Base.connection.execute("Delete from articles_issues;");

  articles = [
    {
      id: 1,
      kind: 'system',
      published: false,
      published_at: Time.now,
      image: 'logo.png',
      title: '捐款支持',
      content: ''
    }
  ]

  articles.each do |a|
    article = Article.new(a)
    article.id = a[:id]
    File.open(Rails.root.join('db', 'fixtures', a[:image])) do |f|
      article.image = f
    end
    article.save
  end

  Banner.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(Banner.table_name)

  unless Rails.env.test?

    banners = [
      {
        id: 1, 
        position: 1,
        title: '社民黨政見',
        image: 'banner00.jpg',
        button: '了解社民黨政見',
        link: '/policies',
        published: true
      }, {
        id: 2, 
        position: 2,
        title: '范雲',
        image: 'banner01.png',
        button: '幫助范雲',
        link: 'https://sdparty.neticrm.tw/civicrm/profile/create?gid=9&amp;reset=1',
        published: true
      }, {
        id: 3, 
        position: 3,
        title: '呂欣潔',
        image: 'banner02.png',
        button: '幫助呂欣潔',
        link: 'https://sdparty.neticrm.tw/civicrm/profile/create?gid=14&amp;reset=1',
        published: true
      }, {
        id: 4, 
        position: 4,
        title: '苗博雅',
        image: 'banner03.png',
        button: '幫助苗博雅',
        link: 'https://sdparty.neticrm.tw/civicrm/profile/create?gid=15&amp;reset=1',
        published: true
      }
    ]

    banners.each do |b|
      banner = Banner.new(b)
      File.open(Rails.root.join('db', 'fixtures', b[:image])) do |f|
        banner.image = f
      end
      banner.id = b[:id]
      banner.save
    end
  end
end



Candidate.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Candidate.table_name)

  unless Rails.env.test?

  candidates = [
    {
      id: 1,
      name: '范雲',
      published: true,
      constituency: '大安區',
      avatar: 'people01.jpg',
      image: 'candidate01.jpg',
      help_image: 'help01.png',
      fb_link: 'https://www.facebook.com/yun.fan1',
      help_link: 'https://sdparty.neticrm.tw/civicrm/profile/create?gid=9&amp;reset=1',
      description: '<p>
    <span class="bww">對</span>我而言，這是很特別的一刻。作為一個沒有家世背景，沒有大黨奧援的新興政黨候選人，在這裡宣布參選，就已經證明，台灣是一個令人驕傲的民主國度。</p>
  <p>
    這個民主國度，是因為許許多多前人的血淚、犧牲與付出所打造的。裡面也包含了在座許多朋友的青春。這是台灣令人驕傲的地方。台灣的驕傲不在於我們有多少財富，不在於多強大的國力，而在於，我們相信在這裡，人人生而平等，都有追求幸福的自由與權利。</p>
  <p>
    兩千年三月政黨輪替的那一天，我在美國耶魯大學剛剛交出我的博士論文。朋友打電話來說，台灣變天了，我無法相信。我們一群留學生聚在一起狂喜了好幾天，無法自處，我們以為這是要奮鬥到老才會實踐的夢想，居然提前到來。</p>
  <p>
    原本以為，從此，人們就能安睡，不會被夜半的敲門聲驚醒。上班族只要認真工作，就能打造一個美好的家。每一個平民，都能參與政治，說出自己對台灣的夢想。然而，十五年過去了，民主，是為我們帶來了投票的權利，但，選舉與金權的快速結合，卻讓許多新舊問題，更為嚴峻。</p>
  <h3 class="sub-title-01">打拼，在來不及之前</h3>
  <p>
    就以大安區為例，在過去十年中，房價飆漲了二點五倍。可是我所教的大學生畢業後領到的薪水，卻倒退到十五年前。即使是大安區，也不是人人都住帝寶，除了建商與少數幸運者，大多數人都是高房價的受害者。多數人的子女，也不再買得起鄰里的房子。這還只是冰山之一角。</p>
  <p>
    如果政治，是為了解決人們生活的問題，在過去十多年婦女運動的每一場小小的戰役裡，我看到的殘酷現實是，國會不僅不是這些問題的解方，反倒是這些問題的來源。民主化後的國會，能夠討論理念與政策的立委，數目不增反減；多數立委忙於選民服務，無心專業問政。更有甚者，本身就是大財團與保守勢力的護航者。即使女性的政治人物人數增加，政治文化中，仍然處處充滿了對弱勢的歧視或漠視。台灣的各個領域，不斷地創新與進步，政治部門卻成了改革的障礙，問題的根源。 今天，我之所以決定參選，而且是以新興政黨「社會民主黨」的身分參選，就是意識到，如果我們不再努力，恐怕就太遲。過去在這條蜿蜒民主路上，我們所相信與追求的平等與多元，不僅無法落實，既有的民主，也不一定能守護。台灣民主奮鬥的歷史，所追求的政治，不是為了圖利少數人。如果我們每一個人，都能變成一個更勇敢的人，都能貢獻比過去更多一點，台灣才有機會成為一個真正令人驕傲的國度。
  </p>
  <h3 class="sub-title-01">一起，追求更好的生活</h3>
  <p>
    大安區是我政治啟蒙的起點。從台大校園，各色人文咖啡廳、茶藝館，到夜色中令人血液沸騰的金華國中演講場，這個社區，給了我許多政治思維與進步價值的養分，也是過去十年內，我站在講台上，努力將美好價值傳遞給下一代的地方。我相信我所認同的大安區，會證明它擁有相互照顧的團結精神，成就一種更好的政治。</p>
  <p>
    如果你也感受到同樣的召喚，同樣的熱情，同樣的動能，讓我們在這歷史的十字路口，做我們每一個人，所能做的事情。讓我們一起改變現況，扭轉劣勢。</p>
  <p>
    未來一年，我要努力的目標就是，讓新政治的理想與思維，再度從台北市大安區出發。</p>
  <p>社會民主的象徵玫瑰，就是要提醒我們，政治，是為了追求更好的生活。
    <br />讓我們共同努力。</p>',
      donate_image: 'donation01.jpg',
      donate_form: '<form 
 action="http://sdparty.backme.tw:80/cashflow/checkout" method="get">
  <input type="hidden" name="project_id" value="74">
  <input type="hidden" name="reward_id" value="248">
                  <h3>募款單位:范雲</h3>
                  <h4>請填寫捐款人基本資料</h4>
                  <p>所有欄位皆為必填</p>
                  <table width="920" border="0">
                    <tbody>
                      <tr>
                        <td width="220" align="right"><label for="custom_field[136]">捐款人姓名（公司名稱）：</label></td>
                        <td width="690"><input name="custom_field[136]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[137]">身分證字號（統一編號）：</label></td>
                        <td><input name="custom_field[137]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[138]">聯絡電話（行動電話）：</label></td>
                        <td><input name="custom_field[138]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[139]">戶籍地址：</label></td>
                        <td><input name="custom_field[139]" required="required" type="text" value="" class="long-input"></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[140]">收據寄送地址：</label></td>
                        <td><input name="custom_field[140]" required="required" type="text" value="" class="long-input"></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="additional_support">捐款金額：</label></td>
                        <td><input name="additional_support" required="required" type="number" value="">
                          元</td>
                      </tr>
                    </tbody>
                  </table>
                  <h4>捐款人注意事項</h4>
                  <p>一、捐款人必須為本國國民且年滿 20 歲。<br>

二、請註明捐款人姓名、身分證字號、地址(含戶籍地址與收件人地址以便寄發收據)、電話。<br>

三、任何人不得以本人以外之名義捐贈。<br>

四、個人對同一擬參選人每年捐贈總額不得超過新台幣10萬元；對不同擬參選人每年捐贈總額合計不得超過新
台幣20萬元。<br>

五、於申報所得稅時，捐款金額可作為列舉扣除額；每申報戶最高為綜合所得額20%，且上限為新台幣20萬元。

其他規定請參閱政治獻金法或監察院網站。</p>
                    <div class="form-btn">
                      <button class="fbt01">確認捐款</button>
                      </div>
                    </form>'
    }, {
      id: 2,
      name: '呂欣潔',
      published: true,
      constituency: '信義松山',
      avatar: 'people02.jpg',
      image: 'candidate02.jpg',
      help_image: 'help02.png',
      fb_link: 'https://www.facebook.com/JenniferLuTw',
      help_link: 'https://sdparty.neticrm.tw/civicrm/profile/create?gid=14&amp;reset=1',
      description: '<h3 class="sub-title-01">打拼，在來不及之前</h3>
  <p>
    <span class="bww">許</span>人認識我，是從我的同志運動身分和工作認識我。我從 19 歲開始，投身同志運動，至今已邁入十三個年頭。我的大半人生，多在思考怎麼讓全台灣的同志過得更好，怎麼讓這個社會更認識同志、破除汙名與歧視，讓每個同志和他們的家人相信，我們都值得更好的愛、更好的生活。
  </p>
  <p>開記者會前，許多人都建議我要降低同志色彩，以求讓多數人接受。我思考了許 久，關於我的參選初衷，是因為我相信台灣。我相信台灣社會已經準備好支持一 名同志身份的立法委員，同時也能夠看見我也是一名女兒、別人的姊妹、在台灣 成長的公民、所謂的七年級青年、以及一名家庭照顧者。身為一個女性與同志、以及長期的同志運動工作者，為性別議題喉舌我當然責無旁貸。今天，我想跟大家分享兩個小故事，說明更多我要參選的原因。
  </p>
  <h3 class="sub-title-01">家庭與國家，應是支持的夥伴關係</h3>
  <p>
    我相差十歲的妹妹是一名極重度身心障礙者，她在前年八月離開人世。從我十歲開始，我們全家的家庭重心就在我妹身上，這二十一年來我們一家人體會了什麼 叫做「毫無資源」、「自生自滅」。由於台灣喘息制度的使用不便，與政府長期照 護體系的缺乏，我的母親因此為了她極重度身障的女兒，放棄她前程似錦的職業生涯，成為二十四小時不休息的特別護士，而我似乎也理所當然地成為了第二順位的家庭照顧者。
  </p>
  <p>
    我們全家面對到的，是處處障礙的公共設施、把所有障別的孩子都隨意地放在一起的特教系統、把特殊孩子的學習障礙當作沒家教的社會誤解，以及永遠都沒有休息時間的繁重照顧工作。因此，我希望投身政治，健全國家長照體制、改善特殊教育系統。家庭與國家，應是夥伴關係，一同成為有需要的人民的支持系統；否則，女性永遠會是這個系統下過度承擔的犧牲者。</p>
  <h3 class="sub-title-01">房價飆漲，青年離家潮</h3>
  <p>
    第二個小故事，是關於我的國小同學們。身為一個土生土長的松山人，我非常喜歡我的家鄉。然而，今年初在參加國小同學會時，二十幾個同學中，我竟然發現，成家後還能住在家鄉的人已寥寥可數（大概只有兩個，且是住在父母的房子，絕不可能自己買）。台北市的房價在過去十年飆漲了兩三倍，但我們這一代人的出社會薪水，竟然和我父母當年「不相上下」。這種世代剝奪、青年貧窮化的情況，讓我們不敢結婚、不敢生子、不敢夢想未來、不敢發揮創意、無法回饋父母、無法安心生活、無法買房置產、無法奢求自由正義。</p>
  <p>
    因此，我希望可以投身政治，改善受薪者的勞動條件、完善租屋政策、以及打破房價炒作的惡性循環。</p>
  <h3 class="sub-title-01">掰掰舊政治，讓人民重新信任國會潮</h3>
  <p>在台大社工的訓練，讓我能夠用個人、家庭、社會結構全面思考來面對眼前的困 境。但我不願只停留在為國家的錯誤政策補破網，我們需要創造更好的制度。而我在同志運動中的工作經驗，不只是站上街頭爭取權益，還包括進入群眾進行教育，以及長期與中央和地方政府合作，建構各種性別友善資源和政策。台灣需要更多在體制內的協商與溝通。這幾年，我也投入國際人權工作，在聯合國與歐盟會議當中，親身體驗台灣的優勢與困境。這十幾年的實務工作經驗，讓我深刻地體會到政治如何影響我們的生活。要擁有更好的生活，就必須把政治權力拿回手中。這不只是為了我長期服務的同志社群，更是為了像我這樣的青年、像我父母這般領薪水的人、像我妹妹這樣需要資源的弱勢族群來努力，以建立一個更好的社會，讓所有人都能過更好的生活。
  </p>
  <p>所以，我以成長的松山信義區作為起點，開始這一場落實民主的旅程。</p>
  <p>
    在此邀請大家從今天開始認識我、監督我；最後，如果你認同我，請把票投給我，讓我們一起來改變令人無感的腐敗政治，讓人民重新信任國會。</p>
  <p>改變就從今天、現在開始！</p>',
      donate_image: 'donation03.jpg',
      donate_form: '<form 
 action="http://sdparty.backme.tw:80/cashflow/checkout" method="get">
  <input type="hidden" name="project_id" value="74">
  <input type="hidden" name="reward_id" value="250">
                  <h3>募款單位: 呂欣潔</h3>
                  <h4>請填寫捐款人基本資料</h4>
                  <p>所有欄位皆為必填</p>
                  <table width="920" border="0">
                    <tbody>
                      <tr>
                        <td width="220" align="right"><label for="custom_field[146]">捐款人姓名（公司名稱）：</label></td>
                        <td width="690"><input name="custom_field[146]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[147]">身分證字號（統一編號）：</label></td>
                        <td><input name="custom_field[147]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[148]">聯絡電話（行動電話）：</label></td>
                        <td><input name="custom_field[148]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[149]">戶籍地址：</label></td>
                        <td><input name="custom_field[149]" required="required" type="text" value="" class="long-input"></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[150]">收據寄送地址：</label></td>
                        <td><input name="custom_field[150]" required="required" type="text" value="" class="long-input"></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="additional_support">捐款金額：</label></td>
                        <td><input name="additional_support" required="required" type="number" value="">
                          元</td>
                      </tr>
                    </tbody>
                  </table>
                  <h4>捐款人注意事項</h4>
                  <p>一、捐款人必須為本國國民且年滿 20 歲。<br>

二、請註明捐款人姓名、身分證字號、地址(含戶籍地址與收件人地址以便寄發收據)、電話。<br>

三、任何人不得以本人以外之名義捐贈。<br>

四、個人對同一擬參選人每年捐贈總額不得超過新台幣10萬元；對不同擬參選人每年捐贈總額合計不得超過新
台幣20萬元。<br>

五、於申報所得稅時，捐款金額可作為列舉扣除額；每申報戶最高為綜合所得額20%，且上限為新台幣20萬元。

其他規定請參閱政治獻金法或監察院網站。</p>
                    <div class="form-btn">
                      <button class="fbt01">確認捐款</button>
                      </div>
                    </form>'
    }, {
      id: 3,
      name: '苗博雅',
      published: true,
      constituency: '中正文山',
      avatar: 'people03.jpg',
      image: 'candidate03.jpg',
      help_image: 'help03.png',
      fb_link: 'https://www.facebook.com/miaopoya',
      help_link: 'https://sdparty.neticrm.tw/civicrm/profile/create?gid=15&amp;reset=1',
      description: '<h3 class="sub-title-01">台灣，已經沒有時間等我們變老</h3>
  <p>「<span class="bww">為</span>什麼你要出來選立委？」
    <br />是每個人聽到我要選舉時，第一個提出的問題。
    <br />先講個真實故事。</p>
  <p>三十年前，我的雙親結婚時，月薪共 4.2 萬，貸款買下 140 萬的房子；我初出社會時月薪 3 萬，而房仲對父母屋齡 30 年老公寓報價 1400 萬。我幾乎不可能再憑工作薪水買到我家的房子。我知道，這個案例，並不特別。。
  </p>
  <p>
    我的雙親年輕時，若考上公務員是終身鐵飯碗，在私人公司服務則有無限的未來；但我們這一代，血汗勞工成為常態，沒有最慘、只有更慘；而新進公務員也開始擔心退撫基金破產、領不到退休俸。</p>
  <p>
    「認真打拼就可以置產、成家，擁有安定的未來」是上代人習以為常的夢想。但對於我們這一代而言，或許已經變成幻想。我們不敢想成家立業，必須拼命加班爆肝才能以未來的健康預支今日的薪資。我們面臨的，已經從「台灣錢、淹腳目」「愛拼才會贏」「向前行」「我的未來不是夢」變成月光族、窮忙族、崩世代、各種年金危機、分配不均、富者越富貧者越貧。</p>
  <h3 class="sub-title-01">這一切的改變，到底是怎麼發生的？</h3>
  <p>
    我們的政府，數十年來不斷護航權貴、漠視勞工；不顧台灣主權及人民權益，意圖透過與中國簽訂各式協議服務跨境資本；為了權貴資本家的利益強徵民地；明目張膽動用軍警暴力將手無寸鐵、和平靜坐的民眾打得頭破血流。</p>
  <p>2014 年 3 月，除了一面幫忙佔領國會運動，我也同時處理一起涉及兩岸司法互助協議的死刑冤案公開救援活動。但在 4 月 29 日，救援中的冤案，竟被馬英九政府槍決，不論案情有多少疑點，兩條人命就此無法挽回。家屬絕望地哭泣，我親眼見證了最終極的國家暴力，個人的力量在國家面前是如此渺小，面對濫用暴力又不知反省的政府，沒有人是安全的。
  </p>
  <p>
    而負責監督行政部門的國會呢？從未輪替的國會總是一再令人民失望，放任行政部門恣意妄為，國會多數黨甚至用 30 秒葬送台灣前途，激起世界矚目的佔領國會運動。</p>
  <p>有健康的國會生態，才有監督行政部門的力量。2014 年公民社會展現史無前例的爆發力，我無法想像，假設我們錯過這次歷史機會，假設如此強大的力量仍然無法推動國會改革，還會再有下一次機會嗎？台灣該何去何從？
  </p>
  <p>「如果 2016 無法翻轉國會，我們將愧對下一代人。」這就是我決定參選的原因。</p>
  <p>
    基於這樣的信念，我選擇代表中間偏左的社會民主黨，在從小生長的極深藍選區，挑戰國民黨大黨鞭。我知道，這會是一場力量極不對稱的選戰。我的對手擁有各種資源，有樁腳、有派系、有資金，而我所依憑的僅是對於憲政民主、司法改革、轉型正義、公平分配、性別平等、世代正義堅定不移的信仰。但我也相信，正因為沒有舊政治背後的政商利益糾葛，我可以拋開舊政治的包袱，為國會注入新生命。</p>
  <p>
    我們的父母受困於政客製造的省籍問題，但事實上，台灣社會衝突的根源都在於政治與經濟的特權階級，而不是省籍。我們必須加倍努力完成世代功課，讓台灣成為一個正常、民主的國家，讓下一代能夠生長在和解共生的台灣。</p>
  <p>
    我們是台灣失落的一代，也是台灣希望之所在。透過這場選戰，我將證明，青年可以跨越舊政治的門檻、青年可以深度參政，我們可以用自己的方式挽救國家，我們可以找回失落的勇氣，讓投票成為一件光榮的事。</p>
  <p>台灣，我的國家，已經沒有時間等待我們變老。
    <br />請你和我，一起行動，讓三十年之後，我們的下一代不再失落。</p>
  <p>讓我們共同努力。</p>',
      donate_image: 'donation02.jpg',
      donate_form: '<form 
 action="http://sdparty.backme.tw:80/cashflow/checkout" method="get">
  <input type="hidden" name="project_id" value="74">
  <input type="hidden" name="reward_id" value="249">
                  <h3>募款單位:苗博雅</h3>
                  <h4>請填寫捐款人基本資料</h4>
                  <p>所有欄位皆為必填</p>
                  <table width="920" border="0">
                    <tbody>
                      <tr>
                        <td width="220" align="right"><label for="custom_field[141]">捐款人姓名（公司名稱）：</label></td>
                        <td width="690"><input name="custom_field[141]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[142]">身分證字號（統一編號）：</label></td>
                        <td><input name="custom_field[142]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[143]">聯絡電話（行動電話）：</label></td>
                        <td><input name="custom_field[143]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[144]">戶籍地址：</label></td>
                        <td><input name="custom_field[144]" required="required" type="text" value="" class="long-input"></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[145]">收據寄送地址：</label></td>
                        <td><input name="custom_field[145]" required="required" type="text" value="" class="long-input"></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="additional_support">捐款金額：</label></td>
                        <td><input name="additional_support" required="required" type="number" value="">
                          元</td>
                      </tr>
                    </tbody>
                  </table>
                  <h4>捐款人注意事項</h4>
                  <p>一、捐款人必須為本國國民且年滿 20 歲。<br>

二、請註明捐款人姓名、身分證字號、地址(含戶籍地址與收件人地址以便寄發收據)、電話。<br>

三、任何人不得以本人以外之名義捐贈。<br>

四、個人對同一擬參選人每年捐贈總額不得超過新台幣10萬元；對不同擬參選人每年捐贈總額合計不得超過新
台幣20萬元。<br>

五、於申報所得稅時，捐款金額可作為列舉扣除額；每申報戶最高為綜合所得額20%，且上限為新台幣20萬元。

其他規定請參閱政治獻金法或監察院網站。</p>
                    <div class="form-btn">
                      <button class="fbt01">確認捐款</button>
                      </div>
                    </form>'
    }, {
      id: 4,
      name: '李晏榕',
      published: true,
      constituency: '中山松山',
      avatar: 'people04.jpg',
      image: 'candidate04.jpg',
      help_image: 'help04.png',
      fb_link: '',
      help_link: 'https://sdparty.neticrm.tw/civicrm/profile/create?gid=17&amp;reset=1',
      description: '<h3 class="sub-title-01">曾幾何時，政治離我何其遙遠，卻又如此接近。</h3>
  <p>
    <span class="bww">我</span>來自一個富裕家庭，從小衣食無虞，學業表現優秀，大學畢業後順利考取專業證照，工作了幾年後出國深造，回國後與好友共同創業，目前是一家小型律師事務所的合夥人。如果以一個流行的術語來形容，我就是所謂的「人生勝利組」。</p>
  <p>然而，很多人不像我這麼幸運。</p>
  <p>
    在成為律師之前，我曾在台北晚晴協會擔任社工，在那短短的一年多之間，我看見了婚姻破裂與經濟不獨立對女性的影響，也看見台灣不健全的社會福利系統，是如何以一種隱微的方式複製著婚姻中的性別不平等。後來，因為對人與婚姻家庭的興趣，我成為一名家事案件律師，看著離婚當事人的悲歡離合、陪伴性侵害倖存者度過艱難的訴訟歷程、協助家暴受害者走出陰霾而開始新的人生，凡此種種都令我體悟到完善的法律體制與性別平等政策的力量，以及女性在台灣社會中所面臨到的、根深蒂固的歧視與貶抑。令我感受最深刻的，是因階級和國族等因素而更為弱勢的東南亞籍與中國籍的女性配偶，她們帶著一個美好的夢想遠渡重洋來到台灣，卻因夫家與社會的歧視而夢碎。然而，就像許多台灣女性一樣，即使手上的資源是那麼地稀少，她們依然能夠勇敢地站起來，只為了保護自己的孩子。女性的堅強與毅力，是不分種族與國籍的。</p>
  <p>
    這些經驗讓我相信，不管來自哪裡、出身何方，我們都應該是平等的；反而是不公平的社會制度，劃分了階級、國族與性別，最後使每個人的遭遇和人生，變得如此不同，特別是經濟條件與出身背景的差異，在社會流動已經趨緩的今天，幾乎決定了一個人的命運。原來，所謂的「人生勝利組」，可能只是因為出身的家庭環境比較好，如此而已。</p>
  <p>
    2008年，我前往法國深造，五年的異國經驗，讓我第一次深刻地感受到身為「外國人」的滋味，但也讓我第一次經歷了「社會民主」的文化衝擊。在法國，準時下班是再也正常不過的事情；孩子6個月大開始，父母親就可以申請社區附近的公立托兒所或幼兒園，讓孩子在父母工作時能夠獲得妥善的照顧。此外，法國政府提供租屋補助與公共住宅普及政策，使得人們不必為了買房子，而每月背負龐大的貸款壓力；家中長輩因為年老而需要看護時，政府提供的日間居家照顧、輔具補助與公共機構照護服務等，都使老人家能夠享有多樣化、高品質的照顧與居住安排。我看到一個健全的社會安全體系，是如何地讓人們即使在遇到生老病死等重要事件時，依舊能夠平等、自在地面對。達成這樣的生活並不困難，只要建立公平的稅賦制度、增加對財團與富人的課稅標準，就能夠讓社會中的每個人都過著如此平等與自在的生活。</p>
  <p>
    身為在社會上享有優勢的人，我看到很多人即使努力打拼，卻仍因為出身背景而載浮載沉。我相信政治可以弭平不公與差異，因此，我願意盡一份心力，讓所有人都能夠過著有尊嚴的幸福生活。</p>
  <p>
    身為在社會上享有優勢的人，我看到很多人即使努力打拼，卻仍因為出身背景而載浮載沉。我相信政治可以弭平不公與差異，因此，我願意盡一份心力，讓所有人都能夠過著有尊嚴的幸福生活。</p>
  <p>或許，會有人說，階級與性別的不平等是文化問題，不是政治問題。</p>
  <p>
    然而，經驗告訴我們，政治影響法律與政策，而法律及政策能帶動人類行為的改變，進一步改變既有的文化。政治是創造進步與改變的動力，我希望透過對政治的參與，達到性別平等與社會平等的終極理想。</p>
  <p>我是李晏榕。</p>
  <p>
    如果你/妳相信「人，不分性別、性傾向、性別認同與性別氣質，應該一律平等」，如果你/妳認為「人，不分出身地域、經濟條件、社會階級，應該一律平等」，請支持我進入國會，扭轉台灣既有的框架，創造一個更平等、更幸福的社會。</p>',
      donate_image: 'donation04.jpg',
      donate_form: '<form 
 action="http://sdparty.backme.tw:80/cashflow/checkout" method="get">
  <input type="hidden" name="project_id" value="74">
  <input type="hidden" name="reward_id" value="251">
  <h4>捐款給李晏榕</h4>
                  <h3>募款單位: 李晏榕</h3>
                  <h4>請填寫捐款人基本資料</h4>
                  <p>所有欄位皆為必填</p>
                  <table width="920" border="0">
                    <tbody>
                      <tr>
                        <td width="220" align="right"><label for="custom_field[151]">捐款人姓名（公司名稱）：</label></td>
                        <td width="690"><input name="custom_field[151]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[152]">身分證字號（統一編號）：</label></td>
                        <td><input name="custom_field[152]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[153]">聯絡電話（行動電話）：</label></td>
                        <td><input name="custom_field[153]" required="required" type="text" value=""></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[154]">戶籍地址：</label></td>
                        <td><input name="custom_field[154]" required="required" type="text" value="" class="long-input"></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="custom_field[155]">收據寄送地址：</label></td>
                        <td><input name="custom_field[155]" required="required" type="text" value="" class="long-input"></td>
                      </tr>
                      <tr>
                        <td align="right"><label for="additional_support">捐款金額：</label></td>
                        <td><input name="additional_support" required="required" type="number" value="">
                          元</td>
                      </tr>
                    </tbody>
                  </table>
                  <h4>捐款人注意事項</h4>
                  <p>一、捐款人必須為本國國民且年滿 20 歲。<br>

二、請註明捐款人姓名、身分證字號、地址(含戶籍地址與收件人地址以便寄發收據)、電話。<br>

三、任何人不得以本人以外之名義捐贈。<br>

四、個人對同一擬參選人每年捐贈總額不得超過新台幣10萬元；對不同擬參選人每年捐贈總額合計不得超過新
台幣20萬元。<br>

五、於申報所得稅時，捐款金額可作為列舉扣除額；每申報戶最高為綜合所得額20%，且上限為新台幣20萬元。

其他規定請參閱政治獻金法或監察院網站。</p>
                    <div class="form-btn">
                      <button class="fbt01">確認捐款</button>
                      </div>
                    </form>'
    }
  ]

  candidates.each do |c|
    candidate = Candidate.new(c)
    candidate.id = c[:id]
    candidate.save
  end
end

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
