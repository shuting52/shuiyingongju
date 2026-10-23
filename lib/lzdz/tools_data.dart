import 'package:flutter/material.dart';

/// 工具箱目录:移植自 10-05landezhaole(懒得找了) ToolboxScreen.
/// 图标沿用原 App 的 Material Icons 语义;页面实现见 lib/lzdz/tools/.
class LzTool {
  final String id;
  final String title;
  final String shortLabel;
  final String desc;
  final IconData icon;

  const LzTool({
    required this.id,
    required this.title,
    required this.shortLabel,
    required this.desc,
    required this.icon,
  });
}

const List<LzTool> kLzTools = [
  LzTool(
    id: 'mouthpiece',
    title: '最强嘴替 · 神级回怼',
    shortLabel: '最强嘴替',
    desc: '神级回怼生成器 · 专治杠精职场催婚 · 优雅不带脏字',
    icon: Icons.record_voice_over,
  ),
  LzTool(
    id: 'age_calc',
    title: '年龄算术 · 生肖测算',
    shortLabel: '年龄算术',
    desc: '精准年月日时分秒 · 生肖天干地支 · 人生进度条',
    icon: Icons.cake,
  ),
  LzTool(
    id: 'offline_treasure',
    title: '离线百宝 · 百宝锦囊',
    shortLabel: '离线百宝',
    desc: 'LED滚动弹幕 · 电子功德木鱼 · 随机做决定器 · SOS爆闪',
    icon: Icons.backpack,
  ),
  LzTool(
    id: 'food_picker',
    title: '今天吃什么 · 随机摇签',
    shortLabel: '今天吃什么',
    desc: '随机摇签 · 各大菜系 · 配料调味料 · 华夏美食宝库',
    icon: Icons.restaurant,
  ),
  LzTool(
    id: 'emergency_phone',
    title: '紧急电话 · 救命热线',
    shortLabel: '紧急电话',
    desc: '救援/道路/举报/法律 · 一键快捷呼出 · 全国通用守护平安',
    icon: Icons.emergency,
  ),
  LzTool(
    id: 'license_plate',
    title: '车牌摇号 · 全国城市选号',
    shortLabel: '车牌摇号',
    desc: '全国城市 · 菜单选择 · 号牌池 · 一键摇号',
    icon: Icons.directions_car,
  ),
  LzTool(
    id: 'cold_joke',
    title: '冷笑话 · 一键分享',
    shortLabel: '冷笑话',
    desc: '随机一条冷笑话 · 一键分享到聊天/短视频平台',
    icon: Icons.ac_unit,
  ),
  LzTool(
    id: 'speed_test',
    title: '测速网 · 真实测速',
    shortLabel: '测速网',
    desc: '真实下载测速 · Ping 延迟 · 当前位置',
    icon: Icons.speed,
  ),
  LzTool(
    id: 'currency',
    title: '货币转换 · 实时汇率',
    shortLabel: '货币转换',
    desc: '全球 50+ 货币 · 实时汇率 · 双向换算',
    icon: Icons.currency_exchange,
  ),
  LzTool(
    id: 'period',
    title: '生理期记录 · 经期日历',
    shortLabel: '生理期记录',
    desc: '经期日历 · 排卵易孕期预测 · 流量症状心情 · 规律性统计',
    icon: Icons.calendar_month,
  ),
  LzTool(
    id: 'worktime',
    title: '工时打卡 · 考勤记录',
    shortLabel: '工时打卡',
    desc: '日历打卡 · 班次工时 · 月度统计 · 薪资估算',
    icon: Icons.work,
  ),
  LzTool(
    id: 'ip_check',
    title: 'IP纯净度检测',
    shortLabel: 'IP纯净度',
    desc: '原生深度诊断 · IP 纯净度 · 住宅/机房识别 · 欺诈评分',
    icon: Icons.security,
  ),
  LzTool(
    id: 'car_brand',
    title: '车标大全 · 真实车标识别',
    shortLabel: '车标识别',
    desc: '大众/宝马/迈巴赫等真实车标库 · 品牌档案 · 以图搜车标',
    icon: Icons.directions_car_filled,
  ),
  LzTool(
    id: 'image_prompts',
    title: '做图指令大全',
    shortLabel: '做图指令',
    desc: '160 分类 1496 条做图指令 · 修图/字体/电商/摄影/艺术全域 · 一键复制',
    icon: Icons.auto_awesome,
  ),
  LzTool(
    id: 'qr_generator',
    title: '二维码生成 · 文本链接转码',
    shortLabel: '二维码生成',
    desc: '文本/链接一键生成高清二维码 · 长按截图保存',
    icon: Icons.qr_code_2,
  ),
  LzTool(
    id: 'password_gen',
    title: '密码生成器 · 随机强密码',
    shortLabel: '密码生成',
    desc: '长度可调 · 大小写数字符号自由组合 · 本地生成不上传',
    icon: Icons.key,
  ),
  LzTool(
    id: 'unit_convert',
    title: '单位换算 · 长度重量温度',
    shortLabel: '单位换算',
    desc: '长度/重量/温度双向换算 · 常用单位全覆盖',
    icon: Icons.swap_horiz,
  ),
  LzTool(
    id: 'bmi_calc',
    title: 'BMI计算 · 健康指数',
    shortLabel: 'BMI计算',
    desc: '身高体重算 BMI · 健康分级与建议',
    icon: Icons.monitor_weight,
  ),
  LzTool(
    id: 'countdown',
    title: '倒数日 · 纪念日',
    shortLabel: '倒数日',
    desc: '生日考试纪念日 · 自动算剩余天数 · 本地保存',
    icon: Icons.event,
  ),
  LzTool(
    id: 'random_draw',
    title: '随机抽签 · 帮你做决定',
    shortLabel: '随机抽签',
    desc: '随机数/抛硬币/掷骰子/名单抽取 · 选择困难症救星',
    icon: Icons.casino,
  ),
  LzTool(
    id: 'music_player',
    title: '音乐播放器 · 在线试听',
    shortLabel: '音乐播放器',
    desc: '在线试听 · 本地收藏',
    icon: Icons.music_note,
  ),
];
