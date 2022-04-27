# WeatherAPP
___
>Привет!
>
>Этот репозиторий является pet-project'ом, за который мне не стыдно.
>
>Это клон приложения погоды от apple с немого упрощенным UI, написанный на чистом SDK.
___
### Стек используемых технологий:
- Swift;
- UIKit;
- CoreData;
- CoreLocation;
- NSLayoutConstraints;
- MVP + Router + ModuleBuilder + NetworkManager (JSON API REST data loading);
___
### Начинка
Помимо того, что написано в стеке:
1. Для навигации между городами используется **UIPageControl в связке с UIScrollView и массивом cityViews**;
2. **CityView** построен на **UITableView**, содержащей несколько **Custom UILabel** для отображения основной информации а так же **UICollectionView** для отображения почасового прогноза;
3. Delegates и DataSources **UITableView** и **UICollectionView**, а так же **UICollectionViewFlowLayout** вынесены в отдельные файлы;
4. Для навигации между экраном прогноза и экраном-менедженом городов используется **Custom ContainerViewController**;
5. Реализован класс **NetworkManager** со статическим методом загрузки, **сессия**, загружающая данные с API, **кастомный список возможных ошибок для сессии**;
6. Написана **модель данных CoreData** для хранения информации и модель данных для загрузки данных с **API REST**;
7. Написан класс **LocationFetcher**, для захвата локации во время использования приложения;
8. Реализован **Singleton NetworkMonitor**, отслеживающий подключение к интернету;
9. Начиная с данного проекта использую подход **Gitflow**, а так же пользуюсь GUI **SourceTree** для удобства. Отделяться от ветки **develop** мне не имеет смысла, тк я единственный разработчик данного проекта;
10. Спроектирована **структурная схема запуска приложения**, описывающая различные сценарии запуска в зависимости от **подключения к интернету, наличия данных в CoreData и доступа к локации**: ![Схема запуска 2  drawio](https://user-images.githubusercontent.com/48126703/165625107-49bd68cb-131e-4f64-b93d-d695a768d837.png)
>PS: Схема закуска написана мной для меня с упором на экономию времени. Если было бы необходимо объяснить что-либо подобной схемой команде разработчиков, я бы придерживался ГОСТ или других правил компании по написанию структурных схем.
___
### Обзор
***_***

>PS: Скриншоты будут добавлены позже, предоставлюю видео по запросу, см. раздел **"Contact me"**
___
### Планы по развитию проекта

При наличии у меня времени на развитие данного проекта, произойдет:
+ Внедрение схемы запуска;
+ Добавление UISeachBar для поиска городов;
+ Добавление карты MapKit для выбора локации на карте.

___
### Установка

1. Клонируйте или скачайте репозиторий
2. Запустите `WeatherAPP.xcodeproj`
___
#### Contact me:
&nbsp;[![image-text](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](https://mail.google.com/mail/#search/denmagg.work@gmail.com)&nbsp;[![image-text](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/denis99m)&nbsp;[![image-text](https://img.shields.io/badge/head_hunter-B71C1C?style=for-the-badge&logo=hh&logoColor=white)](https://hh.ru/resume/e71c0f26ff0738b4410039ed1f37645a747272)
