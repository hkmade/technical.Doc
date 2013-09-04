##Wordpress installl on NAS Server
####Binary download  
`http://ko.wordpress.org`     // 2013.09.02현재 버젼 3.6

####Domain Check
호스트이름  
`http://site url`   
표시할웹사이트  
`http://hk1.storycbue.kr:8080`

dnsever.com을 통해 80 웹포워딩 추가.  // 일반 가정집 인터넷회선은 80 web port를 막는 경우가 많다.  
`http://site url:8080 ---> http://site url`  

####Binrary install
ubuntu에서 기본 htdocs 폴더는  `/var/www` 지점이다.
`/var/www` 에서 해당  binary 압축해제. 디렉토리와 파일 모두 `www-data` 권한으로 변경.

`chown -R www-data:www-data wordpress`

웹브라우저에서 `http://site url/wordpress`  실행

#### 워드프레스 3.5에서 달라진점. (책하고 많이 달라짐)  
 
 미디어 매니저 추가됨.  
 미디어 메뉴의 파일올리기, 에디터에서 미디어추가하는 과정이 많이 변화가 있음  
 링크메뉴가 사라짐  
 살리려면 Link Manager 플러그인사용.  
 즐겨찾기 특성 필터 추가  
 원격출판 옵션, 프라이버시 메뉴 사라짐  

####Wordpress configuration 
워드프레스를 처음 설치하는 경우 설정화일 이 없으므로 오류메세지 출력. 이때 설정파일 만들기를 선택해서 생성한다.
phpmyadmin이나  command line에서 Mysql DB 를 생성
`hkmade@storycube:/etc/mysql$ mysql -u root -p`  
`Enter password:`  
`mysql> create database wordpress;`  
`Query OK, 1 row affected (0.00 sec)`
`mysql> show databases;`

아래의 웹페이지 정보를 입력할것. 사용자 이름과 암호는 mysql 계정정보

	데이터베이스 이름  wordpress  
	사용자이름  
	암호	  
	데이터베이스 호스트 localhost  
	데이블접두어 

	사이트제목 - 추후에 변경 가능 miles story
	사용자명 - 절대 변경 불가능  
	비밀번호 두번  -
	사이트초기에는 프라이버스 항목 체크해제. (검색엔진이 목록을 업데이트하지 못하도록.. )

####URL change
초기 시작 URL 주소를 `http://site url/wordpress`  가 아닌 `http://site url`  로 변경

`~/htdocs/wordpress/index.php ` 화일을 `~/htdocs` 폴더로 복사한다.  

index.php의 제일 아래라인을 수정할것.  
`/** Loads the WordPress Environment and Template */`  
`require('./wordpress/wp-blog-header.php');`


####Wordpress basic configuration
`http://site url/wordpress/wp-admin`  으로 접속. 
#####설정 - 일반

	사이트제목
	워드프레스주소
	사이트주소
	시간대   서울
	날짜표시  년,월등의 한글이 포함되지 않는 양식
	시간표시 한글표시되지 않은 양식
	시작요일 월요일
	
#####설정 - 쓰기
	첫 페이지 표시 - 최근 글 or 정적인 편집페이지
	페이지당 글 수
	RSS에서 보여줄 글 수
	RSS에서 전체내용 또는 일부내용 보여주기
	
#####설정 - 토론
댓글쓰기 정책을 설정. 웹사이트의 댓글 정책은 일정한 방향성을 가지는 것이 좋다.
처음에는 모든 댓글을 허용하고 최소한의 제한만 둘것.


	댓글을 모두 허용할지.. 로그인한 사람만 허용할지
	댓글을 보이기전 - 댓글을 싼 사람이 예전에 댓글에 승인된 적이 있어야 한다. 체크
	
#####설정 - 미디어
높이는 빈칸으로 두면 자동으로 비율에 맞게 변경
중간, 최대크기의 이미지 크기 변경

	중간 크기 - 최대 폭520
	최대 크기 - 최대 폭800
#####설정 - 고유주소
일반적으로 숫자타입이 무난하다. 혹은 사용자 정의 구조에서 조합도 가능
페이지는 이러한 형태로의 변경이 불가능하며 오로지 블로그 포스트만 가능.

#####사용자 - 당신의 프로필
사용자명은 변경불가
개인정보란은 테마에 따라 보여주기도 하며 입력하는 것이 좋다

#####아바타 설정
wp의 대시보드가 아닌 별도의 사이트에서 직접 등록.
반드시 해당 계정의 이메일 정보가 wp과 그라바타(gravatar.com) 사이트가 동일해야 한다. 
현재는 한글사이트도 서비스를 하고 있으며 WP사이트에 계정이 있다면 WP 인증을 통해 바로 로그인이 가능하다.
원하는 사진을 웹 또는 Local PC에서 선택한 후 crop하여 적절한 이미지를 등록한다.

###테마설치

---
####테마설정
테마를 적용하기 위해서는 반드시 wp 블로그내에 컨텐츠가 포함되어 있어야 한다. 따라서 다른 블로그의 컨텐츠를 import한 후에 적용을 시작하자.

Word-press Importer 플러그인 수동 설치. 2013.09 현재 버젼 0.6.1 (책에서 제공하는 예제 컨텐츠글)

	도구 - 가져오기 - WordPress 선택
	설치하기 버튼 실행 후 자동으로 zip화일 다운로드 및 설치 완료.
	설치 완료 후 
	도구 - 가져 오기 - WordPress선택. Wordpress importer 플러그인이 자동으로 활성화되면서 실행
	반드시 Download adn import file attachment 를 체크해야 image도 가져온다
 
 Blogger Importer 플러그인 수동설치. 2013.09현재 버젼 0.5. WP 버젼에서 충분히 테스팅되지 않았다고 나오지만 blogger 사이트의 내용을 WP의 대시보드에서 바로 import해줌
 
 	도구 - 가져오기 - Blogger 선택

import시 포함된 이미지 명이 한글인 경우 오류가 발생할 수 있다. 따라서 블로그에 업로드 하는 이미지 명은 기본적으로 한글이 아닌 영문,숫자로 하는 것이 좋다. 오류발생시 해당 이미지는 rename 후 수동으로 재업로드가 필요하다

import 실패 후 다시 import를 하는 경우 반드시 기존 import했던 컨텐츠는 모두 삭제 후 휴지통까지 완전히 비운후에 다시 import작업이 필요하다. 

####무료테마 다운로드 Bueno
http://www.woothemes.com/ 방문
Themes 메뉴 선택. free 체크후 검색.
책의 예제인 Bueno와 내가 맘에 드는 The Morning After 두개 다운로드
다운로드 전 가입 필요. (무료)

	알림판-외모-테마설치탭-업로드
	활성화 버튼으로 적용하기
기존 다운받은 zip화일을 그대로 선택해서 올려야 한다. 
활성화 하면 해당 테마의 설정메뉴가 알린판의 최상위 메뉴로 생성된다. (테마별로 다른데 보통 구조화된 우수한 테마들이 지원하는 기능이다. )

 



	

