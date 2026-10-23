// 由 tools/lzdz_sites_export.py 自动生成, 数据来源: 10-05landezhaole(懒得找了)
// 站点导航全量数据: 分类 / 子分类 / 站点(标题/链接/简介/徽标)

class LzSite {
  final String id, title, url, icon, fallback, badge, desc, sub, hl;
  const LzSite({required this.id, required this.title, required this.url,
    this.icon = '', this.fallback = '', this.badge = '',
    this.desc = '', this.sub = '', this.hl = ''});
}

class LzSub {
  final String id, name;
  const LzSub(this.id, this.name);
}

class LzCategory {
  final String id, name, desc;
  final List<LzSub> subs;
  final List<LzSite> sites;
  const LzCategory({required this.id, required this.name, this.desc = '',
    this.subs = const [], required this.sites});
}

// 共 17 个分类, 1168 个站点
const List<LzCategory> kLzCategories = [
  LzCategory(
    id: 'ai_models', name: '常用AI与大模型', desc: '顶尖AI对话 · 智能助手 · 深度推理大模型',
    subs: [
      LzSub('all', '全部'),
      LzSub('models', '通用对话'),
      LzSub('creative', '生图与视频'),
      LzSub('agent', '智能体与效率'),
    ],
    sites: [
      LzSite(
        id: 'site_new_loomi', title: 'Loomi', url: 'https://loomi.live',
        icon: 'https://loomi.live/favicon.ico', fallback: 'LM', badge: 'NEW', desc: '新一代AI角色动漫与生动视频生成创意平台', sub: 'creative', hl: '支持角色面部表情与动作一致性生成；高质量动漫场景分镜与运镜控制；创作者高赞的AI动漫与短视频生产工具',
      ),
      LzSite(
        id: 'site_new_amz123', title: 'AMZ123 跨境卖家导航', url: 'https://www.amz123.com/',
        icon: 'https://www.amz123.com/favicon.ico', fallback: 'AMZ', badge: 'HOT', desc: '跨境电商一站式综合服务导航平台，出海卖家必备', sub: 'agent', hl: '汇集亚马逊、TikTok Shop等全球跨境电商工具导航；实时行业资讯、选品分析、海外营销与货源物流生态服务',
      ),
      LzSite(
        id: 'site_new_waclaw', title: 'WaClaw', url: 'https://waclaw.ihuiwa.com',
        icon: 'https://waclaw.ihuiwa.com/favicon.ico', fallback: 'WC', badge: 'NEW', desc: '阿里出品电商AI Agent：覆盖爆款素材生成、智能选品、AI模特商拍与全渠道自动化分发', sub: 'agent', hl: '阿里巴巴官方电商生态AI Agent；一站式解决商品拍摄、虚拟模特换装、AI种草文案与主图短视频；全链路提升跨境与主流电商运营与转化效率',
      ),
      LzSite(
        id: 'site_new_dreammaker', title: 'DreamMaker', url: 'https://dreammaker.vobile.com.cn/',
        icon: 'https://dreammaker.vobile.com.cn/favicon.ico', fallback: 'DM', badge: 'NEW', desc: '阜博集团AIGC数字内容资产与影视短剧创作者平台，赋能创意IP孵化与版权变现', sub: 'creative', hl: '上市公司阜博集团权威背书；覆盖从影视短剧剧本创意到数字资产存证与全渠道商业变现；专为AIGC创作者打造的版权保护与分镜工作流',
      ),
      LzSite(
        id: 'site_new_onsolo', title: 'OnSolo', url: 'https://onsolo.ai/',
        icon: 'https://onsolo.ai/favicon.ico', fallback: 'Solo', badge: 'NEW', desc: 'IP智能体驱动的AI短剧剧本与短视频故事创作平台，将灵感秒级转化为影视分镜与剧本', sub: 'creative', hl: '专精IP微调的智能体与Skills；一键输入灵感生成视频就绪（Video-Ready）剧本与镜头语言；大幅缩短短剧与短篇叙事孵化周期',
      ),      LzSite(
        id: 'ind_cb_2', title: 'MultiOn', url: 'https://www.multion.ai',
        fallback: 'MO', badge: 'AI浏览器', desc: '自主替你在云端浏览器中订票、购物、填表与处理网页任务的AI代理', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_34', title: 'Arc Search', url: 'https://arc.net',
        fallback: 'Arc', badge: 'AI现代浏览', desc: 'Browse for Me自动总结全网网页生成专属简报的新一代AI浏览器', sub: 'agent',
      ),
      LzSite(
        id: 'ind_ec_1', title: '阿里国际站AI生意助手', url: 'https://www.alibaba.com',
        fallback: '阿里', badge: '外贸出海Agent', desc: '自动发品、多语种买家秒级谈判、智能RFQ报价与外贸风向标选品的AI外贸员', sub: 'agent',
      ),
      LzSite(
        id: 'ind_ec_3', title: '淘宝绘蛙AI商拍', url: 'https://www.ihuiwa.com',
        fallback: '绘蛙', badge: '平铺衣秒上身', desc: '上传服装平铺图或人台图，AI秒换全球超模外景实拍与小红书爆款种草图文', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_4', title: '美图设计室AI商拍', url: 'https://www.designkit.com',
        fallback: '美图', badge: 'AI商品图霸主', desc: '白底商品图一键生成百变高级感场景海报、AI模特试鞋试戴与电商详情页', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_5', title: '光帆科技WeShop唯象', url: 'https://www.weshop.com',
        fallback: '唯象', badge: '最早AI模特商拍', desc: '国内首款专注电商产品摄影的AI商拍工具，轻松生成各国籍逼真人像模特与外景', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_6', title: '像素绽放AiPPT/美间', url: 'https://www.meijian.com',
        fallback: '美间', badge: '酷家乐电商设计', desc: '群核科技旗下AI智能海报拼图、电商主图自动抠图排版与提案PPT生成平台', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_7', title: '羚珑智能设计', url: 'https://ling.jd.com',
        fallback: '羚珑', badge: '京东官方设计', desc: '京东出品的一键生成全套大促Banner、多尺寸渠道延展与商品短视频神器', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_8', title: '阿里妈妈万相实验室', url: 'https://wanxiang.taobao.com',
        fallback: '万相', badge: '免费AI商拍', desc: '阿里妈妈官方面向商家免费开放的0成本30秒生成高清模特商拍与视频创意台', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_9', title: '抖音即创', url: 'https://aic.oceanengine.com',
        fallback: '即创', badge: '巨量引擎AIGC', desc: '字节跳动官方抖音带货短视频脚本、数字人直播间搭建与图文带货一键生成台', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_10', title: '腾讯广告妙思', url: 'https://muse.qq.com',
        fallback: '妙思', badge: '微信朋友圈广告', desc: '腾讯广告基于混元大模型打造的一站式广告素材生成与高点击率创意优化平台', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_11', title: '快手磁力开创', url: 'https://kaichuang.kuaishou.com',
        fallback: '磁力', badge: '快手带货短视频', desc: '快手官方AIGC短视频生产平台，日产万条爆款带货切片与真人口播数字人', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_12', title: '百度擎舵AIGC', url: 'https://qingduo.baidu.com',
        fallback: '擎舵', badge: '百度营销创意', desc: '3分钟生成信息流营销文案、数字人营销视频与高转化落地页海报的百度官方台', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_31', title: 'AdCreative.ai', url: 'https://www.adcreative.ai',
        fallback: 'AC', badge: '高转化广告图', desc: '经过数亿条Facebook/Google真实高转化广告训练，一键生成高ROI投放横幅与视频', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_32', title: 'Predis.ai', url: 'https://predis.ai',
        fallback: 'PD', badge: '社媒矩阵AI', desc: '输入一句话自动生成Instagram/TikTok带货短视频、轮播图并定时全网发布', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_33', title: 'Flair.ai', url: 'https://flair.ai',
        fallback: 'FL', badge: 'AI产品摄影棚', desc: '将香水、护肤品、饮料瓶拖入3D画布，AI实时渲染光影反射与大师级商业静物大片', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_34', title: 'Pebblely', url: 'https://pebblely.com',
        fallback: 'PB', badge: '商品场景秒变', desc: '专为中小电商卖家打造的一键把手机拍的商品杂乱背景换成20+精美棚拍场景', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_35', title: 'Botika AI', url: 'https://botika.io',
        fallback: 'BK', badge: '时尚女装AI模特', desc: '将普通真人实拍或人台照片无痕重绘为全球各肤色顶级时尚画报超模', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ec_36', title: 'Vue.ai', url: 'https://vue.ai',
        fallback: 'Vue', badge: '零售时尚AI', desc: '赋能全球时尚零售巨头的AI商品自动打标、个性化搭配推荐与虚拟试衣间', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_18', title: 'LookX AI 建筑灵图', url: 'https://www.lookx.cn',
        fallback: 'LX', badge: '小库建筑大模型', desc: '专为建筑师训练的AI生图平台：草图体块一键渲染为扎哈/安藤忠雄大师级建筑实景', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_19', title: 'ArkoAI', url: 'https://arko.ai',
        fallback: 'AK', badge: 'SketchUp直出', desc: '支持SketchUp、Rhino、Revit一键将白模实时AI渲染为真实建筑摄影效果图的插件', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_20', title: 'Veras by EvolveLAB', url: 'https://www.evolvelab.io/veras',
        fallback: 'VR', badge: 'BIM实时AI渲染', desc: '深度嵌入Revit与Forma的AI建筑与室内概念设计可视化重绘引擎', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_21', title: 'Maket.ai', url: 'https://www.maket.ai',
        fallback: 'MK', badge: 'AI自动画户型', desc: '输入房间数量与面积需求，AI自动生成数百种合规住宅平面户型布局与外观风格', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_27', title: 'Interior AI', url: 'https://interiorai.com',
        fallback: 'IA', badge: '拍毛坯房秒精装', desc: '手机拍一张毛坯房或老破小照片，AI瞬间生成现代、北欧、日式等30种精装改造效果', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_28', title: 'RoomGPT', url: 'https://www.roomgpt.io',
        fallback: 'RG', badge: '开源房间改造', desc: '上传自己房间照片一键AI重新软装布置与配色翻新的热门家装灵感工具', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_31', title: 'ReImagineHome', url: 'https://www.reimaginehome.ai',
        fallback: 'RIH', badge: '房产中介虚拟软装', desc: '专为房产经纪人与民宿房东打造的AI空房虚拟软装布置、庭院绿化美化与天空替换', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_32', title: 'Collov AI', url: 'https://collov.ai',
        fallback: 'CL', badge: 'AI室内外重绘', desc: '针对室内设计、橱柜定制与别墅庭院改造的高精度材质控制AI效果图生成平台', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_33', title: 'PromeAI 建筑设计', url: 'https://www.promeai.pro',
        fallback: 'PM', badge: '线稿转超清实景', desc: '建筑、室内、工业产品与游戏原画师封神的手绘草图精准控制转写实渲染AI工作台', sub: 'creative',
      ),
      LzSite(
        id: 'ind_arch_34', title: 'Krea Architecture', url: 'https://www.krea.ai/apps/image/realtime',
        fallback: 'KR', badge: '左边摆体块右出图', desc: '左侧拖动简单几何体块，右侧毫秒级实时生成光影逼真的大师级建筑摄影', sub: 'creative',
      ),
      LzSite(
        id: 'ind_sci_44', title: 'NotebookLM (Google)', url: 'https://notebooklm.google.com',
        fallback: 'NLM', badge: '谷歌文献转双人播客', desc: '上传数十份PDF论文或笔记，谷歌Gemini不仅精准溯源回答，还能一键生成极其生动的双人播客对谈', sub: 'agent',
      ),
      LzSite(
        id: 'ind_3d_1', title: 'Meshy AI', url: 'https://www.meshy.ai',
        fallback: 'MS', badge: '一句话1分钟生3D', desc: '全球排名第一的AI 3D建模平台：输入文字或单张图片，1分钟生成带四边面拓扑与PBR贴图的游戏级3D模型', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_2', title: 'Tripo 3D', url: 'https://www.tripo3d.ai',
        fallback: 'TP', badge: 'VAST秒级高精3D', desc: '单图5秒极速生成高精细度3D白模与贴图，支持自动骨骼绑定与动作驱动的3D大模型', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_3', title: 'Rodin (Deemos Hyper3D)', url: 'https://hyperhuman.deemos.com/rodin',
        fallback: 'RD', badge: '影游级3D生成王', desc: '上科大孵化影眸科技出品，直接生成媲美人工精雕布线与法线贴图的次世代3D资产大模型', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_4', title: 'CSM.ai (Common Sense)', url: 'https://www.csm.ai',
        fallback: 'CSM', badge: 'MIT世界模型3D', desc: 'MIT团队打造的图片与视频转可交互3D世界与游戏资产引擎', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_6', title: 'Luma Genie & NeRF', url: 'https://lumalabs.ai/genie',
        fallback: 'LM', badge: '手机拍视频转3D', desc: '支持用手机环绕拍摄一段视频通过3D Gaussian Splatting高斯泼溅还原超写实3D场景', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_7', title: 'Polycam 3D扫描', url: 'https://polycam.ai',
        fallback: 'PC', badge: '全球第一3D扫描', desc: '利用手机LiDAR与照片摄影测量将现实世界房间、文物、街景秒变高精度3D网格与点云', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_8', title: 'Kiri Engine', url: 'https://www.kiriengine.app',
        fallback: 'KR', badge: '高光物体3D重建', desc: '支持3DGS高斯泼溅与无特征反光表面物体高精度照片转3D模型的重建平台', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_9', title: 'Sloyd AI', url: 'https://www.sloyd.ai',
        fallback: 'SL', badge: '参数化游戏道具3D', desc: '专为Unity/Unreal开发者打造：输入提示词即时生成UV展开干净、面数可控的低模高模游戏武器建筑道具', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_10', title: 'Kaedim 3D', url: 'https://www.kaedim3d.com',
        fallback: 'KD', badge: '2D原画转生产级3D', desc: '2D游戏角色或装备原画上传后结合AI与质检管线，输出可直接进游戏引擎的精品3D模型', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_11', title: 'Masterpiece X', url: 'https://www.masterpiecex.com',
        fallback: 'MPX', badge: '网页生成绑定动画3D', desc: '零基础在网页或VR头显中用文字生成带全套骨骼绑定与行走跳跃动画的3D角色', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_12', title: 'Move AI', url: 'https://www.move.ai',
        fallback: 'MV', badge: '免穿戴光学动捕', desc: '无需穿戴昂贵动捕服，用普通iPhone拍摄多人运动视频即可提取好莱坞级高精度3D骨骼动画数据', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_13', title: 'DeepMotion', url: 'https://www.deepmotion.com',
        fallback: 'DM', badge: '视频秒转3D骨骼动作', desc: '将抖音舞蹈或体育动作视频上传，AI瞬间解算为包含手部手指与面部表情的FBX/BVH三维动作文件', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_14', title: 'Plask Motion', url: 'https://plask.ai',
        fallback: 'PK', badge: '浏览器3D动捕编辑', desc: '从普通单目视频提取3D角色动作并在浏览器时间轴上直接关键帧打磨与物理平滑', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_15', title: 'Cascadeur AI物理动画', url: 'https://cascadeur.com',
        fallback: 'CS', badge: 'AI自动补齐物理重心', desc: '革命性3D角色关键帧动画软件：只需摆几个姿势，AI自动计算抛物线、重心平衡与武打二次物理动作', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_19', title: 'Scenario 游戏美术AI', url: 'https://www.scenario.com',
        fallback: 'SC', badge: '训练专属画风模型', desc: '上传自己游戏项目的几张设定图即可训练专属LoRA模型，批量产出画风100%统一的图标、立绘与等距贴图', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_20', title: 'Layer.ai', url: 'https://layer.ai',
        fallback: 'LY', badge: '手游2D/3D美术管线', desc: '全球顶级手游工作室使用的企业级AI游戏美术批量生产、图层分离与风格统一工作流', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_22', title: 'Blockade Labs Skybox', url: 'https://skybox.blockadelabs.com',
        fallback: 'SB', badge: '一句话生成360全景天空', desc: '输入奇幻世界描述，10秒生成无缝拼接的8K 360度VR全景天空球HDRI与3D网格世界', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_23', title: 'World Labs (李飞飞)', url: 'https://www.worldlabs.ai',
        fallback: 'WL', badge: '空间智能大世界模型', desc: 'AI教母李飞飞创立的空间智能独角兽，从单张图像生成具备三维几何物理规律的可交互3D世界', sub: 'models',
      ),
      LzSite(
        id: 'ind_3d_36', title: 'HeyGen 数字人', url: 'https://www.heygen.com',
        fallback: 'HG', badge: '全球第一AI数字人播报', desc: '只需上传2分钟真人视频即可克隆你的分身，支持175种语言自动对齐口型唇形翻译全球演讲视频', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_37', title: 'Synthesia', url: 'https://www.synthesia.io',
        fallback: 'SY', badge: '企业培训AI视频霸主', desc: '无需摄像机与录音棚，输入培训文档即由200+超写实多国数字人出镜演播专业企业视频', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_38', title: 'D-ID 照片说话', url: 'https://www.d-id.com',
        fallback: 'DID', badge: '单张人像开口说话', desc: '上传任意一张静态人像照片或历史名画，配合文本或语音瞬间生成眼神灵动的口播视频', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_39', title: '闪剪智作', url: 'https://www.shanjian.tv',
        fallback: '闪剪', badge: '短视频矩阵数字人', desc: '面向知识博主、律师、医生的手机定制个人AI数字人分身，每天输入文案批量产出多平台口播短视频', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_40', title: '硅基智能DUIX', url: 'https://www.guiji.ai',
        fallback: '硅基', badge: '开源实时交互数字人', desc: '千万级数字人克隆先驱，提供可本地私有化部署的移动端实时语音对话数字人SDK', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_41', title: '相芯科技FaceUnity', url: 'https://www.faceunity.com',
        fallback: '相芯', badge: 'XR实时美颜与虚拟化身', desc: '赋能各大直播平台的3D捏脸Avatar、实时面部表情驱动与超写实数字人技术底座', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_42', title: 'Hedra AI', url: 'https://www.hedra.com',
        fallback: 'HD', badge: '极具表现力唱歌说话人像', desc: 'Character-2模型驱动：让任意卡通或真人照片不仅对口型说话，还能带着夸张戏剧化神情高歌演戏', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_43', title: 'LivePortrait (快手开源)', url: 'https://liveportrait.github.io',
        fallback: 'LP', badge: '精准重定向人像猫狗表情', desc: '快手开源封神人像驱动模型：用一段面部视频精准驱动静态人像、动漫甚至猫狗照片做出丝滑微表情', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_44', title: 'SadTalker', url: 'https://sadtalker.github.io',
        fallback: 'ST', badge: '西安交大开源单图说话', desc: 'GitHub高星开源音频驱动单张肖像照片生成自然头部摆动与精准唇形动画标杆项目', sub: 'creative',
      ),
      LzSite(
        id: 'ind_3d_45', title: 'Viggle AI', url: 'https://viggle.ai',
        fallback: 'VG', badge: '让任意角色跳爆款舞蹈', desc: '上传一张静态人物立绘和一段动作视频，AI瞬间让照片里的人物完美复刻视频中的丝滑舞蹈与球场动作', sub: 'creative',
      ),
      LzSite(
        id: 'ind_av_16', title: 'Topaz Labs AI', url: 'https://www.topazlabs.com',
        fallback: 'TP', badge: '影视级4K/8K超分补帧', desc: '好莱坞修复老电影标配：Topaz Video/Photo AI利用深度学习将模糊抖动低帧率视频无损放大至4K 60帧', sub: 'creative',
      ),
      LzSite(
        id: 'ind_av_17', title: 'Magnific AI', url: 'https://magnific.ai',
        fallback: 'MG', badge: '地表最强AI细节超分放大', desc: '被马斯克与全球设计师惊叹的幻觉式高清放大器：将模糊小图放大16倍并由AI无中生有补全毛孔与发丝细节', sub: 'creative',
      ),
      LzSite(
        id: 'ind_av_20', title: 'Clipdrop (Jasper/Stability)', url: 'https://clipdrop.co',
        fallback: 'CD', badge: 'AI立体打光与画面外扩', desc: '支持在浏览器中自由拖动彩色虚拟光源为平淡人像重新3D立体打光、去背景、去文字与无限扩图', sub: 'creative',
      ),
      LzSite(
        id: 'ind_av_21', title: 'Recraft V3', url: 'https://www.recraft.ai',
        fallback: 'RC', badge: '可编辑SVG矢量图霸主', desc: '曾登顶全球文生图竞技场榜首！业内唯一能直接生成真正分层SVG矢量图标、品牌VI插画套系与精准长文本海报的AI', sub: 'creative',
      ),
      LzSite(
        id: 'ind_ind_2', title: '华为云盘古大模型 (矿山/制造/气象)', url: 'https://www.huaweicloud.com/product/pangu.html',
        fallback: '盘古', badge: '不作诗只做事的行业大模型', desc: '深入煤矿井下安全监控、高铁轨检、全球秒级台风路径气象预测（Nature正刊发表）与药物研发的工业底座', sub: 'models',
      ),
      LzSite(
        id: 'ind_ind_32', title: 'AutoDraw (Google AI简笔画)', url: 'https://www.autodraw.com',
        fallback: 'AD', badge: '手残党随手画两笔AI秒变精美简笔画', desc: '谷歌创意实验室出品：鼠标歪歪扭扭画个圈，AI瞬间猜出你想画小猫、自行车还是蛋糕并替换成设计师级矢量图标', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_1', title: '凌迪科技 Style3D', url: 'https://www.style3d.com',
        fallback: '凌迪', badge: '柔性布料物理仿真AI', desc: '全球领先的3D数字化服装设计软件：AI生款打版、高仿真丝绸牛仔布料悬垂物理解算与虚拟走秀', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_2', title: 'POP服装趋势网 AI', url: 'https://www.pop-fashion.com',
        fallback: 'POP', badge: '全球时装周秀场趋势', desc: '国内服装设计师标配：四大时装周高清秀场看款、AI图案四方连续生成与面料流行色预测', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_3', title: '知衣科技 Zhiyi AI', url: 'https://www.zhiyitech.cn',
        fallback: '知衣', badge: '女装爆款大数据选款', desc: '实时监控全网女装电商热销榜与INS潮流趋势，配合AI服装大模型一键改款打版', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_4', title: 'Tiamat 瓦力棋牌/花型AI', url: 'https://www.tiamat.world',
        fallback: 'TM', badge: '国产原生艺术花型AI', desc: '上科大孵化的国内知名AI视觉创意平台，专精丝巾纺织数码印花、国潮插画与概念设计', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_5', title: 'The New Black AI 时装', url: 'https://thenewblack.ai',
        fallback: 'TNB', badge: '全球AI时装鞋包设计', desc: '专为时尚品牌与独立设计师打造的AI高定礼服、运动球鞋、奢侈品皮具与首饰概念生成器', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_6', title: 'Raspberry AI 时尚企划', url: 'https://www.raspberry.ai',
        fallback: 'RP', badge: '服装手绘线稿秒变成衣', desc: '将设计师的铅笔服装款式图瞬间渲染为逼真针织、皮革、蕾丝纹理的上身实拍图', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_7', title: 'Cala AI 时尚供应链', url: 'https://ca.la',
        fallback: 'CL', badge: '从AI草图到工厂打样', desc: '把OpenAI DALL-E服装设计与全球成衣代工厂打样、面辅料采购、物流清关打通的时尚操作系统', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_8', title: 'Vizcom AI 工业设计草图', url: 'https://www.vizcom.ai',
        fallback: 'VZ', badge: '工业汽车设计手绘秒变3D', desc: '全球汽车主机厂与工业设计师封神工具：iPad手绘几笔汽车或耳机草图，毫秒级实时渲染金属烤漆质感并转3D网格', sub: 'creative',
      ),
      LzSite(
        id: 'ind_des_9', title: 'NewArc.ai 产品鞋履渲染', url: 'https://www.newarc.ai',
        fallback: 'NA', badge: '鞋服工业草图精准上色', desc: '严格锁死手绘线条结构比例，10秒将球鞋、背包、家电工程线稿变成照片级产品打样图', sub: 'creative',
      ),
      LzSite(
        id: 'ind_life_1', title: 'Character.ai', url: 'https://character.ai',
        fallback: 'CAI', badge: '全球流量第一AI角色扮演陪伴', desc: '与数百万个动漫角色、历史伟人、小说主角、苏格拉底或专属虚拟伴侣进行沉浸式语音文字对话', sub: 'models',
      ),
      LzSite(
        id: 'ind_life_2', title: '星野 App (MiniMax猫箱)', url: 'https://www.xingyeai.com',
        fallback: '星野', badge: '国内超火沉浸式AI智能体剧情互动', desc: 'MiniMax出品：定制你理想中的声音、立绘与人设，开启7x24小时不间断的浪漫、悬疑或修仙互动故事', sub: 'models',
      ),
      LzSite(
        id: 'ind_life_3', title: '筑梦岛 (阅文集团AI陪伴)', url: 'https://www.zhumengdao.com',
        fallback: '筑梦', badge: '起点网文大神IP角色活过来', desc: '阅文集团官方出品，与热门网文主角及原创高颜值虚拟人物跨越次元壁谈心、群聊与小剧场互动', sub: 'models',
      ),
      LzSite(
        id: 'ind_life_4', title: 'Wow (美团AI社交伴侣)', url: 'https://www.wow.ai',
        fallback: 'Wow', badge: '美团出品年轻人的AI奇幻朋友', desc: '提供极致拟真音色与精美二次元/写实形象的24小时树洞倾诉与趣味脑洞冒险伙伴', sub: 'models',
      ),
      LzSite(
        id: 'ind_life_5', title: 'Pi.ai (Inflection高情商AI)', url: 'https://pi.ai',
        fallback: 'Pi', badge: '全世界最温柔耐心的AI倾听者', desc: '硅谷Inflection专为情绪价值、焦虑疏导、人际困惑与温和启发式语音长谈打造的高情商个人AI', sub: 'models',
      ),
      LzSite(
        id: 'ind_life_6', title: 'Hume AI (共情语音大模型EVI)', url: 'https://www.hume.ai',
        fallback: 'HM', badge: '听懂你叹气颤音与情绪起伏的AI', desc: '全球首个共情语音界面EVI：通过分析你说话的音调、节奏与停顿，精准感知24种人类细微情绪并给予温暖回应', sub: 'models',
      ),
      LzSite(
        id: 'ind_tech_22', title: 'Hugging Face Spaces 免费试玩万款最新AI', url: 'https://huggingface.co/spaces',
        fallback: 'Spaces', badge: '免装显卡浏览器直接免费玩遍全球最新开源AI', desc: '全球AI开源圣地！每天上百个最新发布的文生图、语音克隆、视频换脸、3D建模Gradio在线Demo免排队直接用', sub: 'creative',
      ),
      LzSite(
        id: 'ind_tech_24', title: 'Civitai (C站全球最大Stable Diffusion模型库)', url: 'https://civitai.com',
        fallback: 'C站', badge: '全球百万张AI画风LoRA与Checkpoint大模型总库', desc: 'AI绘画玩家必逛圣地：免费下载全球大神炼制的二次元、写实摄影、建筑室内、国风汉服LoRA模型与完整生成参数', sub: 'creative',
      ),
      LzSite(
        id: 'ind_tech_25', title: '哩布哩布AI (LiblibAI 中国最大AI绘画模型站)', url: 'https://www.liblib.art',
        fallback: '哩布', badge: '国内免梯高速下载十万款国风写实LoRA与在线ComfyUI', desc: '国内排名第一的原创AI模型社区，自带免费在线WebUI与ComfyUI工作流画布，零显卡也能跑顶配大图', sub: 'creative',
      ),
      LzSite(
        id: 'ind_tech_26', title: '吐司AI TusiArt', url: 'https://tusiart.com',
        fallback: '吐司', badge: '每日送免费算力的在线SD模型运行与分享社区', desc: '手机网页就能直接在线运行成千上万款动漫、电商、建筑LoRA模型，支持一键同款咒语复刻', sub: 'creative',
      ),
      LzSite(
        id: 'ind_tech_27', title: 'SeaArt AI 海艺', url: 'https://www.seaart.ai/zhCN',
        fallback: '海艺', badge: '功能超全的多模态AI绘画、智能补全与角色广场', desc: '集成数十万风格模型、AI局部重绘、高清修复、控制网ControlNet与趣味AI滤镜应用的创作站', sub: 'creative',
      ),
      LzSite(
        id: 'ind_tech_28', title: 'Tensor.Art 模数科技', url: 'https://tensor.art',
        fallback: 'TA', badge: '支持在线训练LoRA的全球免费AI生图工作台', desc: '不仅能免费在线跑最新Flux与SD3模型，还支持直接在网页端上传素材低门槛训练专属画风LoRA', sub: 'creative',
      ),
    ],
  ),
  LzCategory(
    id: 'cloud_browser', name: '云端浏览器与沙箱', desc: '100款全球云端浏览器 · 美国原生地区 · 远程沙箱 · 指纹与无痕免配置',
    subs: [
      LzSub('all', '全部'),
      LzSub('usa_cloud', '美国与免翻云端'),
      LzSub('sandbox', '隔离沙箱与开发'),
      LzSub('anti_detect', '指纹多开与住宅'),
      LzSub('rbi_security', '企业隔离RBI'),
      LzSub('vps_web', '网页虚拟机与远程'),
      LzSub('purity_check', '纯净度与风控检测'),
    ],
    sites: [
      LzSite(
        id: 'cloud_br_1', title: 'Muse 云端浏览器 (自带美国地区)', url: 'https://muse.run',
        fallback: 'Muse', badge: 'HOT', desc: '知名免翻云端浏览器：自带美国原生纯净节点，网页端直接串流全功能远程 Chromium，秒开全球网站', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_2', title: 'Hyperbeam 云端虚拟浏览器', url: 'https://hyperbeam.com',
        fallback: 'HB', badge: '美国', desc: '超低延迟云端浏览器房间，自带纯净美国原生 IP，支持音视频同步串流与多人协同浏览', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_3', title: 'Neverinstall 云端云桌面', url: 'https://neverinstall.com',
        fallback: 'NI', badge: '推荐', desc: '在云端免安装极速运行 Chrome / Brave / Firefox，默认欧美顶尖数据中心高速网络', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_4', title: 'SquareX 抛弃型云端沙盒', url: 'https://sqrx.com',
        fallback: 'SQ', badge: '多地区', desc: '即用即抛一次性云端浏览器：自由选择美国、欧洲、亚太等多个数据中心，零追踪无痕隔离', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_5', title: 'Kasm Workspaces 云端容器浏览器', url: 'https://kasmweb.com',
        fallback: 'Kasm', badge: '隔离', desc: '开源容器化远程浏览器隔离 (RBI)：在云端无痕沙盒中安全打开任意可疑网址或私密浏览', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_6', title: 'Browserling 在线即时云浏览器', url: 'https://www.browserling.com',
        fallback: 'Bling', badge: '免登录', desc: '免安装免登录在线云浏览器：一键启动真实云端 Chrome/Firefox/Edge 交互式运行', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_7', title: 'OnWorks 免费云工作站', url: 'https://www.onworks.net',
        fallback: 'OW', badge: '免费', desc: '网页端免费直接运行 Ubuntu / Fedora 桌面与全功能浏览器，自带美国原生网络环境', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_8', title: 'DistroSea 网页直接开系统', url: 'https://distrosea.com',
        fallback: 'DS', badge: '极客', desc: '在网页中秒级启动数十款真实 Linux 操作系统，内嵌完整网络与网页浏览器沙盒', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_9', title: 'Appetize.io 网页云端移动设备', url: 'https://appetize.io',
        fallback: 'Appz', badge: '移动', desc: '在网页浏览器中即时流式运行云端 Android 和 iOS 手机虚拟环境与移动端浏览器', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_10', title: 'JSLinux 网页虚拟机浏览器', url: 'https://bellard.org/jslinux',
        fallback: 'JSL', badge: '神作', desc: '计算机传奇 Fabrice Bellard 打造：纯 JavaScript 在网页内模拟完整 x86 / RISC-V 虚拟机系统', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_11', title: 'StackBlitz WebContainers', url: 'https://stackblitz.com',
        fallback: 'SB', badge: '秒级', desc: '在浏览器内部运行完整 Node.js 与网页应用，内置零延迟云端网页预览环境', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_12', title: 'Gitpod 自动化云开发工作区', url: 'https://www.gitpod.io',
        fallback: 'GP', badge: '开发', desc: '开箱即用的云端容器开发环境，提供完整的 Linux 终端、端口转发与内置浏览器视图', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_13', title: 'GitHub Codespaces 云工作站', url: 'https://github.com/features/codespaces',
        fallback: 'GH', badge: '官方', desc: 'GitHub 官方云端完整开发虚拟机，全球骨干网络出网与即时网页端口预览', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_14', title: 'CodeSandbox 现代化云端沙盒', url: 'https://codesandbox.io',
        fallback: 'CSB', badge: '沙盒', desc: '云端微虚拟机 (MicroVM) 驱动的云端全栈容器，毫秒级热更新与无痕隔离浏览器', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_15', title: 'Replit 云端交互式编程沙盒', url: 'https://replit.com',
        fallback: 'Rep', badge: '北美', desc: '全功能云端容器与 Web 运行环境，原生北美数据中心出网 IP，支持一键托管与浏览', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_16', title: 'Browserless.io 云端无头浏览器', url: 'https://www.browserless.io',
        fallback: 'BL', badge: '自动化', desc: '企业级云端无头 Chrome / Puppeteer 运行集群，支持实时网页调试与远程串流交互', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_17', title: 'LambdaTest 全球实时云端真机', url: 'https://www.lambdatest.com',
        fallback: 'LT', badge: '全球', desc: '跨越全球 3000+ 种真实浏览器与操作系统组合，支持多地理位置即时远程访问', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_18', title: 'BrowserStack 真实云设备矩阵', url: 'https://www.browserstack.com',
        fallback: 'BST', badge: '真机', desc: '全球领先的云端真实机房与浏览器矩阵，即时连接真实海外数据中心网络', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_19', title: 'Sauce Labs 虚拟云浏览器', url: 'https://saucelabs.com',
        fallback: 'SL', badge: '云端', desc: '全球规模最大的自动化与实时交互云端浏览器测试网络之一，提供全方位沙盒环境', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_20', title: 'TestSigma 云端无代码测试浏览器', url: 'https://testsigma.com',
        fallback: 'TS', badge: 'AI', desc: '基于云端浏览器的 AI 自动化交互平台，免环境配置即刻体验云端网页', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_21', title: 'Maskfog 云端指纹浏览器', url: 'https://www.maskfog.com',
        fallback: 'Mask', badge: '美国住宅', desc: '自带原生独享美国住宅 IP 与独享环境隔离，支持一键创建多地区云端环境', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_22', title: '比特浏览器 (BitBrowser)', url: 'https://www.bitbrowser.cn',
        fallback: 'Bit', badge: '多开', desc: '专业多开防关联指纹浏览器，支持深度指纹伪装、内核级隔离与全球代理一键绑定', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_23', title: 'AdsPower 云端反指纹浏览器', url: 'https://www.adspower.com',
        fallback: 'Ads', badge: '出海', desc: '跨境电商与出海业务首选，提供针对 Chromium 和 Firefox 双内核的深度指纹随机化', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_24', title: 'Hubstudio 跨境指纹多开', url: 'https://www.hubstudio.cn',
        fallback: 'Hub', badge: '免费', desc: '纯净独立网络环境隔离，支持永久免费多开与团队协同多账号云端无痕浏览', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_25', title: 'ixBrowser 永久免费防关联浏览器', url: 'https://www.ixbrowser.com',
        fallback: 'IX', badge: '零封锁', desc: '零限制免费指纹浏览器，独立 Canvas/WebGL/字体环境隔离，杜绝跨窗口关联', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_26', title: 'Dolphin{anty} 海外云端浏览器', url: 'https://dolphin-anty.com',
        fallback: 'Dol', badge: '国际', desc: '广受海外推崇的抗检测反指纹浏览器，快速切换全球网络节点，防风控封锁', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_27', title: 'GoLogin Orbita 云端安全浏览器', url: 'https://gologin.com',
        fallback: 'GoL', badge: '云端', desc: '基于自研 Orbita 内核，自带云端虚拟配置与多种多国网络环境模拟', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_28', title: 'MoreLogin 云端指纹浏览器', url: 'https://www.morelogin.com',
        fallback: 'More', badge: '真实机', desc: 'Canvas 与音频声学指纹真实采集重混，支持美国等地区原生住宅 IP 对接', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_29', title: 'MultiLogin 行业标杆防关联系统', url: 'https://multilogin.com',
        fallback: 'ML', badge: '顶级', desc: '防指纹追踪领域的开创者与标杆，彻底隔离设备底层硬件特征与网络栈', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_30', title: 'Incogniton 结构化反关联浏览器', url: 'https://incogniton.com',
        fallback: 'Inc', badge: '自动化', desc: '强大的多配置隔离工具，模拟人类键入行为与真实操作系统环境', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_31', title: 'Octo Browser 高性能防指纹浏览器', url: 'https://octobrowser.net',
        fallback: 'Octo', badge: '高跑分', desc: '通过 Pixelscan / CreepJS 严苛检测的顶级伪装能力，专为高性能极速浏览设计', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_32', title: 'Undetectable.io 云端多开环境', url: 'https://undetectable.io',
        fallback: 'Und', badge: '无痕', desc: '本地与云端双架构无痕隔离，不限配置文件数量，支持海量环境批量生成', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_33', title: 'ClonBrowser 云端防封号沙箱', url: 'https://www.clonbrowser.com',
        fallback: 'Clon', badge: '风控', desc: '全球代理 IP 自动化绑定，多维度伪装系统硬件与网络协议栈指纹', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_34', title: 'MuLogin 多登防关联浏览器', url: 'https://www.mulogin.com',
        fallback: 'MuL', badge: '防联', desc: '独立虚拟浏览器环境，每个配置独享 Cookie、LocalStorage 与硬件指纹', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_35', title: 'Puffin 云端加速浏览器', url: 'https://www.puffin.com',
        fallback: 'Puf', badge: '云渲染', desc: '美国云端服务器远程渲染网页后将画面加密串流回客户端，极度节省流量与设备功耗', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_36', title: 'Mighty 极速串流云端浏览器', url: 'https://www.mightyapp.com',
        fallback: 'Mgt', badge: '黑科技', desc: '由美国顶级数据中心双 Intel Xeon 服务器渲染网页，千兆光纤低延迟流畅串流', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_37', title: 'Island 企业级隔离云浏览器', url: 'https://www.island.io',
        fallback: 'Isl', badge: '企业', desc: '重新定义企业安全：在完全隔离的云端安全环境中进行浏览，彻底防泄露防劫持', sub: 'rbi_security',
      ),
      LzSite(
        id: 'cloud_br_38', title: 'Talon 深度隔离安全云浏览器', url: 'https://www.talon-sec.com',
        fallback: 'Tal', badge: '零信任', desc: '面向分布式混合办公的零信任浏览器隔离体系，保护任意终端的网页访问安全', sub: 'rbi_security',
      ),
      LzSite(
        id: 'cloud_br_39', title: 'Silo by Authentic8 远程隔离浏览器', url: 'https://www.authentic8.com',
        fallback: 'Silo', badge: '军工级', desc: '运行在云端一次性容器中的全隔离网络浏览器，零网页代码在本地设备执行', sub: 'rbi_security',
      ),
      LzSite(
        id: 'cloud_br_40', title: 'Surfly 零安装即时协作云浏览', url: 'https://www.surfly.com',
        fallback: 'Surf', badge: '免安装', desc: '基于云端反向代理与协同浏览技术，输入网址即可和好友在云端实时同步漫游', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_41', title: 'Menlo Security 零信任云端隔离', url: 'https://www.menlosecurity.com',
        fallback: 'Men', badge: '隔离', desc: '全球领先的无害化远程浏览器隔离 (RBI)，所有网页渲染均留在云端沙箱', sub: 'rbi_security',
      ),
      LzSite(
        id: 'cloud_br_42', title: 'Cloudflare Browser Isolation', url: 'https://www.cloudflare.com/zero-trust/products/browser-isolation/',
        fallback: 'CF', badge: '全球边缘', desc: '依托 Cloudflare 全球 300+ 边缘数据中心运行的远程浏览器，毫秒级响应与安全', sub: 'rbi_security',
      ),
      LzSite(
        id: 'cloud_br_43', title: 'Amazon WorkSpaces Web', url: 'https://aws.amazon.com/workspaces/web/',
        fallback: 'AWS', badge: '亚马逊', desc: 'AWS 官方按需付费低成本安全网页浏览器，托管在亚马逊北美等全球骨干云网络', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_44', title: 'Google Cloud Workstations', url: 'https://cloud.google.com/workstations',
        fallback: 'GCW', badge: '谷歌', desc: '谷歌云托管的托管型安全开发环境，全功能云端 Linux 桌面与 Chrome 浏览器', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_45', title: 'Microsoft Windows 365 Cloud PC', url: 'https://www.microsoft.com/en-us/windows-365',
        fallback: 'W365', badge: '微软', desc: '在任意浏览器打开完整的云端 Windows 操作系统与 Edge 浏览器，随时随地接入', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_46', title: 'Paperspace Core 虚拟桌面', url: 'https://www.paperspace.com',
        fallback: 'Paper', badge: '高性能', desc: '纽约与加州低延迟云端工作站，通过网页直接操控全能云主机与浏览器', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_47', title: 'Shells 个人云电脑与虚拟浏览器', url: 'https://www.shells.com',
        fallback: 'Shell', badge: '便携', desc: '专为个人设计的便捷虚拟桌面与浏览器，一键接入美国云电脑畅享无限制网络', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_48', title: 'Shadow PC 高性能云电脑', url: 'https://shadow.tech',
        fallback: 'Shd', badge: '低延迟', desc: '全功能云端高规格 PC，网页或客户端无缝串流，完整 Windows 网络与浏览器环境', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_49', title: 'Apache Guacamole 网页无端远程桌', url: 'https://guacamole.apache.org',
        fallback: 'Guac', badge: '开源', desc: '无客户端 HTML5 远程桌面网关：网页直接连接云端 RDP/VNC/SSH 与远程浏览器', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_50', title: 'RustDesk Web 网页端远程控制', url: 'https://rustdesk.com',
        fallback: 'Rust', badge: '极速', desc: '开源远程桌面客户端 Web 版，支持纯网页访问海外远程设备与云端浏览器', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_51', title: 'urlscan.io 云端沙箱自动检测', url: 'https://urlscan.io',
        fallback: 'UScan', badge: '分析', desc: '在云端无头沙盒中自动访问目标网址并录制网络请求、DOM 结构与完整截屏', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_52', title: 'WebPageTest 全球节点真机渲染', url: 'https://www.webpagetest.org',
        fallback: 'WPT', badge: '多国', desc: '覆盖美国弗吉尼亚、加州及全球多地真实 Chrome/Edge 浏览器远程渲染与视频回放', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_53', title: 'GTmetrix 北美云端浏览器测速', url: 'https://gtmetrix.com',
        fallback: 'GTM', badge: '北美', desc: '基于温哥华与美国机房真实云浏览器加载网页，完整呈现瀑布图与页面视频回放', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_54', title: 'Browsershots 分布式浏览器快照', url: 'https://browsershots.org',
        fallback: 'BS', badge: '快照', desc: '由全球分布式计算节点拍摄数十种浏览器版本下的真实网页渲染结果', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_55', title: 'ScreenshotMachine 云端渲染引擎', url: 'https://www.screenshotmachine.com',
        fallback: 'SSM', badge: '工具', desc: '在线即时抓取全球网页长图，云端高保真还原网页真实样式与排版', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_56', title: 'Urlbox 现代化云端渲染服务', url: 'https://urlbox.com',
        fallback: 'Ubox', badge: 'API', desc: '采用真实云端 Chromium 渲染 WebGL、Canvas 与复杂 JavaScript 的网页沙盒', sub: 'sandbox',
      ),
      LzSite(
        id: 'cloud_br_57', title: 'Bright Data Scraping Browser', url: 'https://brightdata.com',
        fallback: 'BD', badge: '住宅IP', desc: '集成全球 7200 万真实家庭住宅 IP 的智能云端浏览器，全自动绕过验证码与防爬', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_58', title: 'Oxylabs Web Unblocker 智能浏览器', url: 'https://oxylabs.io',
        fallback: 'Oxy', badge: 'AI解封', desc: 'AI 动态模拟人类浏览行为、指纹与请求标头，自动穿透地区限制与反爬虫拦截', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_59', title: 'Smartproxy 独享住宅云浏览器', url: 'https://smartproxy.com',
        fallback: 'SP', badge: '城市级', desc: '覆盖全球 195+ 国家和地区的真实住宅网络，支持精确到美国城市的定向云浏览', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_60', title: 'Webshare 高速纯净云代理浏览器', url: 'https://www.webshare.io',
        fallback: 'WS', badge: '极速', desc: '超低成本纯净数据中心与静态住宅代理，高速畅游欧美各大数据中心服务', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_61', title: 'IPRoyal 纯净家庭住宅网络', url: 'https://iproyal.com',
        fallback: 'IPR', badge: '纯净', desc: '100% 真实家庭宽带 IP，提供极致纯净度的网络访问与无痕指纹浏览器集成', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_62', title: 'NetNut 专线 ISP 架构云浏览器', url: 'https://netnut.io',
        fallback: 'NN', badge: '专线', desc: '直接与全球电信运营商骨干对接，零跳点稳定性极佳的欧美网络环境', sub: 'usa_cloud',
      ),
      LzSite(
        id: 'cloud_br_63', title: 'SOAX 全球移动蜂窝与住宅环境', url: 'https://soax.com',
        fallback: 'SOAX', badge: '4G/5G', desc: '真实移动基站与家庭 WiFi 节点，模拟出最无可挑剔的本地化云端浏览特征', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_64', title: 'Geonode 弹性按需云网络', url: 'https://geonode.com',
        fallback: 'Geo', badge: '弹性', desc: '数百万全球节点随时调度，轻松切换不同国家地理位置进行网页测试', sub: 'anti_detect',
      ),
      LzSite(
        id: 'cloud_br_65', title: 'AnyViewer Web 网页远程控制', url: 'https://www.anyviewer.com',
        fallback: 'AV', badge: '免端', desc: '免装软件随时在浏览器控制异地电脑，秒开远程桌面自带的海外浏览器', sub: 'vps_web',
      ),
      LzSite(
        id: 'cloud_br_66', title: 'BrowserScan 浏览器深度指纹检测', url: 'https://www.browserscan.net',
        fallback: 'BScan', badge: '权威', desc: '一键全面检测 Canvas、WebGL、音频、字体、IP 纯净度与机器人伪装等级', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_67', title: 'CreepJS 极客反指纹对抗诊断', url: 'https://abrahamjuliot.github.io/creepjs/',
        fallback: 'Creep', badge: '地狱级', desc: '业内公认最严苛的浏览器指纹检测系统，能轻易穿透一般伪装并给出可信度评级', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_68', title: 'Pixelscan 浏览器环境一致性评测', url: 'https://pixelscan.net',
        fallback: 'Pixel', badge: '风控分', desc: '针对浏览器指纹与 IP 地理位置的一致性做综合评分，识别伪装瑕疵与代理泄露', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_69', title: 'Whoer.net 网络匿名度评测', url: 'https://whoer.net',
        fallback: 'Whoer', badge: '常用', desc: '老牌匿名度检测站，检测 DNS 泄露、WebRTC 穿透、时区语言不匹配与黑名单状态', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_70', title: 'IPhey 浏览器数字指纹可信度', url: 'https://iphey.com',
        fallback: 'IPhey', badge: '一键查', desc: '全方位评判当前网络环境纯净度：IP、浏览器、硬件、软件和位置五大维度绿标认证', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_71', title: 'BrowserLeaks 全套浏览器泄露诊断', url: 'https://browserleaks.com',
        fallback: 'BLeaks', badge: '专业', desc: '全套网络指纹诊断：WebRTC 泄露、Canvas 指纹、字体检测、SSL/TLS 指纹合集', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_72', title: 'WhatIsMyBrowser 软硬件解析', url: 'https://www.whatismybrowser.com',
        fallback: 'WMB', badge: '基础', desc: '权威查询当前浏览器 User-Agent、屏幕分辨率、Cookies 支持与插件环境', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_73', title: 'DeviceInfo 终极隐私泄露审查', url: 'https://deviceinfo.me',
        fallback: 'DevInfo', badge: '详尽', desc: '深挖 50+ 硬件特征：电池状态、网络速度、传感器、蓝牙 API 与音频延迟分析', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_74', title: 'FingerprintJS 设备指纹演示', url: 'https://fingerprint.com',
        fallback: 'FPJS', badge: '高精准', desc: '商业级 99.5% 跨浏览器识别率设备指纹演示，查看自己设备的唯一设备特征码', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_75', title: 'Am I Unique? 全球指纹独特性对比', url: 'https://amiunique.org',
        fallback: 'AIU', badge: '学术', desc: '法国国家信息与自动化研究所主持的学术项目，查看自己在全球指纹库中的稀缺度', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_76', title: 'Cover Your Tracks (EFF 反追踪测试)', url: 'https://coveryourtracks.eff.org',
        fallback: 'EFF', badge: '公益', desc: '电子前哨基金会官方工具，测试当前浏览器对抗指纹追踪与广告阻断的真实能力', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_77', title: 'WebRTC Troubleshooter 官方诊断', url: 'https://test.webrtc.org',
        fallback: 'RTC', badge: '穿透', desc: 'WebRTC 官方测试：检查麦克风摄像头穿透、STUN/TURN 服务器与真实内网/外网 IP 泄露', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_78', title: 'DNS Leak Test 全球标准泄露测试', url: 'https://www.dnsleaktest.com',
        fallback: 'DNS', badge: '防泄露', desc: '排查运营商劫持与 DNS 查询泄露，检测是否向非目标地区 DNS 发起请求', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_79', title: 'Speedtest 全球节点宽带测速', url: 'https://www.speedtest.net',
        fallback: 'Speed', badge: '测速', desc: 'Ookla 旗下全球基准网络测速，精确测试全球各节点带宽、时延与抖动', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_80', title: 'Fast.com 极简全球流媒体测速', url: 'https://fast.com',
        fallback: 'Fast', badge: '秒测', desc: 'Netflix 官方打造：测试跨国直连真实带宽与流媒体连接质量，极简无广告', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_81', title: 'ping0.cc 纯净度参考 (仅作为参考)', url: 'https://ping0.cc',
        fallback: 'Ping0', badge: '参考源', desc: '网络骨干路由追踪与原生IP分类参考：机房、住宅、广播与风险类型交叉比对', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_82', title: 'IPinfo.io 开发者级高精 IP 库', url: 'https://ipinfo.io',
        fallback: 'IPinfo', badge: '精准', desc: '开发者首选 IP 情报源：精确查询 ASN、运营商、机房类型 (Hosting/ISP/Business)', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_83', title: 'Scamalytics 全球 IP 欺诈评分系统', url: 'https://scamalytics.com',
        fallback: 'Scam', badge: '风控必备', desc: '出海风控必备：查询当前 IP 欺诈分 (Fraud Score 0-100)、黑名单与代理识别', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_84', title: 'IPQualityScore (IPQS 深度分析)', url: 'https://www.ipqualityscore.com',
        fallback: 'IPQS', badge: '企业级', desc: '金融级反欺诈风控库：识别 VPN、Tor 节点、爬虫 IP 与高危代理环境', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_85', title: 'ProxyCheck.io 实时网络代理排查', url: 'https://proxycheck.io',
        fallback: 'PCheck', badge: '检测', desc: '实时检测当前访问是否来自公开代理、VPN 或匿名出口节点，给出危险度评估', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_86', title: 'IPLocation.net 多库地理位置交叉', url: 'https://www.iplocation.net',
        fallback: 'IPLoc', badge: '交叉', desc: '同时比对 MaxMind、IP2Location、DB-IP 等 5 大权威地理数据库的定位差异', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_87', title: 'MaxMind GeoIP 行业标准定位', url: 'https://www.maxmind.com',
        fallback: 'MaxM', badge: '权威', desc: '全球各大科技巨头采用的标准 GeoIP 与 minFraud 欺诈检测数据库', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_88', title: 'IP2Location 全球精准地理与代理', url: 'https://www.ip2location.com',
        fallback: 'IP2L', badge: '全面', desc: '全球高精度 IP 归属地、时区、邮编、运营商与代理类型全面数据库', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_89', title: 'DB-IP 全球 IP 地理威胁库', url: 'https://db-ip.com',
        fallback: 'DBIP', badge: '威胁库', desc: '免费查询 IP 物理坐标、自治系统 ASN 以及关联的安全威胁等级评分', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_90', title: 'AbuseIPDB 恶意攻击 IP 黑名单库', url: 'https://www.abuseipdb.com',
        fallback: 'Abuse', badge: '黑名单', desc: '全球网民与服务器协同维护的恶意扫描、爆破与滥用行为黑名单数据库', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_91', title: 'Shodan 全球联网资产搜索引擎', url: 'https://www.shodan.io',
        fallback: 'Shodan', badge: '黑客神器', desc: '全网联网设备与开放端口资产扫描，探查当前 IP 暴露的服务器与网络服务', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_92', title: 'Censys 互联网资产扫描引擎', url: 'https://censys.io',
        fallback: 'Censys', badge: '测绘', desc: '快速检索全球主机配置、SSL/TLS 证书链信息与互联网基础设施分布', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_93', title: 'FOFA 网络空间资产测绘平台', url: 'https://fofa.info',
        fallback: 'FOFA', badge: '测绘', desc: '国内知名网络空间资产测绘系统，分析 IP 资产的全球分布与服务运行特征', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_94', title: 'ZoomEye 钟馗之眼网络测绘', url: 'https://www.zoomeye.org',
        fallback: 'Zoom', badge: '钟馗', desc: '知道创宇旗下网络空间雷达，洞悉全球设备指纹与组件漏洞分布', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_95', title: 'SecurityTrails 历史 DNS 与资产', url: 'https://securitytrails.com',
        fallback: 'SecTr', badge: '历史DNS', desc: '查询 IP 的历史解析记录、子域名与逆向反查绑定的全部网站', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_96', title: 'VirusTotal 网址与 IP 威胁分析', url: 'https://www.virustotal.com',
        fallback: 'VT', badge: '70+杀软', desc: 'Google 旗下安全平台，聚合 70+ 款顶尖防病毒引擎交叉查杀 IP 与网址安全度', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_97', title: 'ip.sb 极简纯净 IP 与路由查询', url: 'https://ip.sb',
        fallback: 'IPsb', badge: '极简', desc: '极客最爱的极简出网 IP 查询：毫秒响应，提供清晰明了的运营商与经纬度', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_98', title: 'IP138 传统国内高精 IP 查询', url: 'https://www.ip138.com',
        fallback: '138', badge: '中文', desc: '国民级老牌 IP 查询站，快速识别国内三大运营商归属省份与城市行政区划', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_99', title: 'Cloudflare 速度与边缘质量测试', url: 'https://speed.cloudflare.com',
        fallback: 'CFSpd', badge: '边缘', desc: '深入测试当前客户端到 Cloudflare 全球边缘节点的上传、下载、时延与丢包抖动', sub: 'purity_check',
      ),
      LzSite(
        id: 'cloud_br_100', title: 'IPify 极简纯文本公网 IP API', url: 'https://api.ipify.org',
        fallback: 'ipify', badge: '秒回', desc: '全球高可用公网 IP 诊断服务，零广告毫秒级返回当前设备真实公网出口 IP', sub: 'purity_check',
      ),
    ],
  ),
  LzCategory(
    id: 'ai_canvas', name: '无限画布与创作', desc: '节点画布 · 灵感工作台 · 视觉与视频生成',
    subs: [
      LzSub('all', '全部'),
      LzSub('canvas', '无限画布'),
      LzSub('video', '视频生成'),
      LzSub('platform', '聚合平台'),
    ],
    sites: [      LzSite(
        id: 'ind_cc_4', title: '青椒云电脑', url: 'https://www.qingjiaocloud.com',
        fallback: '青椒', badge: 'AIGC云工作站', desc: '预装Stable Diffusion、Blender、Unreal的视觉设计师专属高配GPU云电脑', sub: 'platform',
      ),
      LzSite(
        id: 'ind_cc_23', title: '仙宫云', url: 'https://www.xiangongyun.com',
        fallback: '仙', badge: 'SD云端镜像', desc: '一键启动ComfyUI与WebUI大师预设镜像的AIGC创作者专属算力云', sub: 'platform',
      ),
      LzSite(
        id: 'ind_cc_24', title: '揽睿星舟', url: 'https://www.lanrui-ai.com',
        fallback: '揽', badge: 'AIGC算力', desc: '内置丰富SDXL/Flux模型库、开箱即用的云端GPU工作空间', sub: 'platform',
      ),
      LzSite(
        id: 'ind_arch_1', title: '酷家乐AI', url: 'https://www.kujiale.com',
        fallback: '酷', badge: '10秒户型出图', desc: '群核科技旗下全球领先云设计平台，户型图一键生成3D全景漫游与超写实家装效果图', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_2', title: '三维家3D云设计', url: 'https://www.3vjia.com',
        fallback: '三维', badge: '全屋定制AI', desc: '打通前后端一体化：AI软装搭配、全屋柜体CAD拆单直连工厂数控开料机', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_3', title: '躺平设计家', url: 'https://www.shejijia.com',
        fallback: '躺平', badge: '阿里家装设计', desc: '阿里巴巴联手居然之家打造的免费3D云端室内设计、AI换软装与高清云渲染平台', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_4', title: '小库科技XKool', url: 'https://www.xkool.ai',
        fallback: '小库', badge: '建筑强排AI', desc: '全球首个云端AI建筑设计平台：拿地测算、日照退界强排方案秒级生成百套比选', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_9', title: 'D5渲染器AI', url: 'https://www.d5render.cn',
        fallback: 'D5', badge: '实时光线追踪', desc: '国产之光！内置AI氛围匹配、AI材质超分与植物散布的建筑景观实时光追渲染器', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_10', title: '光辉城市Mars', url: 'https://mars.sheencity.com',
        fallback: 'Mars', badge: '景观建筑VR', desc: '专注建筑设计院与景观园林汇报展示的实时虚拟现实VR数字孪生渲染平台', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_22', title: 'Finch 3D', url: 'https://www.finch3d.com',
        fallback: 'FC', badge: '参数化平面优化', desc: '利用AI与图论算法实时优化建筑平面核心筒排布、得房率、采光与碳排放指标', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_23', title: 'TestFit', url: 'https://www.testfit.io',
        fallback: 'TF', badge: '地产拿地秒算', desc: '房地产开发商拿地神器：实时生成公寓、停车场、物流园总图排布与财务投资回报率', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_24', title: 'Autodesk Forma', url: 'https://www.autodesk.com/products/forma',
        fallback: 'FM', badge: '欧特克AI云建筑', desc: 'Autodesk收购Spacemaker打造的AI建筑前期规划云：实时风环境、噪音与日照微气候仿真', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_25', title: 'Hypar', url: 'https://hypar.io',
        fallback: 'HP', badge: '云端参数化BIM', desc: '在浏览器中通过代码与AI逻辑瞬时生成整栋办公大楼结构、机电管道与幕墙BIM模型', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_26', title: 'Swapp AI', url: 'https://www.swapp.ai',
        fallback: 'SW', badge: 'AI全自动施工图', desc: '将概念建筑设计方案通过AI自动转化为全套可报建、可施工的详图与BIM文档', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_29', title: 'Planner 5D AI', url: 'https://planner5d.com',
        fallback: 'P5D', badge: '纸质户型转3D', desc: '上传一张2D房产宣传单户型图，AI自动识别墙体门窗秒变可漫游摆放家具的3D样板间', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_30', title: 'Homestyler 国际版', url: 'https://www.homestyler.com',
        fallback: 'HS', badge: '全球3D家装', desc: '支持移动端与网页端的全球千万用户在线3D软装设计、AR实景摆家具与AI改造社区', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_arch_35', title: 'Fabrie AI 工业建筑白板', url: 'https://www.fabrie.cn',
        fallback: 'FB', badge: '设计师AI无限画布', desc: '集成AI线稿上色、材质替换、设计调研看板与团队审图的国内顶尖设计师无限画布', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_3d_5', title: 'Spline AI 3D', url: 'https://spline.design',
        fallback: 'SP', badge: '网页交互式3D设计', desc: '浏览器内直接用AI生成可交互3D网页组件、物理碰撞动画并一键嵌入React/Webflow', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_av_1', title: 'Descript', url: 'https://www.descript.com',
        fallback: 'DS', badge: '像改Word一样剪视频', desc: '把音视频自动转成文字稿：删掉文本里的字就能同步剪掉对应视频片段，还能AI克隆声音补录口误', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_2', title: 'OpusClip', url: 'https://www.opus.pro',
        fallback: 'OC', badge: '长视频秒切10条爆款短视频', desc: '上传1小时播客或访谈长视频，AI自动识别高能金句时刻、智能居中人物人脸并配动态字幕切出10条竖屏爆款', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_3', title: 'Vizard.ai', url: 'https://vizard.ai',
        fallback: 'VZ', badge: 'AI会议长片转社媒切片', desc: '自动将Zoom网络研讨会、公开课长视频智能拆解为带精美包装模板的抖音/TikTok/YouTube Shorts短视频', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_4', title: 'Munch AI', url: 'https://www.getmunch.com',
        fallback: 'MC', badge: '大数据热搜匹配切片', desc: '结合全网实时搜索热度，从长视频中精准提取最具传播潜力的黄金片段并自动生成多平台发布文案', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_5', title: 'Captions.ai', url: 'https://www.captions.ai',
        fallback: 'CP', badge: '眼神矫正+网红动态字幕', desc: '即使你看着提词器念稿，AI也能实时把你的眼球视线修正为直视镜头，并一键加上欧美顶流网红花字特效', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_6', title: '神奇字幕 MagicSub', url: 'https://www.shenqizimu.com',
        fallback: '字幕', badge: '短视频网红弹跳花字', desc: '一键识别语音生成爆款短视频节奏感弹跳花字、自动插入音效与表情包的自媒体提效工具', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_7', title: '闪豆视频下载剪辑', url: 'https://www.shandou.com',
        fallback: '闪豆', badge: '多平台音视频字幕提取', desc: '支持全网主流音视频高清素材解析、AI人声伴奏分离与批量横屏转竖屏智能混剪', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_8', title: '度加创作工具', url: 'https://dujia.baidu.com',
        fallback: '度加', badge: '百度AIGC一键成片', desc: '百度官方出品：输入百家号文章或热点话题，AI自动写稿、配音、匹配画面素材一键生成高清视频', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_9', title: '腾讯智影', url: 'https://zenvideo.qq.com',
        fallback: '智影', badge: '腾讯云端AI剪辑台', desc: '无需下载软件，浏览器端直接使用腾讯数字人播报、文本配音、字幕识别、智能横转竖与去水印全套功能', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_10', title: '剪映网页版云剪辑', url: 'https://www.capcut.cn',
        fallback: '剪映', badge: '全民视频剪辑神器', desc: '字节跳动官方在线版与客户端：内置图文成片、智能抠像、音频降噪、美颜美体与海量抖音神曲模板', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_11', title: '必剪 (B站官方)', url: 'https://bcut.bilibili.cn',
        fallback: '必剪', badge: 'UP主专属鬼畜ACG剪辑', desc: '哔哩哔哩官方出品：内置海量B站热梗音画素材、全轨道录屏、ACG虚拟形象驱动与一键投稿B站', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_12', title: '快影AI创作', url: 'https://www.kuaiying.com',
        fallback: '快影', badge: '快手官方智能剪辑', desc: '快手官方免费无广告剪辑工具，支持AI文生图定制分镜、智能变声与一键卡点大片', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_13', title: '秒剪 (微信视频号)', url: 'https://miaojian.weixin.qq.com',
        fallback: '秒剪', badge: '微信视频号官方神器', desc: '腾讯微信团队专门为视频号创作者打造的AI自动配乐、语音转字幕与极简快剪工具', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_14', title: 'Wonder Studio (Autodesk)', url: 'https://wonderdynamics.com',
        fallback: 'WS', badge: '真人实拍直接变CG外星人', desc: '斯皮尔伯格投资、已被欧特克收购：无需绿幕和动捕，AI自动把实拍视频里的真人擦除并替换为光影完美融合的3D CG角色', sub: 'video',
      ),
      LzSite(
        id: 'ind_av_15', title: 'EbSynth 风格化转绘', url: 'https://ebsynth.com',
        fallback: 'EB', badge: '画一帧自动渲染整段视频', desc: '只需由画师或AI重绘视频的几个关键帧，即可将油画、动漫手绘风格丝滑无闪烁地传播到整段长视频', sub: 'video',
      ),
      LzSite(
        id: 'ind_of_11', title: 'Xmind AI', url: 'https://xmind.ai',
        fallback: 'XM', badge: '全球思维导图天花板', desc: '风靡全球的颜值巅峰思维导图工具云端AI版，支持多人协作脑暴与一句话自动拆解万字复杂脑图', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_of_12', title: 'GitMind 思乎', url: 'https://gitmind.cn',
        fallback: 'GM', badge: '免费AI脑图星球', desc: '输入任意问题或上传长文档，AI自动发散构建精美思维导图、流程图、组织架构图与泳道图', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_des_10', title: '包小盒 3D包装设计AI', url: 'https://www.baoxiaohe.com',
        fallback: '包盒', badge: '在线刀版图秒变3D包装盒', desc: '无需C4D基础！在线选择礼盒、纸箱、易拉罐、手提袋刀版尺寸，贴图实时生成3D光追包装样机', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_des_11', title: '小象智合包装AI', url: 'https://www.elepdesign.com',
        fallback: '小象', badge: '从AI包装设计到印刷交付', desc: '一站式完成节日礼盒AI插画生成、结构刀版自动校验与全国就近云印刷工厂打样发货', sub: 'canvas',
      ),
      LzSite(
        id: 'ind_des_12', title: 'Pacdora 全球3D包装样机', url: 'https://www.pacdora.cn',
        fallback: 'PC', badge: '5000款可导出刀版3D样机', desc: '支持在线自定义长宽高自动生成精准印刷ダイカット刀版线，并实时在浏览器渲染4K包装盒动画', sub: 'canvas',
      ),
    ],
  ),
  LzCategory(
    id: 'ai_prompts', name: 'Prompt与Skill社区', desc: '提示词工程 · 智能体Skill · 高质量咒语库',
    subs: [
      LzSub('all', '全部'),
      LzSub('prompt', 'Prompt咒语'),
      LzSub('skill', 'Skill社区'),
      LzSub('gallery', '灵感画廊'),
    ],
    sites: [      LzSite(
        id: 'ind_tech_29', title: 'OpenArt AI', url: 'https://openart.ai',
        fallback: 'OA', badge: '千万级Midjourney/SD提示词库与ComfyUI云工作流', desc: '硅谷前Google团队打造，提供角色一致性漫画面板生成、创意草图转绘与海量可一键运行的云端ComfyUI流', sub: 'gallery',
      ),
      LzSite(
        id: 'ind_tech_30', title: 'Lexica.art', url: 'https://lexica.art',
        fallback: 'LX', badge: '极致丝滑的千万张AI艺术画廊与精准提示词搜索引擎', desc: '输入任意画面关键词或上传一张参考图，毫秒级检索出构图色彩最接近的数千张高清AI画作及完整Prompt咒语', sub: 'gallery',
      ),
      LzSite(
        id: 'ind_tech_31', title: 'PromptHero 全球第一提示词搜索引擎', url: 'https://prompthero.com',
        fallback: 'PH', badge: '搜索Midjourney、Flux、DALL-E3高赞大师咒语', desc: '按人像摄影、建筑室内、Logo设计、赛博朋克分类检索全球百万条经过实测验证的高质量AI绘图提示词', sub: 'prompt',
      ),
      LzSite(
        id: 'ind_tech_32', title: 'FlowGPT 全球最大ChatGPT提示词与角色社区', url: 'https://flowgpt.com',
        fallback: 'FG', badge: '数十万款开源System Prompt指令与生产力角色', desc: '汇集全球极客编写的代码重构大师、论文润色专家、文字冒险RPG游戏、心理导师等即点即用高级指令', sub: 'prompt',
      ),
      LzSite(
        id: 'ind_tech_33', title: 'Awesome ChatGPT Prompts (GitHub十万星指令库)', url: 'https://prompts.chat',
        fallback: 'ACP', badge: 'GitHub突破10万Star的经典角色扮演指令大全', desc: '让大模型一秒化身Linux终端、正则生成器、苏格拉底、面试官、法律顾问的开山鼻祖级结构化指令集', sub: 'prompt',
      ),
      LzSite(
        id: 'ind_tech_34', title: 'LangSmith / LangChain Hub', url: 'https://smith.langchain.com/hub',
        fallback: 'LSH', badge: '企业级Agent与RAG生产环境Prompt模板中心', desc: '全球AI工程师共享与版本化管理RAG检索回答、JSON结构化抽取、多Agent路由工业级Prompt的官方仓库', sub: 'skill',
      ),
      LzSite(
        id: 'ind_tech_35', title: 'Smithery.ai (MCP Server全球技能商店)', url: 'https://smithery.ai',
        fallback: 'MCP', badge: 'Anthropic MCP模型上下文协议全球数千款插件总站', desc: '一键为Claude Desktop、Cursor、Windsurf安装网页搜索、GitHub操作、数据库查询、浏览器控制等数千个MCP工具', sub: 'skill',
      ),
      LzSite(
        id: 'ind_tech_36', title: 'MCP.so (全球最大MCP服务器导航站)', url: 'https://mcp.so',
        fallback: 'M.so', badge: '收录3000+开源Model Context Protocol智能体工具', desc: '让你的AI大模型瞬间长出双手：连接本地文件系统、飞书、Notion、Figma、Blender、高德地图的MCP技能宝库', sub: 'skill',
      ),
      LzSite(
        id: 'ind_tech_37', title: 'Glama MCP Directory', url: 'https://glama.ai/mcp/servers',
        fallback: 'GM', badge: '实时安全审计与在线试玩的MCP智能体工具目录', desc: '每个开源MCP Server均附带代码安全评分、依赖树审查与配置JSON一键复制，安全扩展AI Agent能力', sub: 'skill',
      ),
    ],
  ),
  LzCategory(
    id: 'tools_magic', name: '常用工具与魔法网络', desc: '网络检测 · 极客利器 · 临时邮箱 · 开发辅助',
    subs: [
      LzSub('all', '全部'),
      LzSub('net', '网络工具'),
      LzSub('dev', '极客工具'),
      LzSub('daily', '日常百宝箱'),
    ],
    sites: [      LzSite(
        id: 'ind_cb_1', title: 'Browserbase', url: 'https://www.browserbase.com',
        fallback: 'BB', badge: '云浏览器', desc: '专为AI Agent打造的无头云端浏览器基础设施，支持高并发网页自动化', sub: 'net',
      ),
      LzSite(
        id: 'ind_cb_5', title: 'Rambox', url: 'https://rambox.app',
        fallback: 'RB', badge: '工作空间', desc: '聚合所有Web应用与云端会话的超级多开工作台浏览器', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cb_9', title: 'AdsPower 指纹浏览器', url: 'https://www.adspower.net',
        fallback: 'AD', badge: '跨境云浏览', desc: '跨境电商与矩阵运营必备的多账号防关联云端指纹浏览器', sub: 'net',
      ),
      LzSite(
        id: 'ind_cb_11', title: 'Hubstudio 云浏览器', url: 'https://www.hubstudio.com',
        fallback: 'HS', badge: '无限环境', desc: '免费无限云端环境隔离、团队协同跨境办公云浏览器', sub: 'net',
      ),
      LzSite(
        id: 'ind_cb_15', title: '拉力猫指纹浏览器', url: 'https://www.lalimao.com',
        fallback: '猫', badge: '物理隔离', desc: '多平台跨境电商防关联独立云端浏览器虚拟环境', sub: 'net',
      ),
      LzSite(
        id: 'ind_cb_16', title: '紫鸟浏览器', url: 'https://www.superbrowser.com',
        fallback: '紫', badge: '跨境电商', desc: '超百万跨境电商卖家使用的云端安全店铺加速浏览器', sub: 'net',
      ),
      LzSite(
        id: 'ind_cb_17', title: '花漾指纹浏览器', url: 'https://www.szdamai.com',
        fallback: '花', badge: '分身云浏览', desc: '采集真实设备指纹的云端浏览器分身与社交媒体自动化中枢', sub: 'net',
      ),
      LzSite(
        id: 'ind_cb_21', title: 'Kameleo', url: 'https://kameleo.io',
        fallback: 'KL', badge: '移动端指纹', desc: '支持iOS与Android真实移动浏览器指纹模拟的云端平台', sub: 'net',
      ),
      LzSite(
        id: 'ind_cb_22', title: 'Neko Box', url: 'https://neko.m1k1o.net',
        fallback: 'NK', badge: 'WebRTC云浏览', desc: '基于Docker与WebRTC自托管的多人实时协同虚拟云浏览器', sub: 'dev',
      ),
      LzSite(
        id: 'ind_cb_35', title: 'SigmaOS', url: 'https://sigmaos.com',
        fallback: 'SG', badge: '工作流浏览', desc: '专为深度研究与高效率人士打造的分屏AI原生Mac工作区浏览器', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cb_36', title: 'Wavebox', url: 'https://wavebox.io',
        fallback: 'WB', badge: 'SaaS浏览器', desc: '统一管理数十个云端SaaS工作后台与多账号Cookie隔离的专业浏览器', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cb_37', title: 'Shift Browser', url: 'https://tryshift.com',
        fallback: 'SF', badge: '应用聚合浏览', desc: '将所有邮箱、日历、AI工具与云端文档融合进单一高速窗口的生产力浏览器', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cb_38', title: 'Sidekick Browser', url: 'https://www.meetsidekick.com',
        fallback: 'SK', badge: '防分心浏览', desc: '极速防广告、内置AI任务管理与内存智能休眠的极客工作浏览器', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cb_39', title: 'Brave Leo AI', url: 'https://brave.com/leo',
        fallback: 'BV', badge: '隐私AI浏览', desc: 'Brave浏览器内置零数据留存隐私大模型助手，安全总结网页与视频', sub: 'net',
      ),
      LzSite(
        id: 'ind_cb_40', title: 'Opera Aria', url: 'https://www.opera.com/features/aria',
        fallback: 'OP', badge: '原生AI浏览', desc: 'Opera浏览器内置免费实时联网AI助手，支持网页生图与深度解答', sub: 'net',
      ),
      LzSite(
        id: 'ind_cc_1', title: '阿里云无影云电脑', url: 'https://www.aliyun.com/product/ecs/gws',
        fallback: '无影', badge: '阿里雲电脑', desc: '随时随地通过网页打开高配Windows/Mac云端工作站与AIGC算力桌面', sub: 'net',
      ),
      LzSite(
        id: 'ind_cc_2', title: '移动云电脑', url: 'https://ecloud.10086.cn',
        fallback: '移动', badge: '央企云桌面', desc: '中国移动官方超低延迟云端电脑，手机平板秒变高配办公主机', sub: 'net',
      ),
      LzSite(
        id: 'ind_cc_3', title: '天翼云电脑', url: 'https://www.ctyun.cn',
        fallback: '天翼', badge: '电信云桌面', desc: '中国电信光纤直连的高安全政企与个人云端电脑桌面', sub: 'net',
      ),
      LzSite(
        id: 'ind_cc_6', title: 'ToDesk 云电脑', url: 'https://www.todesk.com',
        fallback: 'TD', badge: '4K高帧云端', desc: '支持4K60帧原画级低延迟远程控制与云端显卡图形工作站', sub: 'net',
      ),
      LzSite(
        id: 'ind_cc_8', title: '红手指云手机', url: 'https://www.gc.com.cn',
        fallback: '红', badge: '24h云手机', desc: '全天候24小时云端在线托管手游与APP矩阵的虚拟安卓云手机', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cc_9', title: '雷电云手机', url: 'https://www.ldmnq.com',
        fallback: '雷', badge: '云端安卓', desc: '高性能ARM集群虚拟云手机，免占本机内存不耗电后台云挂机', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cc_10', title: '双子星云手机', url: 'https://www.armcloud.net',
        fallback: '双', badge: '矩阵云手机', desc: '支持群控同步操作与高清流畅画质的云端安卓虚拟手机', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cc_11', title: '多多云手机', url: 'https://www.ddyun.com',
        fallback: '多', badge: '企业群控', desc: '支持宏脚本录制、虚拟定位与批量管理的高配云端手机', sub: 'daily',
      ),
      LzSite(
        id: 'ind_cc_12', title: '蓝光云手机', url: 'https://www.lgcloud.com',
        fallback: '蓝', badge: '高帧云安卓', desc: '针对大型手游与应用测试深度优化的低延迟云手机', sub: 'daily',
      ),
      LzSite(
        id: 'ind_edu_33', title: '沉浸式翻译', url: 'https://immersivetranslate.com',
        fallback: '沉浸', badge: '双语对照神插件', desc: '接入DeepSeek/Claude/OpenAI实现外网网页、PDF文献、YouTube字幕双语并排精译', sub: 'daily',
      ),
      LzSite(
        id: 'ind_av_38', title: 'Krisp AI 双向通話降噪', url: 'https://krisp.ai',
        fallback: 'KP', badge: '会议秒滤装修狗叫键盘声', desc: '在Zoom/腾讯会议麦克风底层实时过滤背景婴儿哭声、装修电钻、机械键盘声并自动生成会议纪要', sub: 'daily',
      ),
      LzSite(
        id: 'ind_ind_23', title: 'MarineTraffic 全球远洋货轮雷达', url: 'https://www.marinetraffic.com',
        fallback: 'MT', badge: '外贸供应链实时查全球集装箱船', desc: '实时AIS卫星追踪全球海洋上每一艘万吨集装箱巨轮、油轮与游艇的航速、目的港及港口拥堵热力图', sub: 'daily',
      ),
      LzSite(
        id: 'ind_sec_1', title: '微步在线威胁情报AI', url: 'https://x.threatbook.com',
        fallback: '微步', badge: '恶意IP域名秒查', desc: '国内领先的威胁情报分析平台，结合XGPT安全大模型秒级研判木马钓鱼链接与攻击溯源', sub: 'net',
      ),
      LzSite(
        id: 'ind_sec_2', title: '奇安信QAX-GPT安全大模型', url: 'https://www.qianxin.com',
        fallback: '奇安', badge: '政企网安AISOC', desc: '冬奥零事故安全厂商出品，全天候自动化告警降噪、漏洞研判与渗透测试辅助AI', sub: 'net',
      ),
      LzSite(
        id: 'ind_sec_3', title: '深信服安全GPT', url: 'https://www.sangfor.com.cn',
        fallback: '深信', badge: '流量加密攻击检测', desc: '国内首款企业级网络安全垂直大模型，自然语言对话排查全网失陷主机与0day漏洞', sub: 'net',
      ),
      LzSite(
        id: 'ind_sec_4', title: '绿盟科技风云卫大模型', url: 'https://www.nsfocus.com.cn',
        fallback: '绿盟', badge: '攻防实战大模型', desc: '融合二十年攻防知识库的红蓝对抗、态势感知与安全运营自动化智能体', sub: 'net',
      ),
      LzSite(
        id: 'ind_sec_5', title: '长亭科技牧云与雷池WAF', url: 'https://www.chaitin.cn',
        fallback: '长亭', badge: '顶尖语义AI防火墙', desc: '清华蓝莲花战队创办！基于智能语义分析算法的下一代Web应用防火墙雷池与主机安全', sub: 'net',
      ),
      LzSite(
        id: 'ind_sec_8', title: '鹰图平台 Hunter (奇安信)', url: 'https://hunter.qianxin.com',
        fallback: '鹰图', badge: '攻击面管理ASM', desc: '面向攻防演练与企业自查的互联网暴露面资产测绘与暗网数据泄露监控平台', sub: 'net',
      ),
      LzSite(
        id: 'ind_sec_10', title: 'Censys 互联网资产扫描', url: 'https://search.censys.io',
        fallback: 'CS', badge: '密歇根大学安全搜', desc: '由ZMap发明团队打造的全球SSL证书、IPv4主机端口与云资产安全审计搜索引擎', sub: 'net',
      ),
      LzSite(
        id: 'ind_sec_12', title: 'Hybrid Analysis 恶意软件沙箱', url: 'https://www.hybrid-analysis.com',
        fallback: 'HA', badge: 'CrowdStrike云沙箱', desc: '免费在线深度动态执行可疑程序，提取内存Dump、注册表篡改与远控C2通信IP', sub: 'net',
      ),
      LzSite(
        id: 'ind_sec_13', title: 'ANY.RUN 交互式云沙箱', url: 'https://any.run',
        fallback: 'AR', badge: '浏览器亲手点开病毒', desc: '在隔离云端虚拟机浏览器里实时互动运行勒索病毒样本，直观观察进程树与网络抓包全过程', sub: 'net',
      ),
    ],
  ),
  LzCategory(
    id: 'movie', name: '影视娱乐', desc: '高清在线 · 影视下载 · 网盘秒搜 · 动漫追番',
    subs: [
      LzSub('all', '全部'),
      LzSub('online', '在线看'),
      LzSub('download', '下载'),
      LzSub('pan', '网盘'),
      LzSub('anime', '动漫'),
    ],
    sites: [    ],
  ),
  LzCategory(
    id: 'discounts', name: '省钱助手', desc: '外卖神券 · 咖啡打折 · 滴滴打车 · 特价门票',
    subs: [
      LzSub('all', '全部'),
      LzSub('takeout', '外卖美食'),
      LzSub('drink', '咖啡饮品'),
      LzSub('travel', '出行生活'),
    ],
    sites: [      LzSite(
        id: 'ind_ind_44', title: 'Expedia / Roam Around AI 旅行规划', url: 'https://www.roamaround.io',
        fallback: '旅行', badge: '输入目的地秒出按小时排好的吃喝玩乐特种兵攻略', desc: '告诉AI你想去成都或京都玩5天、预算多少、带不带老人小孩，5秒生成每日路线、必吃地道老店与避坑指南', sub: 'travel',
      ),
      LzSite(
        id: 'ind_ind_45', title: '马蜂窝AI自由行路书', url: 'https://www.mafengwo.cn',
        fallback: '蜂窝', badge: '全球旅游攻略路书与AI行程助手', desc: '基于亿万真实旅行者游记训练的AI旅行规划官，一键生成自驾环线地图、签证办理清单与小众机位打卡指南', sub: 'travel',
      ),
      LzSite(
        id: 'ind_ind_46', title: '航旅纵横 (民航官方出行AI)', url: 'https://www.umetrip.com',
        fallback: '航旅', badge: '中航信官方查前序航班延误与机上选座看日落', desc: '中国民航信息集团官方出品：精准透视所乘飞机前序航班飞到哪了、机龄型号、值机选哪边座位能拍到雪山日落', sub: 'travel',
      ),
      LzSite(
        id: 'ind_ind_47', title: '12306 铁路官方购票候补', url: 'https://www.12306.cn',
        fallback: '铁路', badge: '中国铁路官方高铁动车无捆绑购票总站', desc: '官方唯一无加速包套路的高铁火车票查询、候补抢票、中转换乘方案与车站大屏正晚点实时查询平台', sub: 'travel',
      ),
      LzSite(
        id: 'ind_ind_48', title: '高德地图网页版 & AI路线规划', url: 'https://www.amap.com',
        fallback: '高德', badge: '实时路况红绿灯读秒与全国景区热力图', desc: '阿里巴巴旗下国民级出行导航：支持网页端多点途经路线规划、地铁换乘时间精准测算与周边美食避坑榜', sub: 'travel',
      ),
      LzSite(
        id: 'ind_life_22', title: '盖得排行 GuideRank', url: 'https://www.guiderank-app.com',
        fallback: '盖得', badge: '不收广告费的全品类商品硬核横评榜', desc: '从婴儿奶粉、净水器、人体工学椅到猫粮、汽车轮胎，基于实验室拆机检测与权威消委会数据的避坑排行榜', sub: 'takeout',
      ),
      LzSite(
        id: 'ind_life_23', title: '什么值得买 SMZDM AI', url: 'https://www.smzdm.com',
        fallback: '值买', badge: '全网历史低价查询与AI神价爆料', desc: '网购剁手前必查：输入商品链接秒看过去365天真实价格走势曲线、凑单满减神券与值友真实晒单评测', sub: 'takeout',
      ),
      LzSite(
        id: 'ind_life_24', title: '慢慢买历史价格查询', url: 'https://www.manmanbuy.com',
        fallback: '慢买', badge: '拆穿先涨后降假促销的比价神器', desc: '一键查询京东、天猫、拼多多、唯品会商品2年内的每一天历史最低价与全网同款比价', sub: 'takeout',
      ),
      LzSite(
        id: 'ind_life_25', title: '黑猫投诉 (新浪官方消费维权)', url: 'https://tousu.sina.com.cn',
        fallback: '黑猫', badge: '网购霸王条款退款售后极速维权', desc: '新浪旗下公益消费者服务平台，直通各大电商、航司、快递、运营商客服高管通道，公开透明督促解决纠纷', sub: 'travel',
      ),
      LzSite(
        id: 'ind_tech_4', title: '充电桩地图 (特来电/星星充电/高德新能源)', url: 'https://www.teld.cn',
        fallback: '充电', badge: '全国高速与城市超充桩实时空闲电价查询', desc: '新能源车主远途自驾必备：实时查看全国服务区超充站闲忙状态、峰谷分时电价与充电功率曲线', sub: 'travel',
      ),
    ],
  ),
  LzCategory(
    id: 'resources', name: '资源网站', desc: '纯净软件 · 高清壁纸 · 原版系统 · 论坛交流',
    subs: [
      LzSub('all', '全部'),
      LzSub('soft_hub', '软件库'),
      LzSub('wallpaper', '高清壁纸'),
      LzSub('community', '极客社区'),
    ],
    sites: [      LzSite(
        id: 'ind_arch_11', title: '知末网AI建筑', url: 'https://www.znzmo.com',
        fallback: '知末', badge: 'SU模型效果图', desc: '国内百万建筑室内设计师首选的高精SU/3dmax模型库与知末AI建筑灵图生成台', sub: 'soft_hub',
      ),
      LzSite(
        id: 'ind_arch_12', title: '建E室内设计网', url: 'https://www.justeasy.cn',
        fallback: '建E', badge: 'VR全景与AI生图', desc: '汇聚千万套高质量软装3D模型、720度VR全景合成与建E室内AI线稿渲染神器', sub: 'soft_hub',
      ),
      LzSite(
        id: 'ind_arch_13', title: '欧模网3D模型', url: 'https://www.om.cn',
        fallback: '欧模', badge: '严选家装模型', desc: '高品质现代极简、侘寂风、新中式3dmax室内外场景模型与材质贴图下载站', sub: 'soft_hub',
      ),
      LzSite(
        id: 'ind_arch_14', title: '拓者设计吧', url: 'https://www.tuozhe8.com',
        fallback: '拓者', badge: '室内设计师社区', desc: '国内最活跃的私宅别墅室内设计师实景落地案例、施工图规范与AI效果图交流社区', sub: 'community',
      ),
      LzSite(
        id: 'ind_arch_15', title: '谷德设计网gooood', url: 'https://www.gooood.cn',
        fallback: '谷德', badge: '全球建筑景观', desc: '中国最具影响力的全球前沿建筑、景观园林、城市更新与艺术装置高清案例库', sub: 'community',
      ),
      LzSite(
        id: 'ind_arch_16', title: 'ArchDaily 建筑每日', url: 'https://www.archdaily.cn',
        fallback: 'AD', badge: '世界建筑圣经', desc: '全球访问量最大的建筑师专业门户，收录上万座世界级地标建筑平立剖图纸与解析', sub: 'community',
      ),
      LzSite(
        id: 'ind_arch_17', title: '专筑网iarch', url: 'https://www.iarch.cn',
        fallback: '专筑', badge: '建筑留学竞赛', desc: '建筑学子参数化设计Grasshopper、Rhino、AI建筑表现与国际竞赛作品集大本营', sub: 'community',
      ),
      LzSite(
        id: 'ind_arch_37', title: ' Poliigon 顶级材质库', url: 'https://www.poliigon.com',
        fallback: 'PL', badge: '8K照片级PBR材质', desc: 'Blender Guru创办的全球顶级8K无缝大理石、木纹、混凝土PBR物理材质贴图与AI材质生成器', sub: 'wallpaper',
      ),
      LzSite(
        id: 'ind_arch_38', title: 'AmbientCG 免费材质', url: 'https://ambientcg.com',
        fallback: 'ACG', badge: 'CC0免费无版权PBR', desc: '2000+款完全免费CC0可商用的超高清8K三维渲染PBR材质球与HDRI环境光贴图库', sub: 'wallpaper',
      ),
      LzSite(
        id: 'ind_arch_39', title: 'Poly Haven', url: 'https://polyhaven.com',
        fallback: 'PH', badge: '免费8K HDRI天空', desc: '3D建筑与影视渲染师必备的完全免费无版权16K真实天空HDRI光照与高精度模型库', sub: 'wallpaper',
      ),
      LzSite(
        id: 'ind_arch_40', title: 'Sketchfab 3D模型库', url: 'https://sketchfab.com',
        fallback: 'SF', badge: '浏览器看百万3D', desc: '全球最大在线3D/VR/AR模型预览与交易社区，支持浏览器内直接360度拆解光影与拓扑', sub: 'soft_hub',
      ),
      LzSite(
        id: 'ind_av_44', title: '爱给网 aigei', url: 'https://www.aigei.com',
        fallback: '爱给', badge: '国内最大音效配乐绿幕素材', desc: '自媒体剪辑与游戏制作必备的免费音效、影视BGM、绿幕抠像特效视频与2D帧动画素材库', sub: 'soft_hub',
      ),
      LzSite(
        id: 'ind_av_45', title: 'Pexels 免费4K视频图片', url: 'https://www.pexels.com/zh-cn',
        fallback: 'PX', badge: '完全免费可商用4K空镜', desc: '全球摄影师无私奉献的数百万张高清无版权照片与4K航拍延时视频空镜素材，无需署名直接商用', sub: 'wallpaper',
      ),
      LzSite(
        id: 'ind_sec_18', title: '先知社区 (阿里安全白帽)', url: 'https://xz.aliyun.com',
        fallback: '先知', badge: '硬核漏洞分析技术文', desc: '阿里巴巴安全部出品的国内高水平白帽黑客代码审计、二进制逆向与内网渗透技术干货社区', sub: 'community',
      ),
      LzSite(
        id: 'ind_sec_19', title: 'FreeBuf 网络安全行业门户', url: 'https://www.freebuf.com',
        fallback: 'FB', badge: '国内网安资讯第一站', desc: '每日更新全球黑客攻防事件、CTF竞赛Writeup、安全工具测评与企业合规白皮书', sub: 'community',
      ),
      LzSite(
        id: 'ind_sec_20', title: '看雪学苑 Kanxue (逆向安全)', url: 'https://www.kanxue.com',
        fallback: '看雪', badge: '二十年软件逆向殿堂', desc: '中国最早的二进制安全、Android/iOS脱壳逆向、Windows内核驱动与车联网安全极客论坛', sub: 'community',
      ),
      LzSite(
        id: 'ind_des_13', title: 'Yellow Images 顶级商业样机', url: 'https://yellowimages.com',
        fallback: 'YI', badge: '全球最全服装食品3D样机', desc: '国际4A广告公司御用的超高精度3D瓶罐、连帽衫、车辆涂装智能对象PSD分层样机库', sub: 'wallpaper',
      ),
      LzSite(
        id: 'ind_des_14', title: '普象工业设计小站', url: 'https://www.pushthink.com',
        fallback: '普象', badge: '中国最大工业产品设计社区', desc: '汇聚红点奖、iF设计奖获奖作品、家电数码产品结构拆解、CMF材质工艺与手绘作品集', sub: 'community',
      ),
      LzSite(
        id: 'ind_des_15', title: '站酷 ZCOOL 设计师互动平台', url: 'https://www.zcool.com.cn',
        fallback: '站酷', badge: '1700万中国设计师大本营', desc: '涵盖平面品牌、UI交互、插画原画、三维影视、摄影修图与站酷海洛正版图库的国民级社区', sub: 'community',
      ),
      LzSite(
        id: 'ind_des_16', title: '花瓣网 Huaban 灵感采集', url: 'https://huaban.com',
        fallback: '花瓣', badge: '中国设计师首选灵感画板', desc: '陪你做生活的设计师：按色系与画板高效收藏海报排版、摄影构图、古风插画与空间美学素材', sub: 'wallpaper',
      ),
      LzSite(
        id: 'ind_des_17', title: '优设网 UISDC 设计师学习', url: 'https://www.uisdc.com',
        fallback: '优设', badge: '设计师AIGC教程与导航', desc: '国内极具人气的UI/UX设计师干货教程、Stable Diffusion实战指南、字体版权排查与设计网址导航', sub: 'community',
      ),
      LzSite(
        id: 'ind_des_18', title: '致设计 Zhishji 电商视觉', url: 'https://www.zhisheji.com',
        fallback: '致设', badge: '天猫双11大促详情页殿堂', desc: '国内顶尖电商美工与视觉总监分享爆款C4D合成主图、品牌升级提案与AIGC商拍落地案例门户', sub: 'community',
      ),
      LzSite(
        id: 'ind_des_19', title: 'Behance (Adobe全球创意界)', url: 'https://www.behance.net',
        fallback: 'Be', badge: '全球顶级视觉设计风向标', desc: 'Adobe旗下汇聚全球顶尖艺术总监、3D动态设计师、品牌工作室完整项目推导过程的作品集圣地', sub: 'community',
      ),
      LzSite(
        id: 'ind_des_20', title: 'Dribbble 全球UI与动效社区', url: 'https://dribbble.com',
        fallback: 'Db', badge: '全球UI交互与微动效灵感源', desc: '全球优秀产品设计师展示App界面、网页动效、Logo图标与插画设计趋势的精品社区', sub: 'community',
      ),
      LzSite(
        id: 'ind_tech_9', title: '充电头网 Chongdiantou', url: 'https://www.chongdiantou.com',
        fallback: '充头', badge: '数千款氮化镓充电器充电宝暴力拆解评测', desc: '硬核数码实验室！把市面上每一款充电器、移动电源、数据线全部切开看电容用料、测纹波发热与快充协议兼容', sub: 'community',
      ),
      LzSite(
        id: 'ind_tech_10', title: 'RTINGS.com 实验室级电视耳机显示器评测', url: 'https://www.rtings.com',
        fallback: 'RT', badge: '买显示器电视耳机前必查科学仪器跑分', desc: '自费购买数千款显示器、OLED电视、降噪耳机、鼠标键盘，用精密光谱仪与人工耳测出客观延迟、色准与频响曲线', sub: 'community',
      ),
      LzSite(
        id: 'ind_tech_14', title: 'AlternativeTo 找任何昂贵软件的免费开源平替', url: 'https://alternativeto.net',
        fallback: 'Alt', badge: '输入收费软件秒找10款免费开源替代品', desc: '觉得某款软件太贵或不好用？输入它的名字，全球极客为你投票推荐Windows/Mac/Linux/Web端最好用的免费开源平替', sub: 'soft_hub',
      ),
      LzSite(
        id: 'ind_tech_15', title: '善用佳软 / 小众软件 Appinn', url: 'https://www.appinn.com',
        fallback: '小众', badge: '每天发现一款惊艳免费纯净小工具', desc: '深耕十余年的国内老牌精品软件分享社区，挖掘全网体积仅几MB却解决巨大痛点的开源无广告效率神器', sub: 'soft_hub',
      ),
      LzSite(
        id: 'ind_tech_16', title: '少数派 sspai', url: 'https://sspai.com',
        fallback: '少数派', badge: '高效数字生活与生产力工具深度评测社区', desc: '汇聚苹果生态、安卓玩机、Obsidian/Notion知识管理、AI工作流搭建与新奇硬件深度体验报告', sub: 'community',
      ),
      LzSite(
        id: 'ind_tech_17', title: '数字尾巴 DGTle', url: 'https://www.dgtle.com',
        fallback: '尾巴', badge: '分享美好数字生活与高颜值桌面EDC', desc: '国内最具摄影美感的数码好物、客制化机械键盘、桌面改造搭配（Desk Setup）与旅行人文图文社区', sub: 'community',
      ),
    ],
  ),
  LzCategory(
    id: 'music', name: '音乐听歌', desc: '无损音质 · 在线电台 · 歌曲解析 · Hi-Res母带',
    subs: [
      LzSub('all', '全部'),
      LzSub('lossless', '无损听歌'),
      LzSub('radio', '网络电台'),
      LzSub('downloader', '歌曲下载'),
    ],
    sites: [      LzSite(
        id: 'ind_av_23', title: '魔音工坊 Moyin', url: 'https://www.moyin.com',
        fallback: '魔音', badge: '短视频影视解说配音王', desc: '抖音百大影视解说博主御用配音神器，拥有『云希』『魔小哥』等上千款极具情绪张力的AI配音员', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_24', title: '讯飞智作 (配音阁)', url: 'https://peiyin.xfyun.cn',
        fallback: '智作', badge: '科大讯飞官方超拟人配音', desc: '依托讯飞星火语音大模型，支持多语种方言、新闻播报、有声小说多角色情感朗读与一句话声音复刻', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_26', title: '海绵音乐 (字节跳动)', url: 'https://www.haimian.com',
        fallback: '海绵', badge: '字节免费AI写歌神器', desc: '字节跳动出品的国内完全免费AI音乐创作平台，输入歌词或心情一句话生成中文吐字极度清晰的流行热歌', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_27', title: '天工SkyMusic', url: 'https://music.tiangong.cn',
        fallback: '天音', badge: '昆仑万维商用级AI音乐', desc: '国内首款公开可用的SOTA音乐生成大模型，擅长古风、摇滚、说唱与高保真交响乐人声合成', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_28', title: '网易天音', url: 'https://tianyin.music.163.com',
        fallback: '天音', badge: '网易云音乐AI编曲词曲', desc: '网易官方一站式AI词曲编唱工作站，零乐理基础也能定制拜年歌、告白歌与专业级多轨MIDI工程', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_29', title: '腾讯TME Studio', url: 'https://tme-studio.tencentmusic.com',
        fallback: 'TME', badge: '腾讯音乐AI智能曲库', desc: '腾讯音乐娱乐集团出品：提供AI作词灵感、智能曲风编曲、歌声合成与正版曲库一键分离伴奏', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_30', title: 'Mureka AI', url: 'https://www.mureka.ai',
        fallback: 'MK', badge: '哼唱旋律生成完整编曲', desc: '支持录一段自己的清唱或吉他哼唱动机，AI沿着你的旋律骨架自动编配全套乐队伴奏与人声', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_31', title: 'AIVA 交响配乐AI', url: 'https://www.aiva.ai',
        fallback: 'AIVA', badge: '全球首位认证AI作曲家', desc: '专为游戏开发者与电影导演打造的史诗管弦乐、电子乐与古典钢琴无版权BGM自动作曲大师', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_32', title: 'Soundraw AI', url: 'https://soundraw.io',
        fallback: 'SD', badge: '视频高潮精准对点配乐', desc: '可根据视频画面起承转合自由拖动每一小节音乐情绪强弱与乐器编排的无版权AI配乐生成器', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_33', title: 'Beatoven.ai', url: 'https://www.beatoven.ai',
        fallback: 'BV', badge: '播客与纪录片情绪配乐', desc: '上传视频或播客，AI根据旁白情绪变化自动谱写绝不抢人声且100%免版税的专属环境配乐', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_34', title: 'LALAL.AI', url: 'https://www.lalal.ai',
        fallback: 'LL', badge: '母带级10音轨分离神器', desc: '全球顶尖AI音轨分离引擎：从任意混音成品歌曲中无损单独抽离人声、鼓组、贝斯、电吉他、钢琴与管乐', sub: 'downloader',
      ),
      LzSite(
        id: 'ind_av_35', title: 'Moises.ai', url: 'https://moises.ai',
        fallback: 'MS', badge: '乐手扒谱练琴AI神器', desc: '曾获苹果年度应用！AI分离歌曲各乐器音轨、实时识别和弦走向、变速变调与智能节拍器', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_36', title: 'VocalRemover.org', url: 'https://vocalremover.org/zh',
        fallback: 'VR', badge: '完全免费在线去人声提取伴奏', desc: '免注册免登录、打开网页直接把歌曲拖进去10秒分离纯净卡拉OK伴奏与清唱人声、测BPM调性', sub: 'downloader',
      ),
      LzSite(
        id: 'ind_av_37', title: 'Adobe Podcast Enhance', url: 'https://podcast.adobe.com',
        fallback: 'AP', badge: '渣麦录音秒变万元级录音棚', desc: 'Adobe免费开放的封神级AI语音修复工具：哪怕在嘈杂大街用手机录音，一键消除混响噪音变成电台级磁性人声', sub: 'lossless',
      ),
      LzSite(
        id: 'ind_av_42', title: 'Freesound 无版权音效库', url: 'https://freesound.org',
        fallback: 'FS', badge: '全球60万CC开源音效', desc: '影视剪辑师与独立游戏开发者必藏的全球最大知识共享CC协议自然环境音、合成器与拟音Foley音效库', sub: 'downloader',
      ),
      LzSite(
        id: 'ind_av_43', title: '耳聆网 Ear0', url: 'https://www.ear0.com',
        fallback: '耳聆', badge: '国内专业声音素材分享网', desc: '国内最纯粹的录音师与剪辑师高质量立体声环境音、转场音效、综艺花字音效免费分享社区', sub: 'downloader',
      ),
      LzSite(
        id: 'ind_ind_34', title: 'Radio Garden 旋转地球听全球广播', url: 'https://radio.garden',
        fallback: '地球台', badge: '拨动3D地球仪收听世界各地每个小镇实时电台', desc: '把绿色光标移到巴黎、东京、开罗、冰岛或南美雨林小镇的绿点上，即刻收听当地此刻正在播放的真实FM电台', sub: 'radio',
      ),
      LzSite(
        id: 'ind_ind_37', title: 'A Soft Murmur 定制环境白噪音混音台', url: 'https://asoftmurmur.com',
        fallback: '白噪', badge: '自由调配雨声雷声篝火海浪咖啡馆混音比例', desc: '失眠冥想与深度写代码神器：像调音师一样分别拉动雨打芭蕉、柴火噼啪、远方闷雷、西藏颂钵的音量滑块', sub: 'radio',
      ),
      LzSite(
        id: 'ind_ind_38', title: 'Rainy Mood 极简全世界最舒服的雨声', url: 'https://www.rainymood.com',
        fallback: '听雨', badge: '专注十余年的3D环绕立体声雷雨白噪音', desc: '打开网页即刻置身屋檐下听淅淅沥沥的逼真大雨与滚滚春雷，瞬间平复焦虑进入深度专注心流', sub: 'radio',
      ),
      LzSite(
        id: 'ind_life_11', title: '潮汐 Tide (自然声音冥想番茄钟)', url: 'https://tide.fm',
        fallback: '潮汐', badge: '把大海森林雨声装进工作与睡眠', desc: '屡获苹果年度设计大奖！融合自然环境白噪音、正念呼吸冥想、专注番茄钟与轻柔唤醒闹钟的美学应用', sub: 'radio',
      ),
      LzSite(
        id: 'ind_life_12', title: '小睡眠 (7000万人的助眠白噪音)', url: 'https://www.xiaoshuimian.com',
        fallback: '睡眠', badge: '专业ASMR脑波音乐与晚安电台', desc: '提供数百种自定义雨声、猫咪呼噜声、古琴颂钵、助眠故事与睡眠呼吸鼾声梦话监测', sub: 'radio',
      ),
    ],
  ),
  LzCategory(
    id: 'novel', name: '小说阅读', desc: '热门网文 · 经典古籍 · 有声评书 · 电子书库',
    subs: [
      LzSub('all', '全部'),
      LzSub('web_novel', '热门网文'),
      LzSub('audio_book', '有声听书'),
      LzSub('library', '经典书库'),
    ],
    sites: [      LzSite(
        id: 'ind_av_25', title: '喜马拉雅音剪与珠峰AI', url: 'https://www.ximalaya.com',
        fallback: '喜马', badge: '有声书AI演播平台', desc: '喜马拉雅珠峰音频大模型驱动：单人即可完成多角色有声小说AI配音、呼吸停顿精修与智能母带后期', sub: 'audio_book',
      ),
      LzSite(
        id: 'ind_av_39', title: '小宇宙播客社区', url: 'https://www.xiaoyuzhoufm.com',
        fallback: '宇宙', badge: '中文精品长音频播客大本营', desc: '汇聚国内最具思想深度的科技、商业、文化、心理播客节目与时间轴高能金句评论区', sub: 'audio_book',
      ),
      LzSite(
        id: 'ind_ind_28', title: '书格 Shuge (数字古籍善本图书馆)', url: 'https://www.shuge.org',
        fallback: '书格', badge: '完全免费无水印故宫哈佛馆藏古籍宋刻本', desc: '极高品格的开放古籍图书馆，免费下载永乐大典、千里江山图、本草纲目等全球博物馆超高清原色古籍PDF', sub: 'library',
      ),
    ],
  ),
  LzCategory(
    id: 'game', name: '游戏资源', desc: 'PC单机 · 联机对战 · 经典模拟器 · 怀旧红白机',
    subs: [
      LzSub('all', '全部'),
      LzSub('pc', '单机免米'),
      LzSub('online_game', '在线秒玩'),
      LzSub('retro', '怀旧模拟器'),
    ],
    sites: [      LzSite(
        id: 'ind_cc_5', title: '顺网云电脑', url: 'https://www.shunwang.com',
        fallback: '顺网', badge: '电竞云显卡', desc: 'RTX40系显卡云端畅玩3A大作与本地跑大模型的低延迟云电脑', sub: 'online_game',
      ),
      LzSite(
        id: 'ind_cc_7', title: '海马云电脑', url: 'https://www.haimacloud.com',
        fallback: '海马', badge: '旗舰GPU云', desc: '全系搭载旗舰RTX显卡的云端游戏与AI渲染算力平台', sub: 'online_game',
      ),
      LzSite(
        id: 'ind_3d_16', title: 'Mixamo (Adobe)', url: 'https://www.mixamo.com',
        fallback: 'MX', badge: '免费千款3D动作库', desc: 'Adobe官方完全免费提供数千套现成游戏角色走路、格斗、跳舞动作与上传白模1分钟全自动蒙皮绑定', sub: 'pc',
      ),
    ],
  ),
  LzCategory(
    id: 'tools', name: '好用工具', desc: '实用百宝箱 · 抠图转换 · 文件快传 · 在线PS',
    subs: [
      LzSub('all', '全部'),
      LzSub('ai_assist', 'AI助理'),
      LzSub('web_tool', '在线工具'),
      LzSub('file_proc', '文件处理'),
      LzSub('img_proc', '图片处理'),
    ],
    sites: [      LzSite(
        id: 'ind_arch_7', title: '浩辰CAD看图王云端', url: 'https://web.gstarcad.com',
        fallback: '浩辰', badge: '网页免装看CAD', desc: '无需安装庞大AutoCAD，浏览器直接极速打开DWG建筑结构图纸测量批注与AI识图', sub: 'web_tool',
      ),
      LzSite(
        id: 'ind_arch_8', title: '中望CAD工业云', url: 'https://www.zwsoft.cn',
        fallback: '中望', badge: '国产CAD/CAE', desc: '科创板上市国产自主内核二维三维CAD与电磁结构多物理场仿真平台', sub: 'web_tool',
      ),
      LzSite(
        id: 'ind_arch_36', title: 'Cadmapper', url: 'https://cadmapper.com',
        fallback: 'CM', badge: '全球城市3D白模', desc: '一键免费下载全球任意城市街区真实地形等高线、道路网与建筑高度3D模型（SU/Rhino/CAD）', sub: 'web_tool',
      ),
      LzSite(
        id: 'ind_sci_20', title: '白描网页版OCR', url: 'https://web.baimiaoapp.com',
        fallback: '白描', badge: '高精表格OCR', desc: '批量识别图片文字、纸质财务报表还原Excel与身份证扫描件精准提取工具', sub: 'file_proc',
      ),
      LzSite(
        id: 'ind_av_18', title: 'Upscayl 开源免费超分', url: 'https://upscayl.org',
        fallback: 'UP', badge: 'GitHub三万星免费放大', desc: '完全免费开源、跨平台离线运行的AI图像无损高清放大神器，老照片与二次元壁纸瞬间变4K', sub: 'img_proc',
      ),
      LzSite(
        id: 'ind_av_19', title: 'bigjpg AI动漫无损放大', url: 'https://bigjpg.com',
        fallback: 'BJ', badge: '二次元插画降噪放大', desc: '采用深度卷积神经网络专为动漫立绘、插画线条与色彩大面积降噪无损放大4倍至16倍', sub: 'img_proc',
      ),
      LzSite(
        id: 'ind_av_22', title: 'Vectorizer.AI', url: 'https://vectorizer.ai',
        fallback: 'VC', badge: '位图1秒完美转SVG矢量', desc: '利用深度学习将模糊的JPG/PNG Logo、印章与插画瞬间追踪转换为曲线极致平滑的全彩SVG/EPS/DXF矢量图', sub: 'img_proc',
      ),
      LzSite(
        id: 'ind_ind_10', title: '立创EDA (嘉立创在线PCB)', url: 'https://lceda.cn',
        fallback: '立创', badge: '国产百万硬件工程师免费画PCB', desc: '打开浏览器即可免费绘制电路原理图、百万元器件封装库直连嘉立创SMT免费打样与3D外壳设计', sub: 'web_tool',
      ),
      LzSite(
        id: 'ind_ind_43', title: 'Goblin Tools (ADHD拆解任务与高情商转换器)', url: 'https://goblin.tools',
        fallback: '哥布林', badge: '把宏大拖延任务一键AI拆成傻瓜微步骤', desc: '风靡海外的免费公益AI小工具集：把『打扫房间』拆成15个3分钟小动作、把愤怒吐槽秒转成得体职场高情商邮件', sub: 'ai_assist',
      ),
      LzSite(
        id: 'ind_ind_49', title: 'OpenStreetMap 全球开源地图', url: 'https://www.openstreetmap.org',
        fallback: 'OSM', badge: '地图界的维基百科，全球极客共同测绘', desc: '完全开放版权的全球街道、徒步野径、等高线与POI开源地理信息数据库，户外轨迹与GIS开发者的基石', sub: 'web_tool',
      ),
      LzSite(
        id: 'ind_tech_8', title: 'iFixit 全球万物免费拆解维修圣经', url: 'https://zh.ifixit.com',
        fallback: 'iFix', badge: '自己动手换手机电池修Switch手柄', desc: '收录10万份高清图文步骤拆机指南：从iPhone、MacBook、戴森吸尘器到佳能相机、汽车零件手把手教你零基础无损维修', sub: 'web_tool',
      ),
    ],
  ),
  LzCategory(
    id: 'pc_setup', name: '装机必备', desc: '纯净PE · 硬件检测 · 必备软件 · 驱动管理',
    subs: [
      LzSub('all', '全部'),
      LzSub('system', '系统装机'),
      LzSub('hardware', '硬件检测'),
      LzSub('soft_must', '日常必备'),
    ],
    sites: [      LzSite(
        id: 'ind_tech_11', title: 'Socpk 极客湾移动芯片天梯榜', url: 'https://www.socpk.com',
        fallback: '极客湾', badge: '骁龙天玑苹果A系芯片真实能效曲线横评', desc: 'B站顶流硬核数码团队『极客湾』官方维护：一目了然对比历代手机平板SoC芯片CPU/GPU峰值性能与功耗能效比', sub: 'hardware',
      ),
      LzSite(
        id: 'ind_tech_12', title: 'PassMark CPU/GPU 全球跑分库', url: 'https://www.cpubenchmark.net',
        fallback: 'PM', badge: '全球百万台电脑CPU显卡硬盘实测跑分表', desc: '攒机与选购笔记本必查的全球最大硬件基准测试数据库，精准对比每一颗桌面与服务器处理器单核多核性能', sub: 'hardware',
      ),
      LzSite(
        id: 'ind_tech_13', title: 'PCPartPicker 智能DIY攒机兼容性检测', url: 'https://pcpartpicker.com',
        fallback: 'PCPP', badge: '自动检查主板CPU内存机箱尺寸电源瓦数冲突', desc: '全球DIY装机神站：挑选配件时自动校验主板接口针脚、散热器限高、显卡长度与电源功率是否完全兼容', sub: 'hardware',
      ),
    ],
  ),
  LzCategory(
    id: 'explore', name: '探索世界', desc: '趣味摸鱼 · 创意交互 · 极客社区 · 优质导航',
    subs: [
      LzSub('all', '全部'),
      LzSub('fun', '趣味解压'),
      LzSub('dev', '极客开发'),
      LzSub('nav_hubs', '导航聚合'),
    ],
    sites: [      LzSite(
        id: 'ind_ind_16', title: '形色识花 / 花伴侣', url: 'https://www.xingseapp.com',
        fallback: '形色', badge: '中科院植物所图库秒识万物花草', desc: '散步踏青随手拍一朵野花或树叶，1秒识别全球上万种植物学名、养护浇水指南与诗词典故', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_17', title: 'iNaturalist 全球物种公民科学', url: 'https://www.inaturalist.org',
        fallback: 'iNat', badge: '加州科学院全球动植物昆虫AI鉴定', desc: '上传你在野外拍到的奇特昆虫、蘑菇、鸟类、两栖动物照片，AI与全球博物学家共同为你精准鉴定物种', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_18', title: 'Merlin Bird ID (康奈尔鸟类实验室)', url: 'https://merlin.allaboutbirds.org',
        fallback: '鸟', badge: '听鸟叫1秒识别全球万种野生鸟类', desc: '康奈尔大学鸟类学实验室免费神作！开启录音，AI实时声纹图谱高亮识别树林里正在鸣叫的每一种鸟', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_19', title: 'Windy.com 全球气象流体可视化', url: 'https://www.windy.com',
        fallback: 'WD', badge: '震撼级全球台风洋流气象大屏', desc: '飞行员、海钓船长、追风者与摄影师封神的全球ECMWF/GFS气象大模型实时风场、云顶高、雷暴与波浪可视化', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_20', title: '莉景天气 (摄影追光云海预测)', url: 'https://www.lijingtianqi.com',
        fallback: '莉景', badge: '精准预测晚霞火烧云云海银河', desc: '利用大气光学与气象AI模型，提前预报全国各城市朝霞晚霞火烧云概率、高山云海、彩虹与观星指数', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_21', title: 'Earth Nullschool 地球风场超算', url: 'https://earth.nullschool.net/zh-cn',
        fallback: '地球', badge: '3D超算地球大气洋流极光实时粒子', desc: '每3小时同步全球超级计算机气象数据，在3D地球仪上丝滑查看高空急流、温室气体、PM2.5与极光带', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_22', title: 'Flightradar24 全球航班实时雷达', url: 'https://www.flightradar24.com',
        fallback: 'FR24', badge: '实时追踪头顶每一架民航飞机', desc: '在全球地图上实时查看天空中上万架飞机的型号、航线高度、机长视角3D模拟与机场延误实况', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_24', title: 'Celestrak / Stuff in Space', url: 'https://stuffin.space',
        fallback: '太空', badge: '3D实时追踪地球轨道星链与空间站', desc: '在浏览器3D太空中实时查看中国天宫空间站、SpaceX星链卫星群与数万块太空碎片的真实运行轨道', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_25', title: 'NASA Eyes (美国宇航局3D太阳系)', url: 'https://eyes.nasa.gov',
        fallback: 'NASA', badge: '无需下载浏览器畅游太阳系与韦伯望远镜', desc: 'NASA官方实时3D太空交互系统：跟随旅行者1号飞出太阳系、操控毅力号火星车与查看小行星防御轨道', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_26', title: 'Stellarium Web 虚拟天文馆', url: 'https://stellarium-web.org',
        fallback: '星图', badge: '浏览器里的真实星空四季星座星盘', desc: '输入你所在城市与时间，逼真还原今晚夜空中的八大行星、星座连线、深空星云与人造卫星过境时刻', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_27', title: '全历史 AllHistory (知识图谱历史)', url: 'https://www.allhistory.com',
        fallback: '全史', badge: 'AI时空时间轴关系图谱看世界史', desc: '用AB路径关系图谱、3D时空地图与画作复活技术，直观展现从宇宙大爆炸到近现代中外一切历史人物事件交集', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_29', title: '中华珍宝馆 (历代书画超高清放大)', url: 'https://www.ltfc.net',
        fallback: '珍宝', badge: '百亿像素看清王羲之宋徽宗每一根毛笔丝', desc: '收录从晋唐宋元明清至近现代数万幅传世中国书画碑帖，支持手机网页毫秒级无极放大鉴赏笔墨细节', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_30', title: '数字敦煌 Digital Dunhuang', url: 'https://www.e-dunhuang.com',
        fallback: '敦煌', badge: '敦煌研究院30个洞窟4K全景漫游', desc: '足不出户免费进入莫高窟特窟，300DPI超高清端详千年飞天壁画与藏经洞文献细节', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_31', title: 'Google Arts & Culture 谷歌艺术', url: 'https://artsandculture.google.com',
        fallback: '艺术', badge: '云游全球2000家顶级美术馆博物馆', desc: '百亿像素微距欣赏梵高《星月夜》油彩裂纹、大英博物馆卢浮宫VR实景漫游与AI艺术滤镜实验', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_33', title: 'Sketch Metademolab (涂鸦小人活过来)', url: 'https://sketch.metademolab.com',
        fallback: '涂鸦', badge: '把孩子画在纸上的小人拍照变成跳舞动画', desc: 'Meta AI免费公益神作！把小朋友在纸上画的火柴人或卡通涂鸦拍照上传，AI自动识别四肢骨骼让它在屏幕上欢快蹦跳', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_35', title: 'WindowSwap 打开全世界陌生人的窗户', url: 'https://www.window-swap.com',
        fallback: '看窗', badge: '治愈系！透过全球网友的窗台看雨听风', desc: '一键随机切换到瑞士雪山木屋、京都雨夜小巷、纽约黄昏公寓的真实窗外10分钟高清实拍与白噪音', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_36', title: 'Drive & Listen 全球城市云兜风', url: 'https://drivenlisten.com',
        fallback: '兜风', badge: '坐在副驾边听当地电台边在50座世界名城街头兜风', desc: '第一视角4K实拍驾车穿行慕尼黑、哈瓦那、首尔、里斯本街头，自由开关真实街道环境声与当地车载广播', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_39', title: 'MuscleWiki 人体肌肉健身点哪练哪', url: 'https://musclewiki.com/zh-cn',
        fallback: '健身', badge: '点击人体3D肌肉图直接看对应徒手哑铃训练动图', desc: '想练胸肌、背阔肌还是缓解腰肌劳损？在3D人体模型上点一下那块肌肉，立刻列出哑铃、杠铃、弹力带与拉伸标准动作视频', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_40', title: 'Darebee 全球免费无器械家庭健身图鉴', url: 'https://darebee.com',
        fallback: 'DB', badge: '2000张RPG游戏化居家徒手燃脂海报', desc: '非营利免费健身宝库！把每天的HIIT燃脂、核心训练做成《巫师》《赛博朋克》主题闯关海报，零广告无需器材', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_41', title: '下厨房 AI 菜谱大全', url: 'https://www.xiachufang.com',
        fallback: '厨房', badge: '千万中国人每日三餐家常菜与烘焙圣经', desc: '输入冰箱里剩下的鸡蛋、西红柿、土豆，立刻搜出零失败高分步骤图解菜谱与真实厨友交作业避坑指南', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_42', title: '食用手册 (程序员做饭指南HowToCook)', url: 'https://cook.yunyoujun.cn',
        fallback: '做饭', badge: '隔离在家点选冰箱食材+厨具秒筛菜谱', desc: '融合GitHub六万星《程序员做饭指南》！点选你手里现有的蔬菜肉类和一口电饭煲/空气炸锅，秒出精确到克数的菜谱', sub: 'fun',
      ),
      LzSite(
        id: 'ind_ind_50', title: '中国国家地理网', url: 'http://www.dili360.com',
        fallback: '地理', badge: '发现极致华夏山河秘境与人文风物', desc: '《中国国家地理》杂志官方网站，汇聚中国最美雪山、峡谷、古村落科考影像与深度自然地理科普', sub: 'fun',
      ),
      LzSite(
        id: 'ind_des_21', title: 'Awwwards 全球网页设计奥斯卡', url: 'https://www.awwwards.com',
        fallback: 'AW', badge: '每日评选全球最惊艳交互网站', desc: '前端工程师与创意总监必看：收录全球最具突破性WebGL 3D着色器、丝滑滚屏交互的获奖网站', sub: 'dev',
      ),
      LzSite(
        id: 'ind_des_22', title: 'Mobbin 全球顶尖App界面库', url: 'https://mobbin.com',
        fallback: 'MB', badge: '收录30万张真实App全流程截图', desc: '把全球上千款顶级iOS与Android应用的注册、支付、空状态、设置等每一个交互流程页面全部截图归档', sub: 'dev',
      ),
      LzSite(
        id: 'ind_des_23', title: 'Page Flows 用户流程录屏库', url: 'https://pageflows.com',
        fallback: 'PF', badge: '高清录屏拆解全球名企产品交互', desc: '通过完整操作录屏+标注，深度拆解Disney、 Airbnb、Notion、Linear等产品的Onboarding与付费转化流程', sub: 'dev',
      ),
      LzSite(
        id: 'ind_des_24', title: 'Godly.website 极品独立站画廊', url: 'https://godly.website',
        fallback: 'GD', badge: '全网最酷炫现代几何暗黑风网页', desc: '精选全球AI独角兽、Web3、创意工作室最具未来感与交互微动效的实时网页灵感库', sub: 'dev',
      ),
      LzSite(
        id: 'ind_des_25', title: 'LottieFiles 轻量交互动画库', url: 'https://lottiefiles.com',
        fallback: 'LF', badge: '几KB放进App的矢量丝滑动画', desc: 'Airbnb开源Lottie生态中心：免费下载数万个加载、点赞、空状态JSON/dotLottie矢量动画并支持AI改色', sub: 'dev',
      ),
      LzSite(
        id: 'ind_life_8', title: '壹心理 Yixinli', url: 'https://www.xinli001.com',
        fallback: '壹心', badge: '国内2000万人的心理治愈森林', desc: '汇聚专业心理测评、冥想音频、心理FM电台、匿名温暖树洞与国内外持证心理咨询师预约平台', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_9', title: '简单心理 Jiandanxinli', url: 'https://www.jiandanxinli.com',
        fallback: '简心', badge: '严选全球前1%专业心理咨询师', desc: '提供严谨的国际标准精神心理健康自评量表、心理科普专栏与高标准伦理监管的心理咨询服务', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_10', title: 'KnowYourself (KY心理)', url: 'https://www.knowyourself.cc',
        fallback: 'KY', badge: '都市青年自我探索与亲密关系指南', desc: '深入浅出剖析依恋类型、原生家庭、职场内耗与亲密关系沟通技巧的知名心理学科普品牌', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_13', title: 'Headspace 正念冥想', url: 'https://www.headspace.com',
        fallback: 'HS', badge: '全球正念冥想与减压启蒙鼻祖', desc: '用超级可爱的治愈系动画短片与每天10分钟科学正念呼吸练习，帮你清空大脑杂念、改善失眠', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_14', title: 'Calm 睡眠故事与冥想', url: 'https://www.calm.com',
        fallback: 'Calm', badge: '好莱坞巨星为你朗读睡前童话', desc: '打开网页就被宁静湖泊与鸟鸣包围，全球下载量第一的深度放松、焦虑平复与成人睡前故事殿堂', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_15', title: '16Personalities 免费MBTI官方测试', url: 'https://www.16personalities.com/ch',
        fallback: 'MBTI', badge: '全球最火16型人格与可爱小人插画', desc: '超10亿人次测过的中文免费MBTI人格测试官网，深度解析INTJ/INFP/ENFP等16种性格优势、恋爱与职业匹配', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_16', title: '魔宙 / 煎蛋网 Jandan', url: 'http://jandan.net',
        fallback: '煎蛋', badge: '中文互联网最后的极客冷知识净土', desc: '译介全球千奇百怪的科学脑洞、搞笑无聊图、发霉故事与极客手工DIY的经典趣味慢社区', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_17', title: '萌爪医生 WeCarePet', url: 'https://www.wecarepet.com',
        fallback: '萌爪', badge: '猫咪狗狗生病拍照问执业兽医', desc: '北美执业兽医团队审核的科学养宠百科库、毒物误食急救查询、猫粮狗粮成分测评与AI宠医初诊', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_18', title: '波奇宠物百科', url: 'https://www.boqii.com',
        fallback: '波奇', badge: '犬猫品种图鉴与疫苗驱虫日历', desc: '涵盖上千种猫咪、犬类、异宠饲养指南、常见皮肤病肠胃病症状对照与同城宠物服务导航', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_20', title: '薄荷健康 AI 饮食热量识别', url: 'https://www.boohee.com',
        fallback: '薄荷', badge: '拍餐盘1秒识别中餐卡路里与升糖GI', desc: '深耕中国本土千万种家常炒菜、奶茶小吃营养成分数据库，AI拍照秒算热量、碳水蛋白质脂肪占比', sub: 'fun',
      ),
      LzSite(
        id: 'ind_life_21', title: '美丽修行 (化妆品成分安全秒查)', url: 'https://www.bevol.cn',
        fallback: '美修', badge: '护肤品成分党必查致痘防腐剂风险', desc: '同步国家药监局备案库：输入任意面霜精华或拍配料表，1秒拆解每种化学成分功效、孕妇慎用与肤质匹配度', sub: 'fun',
      ),
      LzSite(
        id: 'ind_tech_1', title: '懂车帝 AI选车与实测拆解', url: 'https://www.dongchedi.com',
        fallback: '懂车', badge: '百辆新能源车冬测夏测碰撞硬核数据', desc: '提供3D全景看车、全网真实车主成交裸车价查询、纯电续航达成率实测榜与主机厂零部件深度拆解', sub: 'fun',
      ),
      LzSite(
        id: 'ind_tech_2', title: '汽车之家智能选车', url: 'https://www.autohome.com.cn',
        fallback: '车家', badge: '全球最大汽车参数配置对比库', desc: '支持任意多款车型数百项底盘、智驾芯片、电池电机参数逐行对比、保值率计算与车友会口碑', sub: 'fun',
      ),
      LzSite(
        id: 'ind_tech_3', title: '小熊油耗 (百万车主真实油耗电耗众测)', url: 'https://www.xiaoxiong.com',
        fallback: '油耗', badge: '拒绝工信部快乐表！查真实市区油耗', desc: '汇集全国数百万私家车主每一箱油、每一次充电记录算出的各车型真实四季平均油耗与百公里电耗排行', sub: 'fun',
      ),
      LzSite(
        id: 'ind_tech_5', title: '贝壳找房如视VR & AI讲房', url: 'https://www.ke.com',
        fallback: '贝壳', badge: '激光扫描真房源720度VR量房与AI装修改造', desc: '足不出户在手机上漫游真实二手房每个角落、查看精确到厘米的开间进深、冬至日全天采光模拟与成交历史价', sub: 'fun',
      ),
      LzSite(
        id: 'ind_tech_6', title: '好好住 (真实中国人家装避坑指南)', url: 'https://www.haohaozhu.cn',
        fallback: '好住', badge: '3000万屋主晒出的无滤镜真实装修经验', desc: '搜小户型收纳、无主灯翻车、厨房动线尺寸、水电改造插座高度，看真实入住3年后的良心大实话', sub: 'fun',
      ),
      LzSite(
        id: 'ind_tech_7', title: '一兜糖家居', url: 'https://www.yidoutang.com',
        fallback: '一兜', badge: '全屋记真实装修预算清单抄作业', desc: '按户型面积、装修风格、总花费预算筛选全国屋主公开的硬装软装每一件家具网购清单与实拍图', sub: 'fun',
      ),
      LzSite(
        id: 'ind_tech_18', title: 'V2EX 创意工作者与极客社区', url: 'https://www.v2ex.com',
        fallback: 'V2EX', badge: 'Way to Explore 程序员与独立开发者聚集地', desc: '探讨前沿编程技术、云服务器折腾、Mac效率工具、远程工作机会与独立开发作品秀的极简社区', sub: 'dev',
      ),
      LzSite(
        id: 'ind_tech_19', title: 'Linux.do (新一代开源与AI极客社区)', url: 'https://linux.do',
        fallback: 'LDO', badge: '国内超火的大模型API、自建开源项目交流坛', desc: '真诚、友善、团结、专业的新锐中文技术社区，第一时间分享前沿AI工具、Docker自托管与极客福利', sub: 'dev',
      ),
      LzSite(
        id: 'ind_tech_20', title: 'HelloGitHub 趣味入门开源项目月刊', url: 'https://hellogithub.com',
        fallback: 'HG', badge: '每月28号挖掘GitHub上好玩易上手的宝藏项目', desc: '拒绝枯燥底层框架！专门挑选看一眼就想Star的开源小游戏、桌面宠物、摸鱼神器、实用脚本与新手实战项目', sub: 'dev',
      ),
    ],
  ),
  LzCategory(
    id: 'partners', name: '伙伴推荐', desc: '站长推荐 · 优质副业 · 极速直连 · 精选好站',
    subs: [
      LzSub('all', '全部'),
      LzSub('recom', '站长力荐'),
      LzSub('side_hustle', '副业兼职'),
      LzSub('service', '实用专区'),
    ],
    sites: [    ],
  ),
  LzCategory(
    id: 'ai_bot_ecosystem', name: 'AI生态与精选工具', desc: '智能体 · 代码开发 · 视觉生成与办公AI全景',
    subs: [
      LzSub('all', '全部'),
      LzSub('coding_agent', '编程代码'),
      LzSub('vision_creative', '视觉与多模态'),
      LzSub('office_writing', '办公写作'),
      LzSub('research_eval', '科研评测'),
      LzSub('tools_all', '实用AI'),
    ],
    sites: [      LzSite(
        id: 'ind_cb_31', title: 'Browse AI', url: 'https://www.browse.ai',
        fallback: 'BA', badge: '零代码抓取', desc: '点选网页元素即可训练云端机器人24小时监控网站数据变化', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_cb_32', title: 'Bardeen AI', url: 'https://www.bardeen.ai',
        fallback: 'BD', badge: '浏览器Copilot', desc: '一句话自动串联浏览器跨标签页复制、发邮件、入库的AI效率神器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_cb_33', title: 'Harpa AI', url: 'https://harpa.ai',
        fallback: 'HP', badge: '网页自动化', desc: '结合Claude与GPT的混合AI浏览器自动化引擎，支持价格监控与SEO编写', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_1', title: '丁香园用药助手AI', url: 'https://drugs.dxy.cn',
        fallback: '丁', badge: '临床用药AI', desc: '权威循证医学指南检索、处方相互作用审查与临床决策AI系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_2', title: '百度灵医智惠', url: 'https://01.baidu.com',
        fallback: '灵医', badge: '百度医疗AI', desc: '基于文心医疗大模型的临床辅助诊断、病历质控与眼底影像筛查平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_3', title: '讯飞晓医', url: 'https://xiaoyi.xfyun.cn',
        fallback: '晓医', badge: '症状自查AI', desc: '科大讯飞医疗大模型出品的看病前问诊、体检报告解读与用药咨询助手', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_4', title: '京东健康京医千询', url: 'https://health.jd.com',
        fallback: '京医', badge: '健康大模型', desc: '京东健康推出的全科在线AI导诊、营养师建议与慢病管理平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_5', title: '阿里健康Dr.Deer', url: 'https://www.alihealth.cn',
        fallback: '鹿医', badge: '医疗AI助手', desc: '阿里健康智能医学文献问答、检查化验单拍照秒懂AI工具', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_6', title: '蚂蚁AQ医疗助手', url: 'https://www.antgroup.com',
        fallback: 'AQ', badge: '支付宝AI健康', desc: '连接全国三甲名医智能体、报告深度解读与医保咨询的AI健康管家', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_7', title: '百川医疗大模型', url: 'https://med.baichuan-ai.com',
        fallback: '百医', badge: '儿科全科AI', desc: '百川智能专注医疗临床推理、全科问诊与罕见病筛查的旗舰医疗AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_8', title: '医联MedGPT', url: 'https://www.medlinker.com',
        fallback: '医联', badge: 'AI医生问诊', desc: '国内首款遵循真实临床诊疗路径开具检查检验建议的AI医生平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_9', title: '左手医生AI', url: 'https://www.zuoshouyisheng.com',
        fallback: '左手', badge: '智能导诊', desc: '赋能数百家三甲医院的AI预问诊、智能分诊与家庭医生随访系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_10', title: '森亿智能生成式医疗', url: 'https://www.synyi.com',
        fallback: '森亿', badge: '病历生成AI', desc: '基于大模型的医院电子病历自动书写、手术记录摘要与临床科研AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_11', title: '惠每科技CDSS', url: 'https://www.huimeitech.com',
        fallback: '惠每', badge: '梅奥循证AI', desc: '源自梅奥诊所知识体系的医院全病种临床决策支持与质控AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_12', title: '推想医疗AI', url: 'https://www.infervision.com',
        fallback: '推想', badge: '肺结节影像', desc: '全球领先的胸部CT肺结节、脑卒中与冠脉AI医学影像辅助诊断系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_13', title: '联影智能uAI', url: 'https://www.uii-ai.com',
        fallback: '联影', badge: '全栈医学影像', desc: '覆盖CT、MR、PET多模态医学影像重建、病灶分割与手术规划的AI平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_14', title: '深睿医疗AI', url: 'https://www.deepwise.com',
        fallback: '深睿', badge: '多模态影像', desc: '依托北大科研团队的放射科智能读片、乳腺癌早筛与结构化报告AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_15', title: '数坤科技数字人体', url: 'https://www.shukun.net',
        fallback: '数坤', badge: '心脑血管AI', desc: '全球领先的心脏冠脉CTA、头颈血管三维重建与自动诊断AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_16', title: '科亚医疗深脉', url: 'https://www.keyamedical.com',
        fallback: '科亚', badge: '冠脉血流AI', desc: '国内首张NMPA三类医疗AI证获得者，无创CT-FFR冠脉生理功能评估AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_17', title: '鹰瞳Airdoc', url: 'https://www.airdoc.com',
        fallback: '鹰瞳', badge: '眼底慢病AI', desc: '通过一张视网膜眼底照片无创筛查糖尿病、高血压与血管健康风险', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_18', title: '微医海西医药AI', url: 'https://www.guahao.com',
        fallback: '微医', badge: '数字健共体', desc: '微医医疗大模型驱动的互联网医院智能问诊与慢病处方流转平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_19', title: '晶泰科技XtalPi', url: 'https://www.xtalpi.com',
        fallback: '晶泰', badge: '量子物理制药', desc: '麻省理工孵化的量子物理+AI药物发现与自动化机器人化学合成平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_20', title: '英矽智能InSilico', url: 'https://insilico.com',
        fallback: '英矽', badge: '生成式制药', desc: '端到端生成式AI靶点发现PandaOmics与小分子药物设计Chemistry42平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_21', title: '深势科技Bohrium', url: 'https://bohrium.dp.tech',
        fallback: '深势', badge: 'AI4Science', desc: '微尺度科学计算云平台，支持蛋白质折叠、分子动力学模拟与材料研发', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_22', title: '百图生科BioMap', url: 'https://www.biomap.com',
        fallback: '百图', badge: '生命科学大模型', desc: '李彦宏创立的千亿参数跨模态生命科学大模型xTrimo与蛋白质设计平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_23', title: 'AlphaFold Server', url: 'https://alphafoldserver.com',
        fallback: 'AF3', badge: '诺奖蛋白预测', desc: 'Google DeepMind诺贝尔奖级AlphaFold 3蛋白质、DNA与配体三维结构预测平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_24', title: 'OpenEvidence', url: 'https://www.openevidence.com',
        fallback: 'OE', badge: '医学循证AI', desc: '哈佛与MIT背景打造的临床医生专用AI循证医学搜索，直连百万篇顶级医学期刊', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_25', title: 'Glass Health', url: 'https://glass.health',
        fallback: 'GH', badge: '鉴别诊断AI', desc: '输入患者复杂体征与病史，秒级生成专业临床鉴别诊断与诊疗方案的AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_26', title: 'Abridge AI', url: 'https://www.abridge.com',
        fallback: 'AB', badge: '医患对话转病历', desc: '自动录制医患问诊对话并实时提取生成标准结构化SOAP电子病历的AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_27', title: 'Nabla Copilot', url: 'https://www.nabla.com',
        fallback: 'NB', badge: '门诊AI助手', desc: '支持35种语言、在门诊问诊同时静默自动完成病历文书与医嘱草稿的AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_28', title: 'Suki AI', url: 'https://www.suki.ai',
        fallback: 'SK', badge: '医生语音助手', desc: '专为临床医生打造的AI语音数字助手，减少70%病历录入与编码负担', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_29', title: 'Hippocratic AI', url: 'https://www.hippocraticai.com',
        fallback: 'HP', badge: '安全护理Agent', desc: '专注患者出院随访、术前指导与慢病关怀的超高安全性医疗语音Agent', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_30', title: 'Ada Health', url: 'https://ada.com',
        fallback: 'Ada', badge: '全球症状评估', desc: '由数百名医生训练的全球知名AI健康症状自测与疾病概率评估工具', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_31', title: 'Cradle Bio', url: 'https://www.cradle.bio',
        fallback: 'CB', badge: '生成式蛋白质', desc: '像写代码一样用生成式AI设计和改造高活性工业酶与治疗性抗体蛋白质', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_32', title: 'Benchling AI', url: 'https://www.benchling.com',
        fallback: 'BC', badge: '生物研发云', desc: '全球生物科技公司标配的基因序列设计、CRISPR编辑与AI实验记录云平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_33', title: 'Recursion Pharma', url: 'https://www.recursion.com',
        fallback: 'RC', badge: '生物图像大模型', desc: '利用超算与Phenom生物显微镜视觉大模型筛选靶点与老药新用的平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_34', title: 'ブイキューブ医疗AI', url: 'https://www.pflege.ai',
        fallback: 'PF', badge: '养老康养AI', desc: '智能护理记录、跌倒姿态视觉预警与长者认知康复训练AI平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_35', title: '知网智慧医疗', url: 'https://med.cnki.net',
        fallback: '知医', badge: '中华医学知识库', desc: '汇聚国内核心医学期刊、临床路径与典型病例的智能检索问答库', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_36', title: '梅斯医学AI', url: 'https://www.medsci.cn',
        fallback: '梅斯', badge: '临床科研助手', desc: '临床医生课题设计、SCI医学论文润色、统计分析与期刊选投AI工具', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_med_37', title: '常笑医学网', url: 'https://www.cxmed.cn',
        fallback: '常笑', badge: '医学量表工具', desc: '收录上千款临床各科室标准医学评估量表与医学统计在线计算器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_38', title: '用药参考AI', url: 'https://www.dayi.org.cn',
        fallback: '大医', badge: '中国医药百科', desc: '国家卫健委权威医学科普、中西医疾病百科与药品说明书智能查询', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_39', title: '大家中医AI', url: 'https://www.dajiazhongyi.com',
        fallback: '中医', badge: '经方辨证AI', desc: '伤寒论古籍经方智能检索、舌诊脉案记录与名老中医医案AI学习平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_med_40', title: '问止中医大脑', url: 'https://www.wenzhiai.com',
        fallback: '问止', badge: '中医人工智能', desc: '搭载百万级真实临床方剂医案训练的中医辨证开方辅助人工智能系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_law_1', title: '通义法睿', url: 'https://tongyi.aliyun.com/farui',
        fallback: '法睿', badge: '阿里法律AI', desc: '阿里云通义千问出品的免费法律咨询、起诉状生成、合同风险审查与类案检索AI', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_2', title: '幂律智能MeFlow', url: 'https://www.powerlaw.ai',
        fallback: '幂律', badge: '清华法律AI', desc: '清华计算机系孵化的企业法务智能合同审查、履约管理与法律大模型系统', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_3', title: '北大法宝AI', url: 'https://www.pkulaw.com',
        fallback: '法宝', badge: '权威法律法规', desc: '中国最权威的法律法规、司法案例、法学期刊智能检索与类案推送平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_4', title: '威科先行法律AI', url: 'https://law.wkinfo.com.cn',
        fallback: '威科', badge: '跨国合规库', desc: '集成生成式AI问答的财税、金融、反垄断与涉外法律合规智能信息库', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_5', title: '元典智库', url: 'https://www.yuandian.com',
        fallback: '元典', badge: '法官律师助手', desc: '华宇软件出品的法律知识图谱、裁判尺度分析与诉讼策略评估AI工具', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_6', title: '无讼智能', url: 'https://www.itslaw.com',
        fallback: '无讼', badge: '案例大数据', desc: '全国法院裁判文书深度挖掘、法官过往判例画像与律师办案智能协同平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_7', title: '把手案例', url: 'https://www.lawsdata.com',
        fallback: '把手', badge: '精准检索', desc: '支持可视化裁判规则提炼、相似案情对比与争议焦点分析的法律搜索引擎', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_8', title: '秘塔合同智审', url: 'https://ht.metaso.cn',
        fallback: '秘审', badge: '秒审合同坑', desc: '上传劳动合同或商业协议，30秒逐条标出霸王条款并自动给出修改措辞', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_9', title: '法天使中国合同库', url: 'https://www.fatianshi.cn',
        fallback: '天使', badge: '万份标准合同', desc: '嵌入Word插件的13000+专业律师精修标准合同模板库与AI审校工具', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_10', title: '得理法搜', url: 'https://www.delilegal.com',
        fallback: '得理', badge: '得理法律大模型', desc: '深圳鹏城实验室联合研发的法律行业垂直大模型，支持案情推演与文书起草', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_11', title: '智合AI法律', url: 'https://www.zhihedongfang.com',
        fallback: '智合', badge: '律所智库', desc: '面向顶尖律所与大型企业总法律顾问的合规研究与法律科技评测中心', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_12', title: '法狗狗AI', url: 'https://www.fagougou.com',
        fallback: '狗狗', badge: '婚姻劳动评估', desc: '针对劳动仲裁赔偿计算、交通事故伤残理赔与离婚财产分割的AI法律计算器', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_13', title: 'Harvey AI', url: 'https://www.harvey.ai',
        fallback: 'HV', badge: '全球律所霸主', desc: 'OpenAI领投、全球红圈律所与普华永道标配的顶级生成式法律AI平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_14', title: 'Spellbook', url: 'https://www.spellbook.legal',
        fallback: 'SB', badge: 'Word合同AI', desc: '直接在Microsoft Word中调用GPT-4自动起草商业合同条款与排雷的律师神器', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_15', title: 'CoCounsel', url: 'https://casetext.com',
        fallback: 'CC', badge: '汤森路透AI', desc: '汤森路透6.5亿美元收购的AI法律助理，数分钟读完万页卷宗并生成质证提纲', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_16', title: 'Ironclad AI', url: 'https://ironcladapp.com',
        fallback: 'IC', badge: '数字合同全周期', desc: '全球独角兽级企业合同全生命周期CLM自动化谈判、红线比对与签署AI', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_17', title: 'Robin AI', url: 'https://www.robinai.com',
        fallback: 'RB', badge: 'Claude审合同', desc: '基于Anthropic Claude打造的私募股权NDA、采购合同高速智能审核平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_18', title: 'Luminance', url: 'https://www.luminance.com',
        fallback: 'LM', badge: '并购尽调AI', desc: '剑桥大学孵化的跨国企业并购M&A虚拟数据室万份合同自动尽职调查AI', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_19', title: 'EvenUp', url: 'https://www.evenuplaw.com',
        fallback: 'EU', badge: '索赔文书AI', desc: '利用AI深度分析医疗记录与账单，自动生成高胜率人身伤害索赔函的独角兽', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_20', title: 'DoNotPay', url: 'https://donotpay.com',
        fallback: 'DNP', badge: '消费者维权AI', desc: '全球首个AI机器人律师，自动帮你退订霸王扣费、申诉交通罚单与小额索赔', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_21', title: '智慧芽Patsnap AI', url: 'https://www.zhihuiya.com',
        fallback: '智慧芽', badge: '全球专利AI', desc: '覆盖全球1.7亿件专利数据，支持AI技术交底书自动撰写为完整发明专利申请书', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_law_22', title: '佰腾专利检索', url: 'https://www.baiten.cn',
        fallback: '佰腾', badge: '查新侵权对比', desc: '中外专利免费在线检索、法律状态追踪与专利价值评估大数据平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_law_23', title: 'ヒマワリIncopat', url: 'https://www.incopat.com',
        fallback: 'Inco', badge: '科技创新情报', desc: '全球科技专利语义检索、竞争对手研发路线图监控与专利侵权预警AI', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_law_24', title: '权大师AI', url: 'https://www.quandashi.com',
        fallback: '权', badge: '商标近似筛查', desc: 'AI秒测商标注册通过率、近似商标图样比对与软著版权极速申报平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_25', title: '康信IP平台', url: 'https://service.kangxin.com',
        fallback: '康信', badge: '全球商标专利', desc: '结合AI图像与多语种语义识别的全球商标检索、域名保护与海外维权系统', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_26', title: '天眼查AI企服', url: 'https://www.tianyancha.com',
        fallback: '天眼', badge: '商业穿透AI', desc: '查公司、查老板、股权穿透图谱与企业司法涉诉风险一键AI扫描', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_law_27', title: '企查查企业征信', url: 'https://www.qcc.com',
        fallback: '企查', badge: '司法舆情监控', desc: '企业工商信用、失信被执行人、招投标动态与供应链合规风险实时监控', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_law_28', title: '启信宝商业风控', url: 'https://www.qixin.com',
        fallback: '启信', badge: '合合信息出品', desc: '基于知识图谱的企业关联方挖掘、空壳公司识别与信贷法务风控平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_law_29', title: '中国裁判文书网', url: 'https://wenshu.court.gov.cn',
        fallback: '法院', badge: '官方裁判文书', desc: '最高人民法院官方权威全国各级法院生效判决书、裁定书公开检索库', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_30', title: '国家法律法规数据库', url: 'https://flk.npc.gov.cn',
        fallback: '人大', badge: '宪法法律库', desc: '全国人大常委会官方建立的中华人民共和国现行有效法律、行政法规权威库', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_31', title: '中国庭审公开网', url: 'https://tingshen.court.gov.cn',
        fallback: '庭审', badge: '真实庭审直播', desc: '全国法院真实案件庭审同步高清视频直播与历年经典庭审录像回放库', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_32', title: '企服法大夫', url: 'https://www.fadaifu.com',
        fallback: '大夫', badge: '劳动法顾问', desc: '专注企业用工合规、员工手册定制与经济补偿金风险规避的AI法律助手', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_33', title: '律图网法律百科', url: 'https://www.64365.com',
        fallback: '律图', badge: '民生法律指南', desc: '涵盖婚姻家庭、房产纠纷、债权债务与刑事辩护的通俗法律实务指南', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_34', title: '找法网AI咨询', url: 'https://china.findlaw.cn',
        fallback: '找法', badge: '同城律师匹配', desc: '智能分析案件诉求与胜诉率，免费生成法律意见书并匹配属地专业律师', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_law_35', title: '华律网智能法务', url: 'https://www.66law.cn',
        fallback: '华律', badge: '伤残赔偿计算', desc: '内置最新全国各省工伤赔偿、诉讼费、律师费与逾期利息自动计算器', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_fin_1', title: '同花顺问财HithinkGPT', url: 'https://www.iwencai.com',
        fallback: '问财', badge: '自然语言选股', desc: '输入一句话如『连续3年ROE大于15%的低估值AI股』秒出A股港美股深度投研', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_2', title: '东方财富妙想大模型', url: 'https://www.eastmoney.com',
        fallback: '妙想', badge: '东财金融AI', desc: '东方财富自研金融大模型，一键解读千页上市公司年报、纪要与行业研报', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_3', title: '万得Wind Alice', url: 'https://www.wind.com.cn',
        fallback: 'Wind', badge: '机构投研标配', desc: '国内券商基金投行标配的Wind金融终端AI助手，实时抽取全球宏观与财务数据', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_4', title: '萝卜投研', url: 'https://robo.datayes.com',
        fallback: '萝卜', badge: '通联数据AI', desc: '知识图谱驱动的产业链上下游透视、券商盈利预测汇总与智能研报撰写平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_5', title: '慧博投研资讯', url: 'https://www.hibor.com.cn',
        fallback: '慧博', badge: '海量券商研报', desc: '每日实时更新国内外各大券商研究所深度行研报告、调研纪要与晨会精粹', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_6', title: '发现报告', url: 'https://www.fxbaogao.com',
        fallback: '发现', badge: '行业白皮书库', desc: '汇聚亿欧、艾瑞、麦肯锡及顶尖券商数百万份全行业研究报告与数据图表', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_7', title: '行行查', url: 'https://www.hanghangcha.com',
        fallback: '行查', badge: '细分行业智库', desc: '覆盖数百个垂直细分产业链图谱、市场规模测算与商业尽调数据包', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_8', title: '聚宽JoinQuant', url: 'https://www.joinquant.com',
        fallback: '聚宽', badge: 'Python量化', desc: '支持AI因子挖掘、十年历史Tick级行情回测与实盘仿真的国内顶尖量化交易平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_9', title: '米筐RiceQuant', url: 'https://www.ricequant.com',
        fallback: '米筐', badge: '机构量化投研', desc: '提供多因子风险模型、机器学习选股策略研究与期权衍生品定价的量化云', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_10', title: 'BigQuant AI量化', url: 'https://bigquant.com',
        fallback: 'BQ', badge: '可视化AI量化', desc: '零代码拖拽搭建Transformer与强化学习股票期货量化策略的人工智能平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_11', title: '优矿UQER', url: 'https://uqer.datayes.com',
        fallback: '优矿', badge: '量化实验室', desc: '通联数据旗下支持海量另类数据因子挖掘与Python云端笔记本的量化社区', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_12', title: '掘金量化', url: 'https://www.myquant.cn',
        fallback: '掘金', badge: '极速实盘量化', desc: '支持Python/C++/MATLAB本地与云端策略研发、毫秒级极速仿真回测终端', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_13', title: 'TradingView', url: 'https://cn.tradingview.com',
        fallback: 'TV', badge: '全球看盘神站', desc: '全球5000万交易员使用的超级K线图表、PineScript AI指标编写与全市场行情站', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_14', title: 'AlphaSense', url: 'https://www.alpha-sense.com',
        fallback: 'AS', badge: '华尔街投研AI', desc: '华尔街对冲基金与世界500强标配的市场情报AI搜索引擎，穿透全球高管电话会', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_15', title: 'FinChat.io', url: 'https://finchat.io',
        fallback: 'FC', badge: '全球财报ChatGPT', desc: '专为股票投资者打造的AI财报对话终端，精准绘制全球上市公司10年核心经营图表', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_16', title: 'Koyfin', url: 'https://www.koyfin.com',
        fallback: 'KF', badge: '平民彭博终端', desc: '媲美百万年费Bloomberg终端的全球股票、宏观债券、ETF可视化分析仪表盘', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_17', title: 'Quartr', url: 'https://quartr.com',
        fallback: 'QT', badge: '美股电话会AI', desc: '实时收听苹果、英伟达等全球科技巨头财报电话会议音频并同步AI中英文字幕与PPT', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_18', title: 'Composer.trade', url: 'https://www.composer.trade',
        fallback: 'CP', badge: 'AI自动化美股', desc: '用自然语言构建自动化美股ETF轮动与风险平价交易策略，免编程回测与自动调仓', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_19', title: 'QuantConnect', url: 'https://www.quantconnect.com',
        fallback: 'QC', badge: '开源算法交易', desc: '全球最大开源量化算法交易引擎LEAN云端平台，覆盖美股、期权、外汇与加密资产', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_20', title: 'Seeking Alpha', url: 'https://seekingalpha.com',
        fallback: 'SA', badge: '美股深度量化', desc: '全球最大的美股独立分析师社区与Quant量化因子评级系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_21', title: 'GuruFocus', url: 'https://www.gurufocus.com',
        fallback: 'GF', badge: '巴菲特持仓追踪', desc: '实时追踪巴菲特、段永平、桥水等华尔街投资大师13F持仓变动与内在价值DCF计算', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_22', title: 'WhaleWisdom', url: 'https://whalewisdom.com',
        fallback: 'WW', badge: '13F机构追踪', desc: '深度透视全球顶级对冲基金季度加仓减仓热力图与历史超额收益回溯', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_23', title: '理杏仁', url: 'https://www.lixinger.com',
        fallback: '理', badge: '价值投资数据', desc: '专注A股港股十年历史PE/PB分位点、自由现金流与高股息基本面筛选工具', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_24', title: '乌龟量化', url: 'https://wglh.com',
        fallback: '龟', badge: '指数估值定投', desc: '一目了然查看全球宽基与行业指数历史温度计估值、网格交易与基金定投回测', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_25', title: '集思录', url: 'https://www.jisilu.cn',
        fallback: '集', badge: '低风险套利', desc: '国内最专业的转债双低轮动、分级套利、REITs与封闭基金折溢价实时数据社区', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_26', title: '雪球', url: 'https://xueqiu.com',
        fallback: '雪', badge: '聪明的投资者', desc: '4000万股民基民实盘组合交流、上市公司高管直连与深度财务排雷社区', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_27', title: '巨潮资讯网', url: 'http://www.cninfo.com.cn',
        fallback: '巨潮', badge: '证监会指定披露', desc: '中国证监会指定上市公司官方公告、招股说明书与年度报告唯一权威首发站', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_28', title: '金蝶云苍穹GPT', url: 'https://www.kingdee.com',
        fallback: '金蝶', badge: '财务大模型', desc: '金蝶企业管理AI大模型，一句话自动生成财务记账凭证、多维利润分析与税务风险预警', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_fin_29', title: '用友YonGPT', url: 'https://www.yonyou.com',
        fallback: '用友', badge: '企业服务大模型', desc: '覆盖智能报销审单、现金流预测、供应链寻源与人岗匹配的业界首个企业服务大模型', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_fin_30', title: '合思敏捷财务', url: 'https://www.hosecloud.com',
        fallback: '合思', badge: '无需报销AI', desc: 'AI全链路数电票自动验真查重、差旅免垫资消费即合规的智能财务收支平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_fin_31', title: '分贝通企业支出', url: 'https://www.fenbeitong.com',
        fallback: '分贝', badge: 'AI商旅费控', desc: '将企业机票酒店、用车用餐、公对公打款与AI智能审单合一的下一代费控系统', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_fin_32', title: '百望云智税AI', url: 'https://www.baiwang.com',
        fallback: '百望', badge: '数电发票中枢', desc: '服务千万企业的数电发票自动开具、进项抵扣勾选与税务合规风险扫描AI平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_fin_33', title: '诺诺网智能财税', url: 'https://www.nuonuo.com',
        fallback: '诺诺', badge: '航天信息出品', desc: '一键智能扫码开票、银税直连自动报税与小微企业云代账智能平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_fin_34', title: '看财报AI', url: 'https://www.kancaibao.com',
        fallback: '财报', badge: '三表可视化', desc: '把枯燥的资产负债表、利润表、现金流量表转化为桑基图与杜邦分析图的神器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_35', title: 'CoinMarketCap AI', url: 'https://coinmarketcap.com',
        fallback: 'CMC', badge: '全球加密行情', desc: '全球数字资产实时市值排行、链上资金流向追踪与AI市场情绪分析平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_36', title: 'Dune Analytics', url: 'https://dune.com',
        fallback: 'Dune', badge: 'Web3链上SQL', desc: '使用AI自然语言生成SQL查询以太坊、Solana等公链实时链上交易看板的神器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_37', title: 'Nansen AI', url: 'https://www.nansen.ai',
        fallback: 'NS', badge: '聪明钱追踪', desc: '利用AI标记数亿个区块链钱包地址，实时监控机构巨鲸与聪明钱动向', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_38', title: 'Arkham Intelligence', url: 'https://platform.arkhamintelligence.com',
        fallback: 'AK', badge: '链上侦探AI', desc: 'OpenAI创始人投资的区块链去匿名化情报平台，可视化追踪全球顶级机构链上持仓', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_39', title: 'DefiLlama', url: 'https://defillama.com',
        fallback: 'Llama', badge: '全链TVL大屏', desc: '纯净无广告的全球DeFi协议锁仓量TVL、收益率与协议收入开源统计大屏', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_fin_40', title: 'Fred 圣路易斯联储', url: 'https://fred.stlouisfed.org',
        fallback: 'FRED', badge: '全球宏观经济', desc: '美联储官方收录全球80万条通胀CPI、非农就业、国债收益率与GDP时间序列数据库', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_edu_1', title: 'Khanmigo 可汗学院AI', url: 'https://www.khanmigo.ai',
        fallback: 'Khan', badge: '苏格拉底导师', desc: '可汗学院联手OpenAI打造的AI私教，不直接给答案而是启发式一步步引导解题', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_2', title: '有道子曰教育大模型', url: 'https://fanyi.youdao.com',
        fallback: '子曰', badge: '虚拟人口语教练', desc: '网易有道出品的Hi Echo虚拟人口语私教、全科答疑与AIBox学术双语精读平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_3', title: '猿辅导飞象星球', url: 'https://www.feixiang.com',
        fallback: '飞象', badge: '智慧教育AI', desc: '基于猿力大模型的智能双师课堂、个性化错题举一反三与AI作业批改系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_4', title: '好未来九章大模型', url: 'https://www.mathgpt.com',
        fallback: '九章', badge: '学而思数学AI', desc: '学而思专为中小学数学与理科逻辑推理研发的大模型，分步骤动画讲解压轴题', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_5', title: '作业帮银河大模型', url: 'https://www.zuoyebang.com',
        fallback: '作业', badge: '全科解题AI', desc: '覆盖小初高全学段海量真题题库、中英文作文AI逐句精批与古诗文解析', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_6', title: '高途考研AI助手', url: 'https://www.gaotu.cn',
        fallback: '高途', badge: '考研考公规划', desc: '根据目标院校分数线智能定制复习计划、申论AI批改与英语长难句拆解', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_7', title: '粉笔公考AI刷题', url: 'https://www.fenbi.com',
        fallback: '粉笔', badge: '考公考编神器', desc: '行测百万真题智能组卷、申论AI人工双轨精准估分与面试AI模拟对练平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_8', title: 'Duolingo Max 多邻国', url: 'https://www.duolingo.cn',
        fallback: '多邻', badge: 'GPT4学外语', desc: '全球数亿人着迷的游戏化免费学40国语言平台，支持AI角色扮演与错因精讲', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_9', title: 'Speak AI 口语', url: 'https://www.speak.com',
        fallback: 'SP', badge: 'OpenAI投资口语', desc: 'OpenAI创业基金领投的超高拟真AI英语口语私教，实时纠正地道发音与语法表达', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_10', title: 'ELSA Speak', url: 'https://elsaspeak.com',
        fallback: 'ELSA', badge: '音标发音纠错', desc: '谷歌AI投资的音素级英语口音纠正教练，精准指出舌位与重音偏差助力雅思高分', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_11', title: 'Cambly AI 外教', url: 'https://www.cambly.com',
        fallback: 'CB', badge: '欧美真人+AI', desc: '随时连线英美母语外教与免费AI外教无压力练习商务英语与留学面试', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_12', title: 'Quizlet Q-Chat', url: 'https://quizlet.com',
        fallback: 'QZ', badge: 'AI记忆闪卡', desc: '上传课堂笔记瞬间生成正反面抽认记忆卡与AI互动测验游戏的全球背书神器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_13', title: 'Photomath', url: 'https://photomath.com',
        fallback: 'PM', badge: '拍照秒解微积分', desc: '谷歌旗下手机对准手写或印刷数学公式，秒出多种解法步骤与函数函数图像', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_14', title: 'WolframAlpha', url: 'https://www.wolframalpha.com',
        fallback: 'WA', badge: '计算知识引擎', desc: '人类科学知识计算引擎，精确求解高等数学、量子物理、化学分子与天文学难题', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_edu_15', title: 'GeoGebra 动态几何', url: 'https://www.geogebra.org',
        fallback: 'GG', badge: '交互式数学画板', desc: '全球师生免费的3D函数绘图、平面立体几何动态推演与微积分可视化神器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_16', title: 'Desmos 图形计算器', url: 'https://www.desmos.com',
        fallback: 'DM', badge: '极美函数绘图', desc: '丝滑绘制极坐标、参数方程、傅里叶级数动画的现代在线科学图形计算器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_17', title: 'Symbolab', url: 'https://zs.symbolab.com',
        fallback: 'SB', badge: '高等数学步解', desc: '支持中文的偏微分方程、矩阵线性代数、拉普拉斯变换全步骤推导计算器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_18', title: 'Brilliant.org', url: 'https://brilliant.org',
        fallback: 'BR', badge: '互动探索数理', desc: '抛弃死记硬背，通过交互式游戏拼图掌握神经网络、量子计算与高等数学思维', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_19', title: 'MagicSchool AI', url: 'https://www.magicschool.ai',
        fallback: 'MS', badge: '教师备课神器', desc: '专为中小学与大学老师打造的60+款AI备课工具：一键写教案、出试卷、写评语', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_edu_20', title: 'Curipod', url: 'https://curipod.com',
        fallback: 'CP', badge: '互动课堂PPT', desc: '输入本节课主题，AI自动生成带实时投票、词云、画板与头脑风暴的互动课件', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_edu_21', title: 'Diffit for Teachers', url: 'https://web.diffit.me',
        fallback: 'DF', badge: '分级阅读生成', desc: '将任意新闻或学术文章一键改写为适配不同年级词汇量与阅读理解题的教学材料', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_edu_22', title: 'QuestionWell', url: 'https://www.questionwell.org',
        fallback: 'QW', badge: '视频文档出题', desc: '导入YouTube视频或教材PDF，AI自动生成高质量选择题、填空题并导出至Kahoot', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_edu_23', title: '中国大学MOOC慕课', url: 'https://www.icourse163.org',
        fallback: '慕课', badge: '名校国家精品课', desc: '教育部高教社联手网易推出的清华北大等985名校上万门免费公开课与AI助教', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_24', title: '学堂在线雨课堂', url: 'https://www.xuetangx.com',
        fallback: '学堂', badge: '清华大学慕课', desc: '清华大学发起的全球慕课平台，搭载智谱GLM驱动的24小时课程专属AI助教', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_25', title: '国家中小学智慧教育平台', url: 'https://basic.smartedu.cn',
        fallback: '国家', badge: '教育部官方全科', desc: '教育部官方免费提供小学到高中全版本高清电子课本与特级教师名师同步网课', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_26', title: '国家高等教育智慧教育', url: 'https://higher.smartedu.cn',
        fallback: '高教', badge: '大学全专业课', desc: '汇聚全国顶尖高校数万门计算机、医学、法学、工学核心专业视频课程与虚拟仿真实验', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_27', title: 'Coursera AI', url: 'https://www.coursera.org',
        fallback: 'CS', badge: '斯坦福名校证书', desc: '吴恩达创办、联手斯坦福谷歌IBM提供全球顶尖AI学位课程与Coursera Coach私教', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_28', title: 'edX 麻省理工公开课', url: 'https://www.edx.org',
        fallback: 'edX', badge: '哈佛MIT联办', desc: '哈佛大学与麻省理工学院联合创办的全球顶级计算机与科学开源课程殿堂', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_29', title: 'DeepLearning.AI', url: 'https://www.deeplearning.ai',
        fallback: 'DL', badge: '吴恩达AI短课', desc: '吴恩达联手OpenAI/Meta官方出品的免费1小时掌握Agent、RAG与微调实战短课', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_30', title: 'Fast.ai', url: 'https://www.fast.ai',
        fallback: 'FA', badge: '平民深度学习', desc: '最接地气的免费实战深度学习公开课，会写Python就能亲手训练顶尖视觉与语言模型', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_31', title: '欧路词典AI翻译', url: 'https://www.eudic.net',
        fallback: '欧路', badge: '自定义词库霸主', desc: '支持AI语境精讲、PDF文献取词与每日英语听力无缝同步的学霸级专业词典', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_32', title: 'DeepL Write', url: 'https://www.deepl.com/write',
        fallback: 'DLW', badge: '学术母语润色', desc: '全球最自然准确的AI多语种翻译与英文学术邮件、论文地道表达重塑神器', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_edu_34', title: 'Trancy AI 语言学习', url: 'https://www.trancy.org',
        fallback: 'TC', badge: '看Netflix学外语', desc: '专为YouTube与Netflix打造的双语AI字幕跟读、生词本提取与语法拆解神器', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_35', title: 'YouGlish', url: 'https://youglish.com',
        fallback: 'YG', badge: '真实视频查发音', desc: '输入任意英语单词，瞬间调出上万段TED演讲与美剧真实母语者发音切片', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_36', title: 'AnkiWeb 间隔重复', url: 'https://ankiweb.net',
        fallback: 'Anki', badge: '对抗遗忘曲线', desc: '医学法学考研党封神的艾宾浩斯遗忘曲线开源记忆卡片同步平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_37', title: 'RemNote', url: 'https://www.remnote.com',
        fallback: 'RN', badge: '笔记秒变闪卡', desc: '边记双链大纲笔记边用AI自动生成间隔重复记忆卡的学霸一体化知识库', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_38', title: 'Gauth AI', url: 'https://www.gauthmath.com',
        fallback: 'GT', badge: '字节海外解题王', desc: '横扫欧美教育榜第一的AI数理化生全科拍照解题与24小时导师答疑平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_39', title: 'Question.AI', url: 'https://www.questionai.com',
        fallback: 'QAI', badge: '全科作业助手', desc: '支持多国语言的扫描识题、分步演算与概念延展提问的AI学习伴侣', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_edu_40', title: 'PhET 科罗拉多仿真实验', url: 'https://phet.colorado.edu/zh_CN',
        fallback: 'PhET', badge: '诺奖级互动实验', desc: '诺贝尔物理学奖得主创办的数百个免费在线物理、化学、生物交互式仿真实验室', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_13', title: '卖家精灵SellerSprite', url: 'https://www.sellersprite.com',
        fallback: '精灵', badge: '亚马逊选品王', desc: '百万亚马逊卖家必备的大数据AI选品、关键词反查、競品销量透视与Review分析', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_14', title: '鸥鹭选品Oulu', url: 'https://www.oalur.com',
        fallback: '鸥鹭', badge: '跨境AI大数据', desc: '基于AI预测模型的亚马逊蓝海类目挖掘、Listing智能撰写与广告ACOS优化', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_15', title: 'Jungle Scout', url: 'https://www.junglescout.cn',
        fallback: 'JS', badge: '全球亚马逊霸主', desc: '全球跨境电商选品鼻祖，搭载AI Review分析与智能销售预测系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_16', title: 'Helium 10', url: 'https://www.helium10.com',
        fallback: 'H10', badge: '亚马逊全栈运营', desc: '集成ChatGPT Listing构建器、关键词霸屏追踪与库存索赔的30合一跨境军刀', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_17', title: 'FastMoss 嘀嗒狗', url: 'https://www.fastmoss.com',
        fallback: 'FM', badge: 'TikTok数据分析', desc: '全球排名第一的TikTok直播带货榜、爆款短视频带货商品与达人建联大数据平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_18', title: 'Kalodata', url: 'https://www.kalodata.com',
        fallback: 'KD', badge: 'TikTok爆品挖掘', desc: '用AI洞察全球各国TikTok小店实时成交额、带货视频脚本拆解与爆款趋势', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_19', title: '蝉妈妈AI电商', url: 'https://www.chanmama.com',
        fallback: '蝉', badge: '抖音直播大数据', desc: '抖音爆品挖掘、达人带货ROI分析、直播间话术复盘与蝉镜AI数字人全栈平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_20', title: '灰豚数据', url: 'https://www.huitun.com',
        fallback: '豚', badge: '小红书抖音数据', desc: '全量监测抖音、小红书、快手直播带货数据与爆款笔记热词趋势', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_21', title: '新榜AI新媒体', url: 'https://www.newrank.cn',
        fallback: '新榜', badge: '全平台内容数据', desc: '微信公众号、视频号、小红书、B站全网自媒体排行榜与矩阵AI创作运营平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_22', title: '千瓜数据', url: 'https://www.qian-gua.com',
        fallback: '千瓜', badge: '小红书种草AI', desc: '深度解析小红书爆款种草笔记舆情、品牌投放结案报告与高互动标题AI生成', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_23', title: '飞瓜数据', url: 'https://www.feigua.cn',
        fallback: '飞瓜', badge: '短视频直播智库', desc: '全方位追踪短视频热点BGM、品牌自播转化漏斗与竞品投流策略', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_24', title: 'Shopify Magic', url: 'https://www.shopify.com/magic',
        fallback: 'SP', badge: '独立站AI建站', desc: '全球最大独立站平台内置AI套件：自动生成多语言商品详情、邮件营销与智能客服', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_25', title: '店匠Shoplazza AI', url: 'https://www.shoplazza.cn',
        fallback: '店匠', badge: '国货出海独立站', desc: '集成AI智能落地页生成、高转化结账优化与全球收款物流的DTC品牌出海平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_26', title: '领星ERP', url: 'https://www.lingxing.com',
        fallback: '领星', badge: '跨境电商ERP', desc: '连接亚马逊、沃尔玛、TikTok等数十个平台的AI补货预测、广告自动化与财务核算ERP', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_27', title: '店小秘ERP', url: 'https://www.dianxiaomi.com',
        fallback: '小秘', badge: '免费跨境ERP', desc: '超百万卖家使用的免费跨境电商采集刊登、AI翻译修图与全球打单发货系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_28', title: '聚水潭ERP', url: 'https://www.jushuitan.com',
        fallback: '聚水', badge: '国内电商协同', desc: '全国每5个包裹就有1个由其处理的智能云仓WMS与全渠道电商订单ERP', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_29', title: 'Jasper AI', url: 'https://www.jasper.ai',
        fallback: 'JP', badge: '海外营销文案王', desc: '专为企业市场部打造的生成式AI营销中枢，统一品牌语调批量产出SEO博文与广告', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_ec_30', title: 'Copy.ai', url: 'https://www.copy.ai',
        fallback: 'CP', badge: 'GTM销售自动化', desc: '将市场获客与B2B外贸开发信全流程自动化的AI GTM工作流平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_ec_37', title: 'Manychat AI', url: 'https://manychat.com',
        fallback: 'MC', badge: 'IG/WhatsApp私域', desc: '全球第一的Instagram评论自动私信成交、TikTok与WhatsApp全天候AI私域导购', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_38', title: 'Tidio Lyro AI', url: 'https://www.tidio.com',
        fallback: 'TD', badge: '独立站AI客服', desc: '学习你的店铺商品库后自动解决70%尺码、物流与退换货咨询的独立站AI客服', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_39', title: 'Gorgias AI', url: 'https://www.gorgias.com',
        fallback: 'GG', badge: 'Shopify客服霸主', desc: '深度打通Shopify后台订单修改、自动退款与多渠道工单汇总的电商专属AI客服', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ec_40', title: 'Semrush AI', url: 'https://zh.semrush.com',
        fallback: 'SR', badge: '全球SEO流量王', desc: '全球数字营销标杆，一键透视竞争对手Google自然搜索词、外链与付费广告预算', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_arch_5', title: '广联达AI数字建筑', url: 'https://www.glodon.com',
        fallback: '广联', badge: '工程造价AI', desc: '国内建筑工程信息化龙头：AI智能算量计价、CAD图纸自动识图建模与智慧工地管理', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_arch_6', title: '品茗科技智慧工地', url: 'https://www.pinming.cn',
        fallback: '品茗', badge: '施工安全AI', desc: '建筑施工BIM脚手架模板安全计算、塔吊AI视觉防碰撞与工程资料自动化软件', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_sci_1', title: 'Consensus AI', url: 'https://consensus.app',
        fallback: 'CS', badge: '2亿论文求证', desc: '直接向2亿篇经过同行评审的SCI科学论文提问，每句结论均附真实文献引文出处', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_2', title: 'Elicit AI', url: 'https://elicit.com',
        fallback: 'EL', badge: 'AI文献综述', desc: '专为科研人员打造的AI研究助手：自动检索相关论文、批量提取实验变量生成对比表格', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_3', title: 'Scite.ai', url: 'https://scite.ai',
        fallback: 'SC', badge: '智能引文验证', desc: '不仅看论文被引用多少次，更能用AI精准识别后续研究是『支持』还是『反驳』该论文结论', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_4', title: 'Connected Papers', url: 'https://www.connectedpapers.com',
        fallback: 'CP', badge: '文献脉络图谱', desc: '输入一篇种子论文，秒级生成该领域开山之作与最新演进关系的交互式可视化学术网', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_5', title: 'ResearchRabbit', url: 'https://www.researchrabbit.ai',
        fallback: 'RR', badge: '文献Spotify', desc: '像听歌单一样追踪学术领域动态，自动构建作者合作网络与个性化新发预印本提醒', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_6', title: 'Litmaps', url: 'https://www.litmaps.com',
        fallback: 'LM', badge: '时间轴文献网', desc: '按发表时间与引用权重自动排列领域核心文献，绝不漏掉任何一篇必读综述', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_7', title: 'Semantic Scholar', url: 'https://www.semanticscholar.org',
        fallback: 'S2', badge: '艾伦AI学术搜', desc: '艾伦人工智能研究所出品的免费AI学术搜索引擎，提供TLDR一句话论文核心贡献提炼', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_8', title: 'SciSpace (Typeset)', url: 'https://typeset.io',
        fallback: 'SS', badge: '边读边问PDF', desc: '圈选PDF论文里看不懂的复杂数学公式或统计图表，AI即刻用中文大白话为你深度推导解释', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_9', title: 'ChatPDF', url: 'https://www.chatpdf.com',
        fallback: 'PDF', badge: '对话百页文献', desc: '把数百页英文学术专著或行业年报拖进去，像跟作者聊天一样秒找核心实验数据与页码', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_10', title: 'Humata AI', url: 'https://www.humata.ai',
        fallback: 'HM', badge: '技术文档精读', desc: '专为复杂工程手册、医学临床报告与长篇学术论文打造的精准溯源问答AI', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_11', title: 'Scholarcy', url: 'https://www.scholarcy.com',
        fallback: 'SY', badge: '文献闪卡提炼', desc: '数秒内将长篇SCI论文拆解为研究背景、实验方法、核心发现与局限性结构化摘要闪卡', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_12', title: 'Paperpal', url: 'https://paperpal.com',
        fallback: 'PP', badge: 'SCI投稿润色', desc: '爱思唯尔与Nature等顶级期刊合作推荐的AI学术英文语法精修、同义学术词替换与投稿预审', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_13', title: 'Writefull', url: 'https://www.writefull.com',
        fallback: 'WF', badge: 'Overleaf学术AI', desc: '深度集成Overleaf LaTeX编辑器的AI英文论文语句补全、摘要自动生成与标题打磨神器', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_14', title: 'Trinka AI', url: 'https://www.trinka.ai',
        fallback: 'TK', badge: '医学理工润色', desc: '专为医学、计算机与工程学科论文打造的英式美式学术规范检查与期刊匹配AI', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_15', title: 'QuillBot', url: 'https://quillbot.com',
        fallback: 'QB', badge: '英文降重改写', desc: '全球留学生与科研人员必备的AI英文段落学术改写、降重同义转换与引文格式生成器', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_sci_16', title: 'Jenni AI', url: 'https://jenni.ai',
        fallback: 'JN', badge: 'AI学术写作台', desc: '边写论文边由AI自动检索真实DOI文献插入角标引用的智能学术写作编辑器', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_17', title: 'Overleaf 云端LaTeX', url: 'https://www.overleaf.com',
        fallback: 'OL', badge: '全球LaTeX标配', desc: '免配本地环境！全球高校实验室多人实时协同编写IEEE/ACM/CVPR顶会LaTeX论文云平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_18', title: 'Mathpix Snip', url: 'https://mathpix.com',
        fallback: 'MP', badge: '截图秒转LaTeX', desc: '截图复杂的手写或PDF微积分矩阵公式，1秒精准转换为可编辑LaTeX与Word公式代码', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_19', title: 'SimpleTex', url: 'https://simpletex.cn',
        fallback: 'ST', badge: '国产免费公式OCR', desc: '国内极客打造的完全免费高准确率数学公式与复杂表格截图转LaTeX/Markdown神器', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_21', title: '知云文献翻译', url: 'https://www.zhiyunwenxian.cn',
        fallback: '知云', badge: '研究生看英文文献', desc: '国内百万硕博研究生电脑必装的边读PDF英文文献边调用多AI大模型侧边栏对照翻译器', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_22', title: 'ReadPaper 论文阅读', url: 'https://readpaper.com',
        fallback: 'RP', badge: '粤港澳AI实验室', desc: '集文献管理、中英双语全文对照翻译、同行批注笔记与AI科研助手于一体的中文学术社区', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_23', title: 'AMiner 科技情报', url: 'https://www.aminer.cn',
        fallback: 'AM', badge: '清华唐杰团队', desc: '清华大学计算机系打造的全球学者画像、顶会必读论文追踪与智谱清言学术搜索平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_24', title: '小木虫学术科研', url: 'http://muchong.com',
        fallback: '木虫', badge: '硕博国自然交流', desc: '国内最大硕博研究生、高校青椒探讨国家自然科学基金申报、SCI选刊审稿周期与实验技巧社区', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_25', title: '科学网Sciencenet', url: 'https://www.sciencenet.cn',
        fallback: '科学', badge: '中科院院士博客', desc: '中国科学院、工程院与国家自然科学基金委主办的华人科学家实名博客与前沿学术门户', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_26', title: 'X-MOL 化学材料资讯', url: 'https://www.x-mol.com',
        fallback: 'XM', badge: '化学材料生物顶刊', desc: '实时追踪Nature/Science/JACS/Angew化学、材料与生物医药顶级期刊每日最新成果导读', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_27', title: 'BioRender 生物科研绘图', url: 'https://www.biorender.com',
        fallback: 'BR', badge: '顶刊细胞机制图', desc: 'Nature/Cell封面级生命科学免疫细胞、信号通路、动物实验模式图拖拽式在线绘制神站', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_28', title: 'Figdraw 科研绘图', url: 'https://www.figdraw.com',
        fallback: 'FD', badge: '国产SCI机制图', desc: '科研者之家出品的国内首款开放式在线SCI生物医学论文插图、通路机制图免抠素材平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_29', title: '科研者之家Home for Researchers', url: 'https://www.home-for-researchers.com',
        fallback: '科研', badge: 'SCI写作工具箱', desc: '集合AI学术翻译、写作语料库、CNS配色方案生成器与中英文摘要互译的本土科研百宝箱', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_30', title: 'LetPub 期刊影响因子查询', url: 'https://www.letpub.com.cn',
        fallback: 'LP', badge: '中科院分区查询', desc: '秒查全球SCI期刊最新中科院大小类分区、JCR影响因子、自引率、审稿速度与版面费', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_31', title: 'AbleSci 科研通', url: 'https://www.ablesci.com',
        fallback: '通', badge: '秒求收费文献', desc: '国内高校师生互助秒速下载难找的外文闭源SCI文献、标准规范与经典英文原版教材平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_32', title: 'arXiv 预印本顶会库', url: 'https://arxiv.org',
        fallback: 'arX', badge: '全球AI物理首发', desc: '康奈尔大学运营的全球人工智能、理论物理、数学与计算机科学最新突破论文第一时间首发地', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_34', title: 'AlphaXiv', url: 'https://www.alphaxiv.org',
        fallback: 'aX', badge: 'arXiv论文同行讨论', desc: '在任意arXiv预印本论文页面直接开启全球研究者逐行公开评论、复现质疑与作者答疑', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_35', title: 'Hugging Face Daily Papers', url: 'https://huggingface.co/papers',
        fallback: 'HFP', badge: '每日最火AI论文', desc: '由AK大神每日精选全球最具突破性的大模型、多模态与具身智能论文及在线Demo试玩', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_36', title: 'OpenReview 顶会审稿网', url: 'https://openreview.net',
        fallback: 'OR', badge: 'ICLR/NeurIPS公开审稿', desc: '完全透明查看全球AI顶级会议ICLR、NeurIPS、ICML每篇投稿论文的审稿人打分与Rebuttal交锋', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_37', title: 'Google Scholar 谷歌学术', url: 'https://scholar.google.com',
        fallback: 'GS', badge: '全球学术搜索王', desc: '检索全球各个学科领域学术文献、专利、高被引学者H指数与引用格式的权威入口', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_38', title: 'PubMed 生物医学库', url: 'https://pubmed.ncbi.nlm.nih.gov',
        fallback: 'PM', badge: '美国NIH医学文献', desc: '美国国立卫生研究院免费开放的3600万篇全球生物医学与生命科学临床核心文献数据库', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_39', title: '国家哲学社会科学文献中心', url: 'https://www.ncpssd.cn',
        fallback: '社科', badge: '社科院免费下论文', desc: '中国社会科学院主办！完全免费在线阅读与下载千万篇中文人文社科核心期刊论文', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_40', title: '中国知网CNKI AI', url: 'https://www.cnki.net',
        fallback: '知网', badge: '国内博硕期刊总库', desc: '收录全国99%以上学术期刊、博士硕士学位论文、会议论文与知网AI学术研究助手', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_41', title: '万方数据知识服务', url: 'https://www.wanfangdata.com.cn',
        fallback: '万方', badge: '学术期刊科技报告', desc: '涵盖国内核心期刊、学位论文、中外专利、国家行业标准与科技成果的综合知识库', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_42', title: '维普资讯中文期刊', url: 'http://www.cqvip.com',
        fallback: '维普', badge: '职称期刊检索', desc: '中国最早的中文科技期刊全文数据库与维普论文查重检测官方服务平台', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_43', title: 'Zotero 开源文献管理', url: 'https://www.zotero.org',
        fallback: 'ZT', badge: '科研党封神插件', desc: '完全免费开源、支持接入GPT翻译总结插件与Word一键排参考文献的跨平台文献管理神器', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_sci_45', title: 'Storm (Stanford)', url: 'https://storm.genie.stanford.edu',
        fallback: 'STM', badge: '斯坦福自动写维基', desc: '斯坦福大学开源多智能体研究系统：输入一个主题，自动全网深度检索多视角资料写出万字带引用的维基百科级综述', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_24', title: 'Physical Intelligence (π0)', url: 'https://www.physicalintelligence.company',
        fallback: 'PI', badge: '通用具身机器人大脑', desc: '硅谷顶级具身智能独角兽，研发能控制各种机械臂叠衣服、装购物袋、收拾桌面的通用物理大模型π0', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_25', title: 'Figure AI 人形机器人', url: 'https://www.figure.ai',
        fallback: 'FG', badge: 'OpenAI加持人形机器人', desc: '搭载端到端视觉语言动作大模型VLA、已在宝马工厂实训自主装配作业的硅谷明星双足人形机器人', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_26', title: '宇树科技 Unitree', url: 'https://www.unitree.com',
        fallback: '宇树', badge: '国产春晚人形机器狗', desc: '全球四足机器狗销量冠军与G1/H1全尺寸高动态具身智能人形机器人领军企业', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_27', title: '智元机器人 AgiBot', url: 'https://www.agibot.com',
        fallback: '智元', badge: '稚晖君具身智能', desc: '野生钢铁侠稚晖君创立的远征系列商用双足人形机器人与开源具身智能百万真机数据集AgiBot World', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_28', title: '银河通用机器人 Galbot', url: 'https://www.galbot.com',
        fallback: '银河', badge: '北大具身大模型机器人', desc: '依托十亿级合成三维仿真数据训练的通用泛化抓取与无人药店/商超全自主值守具身机器人', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_29', title: '傅利叶智能 Fourier', url: 'https://www.fftai.com',
        fallback: '傅', badge: 'GR系列通用人形机器人', desc: '从全球领先外骨骼医疗康复机器人跨界通用人形机器人GR-1/GR-2的硬核具身智能企业', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_30', title: '优必选 UBTECH', url: 'https://www.ubtrobot.com',
        fallback: '优必', badge: '人形机器人第一股', desc: 'Walker S系列工业人形机器人已批量进入蔚来、比亚迪、吉利汽车总装车间实训协同作业', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_31', title: '星动纪元 RobotEra', url: 'https://www.robotera.com',
        fallback: '星动', badge: '清华大学人形机器人', desc: '清华大学交叉信息院孵化、原生机器人大模型驱动的高自由度灵巧手与全尺寸人形机器人', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_32', title: '众擎机器人 EngineAI', url: 'https://www.engineai.com.cn',
        fallback: '众擎', badge: '拟人自然步态前空翻', desc: '深圳硬核具身智能新锐，全球首款实现人类自然拟人步态行走与原地前空翻的双足人形机器人', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_33', title: '云深处科技 DEEP Robotics', url: 'https://www.deeprobotics.cn',
        fallback: '云深', badge: '绝影工业四足机器狗', desc: '杭州六小龙之一！专精电力巡检、隧道消防侦察与极端越野全天候作业的工业级四足与轮足机器人', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_3d_34', title: '群核科技 SpatialVerse', url: 'https://www.spatialverse.com',
        fallback: 'SV', badge: '具身智能室内仿真训练场', desc: '基于酷家乐亿级真实室内三维空间资产，为全球具身智能机器人提供物理逼真的室内合成训练环境', sub: 'research_eval',
      ),
      LzSite(
        id: 'ind_av_40', title: 'Podwise AI 播客笔记', url: 'https://podwise.ai',
        fallback: 'PW', badge: '听外文播客秒出中文脑图', desc: '专为播客听众打造的AI知识提取器：自动把2小时英文硅谷创投播客提炼成中英对照大纲、金句与Notion卡片', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_av_41', title: 'Snipd AI Podcast', url: 'https://www.snipd.com',
        fallback: 'SN', badge: '轻触耳机截取播客金句', desc: '带着耳机听播客时轻点两下，AI自动帮你把刚刚听到的3分钟精彩观点剪辑成文字卡片同步Readwise', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_of_1', title: '飞书智能伙伴 (Lark AI)', url: 'https://www.feishu.cn',
        fallback: '飞书', badge: '先进团队AI协作工作台', desc: '字节跳动打造的集多维表格AI自动化、妙记音视频转写纪要、知识库智能问答于一体的组织引擎', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_2', title: '钉钉AI助理 (通义加持)', url: 'https://www.dingtalk.com',
        fallback: '钉钉', badge: '7亿人的AI办公超级助理', desc: '阿里云通义大模型全面重塑：一句话创建宜搭低代码审批流、自动汇总未读群聊与智能排班', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_3', title: 'WPS AI 金山办公', url: 'https://ai.wps.cn',
        fallback: 'WPS', badge: '国产国民Office伴侣', desc: '深度内嵌文字、表格、演示与PDF：一句话写公文通知、自然语言写Excel复杂函数公式、文档秒转精美PPT', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_4', title: '语雀 AI (蚂蚁集团)', url: 'https://www.yuque.com',
        fallback: '语雀', badge: '支付宝工程师御用知识库', desc: '蚂蚁集团出品的极简优雅结构化知识库，支持花园小记、AI续写润色与技术团队文档沉淀', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_5', title: '腾讯文档智能助手', url: 'https://docs.qq.com',
        fallback: '腾文', badge: '微信QQ无缝协同在线Office', desc: '支持百人同时在线填收集表、Excel智能透视表生成、Word转思维导图与PDF全套免装转换', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_6', title: '石墨文档 AI', url: 'https://shimo.im',
        fallback: '石墨', badge: '中国最早云端协同文档', desc: '东方美学极简排版，支持多人毫秒级同步编辑文档、表格、幻灯片与企业知识空间', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_7', title: 'Wolai 我来笔记', url: 'https://www.wolai.com',
        fallback: '我来', badge: '钉钉旗下块编辑双链笔记', desc: '融合块级自由拖拽排版、页面双向链接与丰富数据库视图的本土化个人与团队数字工作区', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_8', title: 'FlowUs 息流', url: 'https://flowus.cn',
        fallback: '息流', badge: '多维表+网盘+AI笔记一体', desc: '专为国内用户优化的Notion替代方案，原生集成云端文件夹网盘、思维导图与AI写作助手', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_9', title: 'flomo 浮墨笔记', url: 'https://flomoapp.com',
        fallback: '浮墨', badge: '像发微博一样无压记灵感', desc: '通过微信服务号随时随地秒记闪念卡片，利用多级标签与每日漫游让散落的碎片想法自然涌现连接', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_10', title: '幕布 Mubu', url: 'https://mubu.com',
        fallback: '幕布', badge: '大纲笔记一键变思维导图', desc: '极简树状结构化大纲笔记神器，回车Tab梳理读书笔记与项目拆解后一键切换为高颜值思维导图', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_13', title: '通义听悟 (阿里免费转写)', url: 'https://tingwu.aliyun.com',
        fallback: '听悟', badge: '每天免费送大量音视频转写', desc: '阿里云良心之作！开会录音、网课视频、B站播客链接一键转逐字稿、区分发言人并提炼章节纪要与PPT脑图', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_14', title: '飞书妙记', url: 'https://www.feishu.cn/product/minutes',
        fallback: '妙记', badge: '音视频秒变可搜索交互文稿', desc: '把2小时会议或采访录像变成可倍速定位每个词、自动翻译多国字幕与智能提炼待办事项的神器', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_15', title: '讯飞听见', url: 'https://www.iflyrec.com',
        fallback: '听见', badge: '国家重大会议同传转写级', desc: '科大讯飞旗舰级多语种语音转文字、专业人工精转、同声传译字幕上屏与AI会议纪要平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_16', title: 'Otter.ai', url: 'https://otter.ai',
        fallback: 'OT', badge: '英文跨国会议AI速记王', desc: '自动加入你的Zoom/Google Meet/Teams英文跨国会议，实时转写英语发言、抓拍共享屏幕PPT并生成总结邮件', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_17', title: 'Fireflies.ai', url: 'https://fireflies.ai',
        fallback: 'FF', badge: '销售与招聘会议AI分析', desc: '自动记录所有客户沟通电话，统计双方说话占比、情绪倾向并把关键承诺自动同步进Salesforce/HubSpot', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_18', title: 'Fathom AI Notetaker', url: 'https://fathom.video',
        fallback: 'FT', badge: 'Zoom官方高赞免费会议AI', desc: '对个人完全免费的Zoom/Teams高清会议录制、重点高亮打标与30秒生成结构化复盘摘要工具', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_19', title: 'Granola AI', url: 'https://www.granola.so',
        fallback: 'GN', badge: '硅谷最火无机器人会议笔记', desc: '不需要往会议室塞尴尬的录音Bot！结合你手敲的几个关键词与系统音频，会后秒出大师级结构化会议纪要', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_20', title: '闪击PPT (MindShow)', url: 'https://www.mindshow.fun',
        fallback: 'MS', badge: '大纲秒变精美可编辑PPT', desc: '国内最早的AI演示文稿生成器之一：输入主题或导入Word/Markdown，秒级自动排版切换数十套商务模板', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_21', title: '歌者AI PPT (Gezhe)', url: 'https://gezhe.com',
        fallback: '歌者', badge: '长文档链接免费生成PPT', desc: '支持直接粘贴网页链接或上传几十页PDF报告，AI深度提炼逻辑骨架生成图文并茂的汇报PPT', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_22', title: '轻竹办公 AI PPT', url: 'https://www.qzoffice.com',
        fallback: '轻竹', badge: '学术答辩工作总结PPT', desc: '专为大学生毕业答辩、教师公开课、国企年终述职定制的本土化高颜值AI一键生成PPT平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_23', title: '美图AI PPT', url: 'https://www.designkit.com/ppt',
        fallback: '美PPT', badge: '设计师级审美AI幻灯片', desc: '美图秀秀设计团队倾力打造，告别土味模板，一句话生成极具时尚杂志感与国潮美学的演示文稿', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_24', title: 'iSlide AI PPT插件', url: 'https://www.islide.cc',
        fallback: 'iS', badge: '千萬职场人装机PowerPoint神插件', desc: '直接嵌入Office/WPS的38个一键对齐排版设计辅助工具、30万正版商业图示库与AI大纲生PPT', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_25', title: 'Beautiful.ai', url: 'https://www.beautiful.ai',
        fallback: 'BA', badge: '自动遵循设计规范的智能PPT', desc: '无论你往幻灯片里加多少字或图表，AI布局引擎都会像专业设计师一样实时自动调整间距与对齐', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_26', title: 'Pitch', url: 'https://pitch.com',
        fallback: 'PT', badge: '硅谷创投路演BP神器', desc: '全球顶尖初创公司制作融资Pitch Deck路演PPT的首选平台，内置AI生成与投资人阅读时长追踪', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_27', title: '酷表 ChatExcel (北大团队)', url: 'https://chatexcel.com',
        fallback: '酷表', badge: '跟Excel说话就能做表算数据', desc: '北京大学团队出品！不用记VLOOKUP和宏代码，直接打字说『把A列去重并按销售额降序标红』秒出结果表', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_28', title: 'Formula Bot', url: 'https://formulabot.com',
        fallback: 'FB', badge: '自然语言秒转Excel/SQL公式', desc: '把复杂的业务计算需求翻译成精准的Excel函数、VBA脚本、Google Sheets正则与SQL查询语句', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_29', title: 'Rows.com', url: 'https://rows.com',
        fallback: 'RW', badge: '内置OpenAI的现代云端电子表格', desc: '把电子表格、OpenAI批量数据清洗、社交媒体API抓数与高颜值嵌入图表合二为一的新一代Excel', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_30', title: 'Airtable Cobuilder', url: 'https://www.airtable.com',
        fallback: 'AT', badge: '硅谷无代码关系型多维表格鼻祖', desc: '用AI一句话生成覆盖项目管理、CRM客户跟进、内容排期与自动化脚本的企业级数字化业务系统', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_31', title: '超级简历 WonderCV', url: 'https://www.wondercv.com',
        fallback: '超简', badge: '名企HR认证ATS高通过率简历', desc: '百万名校毕业生与海归投递大厂、外企、投行咨询首选的中英文双语AI量化成果简历打磨平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_32', title: '木及简历', url: 'https://www.mujicv.com',
        fallback: '木及', badge: '极简Markdown程序员简历', desc: '专为程序员、产品经理与极客设计的清爽无套路在线Markdown双栏/单栏响应式简历排版工具', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_33', title: '老马简历 / 全民简历', url: 'https://www.qmjianli.com',
        fallback: '全民', badge: 'AI岗位JD精准匹配改简历', desc: '粘贴你心仪岗位的招聘JD，AI自动对照找出你简历里的技能缺失项并重写STAR法则项目经历', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_34', title: '多面鹅 OfferGoose', url: 'https://www.offergoose.com',
        fallback: '鹅', badge: '大厂真题AI实时面试助攻', desc: '针对互联网大厂、央国企、外企校招社招，提供八股文深挖追问、模拟压力面试与表达逻辑复盘AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_of_35', title: '白瓜面试', url: 'https://www.baiguamianshi.com',
        fallback: '白瓜', badge: '程序员算法与架构AI模拟面试', desc: '语音模拟真实技术二面三面：手撕LeetCode代码、高并发系统设计追问与行为面STAR话术辅导', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_of_36', title: '智联招聘AI易面', url: 'https://www.zhaopin.com',
        fallback: '智联', badge: 'AI数字人面试官与职业测评', desc: '国内老牌招聘巨头推出的AI简历诊断、行业薪酬水平大数据查询与数字人模拟面试平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_of_37', title: 'BOSS直聘南北阁大模型', url: 'https://www.zhipin.com',
        fallback: 'BOSS', badge: '找工作直接跟老板谈', desc: '搭载自研南北阁职业科学大模型，智能双向精准匹配求职者技能图谱与企业直招BOSS', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_of_38', title: '牛客网 AI (Nowcoder)', url: 'https://www.nowcoder.com',
        fallback: '牛客', badge: '互联网秋招春招笔试真题圣地', desc: '全国计算机与理工科大学生必刷的大厂历年笔试真题、AI模拟机考、面经分享与薪资爆料社区', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_of_39', title: '看准网企业点评', url: 'https://www.kanzhun.com',
        fallback: '看准', badge: '入职前查公司真实加班薪资', desc: '汇集数千万职场人匿名曝出的真实公司年终奖、五险一金比例、加班文化与面试难度避坑指南', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_of_40', title: '脉脉职场社区', url: 'https://maimai.cn',
        fallback: '脉脉', badge: '实名职场人脉与大厂内推', desc: '中高端互联网、新能源汽车、芯片AI行业员工匿名职言动态、猎头直连与内部内推码获取阵地', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_of_41', title: 'Moka Eva 智能招聘HR', url: 'https://www.mokahr.com',
        fallback: 'Moka', badge: '新生代企业AI招聘管理系统', desc: '赋能腾讯小米等数千家名企的AI简历智能初筛、面试官评语自动生成与人才库激活HR SaaS', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_42', title: '北森 iTalentX AI', url: 'https://www.beisen.com',
        fallback: '北森', badge: '一体化HR SaaS与AI领导力教练', desc: '中国最大云端人力资源管理平台，涵盖校招测评题库、绩效管理、继任者计划与AI员工陪练', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_43', title: '公文写作AI (笔杆网)', url: 'https://www.bigan.net',
        fallback: '笔杆', badge: '体制内公文大材料写作神器', desc: '收录数百万篇权威党政机关讲话稿、调研报告、工作总结范文，提供排比金句金词库与AI公文起草', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_44', title: '新华妙笔', url: 'https://miaobi.xinhuaskl.com',
        fallback: '妙笔', badge: '新华社出品权威公文AI', desc: '新华社媒体融合生产技术国家重点实验室出品！政治表述零差错的体制内公文写作、审校与润色平台', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_of_45', title: '蜜度文修', url: 'https://wenxiu.midu.com',
        fallback: '文修', badge: '政务媒体政治错别字AI校对', desc: '专为政府机关、央企党宣与出版机构打造的领导人职务排序、敏感词、知识性差错与标点AI智能校对系统', sub: 'office_writing',
      ),
      LzSite(
        id: 'ind_ind_1', title: '百度智能云开物工业互联网', url: 'https://cloud.baidu.com/product/kaiwu.html',
        fallback: '开物', badge: '国家双跨工业大模型平台', desc: '赋能钢铁、电力、汽车、电子制造的AI视觉表面缺陷质检、设备预测性维护与能耗寻优平台', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_3', title: '阿里云ET工业大脑', url: 'https://et.aliyun.com/brain/industry',
        fallback: '工业', badge: '光伏化工良品率AI调优', desc: '深入车间产线PLC参数实时寻优，帮助水泥、化工、锂电、光伏龙头提升良品率并降低燃煤能耗', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_4', title: '卡奥斯 COSMOPlat (海尔)', url: 'https://www.cosmoplat.com',
        fallback: '卡奥', badge: '工信部榜首工业互联网平台', desc: '海尔打造的连接全球用户的B2M大规模定制工业互联网平台与天智工业大模型', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_5', title: '树根互联根云平台', url: 'https://www.rootcloud.com',
        fallback: '树根', badge: '三一重工孵化工程机械物联', desc: '实时连接全球百万台挖掘机、起重机、盾构机工况遥测数据与故障AI远程诊断的工业物联底座', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_6', title: '蓝卓 supOS 工业操作系统', url: 'https://www.supos.com',
        fallback: '蓝卓', badge: '褚健教授流程工业大脑', desc: '专为石化、炼油、制药、冶金等大型流程工业打造的工厂级智能操作系统与工艺控制AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_7', title: '创新奇智 ManuVision', url: 'https://www.ainnovation.com',
        fallback: '奇智', badge: 'AI+制造第一股孔明大模型', desc: '提供工业机器视觉液晶面板质检、智慧铁水运输调度与CAD生成式工业设计的AI解决方案', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_8', title: '阿丘科技 AIDI 工业视觉', url: 'https://www.aqrose.com',
        fallback: '阿丘', badge: '清华团队3C锂电AI质检', desc: '深耕消费电子、动力电池、半导体晶圆极微小划痕与焊接缺陷毫秒级深度学习视觉检测软件', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_9', title: '思谋科技 SmartMore', url: 'https://www.smartmore.com',
        fallback: '思谋', badge: '贾佳亚创立智能制造独角兽', desc: '融合光学成像、精密机械与IndustryGPT工业大模型的高速产线全自动质检与读码系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_12', title: '极飞科技智慧农业', url: 'https://www.xa.com',
        fallback: '极飞', badge: '全自主农业无人机与农机', desc: '利用AI农田遥感测绘、全自主飞行植保无人机、无人驾驶拖拉机与水肥一体化重塑现代农业', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_13', title: '大疆农业 DJI Agriculture', url: 'https://ag.dji.com/cn',
        fallback: '大疆', badge: '全球智慧农业植保领跑者', desc: '结合多光谱无人机巡田处方图AI分析作物长势、果树三维航线规划与变量精准施肥播撒', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_14', title: '丰农控股识农AI', url: 'https://www.shinong.com',
        fallback: '识农', badge: '拍照1秒识别农作物病虫害', desc: '对着果树叶片或庄稼拍张照，AI毫秒级诊断柑橘、水稻、小麦上百种病虫害并给出科学农技植保方案', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_ind_15', title: '中国农技推广信息平台', url: 'https://www.njtg.cn',
        fallback: '农技', badge: '农业农村部官方农技专家问诊', desc: '汇聚全国数十万基层农技员与农科院专家，免费在线解答种植养殖难题与农事气象预警', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_life_7', title: '西湖心辰 Xinchen AI', url: 'https://www.xinchenai.com',
        fallback: '心辰', badge: '西湖大学孵化心理咨询大模型', desc: '西湖大学蓝振忠团队研发，经过海量专业心理咨询对话训练的抑郁焦虑量表筛查与CBT认知行为倾诉AI', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_life_19', title: '小红书宠物AI / 宠医云', url: 'https://www.chongyiyun.com',
        fallback: '宠医', badge: '智慧宠物医院化验单解读与管理', desc: '赋能全国数千家动物医院的数字化病例管理、X光超声影像AI辅助判读与宠主随访系统', sub: 'tools_all',
      ),
      LzSite(
        id: 'ind_tech_50', title: 'LMSYS Chatbot Arena (全球大模型盲测竞技场)', url: 'https://lmarena.ai',
        fallback: 'Arena', badge: '全球唯一公认最权威的大模型真人双盲PK排行榜', desc: '输入同一个刁钻问题由两个匿名大模型同时作答，你投票选出胜者后揭晓身份，实时查看全球LLM真实战力Elo天梯榜', sub: 'research_eval',
      ),
    ],
  ),
  LzCategory(
    id: 'coding_tools', name: '编程工具', desc: '前沿AI编程助手 · 智能IDE · 全栈代码生成与开发Agent',
    subs: [
      LzSub('all', '全部'),
      LzSub('agent', '智能体Agent'),
      LzSub('maas', 'MaaS与算力'),
      LzSub('framework', 'AI框架生态'),
      LzSub('ide', '智能IDE'),
      LzSub('assistant', '代码补全'),
    ],
    sites: [
      LzSite(
        id: 'new_site_1', title: '秒悟Meoo', url: 'https://meoo.com/',
        icon: 'https://meoo.com/favicon.ico', fallback: 'Meoo', badge: 'NEW', desc: '新一代智能体应用开发与知识增强生产力平台', sub: 'agent', hl: '零门槛可视化搭建AI工作流；多模态数据检索与企业级知识库结合；赋能个人与企业业务自动化',
      ),
      LzSite(
        id: 'new_site_2', title: 'v0.dev', url: 'https://v0.dev/',
        icon: 'https://v0.dev/favicon.ico', fallback: 'v0', badge: 'NEW', desc: 'Vercel出品基于自然语言秒级生成Tailwind与React交互UI组件的AI神器', sub: 'ide', hl: '输入界面设计描述与需求，毫秒级实时生成可交互、高颜值的现代前端组件与页面代码',
      ),
      LzSite(
        id: 'new_site_3', title: '讯飞星辰MaaS', url: 'https://xinghuo.xfyun.cn/maas-home',
        icon: 'https://xinghuo.xfyun.cn/favicon.ico', fallback: '星辰', badge: 'NEW', desc: '科大讯飞一站式大模型训练、微调与MaaS推理服务平台', sub: 'maas', hl: '依托讯飞星火超强底座，提供全链路模型精调与私有化部署；低门槛构建行业专属高精度垂直模型',
      ),
      LzSite(
        id: 'new_site_4', title: 'BigModel', url: 'https://www.bigmodel.cn/',
        icon: 'https://www.bigmodel.cn/favicon.ico', fallback: 'GLM', badge: 'NEW', desc: '智谱AI大模型开放平台，提供GLM-4全系列多模态API', sub: 'maas', hl: '国内顶尖GLM-4/GLM-4V视觉与超长文本调用；高并发稳定接口，支持函数调用与代码解释器',
      ),
      LzSite(
        id: 'new_site_5', title: '阿里云百炼', url: 'https://bailian.console.aliyun.com/',
        icon: 'https://bailian.console.aliyun.com/favicon.ico', fallback: '百炼', badge: 'NEW', desc: '阿里云一站式大模型应用开发与企业级Agent服务平台', sub: 'maas', hl: '通义千问全系列商业API调用；集成Prompt工程、RAG知识库与插件调度，极速落地AI业务',
      ),
      LzSite(
        id: 'new_site_6', title: 'Google AI Studio', url: 'https://aistudio.google.com/',
        icon: 'https://aistudio.google.com/favicon.ico', fallback: 'AIS', badge: 'NEW', desc: '谷歌官方Gemini 1.5 Pro/Flash模型快速原型与API构建平台', sub: 'maas', hl: '支持200万超长Token上下文实验；官方API Key申请与代码生成导出；极速测试多模态音频与视频输入',
      ),
      LzSite(
        id: 'new_site_7', title: '扣子-AI办公', url: 'https://www.coze.cn/',
        icon: 'https://www.coze.cn/favicon.ico', fallback: '扣子', badge: 'NEW', desc: '字节跳动新一代AI智能体开发平台，快速构建办公与对话机器人', sub: 'agent', hl: '支持将Agent一键发布至飞书、微信公众号等办公渠道；海量官方丰富插件与知识库组件库',
      ),
      LzSite(
        id: 'new_site_8', title: '方舟 Coding Plan', url: 'https://www.volcengine.com/product/ark',
        icon: 'https://www.volcengine.com/favicon.ico', fallback: '方舟', badge: 'NEW', desc: '火山引擎大模型服务平台方舟，专为开发者提供代码与模型方案', sub: 'maas', hl: '豆包大模型商业化开放生态；高吞吐、低延迟API调用与企业算力保障；全流程模型评测与推理优化',
      ),
      LzSite(
        id: 'new_site_9', title: 'ZenMux', url: 'https://zenmux.ai/',
        icon: 'https://zenmux.ai/favicon.ico', fallback: 'ZM', badge: 'NEW', desc: '多模型统一智能路由与高效推理负载均衡中枢', sub: 'maas', hl: '毫秒级多提供商自动故障转移与延迟择优；按需降本增效，提供单接口多模型无缝切换',
      ),
      LzSite(
        id: 'new_site_10', title: 'FastGPT', url: 'https://fastgpt.cn/',
        icon: 'https://fastgpt.cn/favicon.ico', fallback: 'FGPT', badge: 'NEW', desc: '基于LLM的高性能知识库问答与复杂工作流搭建系统', sub: 'agent', hl: '精准的数据预处理与混合检索增强RAG；可视化Flow节点编排，支持私有化一键部署',
      ),
      LzSite(
        id: 'new_site_11', title: 'Zion', url: 'https://www.functorz.com/',
        icon: 'https://www.functorz.com/favicon.ico', fallback: 'Zion', badge: 'NEW', desc: '全栈可视化无代码与AI应用开发平台，一站式构建复杂Web与小程序', sub: 'agent', hl: '可视化数据建模与前后端深度逻辑绑定；支持AI助手自动化辅助界面与流程生成',
      ),
      LzSite(
        id: 'new_site_12', title: 'n8n', url: 'https://n8n.io/',
        icon: 'https://n8n.io/favicon.ico', fallback: 'n8n', badge: 'NEW', desc: '开源且极度强大的公平代码自动化工作流与AI Agent编排引擎', sub: 'agent', hl: '内置上百种企业服务集成节点；原生AI Agent、向量检索与LangChain模块深度集成',
      ),
      LzSite(
        id: 'new_site_13', title: 'Dify', url: 'https://dify.ai/',
        icon: 'https://dify.ai/favicon.ico', fallback: 'Dify', badge: 'NEW', desc: '全球开源最火爆的LLM应用开发平台，轻松定义RAG与工作流', sub: 'agent', hl: '可视化Prompt编排与版本管理；极度健全的企业级RAG检索流水线与API输出',
      ),
      LzSite(
        id: 'new_site_14', title: '袋马', url: 'https://www.daimax.cn/',
        icon: 'https://www.daimax.cn/favicon.ico', fallback: '袋马', badge: 'NEW', desc: '国内实用的AI代码辅助与智能软件研发全流程加速工具', sub: 'ide', hl: '全方位代码理解、注释生成与Bug诊断；专为中文开发场景优化的智能编码体验',
      ),
      LzSite(
        id: 'new_site_15', title: '秒哒', url: 'https://www.miaoda.cn/',
        icon: 'https://www.miaoda.cn/favicon.ico', fallback: '秒哒', badge: 'NEW', desc: '百度出品的零代码无门槛AI应用生成平台，人人都是开发者', sub: 'agent', hl: '文生全栈应用；自动打通复杂组件逻辑，实现即写即得的轻量软件部署交付',
      ),
      LzSite(
        id: 'new_site_16', title: '千问云', url: 'https://www.qianwenai.com/',
        icon: 'https://www.qianwenai.com/favicon.ico', fallback: '千问', badge: 'NEW', desc: '阿里云通义千问官方企业级AI服务云端入口', sub: 'maas', hl: '涵盖文本、视觉、代码、语音与数学的全尺寸Qwen大模型集群，性能卓越开源开放',
      ),
      LzSite(
        id: 'new_site_17', title: 'StreamLake', url: 'https://streamlake.com/',
        icon: 'https://streamlake.com/favicon.ico', fallback: 'SL', badge: 'NEW', desc: '快手旗下企业级AI与音视频大模型解决方案云平台', sub: 'agent', hl: '融合可灵AI生视频能力与海量短视频AI算法工程，为企业提供高质量AI内容引擎',
      ),
      LzSite(
        id: 'new_site_18', title: '造化工坊', url: 'https://zaohua.qq.com/',
        icon: 'https://zaohua.qq.com/favicon.ico', fallback: '造化', badge: 'NEW', desc: '腾讯混元大模型官方创作与Agent能力探索工坊', sub: 'agent', hl: '依托腾讯混元万亿参数MoE底座；打造行业领先的智能创作、逻辑推理与角色扮演应用',
      ),
      LzSite(
        id: 'new_site_19', title: 'TArk元舟', url: 'https://www.tarkcloud.com/zh-CN',
        icon: 'https://www.tarkcloud.com/favicon.ico', fallback: '元舟', badge: 'NEW', desc: '企业级AI大模型基础设施管理与全生命周期运营平台', sub: 'maas', hl: '提供算力监控、异构芯片统一纳管与大模型微调推理流水线的一体化云原生治理',
      ),
      LzSite(
        id: 'new_site_20', title: 'Playabl', url: 'https://playabl.ai/',
        icon: 'https://playabl.ai/favicon.ico', fallback: 'PA', badge: 'NEW', desc: '专注于游戏与互动娱乐领域的AI智能NPC与生成式叙事引擎', sub: 'agent', hl: '实时动态对话逻辑，让虚拟世界角色具备自主情感与决策记忆',
      ),
      LzSite(
        id: 'new_site_21', title: 'AstraFlow星图', url: 'https://www.ucloud.cn/site/active/astraflow',
        icon: 'https://www.ucloud.cn/favicon.ico', fallback: '星图', badge: 'NEW', desc: '优刻得UCloud企业级一站式大模型服务与Agent编排底座', sub: 'maas', hl: '结合高性能GPU算力底座，提供模型托管、知识增强检索与快速API集成',
      ),
      LzSite(
        id: 'new_site_22', title: 'OpenRouter', url: 'https://openrouter.ai/',
        icon: 'https://openrouter.ai/favicon.ico', fallback: 'OR', badge: 'NEW', desc: '全球主流大模型统一API网关，支持单点接入数百种前沿LLM', sub: 'maas', hl: '统一OpenAI兼容格式；一键切换Claude 3.5、GPT-4o、Llama 3、DeepSeek等全球顶尖模型',
      ),
      LzSite(
        id: 'new_site_23', title: 'SiliconFlow', url: 'https://cloud.siliconflow.cn/',
        icon: 'https://cloud.siliconflow.cn/favicon.ico', fallback: '硅基', badge: 'NEW', desc: '硅基流动极速云端大模型推理与微调加速平台', sub: 'maas', hl: '业内领先的推理加速框架，让开箱即用的开源大模型与Stable Diffusion生图速度提升数倍',
      ),
      LzSite(
        id: 'new_site_24', title: 'OfoxAI', url: 'https://ofox.io/',
        icon: 'https://ofox.io/favicon.ico', fallback: 'Ofox', badge: 'NEW', desc: '面向出海与跨国团队的多语言智能体协作与办公套件', sub: 'agent', hl: '跨境电商、外贸营销自动化场景深度定制，提升跨语种工作流生产力',
      ),
      LzSite(
        id: 'new_site_25', title: 'QMuse', url: 'https://www.qmusespace.com/',
        icon: 'https://www.qmusespace.com/favicon.ico', fallback: 'QM', badge: 'NEW', desc: '激发创作者灵感的AI多模态艺术与音乐智能交互空间', sub: 'agent', hl: '音画联动生成，支持音乐人与视觉设计师进行实时跨感官创作',
      ),
      LzSite(
        id: 'new_site_26', title: '麦芽AI', url: 'https://www.myaifast.com/',
        icon: 'https://www.myaifast.com/favicon.ico', fallback: '麦芽', badge: 'NEW', desc: '高效率自媒体与内容创作者必备的AI文案与智能辅助助手', sub: 'agent', hl: '爆款文案生成、短视频脚本策划与多平台分发优化工具箱',
      ),
      LzSite(
        id: 'new_site_27', title: 'Trickle AI', url: 'https://trickle.so/',
        icon: 'https://trickle.so/favicon.ico', fallback: 'TK', badge: 'NEW', desc: '将非结构化灵感与网页截屏自动转化为精美结构化笔记的AI知识库', sub: 'agent', hl: 'AI视觉分析图文截屏内容；多维看板智能归类，打造个人的第二大脑',
      ),
      LzSite(
        id: 'new_site_28', title: 'WorldClaw', url: 'https://worldclaw.ai/',
        icon: 'https://worldclaw.ai/favicon.ico', fallback: 'WC', badge: 'NEW', desc: '全球网络信息深度采集与结构化清洗的AI智能Agent', sub: 'agent', hl: '智能解析动态页面与防爬机制；自动化汇编高价值商业情报与行业数据',
      ),
      LzSite(
        id: 'new_site_29', title: 'TokenDance', url: 'https://tokendance.space/',
        icon: 'https://tokendance.space/favicon.ico', fallback: 'TD', badge: 'NEW', desc: '聚焦前沿Web3与区块链智能合约交互的AI Agent创新平台', sub: 'agent', hl: '自然语言理解链上数据；智能分析代币流动性与合约安全风险',
      ),
      LzSite(
        id: 'new_site_30', title: 'MoMA', url: 'https://ecloud.10086.cn/portal/product/MaaS',
        icon: 'https://ecloud.10086.cn/favicon.ico', fallback: '移动', badge: 'NEW', desc: '中国移动云九天大模型与国家队级企业MaaS平台', sub: 'maas', hl: '中国移动九天通用人工智能底座；央国企可信合规安全保障与全国高算力网络调度',
      ),
      LzSite(
        id: 'new_site_31', title: '博查万象', url: 'https://open.bochaai.com/',
        icon: 'https://open.bochaai.com/favicon.ico', fallback: '博查', badge: 'NEW', desc: '国内领先的专业级AI搜索与多模态开放API服务平台', sub: 'agent', hl: '为大模型Agent提供实时权威的联网搜索插件；具备超高事实准确率与结构化摘要能力',
      ),
      LzSite(
        id: 'new_site_32', title: 'B.AI', url: 'https://b.ai/',
        icon: 'https://b.ai/favicon.ico', fallback: 'BAI', badge: 'NEW', desc: '极简高效的下一代智能搜索与前沿AI问答探索平台', sub: 'agent', hl: '一站式解答复杂专业知识；直连全球前沿模型，提供精准无广告的AI解答体验',
      ),
      LzSite(
        id: 'new_site_33', title: '灵光', url: 'https://www.lingguang.com/chat',
        icon: 'https://www.lingguang.com/favicon.ico', fallback: '灵光', badge: 'NEW', desc: '蚂蚁集团旗下全能AI助手，深度赋能专业分析与智能办公', sub: 'agent', hl: '具备精准长文本处理、金融级专业推理与知识检索，多任务智能协同',
      ),
      LzSite(
        id: 'new_site_34', title: '万小智', url: 'https://wanxiaozhi.aliyun.com/',
        icon: 'https://wanxiaozhi.aliyun.com/favicon.ico', fallback: '小智', badge: 'NEW', desc: '阿里智能客服与多模态交互智能体运营系统', sub: 'agent', hl: '亿级电商服务场景打磨；精准意图识别与复杂工单流转自动化',
      ),
      LzSite(
        id: 'new_site_35', title: 'BASE44', url: 'https://base44.com/',
        icon: 'https://base44.com/favicon.ico', fallback: 'B44', badge: 'NEW', desc: '面向现代企业的数据管理与低代码AI应用敏捷搭建底座', sub: 'agent', hl: '连接多种数据库与SaaS API；以表格和视图形式快速生成企业后台与管理应用',
      ),
      LzSite(
        id: 'new_site_36', title: '英博云AI算力', url: 'https://www.ebcloud.com/',
        icon: 'https://www.ebcloud.com/favicon.ico', fallback: '英博', badge: 'NEW', desc: '高性价比高性能GPU云算力租赁与模型加速平台', sub: 'maas', hl: '提供A100/H800/4090等顶尖显卡即租即用；免运维高速网络互联，专为AI训练和渲染打造',
      ),
      LzSite(
        id: 'new_site_37', title: '汇智Token工场', url: 'https://www.agentsyun.com/',
        icon: 'https://www.agentsyun.com/favicon.ico', fallback: '汇智', badge: 'NEW', desc: '专为智能体开发者量身定制的大模型API聚合与Token计费枢纽', sub: 'maas', hl: '统一账单管理；低成本接入多种国产优秀开源大模型，赋能中小企业AI转型',
      ),
      LzSite(
        id: 'new_site_38', title: 'Aippy', url: 'https://aippy.ai/',
        icon: 'https://aippy.ai/favicon.ico', fallback: 'Aip', badge: 'NEW', desc: '让每个人都能轻松上手的个性化AI小工具快速生成社区', sub: 'agent', hl: '输入一句话即可生成专用工具，并支持分享给团队或嵌入个人网站',
      ),
      LzSite(
        id: 'new_site_39', title: '快马InsCode', url: 'https://www.inscode.net/',
        icon: 'https://www.inscode.net/favicon.ico', fallback: '快马', badge: 'NEW', desc: 'CSDN旗下云端在线IDE与AI项目即时运行分享社区', sub: 'ide', hl: '浏览器内秒级启动Python、Node环境；AI一键帮写代码与快速托管部署',
      ),
      LzSite(
        id: 'new_site_40', title: 'NoCode', url: 'https://nocode.meituan.com/',
        icon: 'https://nocode.meituan.com/favicon.ico', fallback: 'NC', badge: 'NEW', desc: '美团企业级低代码与无代码自动化业务协作构建套件', sub: 'agent', hl: '服务海量内部复杂业务场景，提供强大的表单流程引擎与权限控制',
      ),
      LzSite(
        id: 'new_site_41', title: 'Whacka', url: 'https://whacka.app/',
        icon: 'https://whacka.app/favicon.ico', fallback: 'WK', badge: 'NEW', desc: '创新型交互式AI应用与轻量协作小部件构建器', sub: 'agent', hl: '模块化微组件设计，让AI交互像积木一样随意拼接组合',
      ),
      LzSite(
        id: 'new_site_42', title: 'gapp.so', url: 'https://gapp.so/',
        icon: 'https://gapp.so/favicon.ico', fallback: 'Gapp', badge: 'NEW', desc: '新一代AI原生网页轻应用与智能营销微页面生成平台', sub: 'agent', hl: '极简提示词驱动UI排版；自带动画与表单收集功能，快速验证业务想法',
      ),
      LzSite(
        id: 'new_site_43', title: '数眼智能AI', url: 'https://shuyanai.com/',
        icon: 'https://shuyanai.com/favicon.ico', fallback: '数眼', badge: 'NEW', desc: '专业面向企业数据可视化与智能BI分析的决策大模型系统', sub: 'agent', hl: '对话式生成复杂SQL与动态折线/柱状图表，让业务人员直接跟数据对话',
      ),
      LzSite(
        id: 'new_site_44', title: 'SophNet', url: 'https://www.sophnet.com/',
        icon: 'https://www.sophnet.com/favicon.ico', fallback: 'Soph', badge: 'NEW', desc: '算能科技SophNet高能效AI边缘计算与模型推理平台', sub: 'maas', hl: '专为TPU与边缘算力芯片深度优化，赋能智能安防、工业质检与车载AI应用',
      ),
      LzSite(
        id: 'new_site_45', title: '火山机器学习平台', url: 'https://www.volcengine.com/product/ml-platform',
        icon: 'https://www.volcengine.com/favicon.ico', fallback: 'ML', badge: 'NEW', desc: '火山引擎大模型智能体与机器学习开发部署平台', sub: 'agent', hl: '为开发者与企业提供定制模型训练、微调、安全对齐与高性能云端推理调度服务',
      ),
      LzSite(
        id: 'new_site_46', title: '晨涧云', url: 'https://www.mornai.cn/',
        icon: 'https://www.mornai.cn/favicon.ico', fallback: '晨涧', badge: 'NEW', desc: '国内专注于大模型推理加速与高性价比算力服务商', sub: 'maas', hl: '提供弹性可伸缩的GPU集群，保障超大并发请求下低延时响应',
      ),
      LzSite(
        id: 'new_site_47', title: 'LLaMA-Factory Online', url: 'https://www.llamafactory.online/',
        icon: 'https://www.llamafactory.online/favicon.ico', fallback: 'LF', badge: 'NEW', desc: '全球极受欢迎的开源大模型一站式低代码微调WebUI平台', sub: 'maas', hl: '集成LoRA、QLoRA、DPO、PPO等主流精调算法；支持上百种开源模型无代码在线训练与量化',
      ),
      LzSite(
        id: 'new_site_48', title: '大模型实验室', url: 'https://www.lab4ai.cn/',
        icon: 'https://www.lab4ai.cn/favicon.ico', fallback: 'Lab', badge: 'NEW', desc: '国内高校与研究机构聚集的前沿大模型科研与评测基准平台', sub: 'maas', hl: '追踪最新顶会论文与开源成果；提供权威的中文大模型安全性与推理榜单',
      ),
      LzSite(
        id: 'new_site_49', title: 'APIMart', url: 'https://apimart.ai/',
        icon: 'https://apimart.ai/favicon.ico', fallback: 'AM', badge: 'NEW', desc: '面向全球开发者的高可用大模型API市场与中转服务', sub: 'maas', hl: '毫秒级调度主流商业与开源大模型，支持按量计费与开发者专属调试面板',
      ),
      LzSite(
        id: 'new_site_50', title: 'DMXAPI', url: 'https://dmxapi.cn/',
        icon: 'https://dmxapi.cn/favicon.ico', fallback: 'DMX', badge: 'NEW', desc: '极速稳定的全网主流AI模型聚合API转接服务平台', sub: 'maas', hl: '提供极佳的国内网络访问性能，支持单接口对接Midjourney、Sora及GPT-4o',
      ),
      LzSite(
        id: 'new_site_51', title: '小马算力', url: 'https://www.tokenpony.cn/',
        icon: 'https://www.tokenpony.cn/favicon.ico', fallback: '小马', badge: 'NEW', desc: '高性价比AI开发者GPU云主机与容器化微调算力平台', sub: 'maas', hl: '按秒计费，支持主流AI镜像一键启动；为独立开发者与学生团队大幅降低模型训练门槛',
      ),
      LzSite(
        id: 'new_site_52', title: 'Refly', url: 'https://refly.ai/',
        icon: 'https://refly.ai/favicon.ico', fallback: 'Refly', badge: 'NEW', desc: '新一代AI驱动的沉浸式知识库搜索与智能研究助手', sub: 'agent', hl: '多文档交叉比对与自动思维导图生成；大幅缩短论文研读与行业行研周期',
      ),
      LzSite(
        id: 'new_site_53', title: '搭叩', url: 'https://dakou.iflow.cn/',
        icon: 'https://dakou.iflow.cn/favicon.ico', fallback: '搭叩', badge: 'NEW', desc: '阿里巴巴出品的现代化敏捷开发与可视化协同建站平台', sub: 'agent', hl: '海量精美组件库与自动化工作流，助力企业团队几天内完成业务系统上线',
      ),
      LzSite(
        id: 'new_site_54', title: 'CREAO', url: 'https://creao.ai/',
        icon: 'https://creao.ai/favicon.ico', fallback: 'CRE', badge: 'NEW', desc: '下一代生成式AI赋能的数字创意设计与交互展示引擎', sub: 'agent', hl: '将静态图形转换为具备实时物理交互的动态作品，赋能新媒体艺术家',
      ),
      LzSite(
        id: 'new_site_55', title: 'Make', url: 'https://www.make.com/',
        icon: 'https://www.make.com/favicon.ico', fallback: 'Make', badge: 'NEW', desc: '全球知名的无代码可视化跨软件复杂工作流自动化引擎', sub: 'agent', hl: '直观的拖拽分支与条件逻辑；无缝串联上千款SaaS软件与最新生成式AI节点',
      ),
      LzSite(
        id: 'new_site_56', title: 'Wordware', url: 'https://www.wordware.ai/',
        icon: 'https://www.wordware.ai/favicon.ico', fallback: 'WW', badge: 'NEW', desc: '以自然语言为核心代码的AI应用IDE与敏捷Agent工作台', sub: 'agent', hl: '像写Notion文档一样快速编写AI工作流并即时生成生产级API，风靡硅谷开发者',
      ),
      LzSite(
        id: 'new_site_57', title: '天壤小白', url: 'https://www.tianrang.com/',
        icon: 'https://www.tianrang.com/favicon.ico', fallback: '天壤', badge: 'NEW', desc: '天壤智能面向城市大脑与产业数字化打造的AI商业化基座', sub: 'agent', hl: '融合多维时空大数据与交通规划算法，提供城市级的智能调度策略',
      ),
      LzSite(
        id: 'new_site_58', title: 'PPIO派欧云', url: 'https://ppio.cn/',
        icon: 'https://ppio.cn/favicon.ico', fallback: '派欧', badge: 'NEW', desc: '分布式边缘云GPU算力与音视频AI端到端基础设施', sub: 'maas', hl: '覆盖全国上千个边缘节点；为实时语音对话大模型提供超低延迟的边缘算力保障',
      ),
      LzSite(
        id: 'new_site_59', title: '蚂蚁百宝箱Tbox', url: 'https://tbox.alipay.com/',
        icon: 'https://tbox.alipay.com/favicon.ico', fallback: 'Tbox', badge: 'NEW', desc: '蚂蚁集团面向开发者打造的综合研发工具与效率应用集', sub: 'agent', hl: '集成金融级安全组件、性能分析探针与代码规范质检工具链',
      ),
      LzSite(
        id: 'new_site_60', title: 'WaveSpeedAI', url: 'https://wavespeed.ai/',
        icon: 'https://wavespeed.ai/favicon.ico', fallback: 'WS', badge: 'NEW', desc: '专为超低延迟生图与视频生成的AI端侧/云端混合推理引擎', sub: 'maas', hl: '毫秒级实时扩散模型生成算法，让交互式AI视觉体验如丝般顺滑',
      ),
      LzSite(
        id: 'new_site_61', title: '模力方舟', url: 'https://ai.gitee.com/',
        icon: 'https://ai.gitee.com/favicon.ico', fallback: '模力', badge: 'NEW', desc: 'Gitee开源中国旗下打造的本土AI大模型开源体验与托管空间', sub: 'maas', hl: '汇聚海量国产优质开源模型权重与演示Demo；提供免费免配置的Web体验环境',
      ),
      LzSite(
        id: 'new_site_62', title: 'LongCat开放平台', url: 'https://longcat.chat/platform/',
        icon: 'https://longcat.chat/favicon.ico', fallback: 'LC', badge: 'NEW', desc: '多模态长文本AI理解与对话API开放平台', sub: 'maas', hl: '针对几十万字长篇小说、长篇法律合同与学术论文提供超强细节检索与准确归纳',
      ),
      LzSite(
        id: 'new_site_63', title: 'X-All in one', url: 'https://www.x-aio.com/',
        icon: 'https://www.x-aio.com/favicon.ico', fallback: 'AIO', badge: 'NEW', desc: '一体化AI模型调度与跨模态生成云端应用集合', sub: 'maas', hl: '集成文本、画图、代码、语音与3D生成的综合AI工作台',
      ),
      LzSite(
        id: 'new_site_64', title: '无问芯穹', url: 'https://cloud.infini-ai.com/platform/ai',
        icon: 'https://cloud.infini-ai.com/favicon.ico', fallback: '无问', badge: 'NEW', desc: '清华系大模型多元异构芯片联合计算与MaaS云服务生态', sub: 'maas', hl: '打破英伟达芯片单一依赖，跨品牌异构GPU集群高效协同与极致推理加速',
      ),
      LzSite(
        id: 'new_site_65', title: '胜算云', url: 'https://www.shengsuanyun.com/',
        icon: 'https://www.shengsuanyun.com/favicon.ico', fallback: '胜算', badge: 'NEW', desc: '致力于为中小科技企业提供高性价比的GPU算力与AI云原生托管', sub: 'maas', hl: '免运维一键拉起Stable Diffusion、Ollama与vLLM实例，成本降幅高达50%',
      ),
      LzSite(
        id: 'new_site_66', title: '智谱清流', url: 'https://bigmodel.cn/agent',
        icon: 'https://bigmodel.cn/favicon.ico', fallback: '清流', badge: 'NEW', desc: '智谱AI官方企业级智能体Agent平台与知识库定制中枢', sub: 'agent', hl: '内置GLM-4全功能插件体系；支持多智能体辩论、任务拆解与自动化业务流转',
      ),
      LzSite(
        id: 'new_site_67', title: '文心智能体平台', url: 'https://agents.baidu.com/',
        icon: 'https://agents.baidu.com/favicon.ico', fallback: '文心', badge: 'NEW', desc: '百度官方文心大模型Agent平台，分发至百度搜索海量流量生态', sub: 'agent', hl: '零代码与低代码双模式；智能体可直达百度搜索结果卡片，自带亿级曝光变现场景',
      ),
      LzSite(
        id: 'new_site_68', title: 'SkyAgents', url: 'https://model-platform-skyagents.tiangong.cn/home/agent',
        icon: 'https://model-platform-skyagents.tiangong.cn/favicon.ico', fallback: '天工', badge: 'NEW', desc: '昆仑万维天工大模型企业级Agent与多模态智能体平台', sub: 'agent', hl: '结合天工音乐生成与超长文本检索能力，轻松创建跨学科、跨领域的专属AI专家',
      ),
      LzSite(
        id: 'new_site_69', title: '言犀智能体平台', url: 'https://yanxi.jd.com/',
        icon: 'https://yanxi.jd.com/favicon.ico', fallback: '言犀', badge: 'NEW', desc: '京东云言犀产业大模型智能体平台，专注电商、物流与供应链', sub: 'agent', hl: '沉淀万亿级京东零售供应链专业知识库，打造懂商业逻辑的真懂行Agent',
      ),
      LzSite(
        id: 'new_site_70', title: '魔乐社区', url: 'https://modelers.cn/',
        icon: 'https://modelers.cn/favicon.ico', fallback: '魔乐', badge: 'NEW', desc: '基于昇腾AI基础软硬件底座的开源AI模型与开发者生态社区', sub: 'maas', hl: '汇聚国内优秀开源模型权重与昇腾亲和优化套件，促进国产算力自主生态繁荣',
      ),
      LzSite(
        id: 'new_site_71', title: 'BetterYeah AI', url: 'https://www.betteryeah.com/',
        icon: 'https://www.betteryeah.com/favicon.ico', fallback: 'BY', badge: 'NEW', desc: '国内领先的企业级AI Agent应用构建与协同编排工作流套件', sub: 'agent', hl: '深度打通企业ERP、CRM与数据库，赋能业务人员轻松打造生产级AI助手',
      ),
      LzSite(
        id: 'new_site_72', title: '飞桨PaddlePaddle', url: 'https://www.paddlepaddle.org.cn/',
        icon: 'https://www.paddlepaddle.org.cn/favicon.ico', fallback: '飞桨', badge: 'NEW', desc: '百度自主研发的国内首个功能完备开源产业级深度学习平台', sub: 'framework', hl: '集核心框架、基础模型库、端到端开发套件和丰富的工具组件于一体，国内市场份额领先',
      ),
      LzSite(
        id: 'new_site_73', title: '昇思MindSpore', url: 'https://www.mindspore.cn/',
        icon: 'https://www.mindspore.cn/favicon.ico', fallback: '昇思', badge: 'NEW', desc: '华为开源的全场景深度学习框架，专为昇腾AI处理器深度优化', sub: 'framework', hl: '实现端边云按需协同与自动微分计算，具备极致效率与超大规模集群训练能力',
      ),
      LzSite(
        id: 'new_site_74', title: 'PyTorch', url: 'https://pytorch.org/',
        icon: 'https://pytorch.org/favicon.ico', fallback: 'PT', badge: 'NEW', desc: '全球AI科研界与工业界最主流的开源动态图深度学习框架', sub: 'framework', hl: '具备极致的Python原生调试体验与庞大生态；大语言模型研究绝大多数基于PyTorch构建',
      ),
      LzSite(
        id: 'new_site_75', title: 'Gumloop', url: 'https://www.gumloop.com/',
        icon: 'https://www.gumloop.com/favicon.ico', fallback: 'GL', badge: 'NEW', desc: '无代码AI网页自动化、数据抓取与复杂办公业务流水线', sub: 'agent', hl: '直观的节点图连线；让非程序员也能轻松搭建自动化运行的商业级AI流程',
      ),
      LzSite(
        id: 'new_site_76', title: 'TensorFlow', url: 'https://www.tensorflow.org/',
        icon: 'https://www.tensorflow.org/favicon.ico', fallback: 'TF', badge: 'NEW', desc: '谷歌出品的端到端开源机器学习平台与工业部署标杆', sub: 'framework', hl: '拥有极其健全的TensorFlow Serving、TFLite与TensorFlow.js全栈部署基础设施',
      ),
      LzSite(
        id: 'new_site_77', title: 'Apache MXNet', url: 'https://mxnet.apache.org/',
        icon: 'https://mxnet.apache.org/favicon.ico', fallback: 'MX', badge: 'NEW', desc: 'Apache顶级项目，高扩展性与极强性能的分布式深度学习框架', sub: 'framework', hl: '曾被AWS选为官方深度学习框架，具备出色的内存优化与多GPU扩展线性度',
      ),
      LzSite(
        id: 'new_site_78', title: 'Scikit-learn', url: 'https://scikit-learn.org/',
        icon: 'https://scikit-learn.org/favicon.ico', fallback: 'SKL', badge: 'NEW', desc: 'Python经典机器学习算法库之王，数据挖掘与建模基石', sub: 'framework', hl: '包含分类、回归、聚类、降维等全量经典算法，接口设计极其优雅规范',
      ),
      LzSite(
        id: 'new_site_79', title: 'MLX', url: 'https://ml-explore.github.io/mlx/build/html/index.html',
        icon: 'https://ml-explore.github.io/favicon.ico', fallback: 'MLX', badge: 'NEW', desc: '苹果公司专为Apple Silicon芯片自研的高性能机器学习框架', sub: 'framework', hl: '充分发挥统一内存架构优势，在MacBook与Mac Studio上极速本地运行大语言模型与微调',
      ),
      LzSite(
        id: 'new_site_80', title: 'Label Studio', url: 'https://labelstud.io/',
        icon: 'https://labelstud.io/favicon.ico', fallback: 'LS', badge: 'NEW', desc: '功能最全面强大的开源多类型数据标注与清洗平台', sub: 'framework', hl: '支持图像、文本、音频、视频、时序与多模态数据，内置模型辅助预标注能力',
      ),
      LzSite(
        id: 'new_site_81', title: 'Chunkr', url: 'https://lumina.sh/',
        icon: 'https://lumina.sh/favicon.ico', fallback: 'CK', badge: 'NEW', desc: '基于视觉模型的智能文档解析与高精度RAG切片引擎', sub: 'framework', hl: '将复杂的PDF表格、公式和多栏排版转化为结构化高质量分块，极大提升RAG检索质量',
      ),
      LzSite(
        id: 'new_site_82', title: 'Vercel AI SDK', url: 'https://sdk.vercel.ai/docs',
        icon: 'https://sdk.vercel.ai/favicon.ico', fallback: 'SDK', badge: 'NEW', desc: '前端与全栈工程师开发AI应用事实上的标准TypeScript开源库', sub: 'framework', hl: '完美封装流式传输（Streaming UI）、工具调用（Tool Calling）与结构化对象生成',
      ),
      LzSite(
        id: 'new_site_83', title: 'Keras', url: 'https://keras.io/',
        icon: 'https://keras.io/favicon.ico', fallback: 'KR', badge: 'NEW', desc: '优雅高层神经网络API，Keras 3支持JAX/PyTorch/TensorFlow多后端', sub: 'framework', hl: '以人为本的设计理念，写一次代码即可在任意主流底层计算后端上无缝运行',
      ),
      LzSite(
        id: 'new_site_84', title: 'Caffe', url: 'https://caffe.berkeleyvision.org/',
        icon: 'https://caffe.berkeleyvision.org/favicon.ico', fallback: 'CF', badge: 'NEW', desc: '伯克利BVLC出品的计算机视觉经典开源深度学习框架', sub: 'framework', hl: '清晰的C++架构与纯文本配置网络结构，奠定了早期卷积神经网络工业落地的基础',
      ),
      LzSite(
        id: 'new_site_85', title: 'NumPy', url: 'https://numpy.org/',
        icon: 'https://numpy.org/favicon.ico', fallback: 'NP', badge: 'NEW', desc: 'Python科学计算与多维张量数学运算的核心基石库', sub: 'framework', hl: '提供超高性能的N维数组对象与庞大的数学函数库，几乎所有AI与数据科学库的底层依赖',
      ),
      LzSite(
        id: 'new_site_86', title: 'DL4J', url: 'https://deeplearning4j.konduit.ai/',
        icon: 'https://deeplearning4j.konduit.ai/favicon.ico', fallback: 'DL4J', badge: 'NEW', desc: 'Eclipse基金会旗下为Java和JVM环境定制的商用分布式深度学习库', sub: 'framework', hl: '无缝融入Hadoop和Spark大数据生态系统，为Java企业级应用提供本地AI推断能力',
      ),
      LzSite(
        id: 'new_site_87', title: 'JAX', url: 'https://jax.readthedocs.io/en/latest',
        icon: 'https://jax.readthedocs.io/favicon.ico', fallback: 'JAX', badge: 'NEW', desc: '谷歌开源的可组合高性能自动微分与XLA硬件编译加速库', sub: 'framework', hl: '函数式编程范式，TPU/GPU自动向量化与并行加速，被诸多尖端大模型科研实验室广泛采用',
      ),
      LzSite(
        id: 'new_site_88', title: 'NLTK', url: 'https://www.nltk.org/',
        icon: 'https://www.nltk.org/favicon.ico', fallback: 'NLTK', badge: 'NEW', desc: '自然语言处理领域极具代表性的开源Python教学与科研工具包', sub: 'framework', hl: '包含分词、词性标注、句法分析与50多个学术语料库，NLP入门与理论实践必备',
      ),
      LzSite(
        id: 'new_site_89', title: 'LangChain', url: 'https://docs.langchain.com/docs/',
        icon: 'https://docs.langchain.com/favicon.ico', fallback: 'LC', badge: 'NEW', desc: '全球知名度最高的LLM大语言模型链式调用与Agent开发框架', sub: 'framework', hl: '提供了从Prompt管理、Memory记忆、Tools工具箱到LangGraph多智能体图调度的完整技术栈',
      ),
      LzSite(
        id: 'new_site_90', title: 'Lightning AI', url: 'https://lightning.ai/',
        icon: 'https://lightning.ai/favicon.ico', fallback: 'LAI', badge: 'NEW', desc: 'PyTorch Lightning背后的工程化平台，大幅简化模型分布式训练与部署', sub: 'framework', hl: '将工程模版代码与核心科研逻辑解耦；支持在云端几秒内启动多机多卡训练集群',
      ),
      LzSite(
        id: 'new_site_91', title: 'Leap', url: 'https://www.tryleap.ai/',
        icon: 'https://www.tryleap.ai/favicon.ico', fallback: 'Leap', badge: 'NEW', desc: '零代码微调与多模态AI图像/音频API生产集成平台', sub: 'agent', hl: '快速将专属人物面孔或商品风格训练成私有模型，并通过标准REST API对外调用',
      ),
      LzSite(
        id: 'new_site_92', title: 'ChatDev', url: 'https://chatdev.modelbest.cn/',
        icon: 'https://chatdev.modelbest.cn/favicon.ico', fallback: 'CD', badge: 'NEW', desc: '清华与面壁智能出品的多智能体虚拟软件公司协同开发系统', sub: 'agent', hl: '模拟CEO、产品经理、程序员与测试员的协同会议，输入需求即可自动设计、编码并交付软件',
      ),
      LzSite(
        id: 'new_site_93', title: 'Anakin.ai', url: 'https://anakin.ai/zh-cn',
        icon: 'https://anakin.ai/favicon.ico', fallback: 'AK', badge: 'NEW', desc: '一站式无代码AI应用创建平台，内置上千款现成办公与内容Agent', sub: 'agent', hl: '支持跨模型组合工作流，支持一键将AI能力接入团队协作工具',
      ),
      LzSite(
        id: 'code_site_1', title: 'TRAE', url: 'https://www.trae.cn/',
        icon: 'https://www.trae.cn/favicon.ico', fallback: 'TRAE', badge: 'AI IDE', desc: '字节跳动出品的新一代自适应AI编程IDE，全工程感知与智能代理协作', sub: 'ide', hl: '内置Claude 3.5与GPT-4o前沿大模型；支持Builder自主全工程代码生成与即时预览；专为现代全栈开发者打造的自适应AI IDE',
      ),
      LzSite(
        id: 'code_site_2', title: '码上飞', url: 'https://codeflying.cgref.cn/aibot',
        icon: 'https://codeflying.cgref.cn/favicon.ico', fallback: '码上飞', badge: 'AI出码', desc: '自然语言对话极速生成前后端可用系统与业务逻辑', sub: 'agent', hl: '只需描述业务需求，一键自动化构建数据库、接口与交互前端；大幅缩减项目原型与MVP开发周期',
      ),
      LzSite(
        id: 'code_site_3', title: '代码小浣熊', url: 'https://www.xiaohuanxiong.com/',
        icon: 'https://www.xiaohuanxiong.com/favicon.ico', fallback: '浣熊', badge: '智能代码', desc: '基于商汤大模型打造的研发智能辅助工具，代码生成、问答与重构', sub: 'assistant', hl: '支持数十种主流编程语言；毫秒级上下文代码补全与智能重构；安全可靠的开发者日常提效助手',
      ),
      LzSite(
        id: 'code_site_4', title: 'Codex', url: 'https://openai.com/codex/',
        icon: 'https://openai.com/favicon.ico', fallback: 'Codex', badge: 'OpenAI', desc: 'OpenAI前沿代码智能模型基石，自然语言转换为高质量代码', sub: 'assistant', hl: '全球开发者智能编程风向标；精通复杂算法逻辑与跨语言转译；为无数编程辅助工具提供强大内核',
      ),
      LzSite(
        id: 'code_site_5', title: 'Claude Code', url: 'https://www.anthropic.com/claude-code',
        icon: 'https://www.anthropic.com/favicon.ico', fallback: 'Claude', badge: 'Agentic', desc: 'Anthropic推出的终端自主AI编程Agent，直接在命令行解决全工程任务', sub: 'agent', hl: '深入本地代码仓库执行Git、测试与多文件协同修改；精准遵循指令，高复杂度系统重构与Bug排查利器',
      ),
      LzSite(
        id: 'code_site_6', title: 'OpenCode', url: 'https://opencode.ai/',
        icon: 'https://opencode.ai/favicon.ico', fallback: 'Open', badge: '开源Agent', desc: '开放透明的AI辅助研发与代码生成开源平台', sub: 'agent', hl: '强调开源开放架构与本地安全私有化部署；深度融合软件工程全生命周期',
      ),
      LzSite(
        id: 'code_site_7', title: 'Agent.Space', url: 'https://agentspace.cgref.cn/s/omkl2mve4d',
        icon: 'https://agentspace.cgref.cn/favicon.ico', fallback: 'Space', badge: 'Agent空间', desc: '多智能体协同编程与自动化开发工作空间', sub: 'agent', hl: '串联多种特化智能体协同完成产品构思、架构设计与代码实现；全流程智能自动化协作',
      ),
      LzSite(
        id: 'code_site_8', title: 'Qoder', url: 'https://qoder.com/',
        icon: 'https://qoder.com/favicon.ico', fallback: 'Qoder', badge: '极速补全', desc: '新一代AI代码助理，专注极致低延迟补全与项目级理解', sub: 'assistant', hl: '毫秒级响应不卡顿；深度解析工程依赖与架构脉络；让双手永远保持心流编写状态',
      ),
      LzSite(
        id: 'code_site_9', title: 'Kimi Code', url: 'https://www.kimi.com/code',
        icon: 'https://www.kimi.com/favicon.ico', fallback: 'Kimi', badge: '超长', desc: '月之暗面长文本AI代码助手，完整读入整套工程架构与长篇API文档', sub: 'assistant', hl: '支持百万级上下文直接加载全部源码；解决复杂跨模块跨仓库联合排障与代码阅读痛点',
      ),
      LzSite(
        id: 'code_site_10', title: 'Kilo Code', url: 'https://kilo.ai/',
        icon: 'https://kilo.ai/favicon.ico', fallback: 'Kilo', badge: '开发', desc: '轻量高能的智能软件开发与代码加速利器', sub: 'agent', hl: '极简交互设计，专注把复杂功能需求一键化为整洁优雅的代码结构',
      ),
      LzSite(
        id: 'code_site_11', title: 'Google Antigravity', url: 'https://antigravity.google/',
        icon: 'https://antigravity.google/favicon.ico', fallback: 'Anti', badge: 'Google', desc: 'Google最新前沿研发平台与智能工程系统探索', sub: 'agent', hl: '前沿Google黑科技驱动；颠覆传统开发范式的实验级高智能工程协作',
      ),
      LzSite(
        id: 'code_site_12', title: 'Kiro', url: 'https://kiro.dev/',
        icon: 'https://kiro.dev/favicon.ico', fallback: 'Kiro', badge: 'DevTools', desc: '现代Web与全栈工程师的代码生成与智能调试工具箱', sub: 'assistant', hl: '直击开发者痛点，自动化生成单元测试用例与接口规范代码',
      ),
      LzSite(
        id: 'code_site_13', title: 'Cursor', url: 'https://www.cursor.com/',
        icon: 'https://www.cursor.com/favicon.ico', fallback: 'Cursor', badge: '爆款IDE', desc: '全球风靡的AI-First代码编辑器，基于VSCode深层改造与Tab键智能预测', sub: 'ide', hl: 'Composer多文件联合修改；@Docs精准文档引用；全球无数工程师的主力生产力IDE',
      ),
      LzSite(
        id: 'code_site_14', title: 'Cline', url: 'https://cline.bot/',
        icon: 'https://cline.bot/favicon.ico', fallback: 'Cline', badge: '自主Agent', desc: '能够在你的VSCode中直接读写文件、运行终端命令的自主编程助手', sub: 'agent', hl: '开源高星扩展，人类监督下自主创建文件、执行编译排查并在浏览器中验证结果',
      ),
      LzSite(
        id: 'code_site_15', title: 'MiMo Code', url: 'https://mimo.xiaomi.com/mimocode',
        icon: 'https://mimo.xiaomi.com/favicon.ico', fallback: 'MiMo', badge: '小米出品', desc: '小米面向工程师打造的智能编码与研发效率平台', sub: 'assistant', hl: '小米生态研发实战沉淀；全语言适配，提供智能补全、单测生成与代码评审',
      ),
      LzSite(
        id: 'code_site_16', title: 'YouWare', url: 'https://www.youware.com/',
        icon: 'https://www.youware.com/favicon.ico', fallback: 'YW', badge: '低代码AI', desc: '让所有人都能用AI快速定制数字化软件与业务系统', sub: 'agent', hl: '自然语言直达可部署应用，打破传统研发技术壁垒，赋能个人与微小团队',
      ),
      LzSite(
        id: 'code_site_17', title: 'ZCode', url: 'https://zcode-ai.com/',
        icon: 'https://zcode-ai.com/favicon.ico', fallback: 'ZCode', badge: 'AI重构', desc: '高精度代码分析、架构重构与语法转译智能平台', sub: 'assistant', hl: '针对遗留系统与大型工程代码库，提供快速代码迁移、语法升级与缺陷扫描',
      ),
      LzSite(
        id: 'code_site_18', title: 'CodeBuddy IDE', url: 'https://www.codebuddy.ai/',
        icon: 'https://www.codebuddy.ai/favicon.ico', fallback: 'Buddy', badge: 'AI伴侣', desc: '全功能云端与桌面AI编程伙伴，随时随地结对编程', sub: 'ide', hl: '实时在线协同与智能AI结对结伴编码，快速排查Bug并优化执行性能',
      ),
      LzSite(
        id: 'code_site_19', title: 'Lovable', url: 'https://lovable.dev/',
        icon: 'https://lovable.dev/favicon.ico', fallback: 'Love', badge: '全栈构建', desc: '通过自然语言对话一键生成精美全栈Web应用并秒级上线部署', sub: 'agent', hl: '集成现代UI组件与Supabase后端；从草图想法到可分享上线的产品仅需几分钟',
      ),
      LzSite(
        id: 'code_site_20', title: 'CatPaw', url: 'https://catpaw.meituan.com/',
        icon: 'https://catpaw.meituan.com/favicon.ico', fallback: '猫爪', badge: '美团出品', desc: '美团猫爪代码助手，企业级高并发与海量业务研发辅助', sub: 'assistant', hl: '经过海量高并发业务严苛验证；提供卓越的代码生成质量、安全合规检查与架构规范把控',
      ),
      LzSite(
        id: 'code_site_21', title: '网易CodeWave', url: 'https://codewave.163.com/',
        icon: 'https://codewave.163.com/favicon.ico', fallback: '网易', badge: '低代码', desc: '网易自研智能低代码开发平台，可视化搭建物联网与企业系统', sub: 'agent', hl: '网易全栈自研内核，拖拽搭配AI辅助，专业级全生命周期企业数字化解决方案',
      ),
      LzSite(
        id: 'code_site_22', title: 'Augment Code', url: 'https://www.augmentcode.com/',
        icon: 'https://www.augmentcode.com/favicon.ico', fallback: 'Aug', badge: '超大仓库', desc: '专为拥有数百万行代码的超大型团队量身定制的AI编程助手', sub: 'assistant', hl: '极深度的企业级代码索引；毫秒级跨数十个仓库理解引用关系与类型定义',
      ),
      LzSite(
        id: 'code_site_23', title: 'AgnesCode', url: 'https://agnes-ai.com/agnescode',
        icon: 'https://agnes-ai.com/favicon.ico', fallback: 'Agnes', badge: 'AI开发', desc: '专注于智能逻辑梳理与高效代码实现的AI工程工作流', sub: 'assistant', hl: '将业务需求一键分解为清晰的架构蓝图与可靠的代码实现',
      ),
      LzSite(
        id: 'code_site_24', title: 'MonkeyCode', url: 'https://monkeycode.com/',
        icon: 'https://monkeycode.com/favicon.ico', fallback: 'Monkey', badge: '趣味编程', desc: '让写代码变得像玩游戏一样流畅的智能编程体验', sub: 'assistant', hl: '生动的编码提示与高效率的逻辑生成，深受开发者喜爱的轻巧编码伙伴',
      ),
      LzSite(
        id: 'code_site_25', title: '腾讯云AI代码助手', url: 'https://copilot.tencent.com/',
        icon: 'https://copilot.tencent.com/favicon.ico', fallback: '腾讯', badge: '腾讯出品', desc: '腾讯自研混元代码大模型驱动，编码提效与智能问答助手', sub: 'assistant', hl: '支持代码补全、技术规范答疑、单元测试生成与代码优化，企业研发深度提效',
      ),
      LzSite(
        id: 'code_site_26', title: '通义灵码', url: 'https://tongyi.aliyun.com/lingma',
        icon: 'https://tongyi.aliyun.com/favicon.ico', fallback: '灵码', badge: '阿里出品', desc: '阿里云出品的AI智能编码助手，上百万开发者的日常提效首选', sub: 'assistant', hl: '支持行级/函数级代码补全、自然语言写代码、单元测试生成与代码优化，国内极速无网络阻碍',
      ),
      LzSite(
        id: 'code_site_27', title: 'iFlyCode', url: 'https://iflycode.xfyun.cn/',
        icon: 'https://iflycode.xfyun.cn/favicon.ico', fallback: '讯飞', badge: '讯飞星火', desc: '科大讯飞星火代码大模型驱动的智能编程辅助平台', sub: 'assistant', hl: '代码智能补全、代码纠错重构、自动生成单元测试与注释，全面提升研发质量',
      ),
      LzSite(
        id: 'code_site_28', title: '文心快码', url: 'https://comate.baidu.com/',
        icon: 'https://comate.baidu.com/favicon.ico', fallback: '快码', badge: '百度出品', desc: '百度基于文心大模型打造的新一代智能代码助手 (Baidu Comate)', sub: 'assistant', hl: '海量代码库深度训练，支持百种语言与主流IDE，多行代码精准预测补全',
      ),
      LzSite(
        id: 'code_site_29', title: 'MarsCode', url: 'https://www.marscode.cn/',
        icon: 'https://www.marscode.cn/favicon.ico', fallback: '火星', badge: '豆包驱动', desc: '字节跳动出品的免费AI编程助手，提供IDE扩展与云端开发环境', sub: 'ide', hl: '豆包大模型强劲内核，内置AI智能补全、代码解释与单测生成，开箱即用',
      ),
      LzSite(
        id: 'code_site_30', title: 'Fitten Code', url: 'https://code.fittentech.com/',
        icon: 'https://code.fittentech.com/favicon.ico', fallback: '非腾', badge: '极速轻量', desc: '非腾科技打造的高性能AI代码助手，毫秒级极速推理与跨平台支持', sub: 'assistant', hl: '推理速度极快，内存占用小，支持自动补全、代码查错与智能解释',
      ),
      LzSite(
        id: 'code_orig_copilot', title: 'GitHub Copilot', url: 'https://github.com/features/copilot',
        icon: 'https://github.com/favicon.ico', fallback: 'Copilot', badge: '行业标杆', desc: 'GitHub与OpenAI联手打造的全球最普及AI结对程序员', sub: 'assistant', hl: '深度集成各大主流IDE；海量开源仓库训练支撑；代码补全、对话提问与CLI全方位支持',
      ),
      LzSite(
        id: 'code_orig_firebase', title: 'Firebase Studio', url: 'https://firebase.studio/',
        icon: 'https://firebase.studio/favicon.ico', fallback: 'Studio', badge: '云端开发', desc: '新一代云端全栈工作台与一键部署环境', sub: 'ide', hl: '无需本地配置繁琐环境，在浏览器中即可开展全栈编码、调试与即时上线',
      ),
      LzSite(
        id: 'code_orig_windsurf', title: 'Windsurf', url: 'https://windsurf.com/',
        icon: 'https://windsurf.com/favicon.ico', fallback: 'Wind', badge: 'Agent', desc: 'Codeium出品的革命性Agentic AI IDE，具备Cascade心流引擎', sub: 'ide', hl: '首创Cascade心流引擎，无缝融合AI自主行动与人类开发者直觉控制，多文件即时联动',
      ),
      LzSite(
        id: 'code_orig_bolt', title: 'Bolt.new', url: 'https://bolt.new/',
        icon: 'https://bolt.new/favicon.ico', fallback: 'Bolt', badge: '容器', desc: '基于WebContainers直接在浏览器运行Node环境并完整生成全栈应用', sub: 'agent', hl: '零安装在浏览器沙盒中启动Vite与全栈服务，一句话提示词生成、运行并一键部署',
      ),
      LzSite(
        id: 'code_orig_infcode', title: 'InfCode', url: 'https://www.tokfinity.com/infcode',
        icon: 'https://www.tokfinity.com/favicon.ico', fallback: 'Inf', badge: '无限代码', desc: 'Tokfinity出品的无限智能代码与AI生产力驱动引擎', sub: 'agent', hl: '聚焦前沿开发生产力与智能体工作流，助力工程师探索自动化编程无限可能',
      ),
      LzSite(
        id: 'code_add_ollama', title: 'Ollama', url: 'https://ollama.com/',
        icon: 'https://ollama.com/favicon.ico', fallback: 'Oll', badge: '本地模型', desc: '本地极速运行Llama 3、DeepSeek等大模型的轻量级命令行工具', sub: 'assistant', hl: '一行命令拉取、运行并管理海量开源大模型；支持开箱即用OpenAI兼容API',
      ),
      LzSite(
        id: 'code_add_lmstudio', title: 'LM Studio', url: 'https://lmstudio.ai/',
        icon: 'https://lmstudio.ai/favicon.ico', fallback: 'LMS', badge: '桌面模型', desc: '优雅桌面端本地大模型运行工具，支持一键下载运行各类GGUF模型', sub: 'assistant', hl: '完全离线私有运行；支持GPU全显存卸载加速；本地OpenAI格式服务',
      ),
      LzSite(
        id: 'code_add_jan', title: 'Jan AI', url: 'https://jan.ai/',
        icon: 'https://jan.ai/favicon.ico', fallback: 'Jan', badge: '离线优先', desc: '开源离线优先的本地AI对话助手与模型管理桌面客户端', sub: 'assistant', hl: '100%本地存储聊天记录；支持硬件加速与无缝切换云端与本地大模型',
      ),
      LzSite(
        id: 'code_add_cherry', title: 'Cherry Studio', url: 'https://cherry-ai.com/',
        icon: 'https://cherry-ai.com/favicon.ico', fallback: 'Che', badge: '多端聚合', desc: '全能多模型桌面AI客户端，支持全网主流模型聚合与个人知识库', sub: 'assistant', hl: '支持数百家国内外API服务商；内置提示词模板与文档代码多轮交互',
      ),
      LzSite(
        id: 'code_add_chatbox', title: 'Chatbox', url: 'https://chatboxai.app/zh',
        icon: 'https://chatboxai.app/favicon.ico', fallback: 'CB', badge: '全平台', desc: '支持Windows/Mac/Android全平台的跨平台AI对话与代码办公桌面端', sub: 'assistant', hl: '跨端数据同步；支持图像识别与代码高亮高保真渲染；办公好帮手',
      ),
      LzSite(
        id: 'code_add_aider', title: 'Aider', url: 'https://aider.chat/',
        icon: 'https://aider.chat/favicon.ico', fallback: 'Aid', badge: '终端结对', desc: '基于终端命令行的顶尖AI结对编程工具，直接在本地Git仓库协同写代码', sub: 'assistant', hl: '自动感知整个代码仓库架构；自动编写代码并生成精准Git Commit',
      ),
      LzSite(
        id: 'code_add_devin', title: 'Devin', url: 'https://preview.devin.ai/',
        icon: 'https://preview.devin.ai/favicon.ico', fallback: 'Dev', badge: '自主工程师', desc: '全球首位完全自主执行软件工程任务与解决Issue的AI软件工程师', sub: 'agent', hl: '自主分析项目依赖、定位Bug、编写单元测试并提交完整Pull Request',
      ),
      LzSite(
        id: 'code_add_zed', title: 'Zed Editor', url: 'https://zed.dev/',
        icon: 'https://zed.dev/favicon.ico', fallback: 'Zed', badge: 'Rust极速', desc: 'Rust编写的超高性能多人协同与原生AI集成的现代代码编辑器', sub: 'ide', hl: '毫秒级冷启动与零延迟按键响应；原生集成GitHub Copilot与Claude',
      ),
      LzSite(
        id: 'code_add_regex101', title: 'Regex101', url: 'https://regex101.com/',
        icon: 'https://regex101.com/favicon.ico', fallback: 'Reg', badge: '正则神器', desc: '全球开发者最常用的在线正则表达式调试、测试与深度解释工具', sub: 'assistant', hl: '实时高亮匹配分组；逐步分解语法树解释；支持PCRE、Python、JS等引擎',
      ),
      LzSite(
        id: 'code_add_cyberchef', title: 'CyberChef', url: 'https://gchq.github.io/CyberChef/',
        icon: 'https://gchq.github.io/CyberChef/images/cyberchef-128x128.png', fallback: 'Chef', badge: '网络军刀', desc: '网络安全瑞士军刀，支持加密解密、编码转换、散列计算与数据提取', sub: 'assistant', hl: '数以百计的处理操作链式拖拽组合；免除搭建环境，纯本地浏览器解密',
      ),
      LzSite(
        id: 'code_add_caniuse', title: 'Can I use', url: 'https://caniuse.com/',
        icon: 'https://caniuse.com/favicon.ico', fallback: 'Can', badge: '前端兼容', desc: 'Web前端开发必备的浏览器特性与CSS/HTML5兼容性速查表', sub: 'assistant', hl: '精准展示全球与中国主流浏览器版本支持率；前端架构选型必备参考',
      ),
      LzSite(
        id: 'code_add_carbon', title: 'Carbon', url: 'https://carbon.now.sh/',
        icon: 'https://carbon.now.sh/favicon.ico', fallback: 'Car', badge: '代码截图', desc: '一键将你的源代码生成精美高颜值、适合分享的代码截图', sub: 'assistant', hl: '支持数十种代码高亮主题与自定义窗口阴影排版；技术分享神器',
      ),
      LzSite(
        id: 'ind_cb_3', title: 'Steel.dev', url: 'https://steel.dev',
        fallback: 'ST', badge: '开源云浏览', desc: '开源AI Agent专用云端浏览器API，自带反爬绕过与会话管理', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_24', title: 'ScrapingBee', url: 'https://www.scrapingbee.com',
        fallback: 'SB', badge: 'AI网页提取', desc: '内置真实云端无头浏览器渲染与代理轮换的AI网页采集API', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_25', title: 'Skyvern', url: 'https://www.skyvern.com',
        fallback: 'SV', badge: '视觉云浏览', desc: '结合视觉大模型LLM与计算机视觉自动操控云端浏览器完成复杂业务', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_26', title: 'Browser Use', url: 'https://browser-use.com',
        fallback: 'BU', badge: 'Agent连网页', desc: '让任意AI大模型像真人一样丝滑控制浏览器操作的开源神器', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_27', title: 'LaVague', url: 'https://lavague.ai',
        fallback: 'LV', badge: '开源WebAgent', desc: '面向开发者的开源大型动作模型LAM与云端Web浏览器自动化框架', sub: 'framework',
      ),
      LzSite(
        id: 'ind_cb_28', title: 'AgentQL', url: 'https://www.agentql.com',
        fallback: 'AQ', badge: '语义抓网页', desc: '用自然语言语义查询操控动态网页DOM与云端浏览器交互', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_29', title: 'Firecrawl', url: 'https://www.firecrawl.dev',
        fallback: 'FC', badge: '整站转MD', desc: '将任意动态渲染网站瞬间转化为大模型可读干净Markdown的云端引擎', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_30', title: 'Jina Reader', url: 'https://jina.ai/reader',
        fallback: 'JN', badge: 'URL转LLM', desc: '在任意网址前加r.jina.ai即可通过云端浏览器提取纯净正文喂给AI', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_44', title: 'Apify', url: 'https://apify.com',
        fallback: 'AP', badge: '云爬虫商店', desc: '拥有数千个现成云端无头浏览器Actor模板的全栈网页数据抓取与AI投喂平台', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cb_45', title: 'ZenRows', url: 'https://www.zenrows.com',
        fallback: 'ZR', badge: '反封锁云端', desc: '一键绕过Cloudflare等复杂人机验证的AI无头云浏览器API', sub: 'agent',
      ),
      LzSite(
        id: 'ind_cc_15', title: 'RunPod', url: 'https://www.runpod.io',
        fallback: 'RP', badge: '秒级GPU云', desc: '全球AI开发者首选的按秒计费H100/A100/4090容器算力云与Serverless', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_16', title: 'Vast.ai', url: 'https://vast.ai',
        fallback: 'VA', badge: '低价算力网', desc: '全球闲置GPU算力共享市场，以极低价格租用显卡训练与推理大模型', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_17', title: 'Lambda Cloud', url: 'https://lambdalabs.com',
        fallback: 'LB', badge: '深度学习云', desc: '专为大模型预训练与微调集群设计的NVIDIA顶级GPU算力云', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_18', title: 'Modal', url: 'https://modal.com',
        fallback: 'MD', badge: 'ServerlessAI', desc: '用几行Python代码即可在云端瞬间唤醒数百张GPU并发跑模型的神器', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_19', title: 'Baseten', url: 'https://www.baseten.co',
        fallback: 'B10', badge: '高性能部署', desc: '将开源与自研机器学习模型毫秒级部署为高可用生产API的算力底座', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_20', title: 'AutoDL 算力云', url: 'https://www.autodl.com',
        fallback: 'ADL', badge: '国内租GPU', desc: '国内高校与AI炼丹师最常用的高性价比RTX4090/A800按时租赁平台', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_21', title: '恒源云 GPU', url: 'https://gpushare.com',
        fallback: '恒', badge: '炼丹算力云', desc: '专注AI科研训练与ComfyUI镜像秒级启动的国内GPU算力云', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_22', title: '趋动云', url: 'https://www.virtaitech.com',
        fallback: '趋', badge: '池化GPU云', desc: '支持大模型在线开发、公开数据集挂载与GPU弹性算力的AI训练平台', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_25', title: '极链AI云', url: 'https://cloud.videojj.com',
        fallback: '极', badge: '算力租赁', desc: '面向AI开发者与高校实验室的弹性GPU云服务器平台', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_26', title: '智星云', url: 'https://www.ai-galaxy.cn',
        fallback: '智', badge: '渲染GPU云', desc: '专注深度学习训练与3D云渲染的高配GPU算力租赁平台', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_27', title: '无问芯穹 Infini-AI', url: 'https://cloud.infini-ai.com',
        fallback: '芯', badge: '异构大模型云', desc: '清华大学团队孵化、打通多元异构芯片的万卡级大模型MaaS云平台', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_28', title: '潞晨云 Open-Sora', url: 'https://cloud.luchentech.com',
        fallback: '潞', badge: '视频算力云', desc: 'Colossal-AI团队出品的高性价比大模型微调与视频生成算力云', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_29', title: '并行智算云', url: 'https://ai.paratera.com',
        fallback: '并', badge: '科研超算云', desc: '面向高校科研院所的超算级AI大模型训练与科学计算云平台', sub: 'maas',
      ),
      LzSite(
        id: 'ind_cc_30', title: '九章云极 DataCanvas', url: 'https://www.datacanvas.com',
        fallback: '九', badge: '智算操作系统', desc: '自主研发AIFS人工智能基础软件与智算云算力服务底座', sub: 'maas',
      ),
      LzSite(
        id: 'ind_sci_33', title: 'Papers With Code', url: 'https://paperswithcode.com',
        fallback: 'PWC', badge: '论文配开源代码', desc: 'Meta AI支持：将arXiv最新深度学习论文与官方GitHub复现代码、SOTA排行榜一一绑定', sub: 'framework',
      ),
      LzSite(
        id: 'ind_3d_17', title: 'Inworld AI', url: 'https://inworld.ai',
        fallback: 'IW', badge: '智能NPC大脑引擎', desc: '赋予Unity与虚幻引擎5游戏中的NPC独立人格、长期记忆、情绪反应与实时语音自由对话能力', sub: 'agent',
      ),
      LzSite(
        id: 'ind_3d_18', title: 'Convai', url: 'https://www.convai.com',
        fallback: 'CV', badge: '元宇宙3D对话NPC', desc: '让3D虚拟数字人具备空间环境感知、拿取游戏道具并跟玩家实时自然语音互动的AI大脑', sub: 'agent',
      ),
      LzSite(
        id: 'ind_3d_21', title: 'Rosebud AI', url: 'https://www.rosebud.ai',
        fallback: 'RB', badge: '一句话写网页游戏', desc: '零编程基础输入你的游戏创意，AI自动编写Three.js/Phaser代码、生成美术资产并立即在线试玩发布', sub: 'agent',
      ),
      LzSite(
        id: 'ind_3d_35', title: 'NVIDIA Omniverse & Isaac', url: 'https://www.nvidia.com/zh-cn/omniverse',
        fallback: 'NV', badge: '英伟达物理AI数字孪生', desc: '英伟达工业数字孪生与Isaac Lab机器人强化学习万倍加速物理仿真训练底座', sub: 'framework',
      ),
      LzSite(
        id: 'ind_ind_11', title: 'Flux.ai 浏览器AI画电路板', url: 'https://www.flux.ai',
        fallback: 'Flux', badge: '硬件界的GitHub+Copilot', desc: '内置AI硬件助手Flux Copilot：自动阅读芯片Datasheet手册、检查原理图连线错误与自动PCB布线', sub: 'ide',
      ),
      LzSite(
        id: 'ind_sec_15', title: 'Snyk DeepCode AI', url: 'https://snyk.io',
        fallback: 'SN', badge: 'AI秒修代码安全漏洞', desc: '全球开发者安全标配：扫描Git仓库开源依赖漏洞并由DeepCode AI一键生成安全修复PR', sub: 'assistant',
      ),
      LzSite(
        id: 'ind_sec_16', title: 'Socket.dev 供应链防投毒', url: 'https://socket.dev',
        fallback: 'SK', badge: '拦截NPM/PyPI投毒包', desc: '利用AI深度行为分析拦截窃取环境变量与私钥的恶意开源包投毒攻击', sub: 'assistant',
      ),
      LzSite(
        id: 'ind_sec_17', title: 'Semgrep Code AI', url: 'https://semgrep.dev',
        fallback: 'SG', badge: '毫秒级静态代码审计', desc: '支持30+语言的高速开源静态代码分析引擎与AI误报过滤助手', sub: 'assistant',
      ),
      LzSite(
        id: 'ind_tech_21', title: 'GitHub Trending 每日全球开源热榜', url: 'https://github.com/trending',
        fallback: 'Trend', badge: '每天看全世界程序员正在疯抢Star什么新项目', desc: '按日、周、月及编程语言实时查看全球开源界最新爆火的AI Agent、UI组件库与黑科技仓库', sub: 'framework',
      ),
      LzSite(
        id: 'ind_tech_23', title: 'Replicate 云端跑遍万款开源AI模型', url: 'https://replicate.com/explore',
        fallback: 'Rep', badge: '一行API或网页直接运行Flux/SDXL/音乐视频模型', desc: '汇集数万个社区打包好的开源机器学习模型，网页输入参数秒出结果，按秒计费无需自己配环境', sub: 'maas',
      ),
      LzSite(
        id: 'ind_tech_38', title: 'Composio.dev (为AI Agent接入250+软件工具)', url: 'https://composio.dev',
        fallback: 'CMP', badge: '一行代码让Agent托管登录操作GitHub/Gmail/Linear', desc: '自动处理复杂的OAuth2鉴权与API容错，让LangChain/CrewAI/AutoGen智能体丝滑调用250种主流办公开发软件', sub: 'agent',
      ),
      LzSite(
        id: 'ind_tech_39', title: 'E2B.dev (AI Agent云端安全代码沙箱)', url: 'https://e2b.dev',
        fallback: 'E2B', badge: '毫秒级为AI大模型分配独立Linux云端代码执行环境', desc: '让AI编写的Python数据分析、爬虫、全栈应用代码在完全隔离的Firecracker微虚拟机云沙箱中安全运行并实时预览', sub: 'agent',
      ),
      LzSite(
        id: 'ind_tech_40', title: 'CrewAI 角色协同多智能体框架', url: 'https://www.crewai.com',
        fallback: 'Crew', badge: '像组建公司团队一样让多个AI分工合作干活', desc: '全球最火爆的多Agent协同框架：定义研究员、程序员、质检员、主笔四个AI角色，全自动交接完成复杂商业报告与软件项目', sub: 'framework',
      ),
      LzSite(
        id: 'ind_tech_41', title: 'AutoGen (微软开源多Agent对话框架)', url: 'https://microsoft.github.io/autogen',
        fallback: 'AG', badge: '微软研究院出品的多智能体协作与代码执行基石', desc: '支持多个LLM智能体之间互相争辩、写代码、跑测试、结合人类反馈协同解决高难度数学与工程任务', sub: 'framework',
      ),
      LzSite(
        id: 'ind_tech_42', title: 'MetaGPT (一句话变成一家软件公司)', url: 'https://www.deepwisdom.ai',
        fallback: 'MGPT', badge: 'SOP标准作业程序驱动的多智能体虚拟软件公司', desc: '输入一句话需求，内部的AI产品经理写PRD、AI架构师画设计图、AI工程师写代码、AI测试写单测全流程自动交付', sub: 'framework',
      ),
      LzSite(
        id: 'ind_tech_43', title: 'Camel-AI (首个自主合作Agent开源社区)', url: 'https://www.camel-ai.org',
        fallback: 'CML', badge: '探索大规模多智能体社会交互与OWL通用Agent', desc: '开源顶流OWL通用多智能体框架，在GAIA基准测试中名列前茅，支持自动操作浏览器、文档与终端解决现实任务', sub: 'framework',
      ),
      LzSite(
        id: 'ind_tech_44', title: 'OpenHands (原OpenDevin 开源AI软件工程师)', url: 'https://www.all-hands.dev',
        fallback: 'OH', badge: 'GitHub五万星完全开源的自主编程Agent平台', desc: '自带安全Docker终端、代码编辑器与内置Chromium云浏览器，可自主阅读文档、修复GitHub真实Issue并提交代码', sub: 'agent',
      ),
      LzSite(
        id: 'ind_tech_48', title: 'Windsurf Editor (Codeium Agentic IDE)', url: 'https://codeium.com/windsurf',
        fallback: 'WS', badge: '首款Cascade深度上下文心流AI编程IDE', desc: '与Cursor并驾齐驱的王牌AI IDE：具备全仓库深层感知、多文件连贯重构、终端命令自动执行与极速免费补全', sub: 'ide',
      ),
    ],
  ),
];
