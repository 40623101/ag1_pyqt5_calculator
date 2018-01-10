<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ahshoe.20161120121808.1"><vh>@settings</vh>
<v t="ahshoe.20170315212615.1"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="ahshoe.20170315212626.1"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="40323230.20170123213451.1"><vh>@button Report pdf</vh></v>
<v t="yen.20170429132400.1"><vh>協同著作規劃</vh></v>
<v t="leo.20171218141522.1"><vh>報告章節規劃</vh></v>
<v t="yen.20170429103742.1" a="E"><vh>@path ./../</vh>
<v t="yen.20170429103940.1" a="E"><vh>@path markdown</vh>
<v t="ahshoe.20170322182713.1"><vh>@edit reference.md</vh></v>
<v t="ahshoe.20170322181453.1"><vh>@edit refer.bib</vh></v>
<v t="leo.20171119234752.1" a="E"><vh>封面以及摘要</vh>
<v t="ahshoe.20161120122151.1"><vh>@clean cover_and_abstract.md</vh>
<v t="ahshoe.20170317115820.1"><vh>摘要</vh></v>
</v>
</v>
<v t="leo.20171119234822.1" a="E"><vh>各章節內容</vh>
<v t="yen.20170429214845.1" a="E"><vh>@path paragraph</vh>
<v t="yen.20170429214838.1" a="E"><vh>@clean introduction.md</vh>
<v t="yen.20170429214838.3"><vh>前言內容</vh></v>
</v>
<v t="yen.20170429215041.1" a="E"><vh>@clean portable_system.md</vh>
<v t="yen.20170429215130.1"><vh>可攜程式系統介紹</vh></v>
</v>
<v t="yen.20170429215252.1" a="E"><vh>@clean python_introduction.md</vh>
<v t="yen.20170429215308.1"><vh>Python 程式語法介紹</vh></v>
</v>
<v t="yen.20170429215416.1" a="E"><vh>@clean pyqt5_introduction.md</vh>
<v t="yen.20170429215446.2"><vh>PyQt5 語法介紹</vh></v>
</v>
<v t="yen.20170429215617.1" a="E"><vh>@clean calculator.md</vh>
<v t="yen.20170429215851.1"><vh>計算機程式內容</vh></v>
</v>
<v t="yen.20170429215922.1" a="E"><vh>@clean discussion.md</vh>
<v t="yen.20170429220001.1"><vh>程式開發心得</vh></v>
</v>
<v t="yen.20170429220128.1" a="E"><vh>@clean results.md</vh>
<v t="yen.20170429220137.1"><vh>期末報告結論</vh></v>
</v>
<v t="yen.20170429220335.1" a="E"><vh>@clean appendix.md</vh>
<v t="yen.20170429220335.2"><vh>附錄</vh></v>
</v>
</v>
</v>
</v>
</v>
<v t="leo.20180110215023.2" a="E"><vh>Recovered Nodes</vh>
<v t="leo.20180110215023.3"><vh>Recovered node "摘要" from @clean cover_and_abstract.md</vh>
<v t="leo.20180110215023.4"><vh>old:摘要</vh></v>
<v t="leo.20180110215023.5"><vh>new:摘要</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="40323230.20170123213451.1">@language python
filename = "report"
import os, platform
# 更換目錄到 markdown 
os.chdir("./../markdown")

# 若在 Linux 環境則使用 ukai.ttc 系統字形
if platform.system().lower()=="linux": font = "ukai.ttc"
# 在 windows 環境使用 SimSun 字形
elif platform.system().lower()=="windows": font = "SimSun"
else: font = "Arial"
fontsize = "12"
margin = "1in"
# --pdf-engine 使用 xelatex
# lang 請參照 https://tools.ietf.org/html/bcp47, 這裡的 zh-cmn 為 Mandarin Chinese 國語
# -V lang=zh-cmn 為一組 key=value 對應的 Variable 設定
# -N 表示 Number section headings in LaTeX, ConTeXt, HTML, or EPUB output. By default, sections are not numbered.
settingFlag = "--pdf-engine=xelatex -V lang=zh-cmn -N --toc --highlight-style kate -V documentclass=report  --filter pandoc-fignos --filter pandoc-tablenos --template=template.tex -V \"CJKmainfont:{0}\" -V fontsize={1}pt -V geometry:margin={2} --bibliography=refer.bib --csl=ieee.csl".format(font, fontsize, margin)
g.es("---Pandoc---")

