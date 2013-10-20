#encoding: utf-8
require 'date'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = Admin.create!(name:     "admin",
                         password: "000000",
                         password_confirmation:"000000")

    car1 = Car.create!(model: "风行",
                       plate:"赣M87711",
                       load_limit:7)
    car2 = Car.create!(model: "瑞风",
                       plate:"赣M71479",
                       load_limit:7)
    car3 = Car.create!(model: "全顺工程车",
                       plate:"赣AC0325",
                       load_limit:10)
    car4 = Car.create!(model: "全顺工程车",
                       plate:"赣AC1767",
                       load_limit:10)
    car5 = Car.create!(model: "瑞风",
                       plate:"赣A0T567",
                       load_limit:7)
    car6 = Car.create!(model: "全顺",
                       plate:"赣M71806",
                       load_limit:7)
    car7 = Car.create!(model: "依维柯",
                       plate:"赣AT0062",
                       load_limit:7)
    car8 = Car.create!(model: "猎豹",
                       plate:"赣M91691",
                       load_limit:0)
    car9 = Car.create!(model: "瑞风",
                       plate:"赣A0T123",
                       load_limit:0)
    car10 = Car.create!(model: "风行",
                       plate:"赣M86360",
                       load_limit:0)
    car11 = Car.create!(model: "风行",
                       plate:"赣A9J223",
                       load_limit:0)
    car12 = Car.create!(model: "全顺V348",
                       plate:"赣M71801",
                       load_limit:0)
    car13 = Car.create!(model: "全顺",
                       plate:"赣M96016",
                       load_limit:0)
    car14 = Car.create!(model: "宝威",
                       plate:"赣A2D973",
                       load_limit:0)
    car15 = Car.create!(model: "依维柯",
                       plate:"赣M06627",
                       load_limit:11)
    car16 = Car.create!(model: "全顺工程车",
                       plate:"赣M05231",
                       load_limit:10)


    dest1 = Destination.create!(name:"南昌变")
    dest2 = Destination.create!(name:"梦山变")
    dest3 = Destination.create!(name:"永修变")
    dest4 = Destination.create!(name:"石钟山变")
    dest5 = Destination.create!(name:"抚州变")
    dest6 = Destination.create!(name:"进贤变")
    dest7 = Destination.create!(name:"鹰潭变")
    dest8 = Destination.create!(name:"乐平变")
    dest9 = Destination.create!(name:"信州变")
    dest10 = Destination.create!(name:"洪源变")
    dest11 = Destination.create!(name:"罗坊变")
    dest12 = Destination.create!(name:"安源变")
    dest13 = Destination.create!(name:"文山变")
    dest14 = Destination.create!(name:"赣州变")
    dest15 = Destination.create!(name:"雷公山变")
    dest16 = Destination.create!(name:"其它")


    note1 = Note.create!(name:"消缺")
    note2 = Note.create!(name:"临检")
    note3 = Note.create!(name:"定检")
    note4 = Note.create!(name:"抢修")
    note5 = Note.create!(name:"其它")


    group1 = Group.create!(name:"二次一班")
    group2 = Group.create!(name:"二次二班")
    group3 = Group.create!(name:"二次三班")
    group4 = Group.create!(name:"二次四班")
    group5 = Group.create!(name:"开关一班")
    group6 = Group.create!(name:"开关二班")
    group7 = Group.create!(name:"开关三班")
    group8 = Group.create!(name:"开关四班")
    group9 = Group.create!(name:"变压器班")
    group10 = Group.create!(name:"试验班")
    group11 = Group.create!(name:"辅助一班")
    group12 = Group.create!(name:"辅助二班")


    #二次一班

    worker1 = Worker.create!(name:"戴斌",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker2 = Worker.create!(name:"陈武恝",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker3 = Worker.create!(name:"胡平",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker4 = Worker.create!(name:"帅玲玲",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker5 = Worker.create!(name:"吴骅",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker6 = Worker.create!(name:"周东",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker7 = Worker.create!(name:"邹明",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker8 = Worker.create!(name:"曾莹",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)
    worker9 = Worker.create!(name:"邓哲林",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group1.id)


    #二次二班

    worker10 = Worker.create!(name:"赖志刚",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker11 = Worker.create!(name:"杨杰",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker12 = Worker.create!(name:"韩旭光",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker13 = Worker.create!(name:"李声春",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker14 = Worker.create!(name:"吕阳星",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker15 = Worker.create!(name:"刘颿",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker16 = Worker.create!(name:"王燕",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker17 = Worker.create!(name:"周军波",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker18 = Worker.create!(name:"王元楚",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)
    worker19 = Worker.create!(name:"蒙天骐",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group2.id)



    #二次三班

    worker20 = Worker.create!(name:"吴珂",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker21 = Worker.create!(name:"蔡明",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker22 = Worker.create!(name:"周盛",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker23 = Worker.create!(name:"周小兵",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker24 = Worker.create!(name:"陈裕云",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker25 = Worker.create!(name:"邓清",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker26 = Worker.create!(name:"肖齐",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker27 = Worker.create!(name:"吴颖",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)
    worker28 = Worker.create!(name:"程文星",
                             password: "000000",
                             password_confirmation:"000000",
                             group_id: group3.id)

    #二次四班

    worker29 = Worker.create!(name:"万宇",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker30 = Worker.create!(name:"许广伟",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker31 = Worker.create!(name:"周道城",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker32 = Worker.create!(name:"秦纪平",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker33 = Worker.create!(name:"汪建敏",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker34 = Worker.create!(name:"郑潇",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker35 = Worker.create!(name:"刘剑勇",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker36 = Worker.create!(name:"饶诗琴",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)
    worker37 = Worker.create!(name:"严一凡",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group4.id)

    #开关一班

    worker38 = Worker.create!(name:"刘军农",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker39 = Worker.create!(name:"杨润根",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker40 = Worker.create!(name:"张敏",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker41 = Worker.create!(name:"朱春良",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker42 = Worker.create!(name:"唐武",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker43 = Worker.create!(name:"杨帆",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker44 = Worker.create!(name:"周鹏杰",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)
    worker45 = Worker.create!(name:"吴智超",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group5.id)

    #开关二班

    worker46 = Worker.create!(name:"黄斌",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker47 = Worker.create!(name:"万平",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker48 = Worker.create!(name:"周洪刚",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker49 = Worker.create!(name:"戴钦来",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker50 = Worker.create!(name:"黄颖",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker51 = Worker.create!(name:"汪志祥",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker52 = Worker.create!(name:"黄凌超",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)
    worker53 = Worker.create!(name:"朱宁",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group6.id)

    #开关三班

    worker54 = Worker.create!(name:"陶玉骏",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker55 = Worker.create!(name:"陈义强",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker56 = Worker.create!(name:"杨洪斌",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker57 = Worker.create!(name:"欧宇光",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker58 = Worker.create!(name:"熊华维",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker59 = Worker.create!(name:"顾工川",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker60 = Worker.create!(name:"李昊",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)
    worker61 = Worker.create!(name:"张喻",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group7.id)

    #开关四班

    worker62 = Worker.create!(name:"薄鲁海",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker63 = Worker.create!(name:"吴建明",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker64 = Worker.create!(name:"彭亦龙",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker65 = Worker.create!(name:"辜玄",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker66 = Worker.create!(name:"张小平",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker67 = Worker.create!(name:"朱擘",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker68 = Worker.create!(name:"曾晗",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)
    worker69 = Worker.create!(name:"艾戈韬",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group8.id)

    #变压器班

    worker70 = Worker.create!(name:"熊继承",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker71 = Worker.create!(name:"魏风林",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker72 = Worker.create!(name:"刘玉玲",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker73 = Worker.create!(name:"谌军",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker74 = Worker.create!(name:"于怀金",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker75 = Worker.create!(name:"郑杰",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker76 = Worker.create!(name:"杨小平",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)
    worker77 = Worker.create!(name:"周银彪",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group9.id)

    #试验班

    worker78 = Worker.create!(name:"罗利云",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker79 = Worker.create!(name:"黄小红",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker80 = Worker.create!(name:"贺兆哲",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker81 = Worker.create!(name:"钟文慧",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker82 = Worker.create!(name:"李映含",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)
    worker83 = Worker.create!(name:"王宇",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group10.id)

    #辅助一班

    worker84 = Worker.create!(name:"熊珂",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker85 = Worker.create!(name:"朱国青",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker86 = Worker.create!(name:"梁波",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker87 = Worker.create!(name:"闵捷",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker88 = Worker.create!(name:"王令",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker89 = Worker.create!(name:"郝琦",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker90 = Worker.create!(name:"付金文",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker91 = Worker.create!(name:"彭枫",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker92 = Worker.create!(name:"章司珍",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker93 = Worker.create!(name:"旷凌云",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker94 = Worker.create!(name:"何晶",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker95 = Worker.create!(name:"倪伟林",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker96 = Worker.create!(name:"何帆",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker97 = Worker.create!(name:"杨意华",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker98 = Worker.create!(name:"朱立军",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker99 = Worker.create!(name:"段世金",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker100 = Worker.create!(name:"吴花",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker101 = Worker.create!(name:"万文娟",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker102 = Worker.create!(name:"肖红为",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)
    worker103 = Worker.create!(name:"封智利",
                              password: "000000",
                              password_confirmation:"000000",
                              group_id: group11.id)

    #辅助二班

    worker104 = Worker.create!(name:"刘威",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker105 = Worker.create!(name:"李伟",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker106 = Worker.create!(name:"胡岸武",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker107 = Worker.create!(name:"宗征宇",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker108 = Worker.create!(name:"孙喜华",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker109 = Worker.create!(name:"彭晓英",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker110 = Worker.create!(name:"彭璇",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)
    worker111 = Worker.create!(name:"王丽珍",
                               password: "000000",
                               password_confirmation:"000000",
                               group_id: group12.id)




    #检修司机一班

    driver1 = Driver.create!(name:     "余靓",
                             phone:    "663941",
                             password: "000000",
                             password_confirmation:"000000")
    driver2 = Driver.create!(name:     "唐振军",
                             phone:    "663984",
                             password: "000000",
                             password_confirmation:"000000")
    driver3 = Driver.create!(name:     "钱家意",
                             phone:    "665701",
                             password: "000000",
                             password_confirmation:"000000")
    driver4 = Driver.create!(name:     "程鹏",
                             phone:    "668799",
                             password: "000000",
                             password_confirmation:"000000")
    driver5 = Driver.create!(name:     "邹睿",
                             phone:    "668346",
                             password: "000000",
                             password_confirmation:"000000")
    driver6 = Driver.create!(name:     "黄明辕",
                             phone:    "13970031807",
                             password: "000000",
                             password_confirmation:"000000")
    driver7 = Driver.create!(name:     "谢强",
                             phone:    "665840",
                             password: "000000",
                             password_confirmation:"000000")
    driver8 = Driver.create!(name:     "章建兵",
                             phone:    "663942",
                             password: "000000",
                             password_confirmation:"000000")
    driver9 = Driver.create!(name:     "梁红林",
                             phone:    "660304",
                             password: "000000",
                             password_confirmation:"000000")
    driver10 = Driver.create!(name:     "李年伟",
                              phone:    "668810",
                              password: "000000",
                              password_confirmation:"000000")


    #检修司机二班

    driver11 = Driver.create!(name:     "魏群敏",
                              phone:    "668759",
                              password: "000000",
                              password_confirmation:"000000")
    driver12 = Driver.create!(name:     "胡晓俊",
                              phone:    "665643",
                              password: "000000",
                              password_confirmation:"000000")
    driver13 = Driver.create!(name:     "徐志华",
                              phone:    "668812",
                              password: "000000",
                              password_confirmation:"000000")
    driver14 = Driver.create!(name:     "蔡浩",
                              phone:    "660351",
                              password: "000000",
                              password_confirmation:"000000")
    driver15 = Driver.create!(name:     "徐后勤",
                              phone:    "18979128743",
                              password: "000000",
                              password_confirmation:"000000")
    driver16 = Driver.create!(name:     "孟建忠",
                              phone:    "663546",
                              password: "000000",
                              password_confirmation:"000000")
    driver17 = Driver.create!(name:     "谈建军",
                              phone:    "664646",
                              password: "000000",
                              password_confirmation:"000000")
    driver18 = Driver.create!(name:     "周卫东",
                              phone:    "668740",
                              password: "000000",
                              password_confirmation:"000000")
    driver19 = Driver.create!(name:     "张建新",
                              phone:    "668467",
                              password: "000000",
                              password_confirmation:"000000")



    ds1 = Drivership.create!(car_id:    car1.id,
                             driver_id: driver1.id)
    ds2 = Drivership.create!(car_id:    car2.id,
                             driver_id: driver2.id)
    ds3 = Drivership.create!(car_id:    car3.id,
                             driver_id: driver3.id)
    ds4 = Drivership.create!(car_id:    car4.id,
                             driver_id: driver4.id)
    ds5 = Drivership.create!(car_id:    car5.id,
                             driver_id: driver5.id)
    ds6 = Drivership.create!(car_id:    car6.id,
                             driver_id: driver6.id)
    ds7 = Drivership.create!(car_id:    car7.id,
                             driver_id: driver7.id)


    ds8 = Drivership.create!(car_id:    car8.id,
                             driver_id: driver11.id)
    ds9 = Drivership.create!(car_id:    car9.id,
                             driver_id: driver12.id)
    ds10 = Drivership.create!(car_id:    car10.id,
                             driver_id: driver13.id)
    ds11 = Drivership.create!(car_id:    car11.id,
                             driver_id: driver14.id)
    ds12 = Drivership.create!(car_id:    car12.id,
                             driver_id: driver15.id)
    ds13 = Drivership.create!(car_id:    car13.id,
                             driver_id: driver16.id)
    ds14 = Drivership.create!(car_id:    car14.id,
                             driver_id: driver17.id)
    ds15 = Drivership.create!(car_id:    car15.id,
                             driver_id: driver18.id)
    ds16 = Drivership.create!(car_id:    car16.id,
                             driver_id: driver19.id)

    #测试数据

    #历史出差数据

    trip1 = Trip.create!(drivership_id: ds1.id,
                         destination_id: dest1.id,
                         departure_time: Date.new(2012,11,1),
                         back_time: Date.new(2012,11,2),
                         note_id: note1.id)

    workerships1 = Workership.create!(trip_id: trip1.id, worker_id: worker1.id)
    workerships2 = Workership.create!(trip_id: trip1.id, worker_id: worker2.id)
    workerships3 = Workership.create!(trip_id: trip1.id, worker_id: worker3.id)


    trip2 = Trip.create!(drivership_id: ds2.id,
                         destination_id: dest2.id,
                         departure_time: Date.new(2012,11,1),
                         back_time: Date.new(2012,11,6),
                         note_id: note2.id)

    workerships4 = Workership.create!(trip_id: trip2.id, worker_id: worker3.id)
    workerships5 = Workership.create!(trip_id: trip2.id, worker_id: worker4.id)


    trip3 = Trip.create!(drivership_id: ds3.id,
                         destination_id: dest3.id,
                         departure_time: Date.new(2012,11,3),
                         back_time: Date.new(2012,11,5),
                         note_id: note3.id)

    workerships6 = Workership.create!(trip_id: trip3.id, worker_id: worker5.id)
    workerships7 = Workership.create!(trip_id: trip3.id, worker_id: worker6.id)
    workerships8 = Workership.create!(trip_id: trip3.id, worker_id: worker7.id)
    workerships9 = Workership.create!(trip_id: trip3.id, worker_id: worker8.id)


    trip4 = Trip.create!(drivership_id: ds4.id,
                         destination_id: dest4.id,
                         departure_time: Date.new(2012,11,10),
                         back_time: Date.new(2012,11,12),
                         note_id: note4.id)

    workerships10 = Workership.create!(trip_id: trip4.id, worker_id: worker9.id)
    workerships11 = Workership.create!(trip_id: trip4.id, worker_id: worker10.id)
    workerships12 = Workership.create!(trip_id: trip4.id, worker_id: worker11.id)
    workerships13 = Workership.create!(trip_id: trip4.id, worker_id: worker12.id)


    trip5 = Trip.create!(drivership_id: ds5.id,
                         destination_id: dest5.id,
                         departure_time: Date.new(2012,11,11),
                         back_time: Date.new(2012,11,12),
                         note_id: note3.id)

    workerships14 = Workership.create!(trip_id: trip5.id, worker_id: worker13.id)
    workerships15 = Workership.create!(trip_id: trip5.id, worker_id: worker14.id)
    workerships16 = Workership.create!(trip_id: trip5.id, worker_id: worker15.id)


    trip6 = Trip.create!(drivership_id: ds6.id,
                         destination_id: dest6.id,
                         departure_time: Date.new(2012,11,12),
                         back_time: Date.new(2012,11,16),
                         note_id: note1.id)

    workerships18 = Workership.create!(trip_id: trip6.id, worker_id: worker16.id)
    workerships19 = Workership.create!(trip_id: trip6.id, worker_id: worker17.id)


    trip7 = Trip.create!(drivership_id: ds7.id,
                         destination_id: dest7.id,
                         departure_time: Date.new(2012,11,13),
                         back_time: Date.new(2012,11,15),
                         note_id: note2.id)

    workerships20 = Workership.create!(trip_id: trip7.id, worker_id: worker18.id)
    workerships21 = Workership.create!(trip_id: trip7.id, worker_id: worker19.id)


    trip8 = Trip.create!(drivership_id: ds8.id,
                         destination_id: dest8.id,
                         departure_time: Date.new(2012,11,17),
                         back_time: Date.new(2012,11,20),
                         note_id: note4.id)

    workerships22 = Workership.create!(trip_id: trip8.id, worker_id: worker20.id)
    workerships23 = Workership.create!(trip_id: trip8.id, worker_id: worker21.id)
    workerships24 = Workership.create!(trip_id: trip8.id, worker_id: worker22.id)
    workerships25 = Workership.create!(trip_id: trip8.id, worker_id: worker23.id)


    trip9 = Trip.create!(drivership_id: ds9.id,
                         destination_id: dest9.id,
                         departure_time: Date.new(2012,11,18),
                         back_time: Date.new(2012,11,23),
                         note_id: note1.id)

    workerships26 = Workership.create!(trip_id: trip9.id, worker_id: worker24.id)
    workerships27 = Workership.create!(trip_id: trip9.id, worker_id: worker25.id)


    trip10 = Trip.create!(drivership_id: ds10.id,
                          destination_id: dest10.id,
                          departure_time: Date.new(2012,11,23),
                          back_time: Date.new(2012,11,25),
                          note_id: note3.id)

    workerships28 = Workership.create!(trip_id: trip10.id, worker_id: worker26.id)
    workerships29 = Workership.create!(trip_id: trip10.id, worker_id: worker27.id)
    workerships30 = Workership.create!(trip_id: trip10.id, worker_id: worker28.id)


    trip11 = Trip.create!(drivership_id: ds1.id,
                          destination_id: dest1.id,
                          departure_time: Date.new(2012,10,1),
                          back_time: Date.new(2012,10,2),
                          note_id: note1.id)

    workerships31 = Workership.create!(trip_id: trip11.id, worker_id: worker29.id)
    workerships32 = Workership.create!(trip_id: trip11.id, worker_id: worker30.id)
    workerships33 = Workership.create!(trip_id: trip11.id, worker_id: worker31.id)
    workerships34 = Workership.create!(trip_id: trip11.id, worker_id: worker32.id)


    trip12 = Trip.create!(drivership_id: ds2.id,
                          destination_id: dest2.id,
                          departure_time: Date.new(2012,10,1),
                          back_time: Date.new(2012,10,6),
                          note_id: note2.id)

    workerships35 = Workership.create!(trip_id: trip12.id, worker_id: worker33.id)
    workerships36 = Workership.create!(trip_id: trip12.id, worker_id: worker34.id)


    trip13 = Trip.create!(drivership_id: ds3.id,
                          destination_id: dest3.id,
                          departure_time: Date.new(2012,10,3),
                          back_time: Date.new(2012,10,5),
                          note_id: note3.id)

    workerships37 = Workership.create!(trip_id: trip13.id, worker_id: worker35.id)
    workerships38 = Workership.create!(trip_id: trip13.id, worker_id: worker36.id)


    trip14 = Trip.create!(drivership_id: ds4.id,
                          destination_id: dest4.id,
                          departure_time: Date.new(2012,10,10),
                          back_time: Date.new(2012,10,12),
                          note_id: note4.id)

    workerships39 = Workership.create!(trip_id: trip14.id, worker_id: worker37.id)
    workerships40 = Workership.create!(trip_id: trip14.id, worker_id: worker38.id)


    trip15 = Trip.create!(drivership_id: ds5.id,
                          destination_id: dest5.id,
                          departure_time: Date.new(2012,10,11),
                          back_time: Date.new(2012,10,12),
                          note_id: note3.id)

    workerships41 = Workership.create!(trip_id: trip15.id, worker_id: worker39.id)
    workerships42 = Workership.create!(trip_id: trip15.id, worker_id: worker40.id)
    workerships43 = Workership.create!(trip_id: trip15.id, worker_id: worker41.id)
    workerships44 = Workership.create!(trip_id: trip15.id, worker_id: worker42.id)
    workerships45 = Workership.create!(trip_id: trip15.id, worker_id: worker43.id)
    workerships46 = Workership.create!(trip_id: trip15.id, worker_id: worker44.id)


    trip16 = Trip.create!(drivership_id: ds6.id,
                          destination_id: dest6.id,
                          departure_time: Date.new(2012,10,12),
                          back_time: Date.new(2012,10,16),
                          note_id: note1.id)

    workerships47 = Workership.create!(trip_id: trip16.id, worker_id: worker45.id)
    workerships48 = Workership.create!(trip_id: trip16.id, worker_id: worker46.id)
    workerships49 = Workership.create!(trip_id: trip16.id, worker_id: worker47.id)


    trip17 = Trip.create!(drivership_id: ds7.id,
                          destination_id: dest7.id,
                          departure_time: Date.new(2012,10,13),
                          back_time: Date.new(2012,10,15),
                          note_id: note2.id)


    workerships50 = Workership.create!(trip_id: trip17.id, worker_id: worker48.id)
    workerships51 = Workership.create!(trip_id: trip17.id, worker_id: worker49.id)


    trip18 = Trip.create!(drivership_id: ds8.id,
                          destination_id: dest8.id,
                          departure_time: Date.new(2012,10,17),
                          back_time: Date.new(2012,10,20),
                          note_id: note4.id)

    workerships52 = Workership.create!(trip_id: trip18.id, worker_id: worker50.id)
    workerships53 = Workership.create!(trip_id: trip18.id, worker_id: worker51.id)
    workerships54 = Workership.create!(trip_id: trip18.id, worker_id: worker52.id)


    trip19 = Trip.create!(drivership_id: ds9.id,
                          destination_id: dest9.id,
                          departure_time: Date.new(2012,10,18),
                          back_time: Date.new(2012,10,23),
                          note_id: note1.id)

    workerships55 = Workership.create!(trip_id: trip19.id, worker_id: worker53.id)
    workerships56 = Workership.create!(trip_id: trip19.id, worker_id: worker54.id)
    workerships57 = Workership.create!(trip_id: trip19.id, worker_id: worker55.id)


    trip20 = Trip.create!(drivership_id: ds10.id,
                          destination_id: dest10.id,
                          departure_time: Date.new(2012,10,23),
                          back_time: Date.new(2012,10,25),
                          note_id: note3.id)

    workerships58 = Workership.create!(trip_id: trip20.id, worker_id: worker56.id)
    workerships59 = Workership.create!(trip_id: trip20.id, worker_id: worker57.id)


    trip21 = Trip.create!(drivership_id: ds6.id,
                          destination_id: dest6.id,
                          departure_time: Date.new(2012,9,12),
                          back_time: Date.new(2012,9,16),
                          note_id: note1.id)

    workerships60 = Workership.create!(trip_id: trip21.id, worker_id: worker58.id)
    workerships61 = Workership.create!(trip_id: trip21.id, worker_id: worker59.id)


    trip22 = Trip.create!(drivership_id: ds7.id,
                          destination_id: dest7.id,
                          departure_time: Date.new(2012,9,13),
                          back_time: Date.new(2012,9,15),
                          note_id: note2.id)

    workerships62 = Workership.create!(trip_id: trip22.id, worker_id: worker60.id)
    workerships63 = Workership.create!(trip_id: trip22.id, worker_id: worker61.id)


    trip23 = Trip.create!(drivership_id: ds8.id,
                          destination_id: dest8.id,
                          departure_time: Date.new(2012,8,17),
                          back_time: Date.new(2012,8,20),
                          note_id: note4.id)

    workerships64 = Workership.create!(trip_id: trip23.id, worker_id: worker62.id)
    workerships65 = Workership.create!(trip_id: trip23.id, worker_id: worker63.id)
    workerships66 = Workership.create!(trip_id: trip23.id, worker_id: worker64.id)
    workerships67 = Workership.create!(trip_id: trip23.id, worker_id: worker65.id)


    trip24 = Trip.create!(drivership_id: ds9.id,
                          destination_id: dest9.id,
                          departure_time: Date.new(2012,8,18),
                          back_time: Date.new(2012,11,23),
                          note_id: note1.id)

    workerships68 = Workership.create!(trip_id: trip24.id, worker_id: worker66.id)
    workerships69 = Workership.create!(trip_id: trip24.id, worker_id: worker67.id)
    workerships70 = Workership.create!(trip_id: trip24.id, worker_id: worker68.id)


    trip25 = Trip.create!(drivership_id: ds10.id,
                          destination_id: dest10.id,
                          departure_time: Date.new(2012,8,23),
                          back_time: Date.new(2012,8,25),
                          note_id: note3.id)

    workerships71 = Workership.create!(trip_id: trip25.id, worker_id: worker69.id)
    workerships72 = Workership.create!(trip_id: trip25.id, worker_id: worker70.id)


    trip26 = Trip.create!(drivership_id: ds1.id,
                          destination_id: dest1.id,
                          departure_time: Date.new(2012,7,1),
                          back_time: Date.new(2012,7,2),
                          note_id: note1.id)

    workerships73 = Workership.create!(trip_id: trip26.id, worker_id: worker71.id)
    workerships74 = Workership.create!(trip_id: trip26.id, worker_id: worker72.id)


    trip27 = Trip.create!(drivership_id: ds2.id,
                          destination_id: dest2.id,
                          departure_time: Date.new(2012,7,1),
                          back_time: Date.new(2012,7,6),
                          note_id: note2.id)

    workerships75 = Workership.create!(trip_id: trip27.id, worker_id: worker73.id)
    workerships76 = Workership.create!(trip_id: trip27.id, worker_id: worker74.id)



    trip28 = Trip.create!(drivership_id: ds3.id,
                          destination_id: dest3.id,
                          departure_time: Date.new(2012,7,3),
                          back_time: Date.new(2012,7,5),
                          note_id: note3.id)

    workerships77 = Workership.create!(trip_id: trip28.id, worker_id: worker75.id)
    workerships78 = Workership.create!(trip_id: trip28.id, worker_id: worker76.id)



    trip29 = Trip.create!(drivership_id: ds4.id,
                          destination_id: dest4.id,
                          departure_time: Date.new(2012,7,10),
                          back_time: Date.new(2012,7,12),
                          note_id: note4.id)

    workerships79 = Workership.create!(trip_id: trip29.id, worker_id: worker77.id)
    workerships80 = Workership.create!(trip_id: trip29.id, worker_id: worker78.id)
    workerships81 = Workership.create!(trip_id: trip29.id, worker_id: worker79.id)


    trip30 = Trip.create!(drivership_id: ds5.id,
                          destination_id: dest5.id,
                          departure_time: Date.new(2012,6,11),
                          back_time: Date.new(2012,6,12),
                          note_id: note3.id)

    workerships82 = Workership.create!(trip_id: trip30.id, worker_id: worker80.id)
    workerships83 = Workership.create!(trip_id: trip30.id, worker_id: worker81.id)
    workerships84 = Workership.create!(trip_id: trip30.id, worker_id: worker82.id)
    workerships85 = Workership.create!(trip_id: trip30.id, worker_id: worker83.id)


    trip40 = Trip.create!(drivership_id: ds6.id,
                          destination_id: dest6.id,
                          departure_time: Date.new(2011,12,31),
                          back_time: Date.new(2012,1,3),
                          note_id: note2.id)

    workerships40 = Workership.create!(trip_id: trip40.id, worker_id: worker84.id)
    workerships40 = Workership.create!(trip_id: trip40.id, worker_id: worker85.id)
    workerships40 = Workership.create!(trip_id: trip40.id, worker_id: worker86.id)
    workerships40 = Workership.create!(trip_id: trip40.id, worker_id: worker87.id)


    trip41 = Trip.create!(drivership_id: ds7.id,
                          destination_id: dest7.id,
                          departure_time: Date.new(2012,1,2),
                          back_time: Date.new(2012,1,4),
                          note_id: note5.id)

    workerships41 = Workership.create!(trip_id: trip41.id, worker_id: worker88.id)
    workerships41 = Workership.create!(trip_id: trip41.id, worker_id: worker89.id)
    workerships41 = Workership.create!(trip_id: trip41.id, worker_id: worker90.id)
    workerships41 = Workership.create!(trip_id: trip41.id, worker_id: worker91.id)


    #出差中
    trip31 = Trip.create!(drivership_id: ds1.id,
                          destination_id: dest1.id,
                          departure_time: Date.new(2012,11,27),
                          back_time: Date.new(2012,11,28),
                          note_id: note1.id,
                          ing: true)

    workerships86 = Workership.create!(trip_id: trip31.id, worker_id: worker15.id)
    workerships87 = Workership.create!(trip_id: trip31.id, worker_id: worker16.id)
    workerships88 = Workership.create!(trip_id: trip31.id, worker_id: worker17.id)

    ds1_car = ds1.car

    ds1_car.current_trip = trip31.id

    ds1_car.save


    TripUser.create!(user_id:driver1.id, trip_id: trip31.id)
    TripUser.create!(user_id:worker15.id, trip_id: trip31.id)
    TripUser.create!(user_id:worker16.id, trip_id: trip31.id)
    TripUser.create!(user_id:worker17.id, trip_id: trip31.id)



    trip32 = Trip.create!(drivership_id: ds2.id,
                          destination_id: dest2.id,
                          departure_time: Date.new(2012,11,27),
                          back_time: Date.new(2012,11,28),
                          note_id: note2.id,
                          ing: true)

    workerships89 = Workership.create!(trip_id: trip32.id, worker_id: worker25.id)
    workerships90 = Workership.create!(trip_id: trip32.id, worker_id: worker26.id)
    workerships91 = Workership.create!(trip_id: trip32.id, worker_id: worker27.id)


    ds2_car = ds2.car

    ds2_car.current_trip = trip32.id

    ds2_car.save

    TripUser.create!(user_id:driver2.id, trip_id: trip32.id)
    TripUser.create!(user_id:worker25.id, trip_id: trip32.id)
    TripUser.create!(user_id:worker26.id, trip_id: trip32.id)
    TripUser.create!(user_id:worker27.id, trip_id: trip32.id)


    trip33 = Trip.create!(drivership_id: ds3.id,
                          destination_id: dest3.id,
                          departure_time: Date.new(2012,11,28),
                          back_time: Date.new(2012,11,29),
                          note_id: note3.id,
                          ing: true)

    workerships92 = Workership.create!(trip_id: trip33.id, worker_id: worker36.id)
    workerships93 = Workership.create!(trip_id: trip33.id, worker_id: worker37.id)

    ds3_car = ds3.car

    ds3_car.current_trip = trip33.id

    ds3_car.save


    TripUser.create!(user_id:driver3.id, trip_id: trip33.id)
    TripUser.create!(user_id:worker36.id, trip_id: trip33.id)
    TripUser.create!(user_id:worker37.id, trip_id: trip33.id)


    trip34 = Trip.create!(drivership_id: ds4.id,
                          destination_id: dest4.id,
                          departure_time: Date.new(2012,11,27),
                          back_time: Date.new(2012,11,28),
                          note_id: note4.id,
                          ing: true)

    workerships94 = Workership.create!(trip_id: trip34.id, worker_id: worker38.id)
    workerships95 = Workership.create!(trip_id: trip34.id, worker_id: worker39.id)
    workerships96 = Workership.create!(trip_id: trip34.id, worker_id: worker40.id)
    workerships97 = Workership.create!(trip_id: trip34.id, worker_id: worker41.id)

    ds4_car = ds4.car

    ds4_car.current_trip = trip34.id

    ds4_car.save


    TripUser.create!(user_id:driver4.id, trip_id: trip34.id)
    TripUser.create!(user_id:worker38.id, trip_id: trip34.id)
    TripUser.create!(user_id:worker39.id, trip_id: trip34.id)
    TripUser.create!(user_id:worker40.id, trip_id: trip34.id)
    TripUser.create!(user_id:worker41.id, trip_id: trip34.id)


    trip35 = Trip.create!(drivership_id: ds5.id,
                          destination_id: dest5.id,
                          departure_time: Date.new(2012,11,27),
                          back_time: Date.new(2012,11,29),
                          note_id: note3.id,
                          ing: true)

    workerships98 = Workership.create!(trip_id: trip35.id, worker_id: worker52.id)
    workerships99 = Workership.create!(trip_id: trip35.id, worker_id: worker53.id)
    workerships100 = Workership.create!(trip_id: trip35.id, worker_id: worker54.id)

    ds5_car = ds5.car

    ds5_car.current_trip = trip35.id

    ds5_car.save


    TripUser.create!(user_id:driver5.id, trip_id: trip35.id)
    TripUser.create!(user_id:worker52.id, trip_id: trip35.id)
    TripUser.create!(user_id:worker53.id, trip_id: trip35.id)
    TripUser.create!(user_id:worker54.id, trip_id: trip35.id)


    trip36 = Trip.create!(drivership_id: ds6.id,
                          destination_id: dest6.id,
                          departure_time: Date.new(2012,11,27),
                          back_time: Date.new(2012,11,30),
                          note_id: note1.id,
                          ing: true)

    workerships101 = Workership.create!(trip_id: trip36.id, worker_id: worker65.id)
    workerships102 = Workership.create!(trip_id: trip36.id, worker_id: worker66.id)

    ds6_car = ds6.car

    ds6_car.current_trip = trip36.id

    ds6_car.save



    TripUser.create!(user_id:driver6.id, trip_id: trip36.id)
    TripUser.create!(user_id:worker65.id, trip_id: trip36.id)
    TripUser.create!(user_id:worker66.id, trip_id: trip36.id)


    trip37 = Trip.create!(drivership_id: ds7.id,
                          destination_id: dest7.id,
                          departure_time: Date.new(2012,11,28),
                          back_time: Date.new(2012,11,28),
                          note_id: note2.id,
                          ing: true)

    workerships103 = Workership.create!(trip_id: trip37.id, worker_id: worker77.id)
    workerships104 = Workership.create!(trip_id: trip37.id, worker_id: worker78.id)
    workerships105 = Workership.create!(trip_id: trip37.id, worker_id: worker79.id)
    workerships106 = Workership.create!(trip_id: trip37.id, worker_id: worker80.id)


    ds7_car = ds7.car

    ds7_car.current_trip = trip37.id

    ds7_car.save


    TripUser.create!(user_id:driver7.id, trip_id: trip37.id)
    TripUser.create!(user_id:worker77.id, trip_id: trip37.id)
    TripUser.create!(user_id:worker78.id, trip_id: trip37.id)
    TripUser.create!(user_id:worker79.id, trip_id: trip37.id)
    TripUser.create!(user_id:worker80.id, trip_id: trip37.id)




    trip38 = Trip.create!(drivership_id: ds8.id,
                          destination_id: dest8.id,
                          departure_time: Date.new(2012,11,28),
                          back_time: Date.new(2012,12,6),
                          note_id: note4.id,
                          ing: true)


    workerships107 = Workership.create!(trip_id: trip38.id, worker_id: worker81.id)
    workerships108 = Workership.create!(trip_id: trip38.id, worker_id: worker82.id)
    workerships109 = Workership.create!(trip_id: trip38.id, worker_id: worker83.id)

    ds8_car = ds8.car

    ds8_car.current_trip = trip38.id

    ds8_car.save

    TripUser.create!(user_id:driver11.id, trip_id: trip38.id)
    TripUser.create!(user_id:worker81.id, trip_id: trip38.id)
    TripUser.create!(user_id:worker82.id, trip_id: trip38.id)
    TripUser.create!(user_id:worker83.id, trip_id: trip38.id)




    #s = "%d,%d,%d"%[worker81.id,worker82.id,worker83.id]
    #
    #trip38.workers_ids = s
    #trip38.save
    #puts trip38.workers_ids

    @trips = Trip.all
    @trips.each { |trip|
      workers_ids = []
      workers_names = []
      trip.workers.each { |worker|
        workers_ids.push(worker.id)
        workers_names.push(worker.name)
      }
      trip.workers_ids = workers_ids.join(",")
      trip.workers_names = workers_names.join("，")
      trip.save
    }

  end
end