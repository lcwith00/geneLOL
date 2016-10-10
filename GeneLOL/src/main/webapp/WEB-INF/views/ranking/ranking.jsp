<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href=".css"/>
<title>GeneLOL Ranking</title>
<link rel="stylesheet" type="text/css"
   href="resources/semantic-ui/semantic.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/semantic-ui/semantic.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="./Grid Example - Semantic_files/reset.css">
<link rel="stylesheet" type="text/css"
   href="./Grid Example - Semantic_files/site.css">

<link rel="stylesheet" type="text/css"
   href="./Grid Example - Semantic_files/container.css">
<link rel="stylesheet" type="text/css"
   href="./Grid Example - Semantic_files/divider.css">
<link rel="stylesheet" type="text/css"
   href="./Grid Example - Semantic_files/grid.css">
<link rel="stylesheet" type="text/css"
   href="./Grid Example - Semantic_files/header.css">
<style type="text/css">
.two.wide.column {
   word-wrap: break-word;
   text-align: center;
}

.three.wide.column {
   word-wrap: break-word;
   text-align: center;
   min-width: 179px;
}

.ui.three.column.grid {
   min-width: 970px;
}
#search{margin: 10px;   min-width: 388px;}
#rankingPage{border: 1px solid black;
margin: 3px;
}
</style>
</head>
<body>
<!--  총 16 1 2 3 3  2 2 3 -->


            <div class='box-body' id="search">

               <select name="searchType">
                  <option value="id"
                     <c:out value="${cri.searchType eq 'id'?'selected':''}"/>>
                     id명</option>
                  <option value="tier"
                     <c:out value="${cri.searchType eq 'tier'?'selected':''}"/>>
                     티어</option>
               </select> <input type="text" name='keyword' id="keywordInput"
                  value='${cri.keyword }'>
               <button id='searchBtn'>Search</button>
               <button id='newBtn'>New Board</button>

            </div>

      <div class="ui three column grid" id="rankingPage">
         <div class="two wide column">순위</div>
         <div class="three wide column">아이콘</div>
         <div class="three wide column">id명</div>
         <div class="two wide column">티어</div>
         <div class="two wide column">티어점수</div>
         <div class="four wide column">승률</div>
      </div>
            <div class="ui three column grid" id="rankingPage">
         <div class="two wide column">12345678</div>
         <div class="three wide column">아이콘aaaaaaaaa</div>
         <div class="three wide column">최대여덟글자까지</div>
         <div class="two wide column">Challenger</div>
         <div class="two wide column">1234</div>
         <div class="four wide column">300전 200승 100패 66.6%</div>
      </div>
      
</body>
</html>