# 選擇所要納入的 Markdown 檔案, 不納入的檔案名稱前方加上  # 即可
chapter_list = " ".join("./paragraph/" + i for i in [
"introduction.md",
"portable_system.md", 
"python_introduction.md", 
"pyqt5_introduction.md", 
"discussion.md", 
"results.md", 
])

# 若系統並未正確轉檔, 可以將 os.system 改為 g.es 表示要使用 Leo Editor 的 global 物件中的 echo string 將指令印在 log 區
# 然後複製指令, 然後在命令列視窗中的 markdown 目錄中執行, 就可以得到錯誤訊息
# 或許可以再從 https://stackoverflow.com/questions/26005583/return-value-of-x-os-system 中的建議改進此一指令
g.es(os.system("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag)))
g.es("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("PDF 轉換完畢")
g.es('-'*12)</t>
<t tx="ahshoe.20161120121808.1"></t>
<t tx="ahshoe.20161120122151.1">---
university_zh: '國立虎尾科技大學'
institute_zh: '機械設計工程系'
category_zh: '計算機程式 ag1 期末報告'
title_zh: 'PyQt5 事件導向計算器'
title_en: 'PyQt5 Event-Driven Calculator Project'
author:
- 設計一甲 40623101 王馨慧
- 設計一甲 40623102 吳柔燕
- 設計一甲 40623103 宋宜蓁
- 設計一甲 40623110 翁俊揚
- 設計一甲 40623111 王映捷
- 設計一甲 40623112 王柏翔

advisor_zh: '嚴家銘'
date: '2017.12.18'
---

@others
</t>
<t tx="ahshoe.20170315212615.1">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="ahshoe.20170315212626.1">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="ahshoe.20170317115820.1">---
abstract: |
    了解fossil 與github，並運用在計算機程式上
    
    + 視窗命令列與Fossil SCM 常用指令。
    + Python3 程式語法練習
    + 客製化可攜環境及PyQt5 程式編寫
    + Github 協同倉儲+ 普通計算機程式設計(採用PyQt5 與Python3 建立，採用
事件導向的方式
    
    



</t>
<t tx="leo.20171119234752.1"></t>
<t tx="leo.20171119234822.1"></t>
<t tx="leo.20171218141522.1">標題頁 - 含報告標題、作者、日期與所屬單位
目錄 - 列出全文章節與所屬頁面連結
摘要 - 解釋報告編寫動機、報告重點、結論、建議與關鍵字

前言 - 簡要描述全文意旨與背景, 說明報告目標與報告內容組成架構

內文 - 依照章節標題, 詳細說明報告內容, 包括方法、操作步驟與所得結果的詳細說明

結論 - 條列所獲致的重要成果, 與摘要及導言中的目標互相呼應

討論與建議 - 說明後續值得進行的方向、方法與可能遭遇問題的討論

參考 - 詳列所引用的參考內容

附錄 - 附加值得參考的詳細內容</t>
<t tx="leo.20180110215023.2"></t>
<t tx="leo.20180110215023.3">(uncached) ahshoe.20170317115820.1
Diff...
  ---
  abstract: |
-     了解fossil 與github，並運用在計算機程式上
+     這裡是摘要內容。A pipe character, followed by an indented block of text is treated as a literal block, in which newlines are preserved throughout the block, including the final newline.
      
+     + 以 YAML 的方式插入。
+     + The '+' indicator says to keep newlines at the end of text blocks.
+     + 使用 Markdown 語法。
+     + 前面使用加號
-     + 視窗命令列與Fossil SCM 常用指令。
-     + Python3 程式語法練習
-     + 客製化可攜環境及PyQt5 程式編寫
-     + Github 協同倉儲+ 普通計算機程式設計(採用PyQt5 與Python3 建立，採用
- 事件導向的方式
      
-     
+     本研究的重點在於 ...
+ ---
  
  
- 
</t>
<t tx="leo.20180110215023.4">---
abstract: |
    這裡是摘要內容。A pipe character, followed by an indented block of text is treated as a literal block, in which newlines are preserved throughout the block, including the final newline.
    
    + 以 YAML 的方式插入。
    + The '+' indicator says to keep newlines at the end of text blocks.
    + 使用 Markdown 語法。
    + 前面使用加號
    
    本研究的重點在於 ...
---


</t>
<t tx="leo.20180110215023.5">---
abstract: |
    了解fossil 與github，並運用在計算機程式上
    
    + 視窗命令列與Fossil SCM 常用指令。
    + Python3 程式語法練習
    + 客製化可攜環境及PyQt5 程式編寫
    + Github 協同倉儲+ 普通計算機程式設計(採用PyQt5 與Python3 建立，採用
事件導向的方式
    
    



</t>
<t tx="yen.20170429103742.1"></t>
<t tx="yen.20170429103940.1"></t>
<t tx="yen.20170429132400.1">每一位協同人員各在 users 目錄中建立一個 .leo 檔案

各自選擇要編輯的 .md 檔案, 可以使用 @edit 或 @clean 節點編輯指令

除非必要否則不更動 markdown 目錄下的 template.tex 檔案</t>
<t tx="yen.20170429214838.1">前言
===

計算器程式期末報告前言

@others
</t>
<t tx="yen.20170429214838.3">前言
---


1. 機械設計: 經過詳細的思考，完成各個互動元件的配置，讓它展現出特定功
能的具體規劃表達。
2. 表達方式: 口語、文字、2D、3D、理論、實體。
3. 創造力: 自學力、執行、想像。


使用隨身碟可攜系統中的基本視窗命令提示指令元，, 編輯近端及提送到遠端，用
eric6 的程式軟體，結合python3 與PyQt5 建立簡易的計算機，其中使用python3
物件導向和視窗事件驅動的基本概念。
</t>
<t tx="yen.20170429214845.1"></t>
<t tx="yen.20170429215041.1">可攜程式系統介紹
===

可攜程式系統介紹

@others
</t>
<t tx="yen.20170429215130.1">啟動與關閉
---

1. start.bat 會開啟cover_and_abstract cmd exe
2. 可以從cover_and_abstract 中修改start.bat 讓他開啟時可以一起開啟leo
3. 從cover_and_abstract 中修改leo 讓他在start.bat 開啟時可以找到要開的檔案
stop.bat 的作用關閉全部的檔案

Leo Editor
---

1. 開啟與編輯Reveal.js 投影片
2. 編輯Pelican 靜態blog
3. 利用IPv4 WWW 伺服器在近端檢視Pellican Blog
</t>
<t tx="yen.20170429215252.1">Python 程式語法
===

Python 程式語法

Python 程式語法
---

if 語句：當條件成立時執行語句塊。經常與else, elif（相當於else if）配合使用。

for 語句：遍列列表、字串、字典、集合等疊代器，依次處理疊代器中的每個元素。

while 語句：當條件為真時，循環執行語句塊。

try 語句：與except, finally, else 配合使用處理在程式執行中出現的異常情況。

class 語句：用於定義類型。

def 語句：用於定義函式和類型的方法。

Print 函式: 支援遞迴、預設參數值、可變參數，函式呼叫時，可以如同C 語言那樣按照位置與形參符合，也可以按照命名參數形式呼叫，param_name=value 形式的實參。在一個函式呼叫的實參表中，關鍵字引數必須出現在位置參數之後。

運算:Python 使用與C、Java 類別似的運算子，支援整數與浮點數的數學運算。同時還支援複數運算與無窮位數（實際受限於電腦的能力）的整數運算。除了求絕對值函式abs() 外，大多數數學函式處於math 和cmath 模組內。

@others
</t>
<t tx="yen.20170429215308.1">變數命名
---

變數必須以英文字母大寫或小寫或底線開頭變其餘字元可以是英文大小寫字母、數字、底線變數區分英文大小寫變數不限字元長度不可使用關鍵字當變數名稱。

Python3 的程式關鍵字, 使用者命名變數時, 必須避開下列保留字:[“False”,”None”,”True”,”and”,”as”,”assert”,”break”, ”class”,”continue”,”def”,”del”,”elif”,”else”,”except”,“finally”,”for”,”from”,”global”,”if”,”import”,”in”, ”is”,”lambda”,”nonlocal”,”not”,”or”,”pass”,”raise”,“return”,”try”,”while”,”with”,”yield”]

print 函式
---
1. print( ) 為Python 程式語言中用來列印數值或字串的函式
2. sep 變數定義分隔符號, sep 內定為“,”, end 變數則用來定義列印結尾的符號
3. end 內定為跳行符號.

重複迴圈
---
用於已知重複次數的程式，配合數列。

for i in number: i.clicked.connect(self.digitClicked)

判斷式
---
if self.display.text() == ‘0’ and digitValue == 0.0:
    return

數列
---
number = [self.one, self.two, self.three, self.four, self.five, self.six, self.seven, self.eight,self.nine]
</t>
<t tx="yen.20170429215416.1"> PyQt5 簡介
===

說明 PyQt5 基本架構與程式開發流程
PyQt5 簡介
---

PyQt5 是Python 語言的GUI 編程解決方案之一。可以用來代替Python 內建的
Tkinter。其它替代者還有PyGTK、wxPython 等。與Qt 一樣，PyQt 是一個自由軟
體。PyQt 是PyKDE 的基礎。


@others
</t>
<t tx="yen.20170429215446.2">PyQt5 架構
---

大部分所見的圖形化介面程式語言都是由有物件導向的程式語言開發的，例如C+
+、Java、C#、Python 等。

直接使用C++ 語言「寫出」圖形介面是一件滿費心的差事，因此有滿多圖形介面的函式庫(library) 可以使用，例如Qt、Tk、wxWidgets、GTK+ 等。使用簡單的函式(function) 就可創造視窗介面，並且有很多函式庫盡力克服「跨平台」的障礙。由於可以包含的部件極多，稱得上圖形介面「框架(framework)」一詞。
</t>
<t tx="yen.20170429215617.1">Calculator 程式
===

Calculator 程式細部說明

@others</t>
<t tx="yen.20170429215851.1">建立對話框
---

自動控制 的內容

其中包含一個表格：

Table: Python 網際框架比較 {#tbl:網際框架}

| Framework | Started | Py2 | Py3 | ORM | Template Engine | Auth Moudule | Database Admin | Project Scale |
|:---------:|:-------:|:---:|:---:|:---:|:---------------:|:------------:|:--------------:|:-------------:|
| Pyramid | 2005 | V | V |  |  | V |  | large |
| Django | 2006 | V | V | V | V | V | V | large |
| Flask | 2010 | V |  |  |  |  |  | small |

稱為表 {@tbl:網際框架}。

Table: 價目表 {#tbl:價目表}

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

稱為表 {@tbl:價目表}。

關於表格生成可以參考這裡：[http://www.tablesgenerator.com/markdown_tables]

[http://www.tablesgenerator.com/markdown_tables]: http://www.tablesgenerator.com/markdown_tables

建立按鈕
---

建立程式碼
---

</t>
<t tx="yen.20170429215922.1">心得
===

期末報告心得

@others
</t>
<t tx="yen.20170429220001.1">Fossil SCM
---

40623101 王馨慧

用fossil 的基本指令，去做遠端及近端的同步，還有自我管理倉儲。

40623102  吳柔燕

管理倉儲，了解近端與遠端，學習fossil指令。

網誌心得
---

40623101 王馨慧

整理每周上課內容，並推送到上面，忘了還可以看，而且想改的話，隨時都可以。

40623102 吳柔燕

統整上課內容，可以隨時查看並更改。

Github 協同倉儲
---

40623101 王馨慧

雖然同步工作很好，但同步後，不一定會很順利，如何去解決衝突，就變得很重要。

40623102 吳柔燕

大家的分工合作很重要，能一起檢查錯誤，但衝突也需要一些解決時間。

學員心得
---

40623101 王馨慧

這學期學到了很多新東西，雖然學的很辛苦，但其實它還挺有趣的，而且覺得未
來會用到的機率很高。

40623102 吳柔燕

在這門課學到了很多，一開始真的是手足無措，但在問題解決後成功的結果，也讓我在其中找到了一些樂趣。

說明各學員任務與執行過程
---

40623101 王馨慧 :
建立協同倉儲，負責數字迴圈，0不重複及clear all後為0。

40623102 吳柔燕 :
負責加減按鈕，回復按鈕。

40623103 宋宜蓁 :
負責MC,MR,MS,M+，小數點按鈕。

40623110 翁俊揚 :
負責單一運算元按下後處理方法。

40623111 王映捷 :
負責乘除按鈕。

40623112 王柏翔 :
負責根號，平方及倒數按鈕。


</t>
<t tx="yen.20170429220128.1">結論
===

期末報告結論

@others</t>
<t tx="yen.20170429220137.1">結論與建議
---

結論與建議內容</t>
<t tx="yen.20170429220335.1">附錄
===

附錄內容

@others</t>
<t tx="yen.20170429220335.2">專案執行會議紀錄
---

操作過程照片
---

操作過程照片</t>
</tnodes>
</leo_file>
