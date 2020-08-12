//
//  ViewController.swift
//  AvelaDemo2
//
//  Created by Иван on 25.01.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//


import UIKit
import SDWebImage

class LatestNewsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var latestNews: [News]?
    
    var items = [MVP]()
    
    //    var news: NewsInfo?
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView?.register(NewsCell.self, forCellWithReuseIdentifier: cellId)
        
        self.navigationController?.navigationBar.backgroundColor = .white
        let topBar = UIView(frame: UIApplication.shared.statusBarFrame)
        topBar.backgroundColor = .white
        view.addSubview(topBar)
        
        //        let search = UISearchController(searchResultsController: nil)
        //        //        search.searchResultsUpdater = self
        //        search.obscuresBackgroundDuringPresentation = false
        //        search.searchBar.placeholder = "Test Text"
        //        navigationItem.searchController = search
        //
        //        viewWillAppear(true)
        
        fetchData()
    }
    
    
    var groups = [News]()
    
    fileprivate func fetchData(){
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.notify(queue: .main){
            //            self.activityIndicatorView.stopAnimating()
            
            self.items = [
                MVP.init(url: "zhenskaya_sbornaya_rossii_po_gandbolu_-_bronzovyy_prizer_chempionata_mira_93418", id: "359013c6-9464-42ef-b877-75493007451b", transliteration_value: "zhenskaya_sbornaya_rossii_po_gandbolu_-_bronzovyy_prizer_chempionata_mira", transliteration_id: "9318", source_id: "40a3ba98-56cc-421d-b2bc-33037c34609a", source_name: "Госновости.РФ (gov-news.ru)", source_favicon: "http://favicon.yandex.net/favicon/gov-news.ru/", source_type: "", source_uri: "https://gov-news.ru/news/1027886", validate_status: "allow", validate_by:     "73f6c632-86f5-400a-96df-522da30caa9d", publication_date: "2019-12-17 08:00:47", added: "2019-12-17 07:07:00", is_top: "2019-12-17 07:08:40", title: "Женская сборная России по гандболу - бронзовый призер Чемпионата мира", annotation: "С 30 ноября по 15 декабря в Кумамото (Япония) прошел Чемпионат мира по гандболу среди женщин. Сборная России выиграла 'бронзу', обыграв в мачте за третье место команду Норвегии со счетом 33:28.", content: "<p><strong>Министерство спорта Российской Федерации</strong> поздравляет женскую сборную России и тренерский штаб с завоеванием бронзовых наград на Чемпионате мира в Японии и желает новых высоких достижений и ярких побед!</p><p><a href=\"https://gov-news.ru/news/1027886\" target=\"_blank\">Госновости.РФ</a>&nbsp;</p>", file_info_id:     "2a221851-5637-4ada-b3ce-819202a34493", file_info_file: "5df87ef81d6a6_77a82bf74e4eb07f5324e6400fd99bd4.png", file_info_variants: "a:3:{i:0;s:6:\"middle\";i:1;s:5:\"small\";i:2;s:3:\"big\";}", tags: [], mark: "Нейтральная"),
                MVP.init(url: "news/mihail_degtyarev_v_zakone_o_vozvrashtenii_piva_na_stadiony_ne_predusmotreny_otchisleniya_professionalnym_klubam_93420", id: "1f58420d-a6e8-42d8-a03c-c417415e2af2", transliteration_value: "93420", transliteration_id:     "mihail_degtyarev_v_zakone_o_vozvrashtenii_piva_na_stadiony_ne_predusmotreny_otchisleniya_professionalnym_klubam", source_id:     "52408510-be3a-4926-af49-8d08b33422ae", source_name: "Спорт экспресс (sport-express.ru)", source_favicon: "http://favicon.yandex.net/favicon/sport-express.ru/", source_type: "undefined", source_uri: "", validate_status:     "https://www.sport-express.ru/football/rfpl/news/mihail-degtyarev-v-zakone-o-vozvraschenii-piva-na-stadiony-ne-predusmotreny-otchisleniya-professionalnym-klubam-1622735/", validate_by: "allow", publication_date: "2019-12-17 08:00:47", added:     "2019-12-17 07:10:22", is_top: nil, title: "Михаил Дегтярев: \"В законе о возвращении пива на стадионы не предусмотрены отчисления профессиональным клубам\"", annotation:     "<p>Председатель комитета Государственной думы по физической культуре, спорту, туризму и делам молодежи Михаил Дегтярев заявил, что в законопроекте, разрешающем розничную продажу пива на стадионах во время проведения матчей по футболу (за исключением проведения детско-юношеских соревнований) не предусмотрены отчисления субъектам профессионального спорта.</p>", content: "<p>Напомним, в минувшую пятницу Госдума в первом чтении одобрила этот закон.</p><p>&nbsp;- В пояснительной записке авторов законопроекта расчетов о том, какую конкретную сумму получит детский спорт, не дано, - отметил Дегтярев. - На сегодняшний день это эксперимент. Все узнаем эмпирическим путем после года реализации закона.</p><p>Получит ли деньги профессиональный спорт? В законе четко прописано - \"только на детско-юношеский спорт\". Согласно правилам, которые утверждают органы исполнительной власти, реализующие государственную политику в сфере спорта, туризма - то есть <strong>Минспорта</strong>. Единственное, на что мы обратили внимание на заседании нашего комитета, что при принятии в третьем чтении <strong>Минспорта</strong> уже должен предъявить Госдуме по регламенту эти правила проекта. Чтобы не получилось так, что мы примем закон, а министерство 10 лет будет разрабатывать эти правила. Чтобы к третьему чтению было понятно, каким образом станут собираться деньги. (Андрей Сизякин)</p><p><a href=\"https://www.sport-express.ru/football/rfpl/news/mihail-degtyarev-v-zakone-o-vozvraschenii-piva-na-stadiony-ne-predusmotreny-otchisleniya-professionalnym-klubam-1622735/\" target=\"_blank\">Спорт экспресс</a>&nbsp;<a href=\"https://www.sportsdaily.ru/news/mixail-degtyaryov-poyasnil-pochemu-kluby-ne-poluchat-doxod-ot-prodazhi-piva-na-stadonax\" target=\"_blank\">Спорт день за днем</a><u>&nbsp;</u><a href=\"https://news.myseldon.com/ru/news/index/220603700\" target=\"_blank\">Seldon.News </a></p>", file_info_id: nil, file_info_file: nil, file_info_variants: nil, tags: [], mark: "Нейтральная"),
                MVP.init(url: "news/ot_kapvlozheniy_potrebovali_zashtity_92663", id: "89567315-18ad-4e20-8a1c-ff0b15ec3e76", transliteration_value: "92663", transliteration_id: "ot_kapvlozheniy_potrebovali_zashtity", source_id: "0065b0a9-b357-4cee-ab80-26b1659c578e", source_name: "Коммерсантъ", source_favicon: "http://favicon.yandex.net/favicon/kommersant.ru", source_type: "newspaper", source_uri: "https://www.kommersant.ru/doc/4188862", validate_status: "allow", validate_by:     "73f6c632-86f5-400a-96df-522da30caa9d", publication_date: "2019-12-11 07:55:39", added: "2019-12-11 07:08:00", is_top: "0", title: "От капвложений потребовали защиты", annotation: "<p>Вопросы обеспечения инвестиционного рывка в России обсуждались 10 декабря на двух мероприятиях, в обоих случаях в первую очередь речь шла об основной инициативе правительства в этой сфере — законопроекте о защите и поощрении капиталовложений (СЗПК).</p>", content:     "<p>Сначала опасения скрытых эффектов его принятия выражали помощник президента Андрей Белоусов и глава РСПП Александр Шохин на конференции АСИ — там также обсуждали потребности бизнеса в «регуляторных песочницах» и борьбу с давлением на бизнес силовиков. Затем господин Шохин фактически повторил те же аргументы об опасности «инвестпаузы» при принятии закона о СЗПК и необходимости его доработки уже в Госдуме. В итоге проект был принят Думой в первом чтении, но ко второму в него обещаны обширные поправки.</p>", file_info_id:     "a5756465-c4a8-41de-951a-a9e011d5106c", file_info_file: "5df09653aea33_Без имени.png", file_info_variants:     "a:3:{i:0;s:5:\"small\";i:1;s:6:\"middle\";i:2;s:3:\"big\";}", tags: [], mark: "Положительная")
            ]
            
            self.collectionView.reloadData()
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCell
        //        cell.latestNews = latestNews?[indexPath.item]
        
        cell.news = items[indexPath.item]
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let newsId = String(items[indexPath.item].id)
        let newsDetailController = NewsDetailController(source_name: items[indexPath.item].source_name , title: items[indexPath.item].title, publication_date: items[indexPath.item].publication_date , annotationNews: items[indexPath.item].annotation, imageName: items[indexPath.item].file_info_file ?? "", content: items[indexPath.item].content, sourceFavicon: items[indexPath.item].source_favicon ?? "")
//        let newsDetailController = NewsDetailController(newsId: newsId)
//        print(newsId)
        navigationController?.pushViewController(newsDetailController, animated: true)
        
        
        
        //        if let news = latestNews?[indexPath.item]{
        ////            showAppDetailNews(news: news)
        //        }
//        let newsDetailController = NewsDetailController()
        //                newsDetailController.news = news
//        navigationController?.pushViewController(newsDetailController, animated: true)
    }
    
    //    func showAppDetailNews(news: News){
    //        let layout = UICollectionViewFlowLayout()
    //        let newsDetailController = NewsDetailController(collectionViewLayout: layout)
    //        newsDetailController.news = news
    //        navigationController?.pushViewController(newsDetailController, animated: true)
    //    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        if let latestNews = self.latestNews?[indexPath.item]{
        //            let approximatedWidthOfAnnotationTextView = view.frame.width - 8 - 2
        //            let size = CGSize(width: approximatedWidthOfAnnotationTextView, height: 1000)
        //            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        //            let estimatedFrame = NSString(string: latestNews.annotation!).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        //
        //            return CGSize(width: view.frame.width, height: estimatedFrame.height + 50)
        //        }
        return CGSize(width: view.frame.width, height: 800)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


