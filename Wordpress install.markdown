###Wordpress installl on NAS Server
---
####Binary download  
`http://ko.wordpress.org`     // 2013.09.02현재 버젼 3.6

####Domain Check
호스트이름   `http://site url`  
표시할웹사이트  `http://hk1.storycbue.kr:8080`

####Binrary install
ubuntu에서 기본 htdocs 폴더는  `/var/www` 지점이다.   
 `/var/www` 에서 해당  binary 압축해제.   
 디렉토리와 파일 모두 `www-data` 권한으로 변경.  
 `chown -R www-data:www-data wordpress`  
웹브라우저에서 `http://site url/wordpress`  

### 워드프레스 기본 설정
---
#### 워드프레스 3.5에서 달라진점. (책하고 많이 달라짐)  
 미디어 매니저 추가됨.  
 미디어 메뉴의 파일올리기, 에디터에서 미디어추가하는 과정이 많이 변화가 있음  
 링크메뉴가 사라짐  
 살리려면 Link Manager 플러그인사용.  
 즐겨찾기 특성 필터 추가  
 원격출판 옵션, 프라이버시 메뉴 사라짐  

####Wordpress configuration 
워드프레스를 처음 설치하는 경우 설정화일 이 없으므로 오류메세지 출력. 이때 설정파일 만들기를 선택해서 생성한다. phpmyadmin이나  command line에서 Mysql DB 를 생성.  
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
	사이트초기에는 프라이버시 항목 체크해제. (검색엔진이 목록을 업데이트하지 못하도록.. )

####URL change
초기 시작 URL 주소를 `http://site url/wordpress`  가 아닌 `http://site url`  로 변경.  
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
일반적으로 숫자타입이 무난하다. 혹은 사용자 정의 구조에서 조합도 가능.   
페이지는 이러한 형태로의 변경이 불가능하며 오로지 블로그 포스트만 가능.

#####사용자 - 당신의 프로필
사용자명은 변경불가
개인정보란은 테마에 따라 보여주기도 하며 입력하는 것이 좋다

#####아바타 설정
wp의 대시보드가 아닌 별도의 사이트에서 직접 등록.
반드시 해당 계정의 이메일 정보가 wp과 그라바타(gravatar.com) 사이트가 동일해야 한다. 
현재는 한글사이트도 서비스를 하고 있으며 WP사이트에 계정이 있다면 WP 인증을 통해 바로 로그인이 가능하다. 원하는 사진을 웹 또는 Local PC에서 선택한 후 crop하여 적절한 이미지를 등록한다.

###테마설치
---
####테마설정
테마를 적용하기 위해서는 반드시 wp 블로그내에 컨텐츠가 포함되어 있어야 한다. 따라서 다른 블로그의 컨텐츠를 import한 후에 적용을 시작하자.  Word-press Importer 플러그인 수동 설치. 2013.09 현재 버젼 0.6.1 (책에서 제공하는 예제 컨텐츠글)

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

##### 테마에서 메뉴 설정하기
각테마별로 지원하는 메뉴가 다르다.  BUENO의 경우 두개의  메뉴를 지원한다.
기본값으로 우측상단의 Primary menu는 Main, 좌측상단의 Secondary menu는  category를 선택한다. 

메뉴갯수와 메뉴의 할당은 대시보드에서.
외모 - 메뉴. 위치관리하기탭에서 지정이 가능하다.

###### Pirmary menu에 메뉴를 하나 추가하기

외모 - 메뉴. 메뉴편집하기-편집할 메뉴 선택 후 선택버튼. 
여기서 우측상단의 화면옵션을 확인한다.   
화면에 보여주기 속성을 모두 체크한다. 기본값으로 글은 메뉴에 등록할수 없기 때문에 모두체크해서 사용자가 원하는 항목을 메뉴에 등록시킬수 있도록 한다.   
링크 버튼 선택 후 타이틀과 이동하기 원하는 URL을 달아 등록. 메뉴저장 후 블로그에서 주메뉴 부분에 링크메뉴가 추가된 것을 확인.  
메뉴에 포함된 항목들은 드래그앤드롭이 가능하며 하위 메뉴로 등록도 가능하다. 메뉴에 포함시킬수 있는 항목은 우측 상단의 화면옵션에서 조정가능.  
특히 워드프레스 메뉴기능은 카테고리나 페이지 구조와 독립적으로 원하는 항목만 골라서 구성이 가능.  (하지만 새 상위레벨 페이지를 자동으로 추가 하는 옵션을 선택하지 않는것이 좋다. 만드는 모든 페이지가 자동으로 메뉴에 등록되기 때문)  
메뉴에 포함시킬수 있는 항목의 추가,삭제가 자유로우며 항목의 순서 조정도 유연함.  
메뉴에 포함된 항목 (카테고리, 페이지, 포스트)은 고유주소가 변경되어도 메뉴에 자동으로 반영.  
워드프레스 import/export할때 메뉴도 포함됨.   
단 워드프레스 가져오기할때 메뉴의 정보는 모두 가져오지면 메뉴 설정은 수동으로 다시 잡아야 한다.   
테마의 기본설정 - 테마 스타일, 타이틀, 로고, 파비콘  

###### Bueno 테마설정하기
Bueno-Theme Options - General Settings 설정 후 반드시 우측 상단의 Save All Changes 버튼. 잊지 말것.

**Custom Logo**  
이미지를 업로드 하면 기본적으로 미디어 라이브러리에 등록된다.  
여기서 기존의 이미지 혹은 업로드한 이미지를 보기 누르고 Gallery에서 해당 이미지의 속성을 지정할 수 있다.  
전체 크기로 하고 - Use as Custom Logo를 실행한다.   

**Text Title**   
Custom Logo를 사용하지 않는다면 텍스트로 선택이 가능하다.
Text의 경우 한글폰트가 매우 제한적이며 Custom Logo가 더 우월하다. 

**Custom Favicon**   
브라우저 탭 제목 앞에 붙는 아이콘. 로고 이미지와 동일한 방법으로 업로드. gallery에서 Custom favicon선택후 활성화. 파비콘 이미지는 ico화일이 일반적이며 www.faviconr.com에서 손쉽게 만들수 있다. 

**파비콘 만들기**  
파비콘은 브라우저의 탭 제목 앞에 붙는 아이콘. 로고 이미지와 마찬가지로 업로드하면 된다.  
업로드하는 파일형식은 일반 그림화일보다는  ico 화일을 사용하는 것이 호환성 측면에서 좋다.  
나는 http://favicon-generator.org 사이트를 이용했음. 책에서는 www.faviconr.com 을 예제로 사용.  

**테마설정백업**  
테마설정 백업은 대부분의 유료테마에서 적용하는 기능임. 우테마의 부에노 테마는 무료임에도 테마설정백업을 지원한다.

#####관리자 화면 총정리
알림판의 홈메뉴를 살펴보자.
오른쪽 상단 화면 옵션의 메뉴 설명.  

- 가입형 워드프레스에서는 통계를 지원하지만 설치형은 지원하지 않는다. 이때에는 구글 통계 분석 플러그인을 사용하는 것이 좋다.  

**상단옵션**

- 들어오는 링크 : 다른 사람이 내 블로그를 링크로 연결하거나 트랙백을 보내거나 포스트에 링크를 걸면 알려주는 기능.

 - 빨리쓰기 : 대시보드에서 바로 포스트를 작성할 수 있는 기능. 홈 화면에서 포스트 초안을 작성하고 저장할 수 있다.

- 만약 워드프레스에서 로그인 버튼 사라졌을 시 바로 관리자로그인 URL  
`http://블로그주소/wp-login.php  로 접속한다.`

알림판 - 글

 - 모든글, 새글 쓰기, 카테고리, 태그

알림판 - 미디어

 - 이미지 파일을 따로 관리한다. 워드프레스에 업로드한 모든 이미지 파일은 여기에서 확인 가능
 - 동영상 화일은 개당 21MB까지 올릴수 있음.  동영상 전문사이트의 URL을 삽입링크를 사용하는 것이 좋다. 

알림판 - 링크

- 버전업 되면서 없어진 메뉴.

알림판 - 페이지

- 포스트와 동일한 편집.  페이지는 별다른 변경 없이 블로그에 지속적으로 노출시킬수 있다. 첫 페이지를 웹사이트처럼 꾸미거나 프로필 페이지 제작, 메뉴 생성 등의 목적으로 다양하게 활용.
- 포스트는 발행과 동시에 바로 방문자에게 노출되지만 페이지는 별도의 접속 링크를 제공하지 않으면 방문자가 쉽게 접근할 수 없다. 
- 포스트와 달리 카테고리-하위 카테고리 의 분류 항목이 없다. 
- Parent페이지를 지정하면 다른 페이지의 하위 목록으로 옮길수 있다.  즉 트리 형식으로 만들고 메뉴바를 활용하면 블로그가 아닌 웹사이트 형식으로 쉽게 변형이 가능하다.
- 포스트와 달리 템플릿 설정 메뉴가 있다. 이는 테마에서 지원한다. 

알림판 - 댓글

- 일괄편집, 필터 적용 가능. 휴지통으로 보내는 건 복구가 가능하다.  기본 댓글 시스템에 더해 소셜 댓글 플러그인을 자유롭게 추가 가능.

알림판 - 외모 - 테마

- 테마는 스킨과 비슷한 개념. 

알림판 - 외모 - 위젯

- 홈페이지 오른쪽 또는 왼쪽 사이드바에서 제공하는 여러 가지 기능.  위젯 항목중에 몇 개를 골라 사이드바 영역으로 끌어나 놓으면 구성가능. 테마 플러그인을 설치한 후 추가로 나타나는 위젯도 존재

알림판 - 외모 - 메뉴

- 사용하는 테마에 따라 1단, 2단 또는 그 이상을 지원한다. 마우스를 이용하여 계층 구조로도 만들수 있다. 

알림판 - 외모 - 편집기

- 테마를 직접 수정/제작 하는 곳. 

알림판 - 플러그인

- 2만여개의 무료 플러그인과 유료 플러그인이 존재
- 플러그인 추가하기 에서 다양한 플러그인을 검색해서 바로 설치할 수 있다. 플러그인은 설치한 후 반드시 활성화 버튼을 눌러야 한다. 
- 노란별(평가)이 4개 이상 표시된 플러그인을 사용하는 것이 바람직하다. 

알림판 - 사용자

- 3.0이후 WP는 다중사용자 권한을 5단계로 구분함. 
- 구독자 : 읽기만 가능, 자신의 프로필만 변경 가능
- 관리자 : 관리자 모든 화면을 사용
- 편집자 : 글쓴이에 상관없이 모든 포스트, 페이지 편집가능
- 글쓴이 : 자신이 쓴 포스트만 편집 관리 가능
- 후원자 : 포스트를 쓰고 편집할 수 있지만 발행은 불가능. 관리자가 검토후 발행 여부 결정

팀블로그 운영

- 훈련된 필진은 글쓴이, 초보 필진은 후원자로 설정. 후원자는 이미지 업로드가 불가능하고, 다름 사람이 올려놓은 이미지를 삽입할 수 있다. . 플러그인 설치 및 테마 수정은 관리자만 가능.

알림판 - 사용자 - 당신의 프로필.

- 비주얼편집기 사용여부, 키보드 단축기 사용여부, 관리자 툴바 사용여부, 이름과 별명 연락처, 비밀번호를 설정할수 있다. 

**WP의 단축기는  http://codex.wordpress.org/Keyboard_Shortcuts**


알림판 - 도구

- 플러그인은 워드프레스로 만든 웹사이트의 기능 향상.
- 도구는 WP 자체를 이용하기 쉽게 해주는 기능.

알림판-도구-내보내기 (Export)

- WP의 포스트,댓글자료를 불러오거나 내보내기가 가능. xml화일로 저장할 수 있다. 가장 기본적인 백업도구

알림판-도구-사용가능한 도구

- 끌어오기와 카테고리/태그변환기 두개가 기본적으로 등록되어 있음.
- 끌어오기는 북마크렛의 일종.  JS기반으로 해당 사이트의 링크와 함께 post작성을 위한 편집기가 바로 열림.
- 카테고리/태그변환기는  알림판-도구-가져오기 메뉴에 포함되어 있다. 다양한 이기종의 블로그에서 데이터를 import할수 있는 도구를 제공한다. 

####웹사이트에 콘텐츠 올리기
상단의 `+새로추가` 메뉴를 이용하여 포스트 쓰기 가능.  
`글`  `미디어`   `페이지` `사용자`  
4개의 추가 서브메뉴가 존재

글 쓰기에서 중요한것은 설정-고유주소 의 방식을 기본방식이 아닌 글 이름 방식으로 한 경우 한글 제목으로 작성하는 경우이다.  
이때 화면옵션에서 슬러그 옵션을 활성화하고 하당 슬러그 부분을 클릭하여 태그입력하듯이 한글이 포함된 제목을 영문 제목으로 입력한다. 발행하면 한글 제목이 아닌 슬러그에 입력한 영문태그로 주소가 처리된다.  한글 제목의 웹브라우저 주소창에서 주소가 깨질수 있으니 중요한 게시물은 반드시 슬러그 처리할것.

글입력중 이미지 업로드시 이미지 이름은 한글을 피할것.  

이미지는 단순히 업로드가 아니라 디테일한 정보를 기입한다. WP에서는 이미지를 단순 화일이 아닌 이미지라이브러리에서 통합적으로 관리하기 때문이다.   

글쓰기 편집창에서 이미지를 클릭하면 지우기 /편집하기가 가능하다. 지우기는 단지 편집기에서만 지우는것임. 이미지 라이브러리에는 그대로 살아 있다.  

공개하기는 화면 오른쪽 상단에 위치함. 예약등록, 검토/덜쓴글로 모드를 변환할수 있다.  

카테고리는 여러 카테고리에 동시 등록이 가능하다.   
카테고리 추가는 새분류 추가에서 등록하고 반드시 외모-메뉴의 하단-카테고리에서 체크한후 메뉴에 추가를 눌러야 한다.  
편집할 메뉴선택에서 카테고리를 선택 한후 체크해서 메뉴에 추가해야 한다.   

태그

- 카테고리가 분류라면 태그는 꼬리표. 포스트를 분류하는 또다른 방식. 

특성이미지

- 포스트의 대표이미지. 글목록에서 보여줄 포스트의 썸네일 이미지. 포스트에 여러개의 이미지가 있어도 특성 이미지를 설정하지 않으면 글 목록에서 보이지 않는다. 

슬러그

- 제목 입력란에서 변경할수 있고 슬러그 항목에서도 변경가능. (사이트주소에서 제목표기)

요약

- 포스트의 일부만을 잘라보여주는 것. 검색결과나 목록의 출력방식.  
웬만한 테마들은 포스트 목록을 보여줄때 본문 전체를 보여줄지 요약을 보여줄지 설정하는 기능 제공.  
Bueno 테마에서는 General Settings - > Post Content에서 The Excerpt(화면의 요약글로 보여준다)로 설정
화면옵션의 요약을 활성화 하면 사용자가 직접 요약문구를 입력할 수 있다.   

토론

- 포스트에 댓글와 트랙백 핑백을 허용할지 여부는 설정-토론에서 Global하게 적용하며 개별 글에서 설정도 가능하다. 

글쓴이

- 관리자 권한을 가지고 있다면, 특정 글의 글쓴이를 변경할 수 있다. 

포스트를 공개하거나 임시글로 저장하면 기존 글을 덮어쓰는 것이 아니라 버젼별로 저장된다.  편집화면 아래에 Revisions 옵션이 나타나는데 원하는 시점으로 rollback이 가능하다. 

####카테고리 정리하기
알림판 - 글 - 카테고리

- 카테고리 이름은 한/영 상관없지만  슬러그는  인터넷 주소에 포함되므로 영문으로 입력하는 것이 좋다. 
상위 메뉴에서 없음을 선택하면 최상위 카테고리로 노출됨.
- 분류되지 않음 이라는 기본 제공 카테고리는 슬러그를 영문으로 변경하는 것이 좋다. 
- 포스트나 페이지와는 달리 카테고리는 한번 삭제하면 휴지통에 보관되는 것이 아니라 완전삭제되어 복구가 불가능. 

####페이지로 고정글 올리기
포스트는 지속적으로 컨텐츠가 올라가는 반면 페이지는 회사 소개나 약도(찾아오늘 길)처럼 고정된 글에 사용. 
RSS피드를 통해 자동으로 페이지를 구독할 수 없다. 
페이지 목록은 알림판 - 페이지 - 모든 페이지 에서 관리하며 새로운 페이지 작성도 가능.
페이지는 포스트와는 달리 페에지 생성 후 보여지지 않는다. 메뉴로 설정을 바꾸어서 노출시켜야 한다. 

페이지노출은  
알림판 - 외모 - 메뉴 - 페이지 파트에서 선택해서 메뉴에 추가해야 한다. 그리고 오른쪽 상단 메뉴 저장 

포스트는 카테고리를 통해서 분류하지만 페이지는 하나하나 고유한 성격이 있고 카테고리 지정이 안됩니다. 페이지 분류는 순서로 정렬하고, 상위 페이지와 하위 페이지 형태로 분류해야 한다.  페이지에 상위 페이지를 지정하는 방식. 하위 페이지는 지정할 수는 없다.

#####정렬순서
포스트의 순서는 별도의 플러그인을 사용하지 않는한 최근 작성한 포스트가 맨 위에 노출. 페이지는 [순서] 라는 속성 값으로 정렬.  
작은숫자가 우선. 숫자가 같으면 알파벳 순으로 정렬. 임이의 높은 숫자를 지정해 두면 가장 아래에 보여서 관리하기가 편함.

## WP플러그인
---
플러그인은 WP의 공식사이트인 WP플러그인 디렉토리(http://wordpress.org/extend/plugins) 에서 검색해 설치하거나 개발자들의 개발 사이트에서 구할수 있다.   

WP설치시 기본 설치 플러그인은 akismet(스팸댓글)과 hello dolly(환영 인사말를 보여주는 기능)	플러그인를 삭제하고 싶다면 비활성화 후 삭제 버튼.  

자동설치

- 알림판 - 플러그인 - 플러그인 추가하기
- 검색후 지금 설치하기로 설치 가능

수동설치

- 다운로드한 후 플러그인 추가하기 - 상단 업로드 를 통해 선택해서 파일선택.

타 WP사이트의 플러그인을 확인하고 싶다면 소스보기에서 `plugin` 이라는 키워드로 확인이 가능하다. `wp-content/plugins/` 아래의 설치된 플러그인 정보를 알 수 있다. 플러그인 설치후에는 활성화를 해야 적용이 가능하다.

####플러그인에 대해 꼭 알아야 할 내용들
플러그인 설치 후에는  
알림판 - 설정 - 아래에 해당 플러그인의 설정메뉴가 추가된다.   
이외에도 위젯이나 사이트나, 푸터, 홈페이지 첫화면등에 추가되는 경우도 있다.   

플러그인 설정은 플러그인 메뉴아래, 설정 메뉴 아래, 또는 별도로 최상위 메뉴로 나타나기도 한다.  

만약 플러그인 활성화시 필수적인 정보를 입력하지 않는 경우 에러메세지가 나타난다.   

설치시 현재 설치되어 있는 WP의 버젼과 호환성 여부를 알아보고 설치할것.  
보통 현재 버젼에서 충분히 시험되지 않았습니다 메세지가 뜨기도 하는데 실제로 왠만한 평점이상의 플러그인은 호환성이 떨어지더라고 사용하는데는 별지장이 없다.  

새로 설치한 플러그인과 기존 플러그인의 충돌시 일부 기능의 비활성화될수 있음. 충돌하는 경우 하나씩 비활성화 하면서 테스트해야 함. 플러그인 업데이트는 플러그인 메뉴에서 알림이 뜸.


#### 꼭 설치해야 할 플러그인
##### Akismet
스팸 댓글 차단은 Akismet 플러그인 사용  
http://akismet.com 에서 회원가입  
Personal 버젼을 선택하면 무료로 API key를 받을 수 있다. (가입 email로 송부됨)기존 가입회원이라면 account메뉴에서 reveal버튼을 통해 API키를 확인할 수 있다.   
해당 API 키를 플러그인 - Akismet 에서 입력한다.   
입력 후 네트워크상태점검을 눌러 정상적으로 작동하는지 체크  
'Akismet은 제대로 접근하고 있습니다. 모든 서버에 접근이 가능합니다. '  
메세지를 확인 할 수 있다.   
스팸덧글은 알림판 - 오른쪽 블로그현황 에서 확인 할 수 있다. 
#####Bootstrap Admin
 Bootstrap방식으로 관리자 화면을 이쁘게 만들어주는 플러그인
하지만 WP가 업그레이드 되면서 더이상 대응하지 못함. 삭제.


#####WP google fonts
 : 테마에 관계없이 나눔고딕 폰트를 적용할 수 있는 플러그인.  
  - 알림판 - 설정 - Google Fonts 에서 설정이 필요하다.  
   FONT1섹션에서 Abel 선택. 그러면 Option 화면이 펼쳐진다. 1,2,4번의 항목은 모두 체크 해제  
   3번의 Custom CSS에 아래의 소스 코드 기입  
   `@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css" ) ; `    
   `body, h1, h2, h3, h4, h5, h6, li, p { font-family:"Nanum Gothic" !important ; }`

#####TinyMCE Advnced
기본 WP 글쓰기 편집기의 추가적이 기능을 더함
  
##### Category Order
카테고리 순서를 바꾸자.   
카테고리른 서브 카테고리를 만들수는 있지만 순서는 바꿀수  없다. 항상 알파벳순으로 자동정렬된다.   
카테고리 순서를 바꿔 보기 좋게 정리하고 싶을때 Category Order 플러그인을 사용.  
설치 이후 알림판 - 글 - Category order 메뉴가 추가됨.   
여기서 원하는 대로 순서 변경이 가능하다.  

##### Custom Taxonomy Order 플러그인 설치하기
사용자 포스트 카테고리 뿐만 아니라 '사용자 정의 타입' 에도 순서를 조정할 수 있다.  
사용자 정의 타입  
포스트와 페이지 외에  이벤트, 슬라이드, 포트폴리오 등 다양한 사용자 정의 글 타입(Custom Post Types) 이 있다.  사용자 정의 타입은 플러그인이나 테마를 설치하면 추가할 수 있다.   
 이 플러그인 을 설치하면 Term Order메뉴가 생성. 기본 카테고리 뿐만 아니라 모든 사용자 겅의 카테고리의 순서 변경이 가능.  원하는 카테고리를 마우스로 끌어서 옮기면 원하는 순서대로 바꿀 수 있다. 
 
#####Ozh' Admin Drop Down Menu
WP의 어드민 화면을 좌측 방식이 아닌 상단 풀다운 방식으로 변경함.
 
  
#####Crayon Syntax Highlighter  
 
소스코드를 보기좋게 보여줌.
기존 소스코드를 자동으로 분석해서 highligt를 입혀줌.

##### Post Types Order
WP의 포스트는 기본적으로 공개 일자 순으로 정렬.  시리즈 게시물인 경우 1번부터 차례대로 보여주는것이 좋다. 
공개일자를 바꾸지 않고 보이는 순서를 바꾸고 싶을 때 이 플러그인은 설치후 반드시 설정값 적용이 필요하다.  
알림판 - 설정 - Post Types Order  선택  
최소 설정 권한은 administrator가 되도록 확인.  - Save setting 실행  
설정 이후 알림판 - 글 - Re-Order 메뉴가 등록되어 있다.  

포스트와 달리 페이지는 오로지 별도의 순서값에 의해서 정렬된다. 따라서 모든 페이지는 순서값을 지정하는 습관을 들이는 것이 좋다.

#####WP-PageNavi
페이지 인덱스를 직관적으로 변경하기
일반적으로 테마들은 예전 글과 최근 글만 보여준다. 페이지 인덱스를 숫자로 바꾸고 싶다면 플러그인을 설치한다.
플러그인 활성화 후 설정-페이지내비가 추가됨.

#####WPtouch 플러그인 설치
WP로 만든 웹사이트를 스마트폰에서도 보기 좋게 표현. 포스트글을 스마트용으로디자인으로 보여주는 플러그인을 사용.  
General Setting에서 Author's Name, Categories, Tags, Excerpts  4개부분을 체크해제.  
유료 버젼은 자신만의 아이콘모음, 태블릿 UX적용 등의 구현에 필요.

###워드프레스와 SNS연동
#####Disqus Comment System Plugin
워드프레스의 기본 댓글 시스템 외에 소셜 댓글 시스템으로 SNS와 연동하기.   
소셜 댓글을 추가하는 플러그인은 우선 디스커스 플러그인을 추천.  
디스커스 플러그인  
- 디스커스 계정 하나로 여러 개의 웹사이트와 댓글을 통합관리가능. 디스커스 플러그인 활성화되면 WP의 기본 댓글창이 사라지고 디스커스가 우선 적용.   
- 디스커스에도 FB 댓글 기능이 있다. FB댓글은 댓글을 남기면 자동으로 FB에 발행이 되지만 디스커스는 자동으로 FB에 댓글을 남겨주지 않는다.   

플러그인을 설치하면 알림판 - 댓글 - Disqus 메뉴가 추가됨.  
우선 디스커스 프로필을 새로 만들어야 함. FB나 TW,GOOGLE 아이디로 로그인 또는 신규 ID/PASSWD로 가능.
http://disqus.com  
로그인 후 자신의 웹사이트 등록.  
Site URL  
Siite Name (한글로도 가능)  
Site Shortname - 반드시 영문,숫자로 조합.   
Site 등록 후 Disqus Settup화면에서 자신의 등록한 웹사이트 플랫폼을 선택한다. WP플랫폼.  
다음세팅에서 언어 설정은 Korean으로 변경, 트위터가 있다면 계정 등록. Like 버튼, 로그인 기능등의 해제도 가능. 설정을 마친 후에 Edit profile에서 Usernamed과 Password를 설정한다.  
WP의 설정화면으로 돌아와 알림판-댓글-Disqus에서 Username과 Password를 입력한다.  
로그인이 되면 Disqus에서 등록한 사이트가 나온다. 선택.  
#####WP Tweet Button
트위터연동 플러그인. 이건 그냥 skip  

##### Wordpress Connect 
좋아요! 페이스북 소셜 플러그인

**대표적인 기능**  

- 좋아요 버튼/보내기버튼(웹페이지를 FB으로 쉽게 공유)  
- 댓글(FB의 댓글기능을 이용해 웹사이트 댓글 작성)  
- 활동피드/추천(어떤 컨텐츠를 공유하고 좋아요 했는지 보여줌)  
- 좋아요 상자(웹사이트에 페이스북페이지 최근 글목록)  

WP Connect를 위해서는 휴대폰 인증이 완료된 페이스북 계정과 Admin ID, App ID 필요

- App ID를 만들기 위해서는 facebook app생성이 필요. 이를 위해서는 반드시 휴대폰 인증이 되어야 함
- http://facebook.com/confirmphone.php 에서 인증 받을 것.

Admin ID  확인하기

- 페이스북에서 자신이 업로드한 이미지 URL을 살펴보며 다음과 같다 
- `https://www.facebook.com/photo.php?fbid=542400465801088&set=t.100000934180723&type=3&theater`
- 여기서 제일 마지막 부분 숫자배열이 admin ID가 된다. 
- admin ID :  100000934180723 
- 이 admin ID가 맞는지 확인하기 위해서는 `http://facebook.com/profile.php?id=xxxxx`  에서  xxxxx부분에 admin ID를 입력해서 본인의 계정으로 넘어가면 올바른 ID값이다

App ID 만들기

- facebook에서 app을 등록하지 않았다면 http://developers.facebook.com/apps 로 접속한다. 
- 상단 Resgister as a Developer 클릭
- Accept 하고 계속. 계정확인. 자신의 핸드폰 번호 입력. 확인코드입력.
- 자신에 대해 말해달라는데 간단히 skip
- confirm mail 날라옴. 확인 후 다시 developers.facebook.com/apps 접속
- 이제 새로운 app등록을 할수 있는 버튼으로 변경됨. `새앱만들기`
- 여기서 앱 이름, 앱 네임스페이스를 정의해주어야 함. 
- 앱네임스페이스는 지정하지 않아도 되며(실제 서비스 용이 아닌 App ID를 얻기 위한 과정이므로 불필요하다.) 앱 이름은 사용가능한 이름인지를 초록색으로 알려줌. 임의의 테스트 이름으로 일단 입력.
- 보안확인 텍스트 입력 
- 이제 테스트이름을 가진 app이 하나 생성되고 App ID를 확인 할 수 있다. 


페이스북공식 플러그인과 Wordress Connect 두가지의 대표적인 플러그인이 있는데 Wordpress Connect가 훨씬 우수. 우선 facebook App ID를 확인 할것.  facebook에서 APP생성(테스트형식으로 만들어도 상관 없음)하면 App ID가 발급됨.  
  
- App ID : xxxx  
- Admin ID : xxxx  

Admin ID는 FB에 자신이 올린 사진 이미지의 링크 정보에서 ?type 이전의 숫자열이다.   

플러그인을 설정하면 알림판에서 별도로 메뉴가 추가 된다.   

- Language - Korean  
- Application ID - App ID of FB  
- Application Admins - Admin ID of FB  
- Image URL과 Description 은 생략가능  


** 알림판-WP Connect **

Like Button 
 
 - width는 약 383정도 조정.  
 - Show face : 친구가 좋아요 했다면 얼굴을 보여줌.  

 포스트의 상단에 위치하는 것이 좋다  
 
 - Default Position
 - Display Settings  : 기본값인 everywhere display는 해제. 포스트와 페이지에서만 보이게 하는 것이 좋다.
 
 Comment
 
 - Width는 본문 너비를 고려해서 설정한다. 예제에서는 520px
 - Default Position : Bottom
 - Everywhere : default 값은 해제. 
 
모든 설정을 완료하고 외모 - 위젯을 보면 WPC의 접두어로 9개의 위젯이 추가되어 있음.  사이드바로 옮겨 사용할 수 있다.  WPC Like Button/Like Box를 기본으로 사용하고 Activity Feed 와 Recommendation은 방문자가 많아졌을때 사용하면 좋다.  
 
 사이트바에 위젯 형태로 WPC Like Button은 웹사이트의 즐겨찾기 개념. 
 
 - Title : 이곳이 맘에 드세요?  정도 타이틀을 달아준다.  
 - URL은 자신의 홈페이지.
 - Width : 자신의 사이드바의 사이즈에 맞추어 조정한다.  기본값은 383인데  300정도가 적당함.
 - Verb to display : recommend 
 
 WPC Like Box는 페이스북의 페이지를 운영하는 경우 유용하다. 
 
 댓글은 별도의 위젯을 사용하지 않아도 자동으로 포스트에 삽입되어 나타남. 페이스북 앱관리자는 댓글을 관리할 수 있다.   
 댓글 메뉴 우축의 설정 을 클릭하면 관리 메뉴가 나타나고 설정이 가능하다.   
 다른 로그인 제공업체 를 이용한 게시를 허용합니다. 체크하면 페이스북 뿐 아니라 야후와 핫메일을 통해서도 댓글을 남길수 있다.  
 네이버나 다음 메일은 지원하지 않는다. 
 
 WP의 기본댓글은 알림판(대시보드)에서 알려주지만 FB 댓글 시스템은 앱을 통해서 확인.  
 http://developers.facebook.com/tools/comments/ 링크를 통해서 모든 FB의 댓글 확인. 댓글에 다시 댓글을 달수 있다.  
 
 개별포스트(페이지)에서 좋아요 버튼과 댓글 사용하기.  
 
- Wordpress Connect - Like Button 메뉴와 Comments 메뉴에서 설정한 값은 개별 포스트에서 변경 가능.  
- 알림판 - 글 - 새글 쓰기 에서 오른쪽 위젯에 Wordpress Connect 이 추가된다.  
- 개별 포스트에서 댓글을 허용 여부를 별도로 지정할 수 있다.  지정된 위치 뿐만 아니라 숏코드 형태로  본문에 Like, Comment 버튼을 삽입 할 수 있다.  
- 알림판 - 글 - 새글쓰기에서 상단에 좋아요. 버튼을 누르면 별도 설정창이 뜨고 URL to like를 빈칸으로 두면 현재 포스트의 URL이 삽입된다. 임의의 URL을 별도로 넣을 수도 있다.   
- 숏코드로 댓글을 삽입하면 댓글창이 하나 더 추가되어 댓글창이 두 개나 보이게 된다.  기본댓글창은 비활성화 시킬수 있다.   

페이스북 플러그인에 문제가 생기면 Object Debugger를 도구를 사용해서 특정 URL을 점검해 볼 수 있다.   `http://developers.facebook.com/tools/debug`  로 접속해서 웹사이트나 포스트의 URL을 입력하면 자세히 알 수 있다. 

#####instapress plugin
** 현재 안되고 있음. 젠장 **  
인스타그램 연동. 설치후 인스타그램 계정 인증 해야 한다. 인증이 완료되면 경고메세지가 사라짐.  
책에서 언급한 instapress는 3.6.1에서는 치명적 오류 발생.   
대신 Easy Instagram을 설치 했음.  
알림판 - 설정 - Easy Instagram 에서 설정.  
Application Client ID - instagram ID  
Application Client Server -   

-- http://instagram.com/developer  에서 개발자 등록이 필요하다.  

Register new OAuth Client  
Application Name : 임의  
Description : 임의  
Website : http://miles.storycube.kr  
OAuth redirect_url : http://miles.storycube.kr/wordpress/wp-admin/options-general.php?page-easy-instagram  

등록 후  Clinet ID, Secret Client 값을 설정에 등록한다. 제일 하단 instagram 로그인을 실행하면	 Instagram의 Access 동의 창이 뜬다. Authorize 실행.  

다시 WP 설정-easy instagram으로 되돌아 오지만 현재 User ID가 생성이 안되고 있다. 일단 보류. 
완료후 외모 - 위젯에 가면 Easy Instagram이 등록된 것을 확인.
 
#####Pinterest plugin
이건 skip 별로 필요치 않다.

#####Shareaholic | share buttons & related posts
** 이 플러그인은 편리하긴 한데 페이지 로드시 네트웍 점유가 심함. 전체 블로그 로딩 타임에 악영향. 일단 비활성화 했음. **  
SNS공유를 한꺼번에 제공  
거의 모든 SNS 공유기능 제공. 원하는 SNS만 선택해서 공유 기능 제공. 공유한 횟수 보여줌. 스타일이 좋다.  
설후 알림판 최상위 메뉴에 Shareaholic 메뉴가 추가됨.  
설치후 Share buttons, Related content, Analytics 세가지 기능이 제공됨.   
오른쪽 Edit General Website Settings  버튼 실행.  
로그인 필요. FB 패스포트로 로그인.  
WebSite Profile 체크  
DOMAIN : miles.storycube.kr  
Name : Miles Story  
Platform : Wordpress   
저장  


###멀티미디어 관련 플러그인.

#####picasa and Google Plus Express x2 plugin
피카사의 이미지를 포스트에 등록하기.  
피카사에 이미지를 저장하고 이를 이미지 링크식으로 불러와 포스트와 페이지를 작성하면 좋다.   
테마에 사용하거나 자주 사용하는 이미지는 WP에 직접 이미지를 올려 미디어 갤러리를 사용. 포스트 등록은 피카사등에 저장하는 것이 유리.  

- 설정 - Express 
- Google+ Express access level : blog로 설정. (비공개 앨범도 접근가능)
- Google user name for site : google 계정 입력.  
- Requesting access to private albums 실행.
- Advertising 항목은 모두 해제
- 변경사항 저장

#####WP YouTube Player plugin
유튜브의 코드를 가져오는 대신 간단하게 숏코드를 입력해서 유투브 동영상을 가져오는 플러그인   
유튜브 URL, 구방식의 유튜브URL, 동영상 ID  세가지 방식으로 사용가능.  
플러그인을 사용하면 HTML코드가 아닌 숏코드 방식으로 삽입하게 되므로 HTML모드가 아니라 보여주기 편집창에서 작성해야 한다.  
Player width 는 500x308 정도가 적당. Enable Fullscreen 가능하도록 설정.  

#####Slideshare for WordPress by Yoast
Skip 버젼업데이트가 안되고 있음  

##### AZIndex
글 목록 한번에 보여주기. 전체 글 목록이나 카테고리별 글 모록을 제목만 뽑아 보여주는 기능.  
플러그인 검색으로는 안되며 Web Site에서 직접 받을것.   
이 플러그인의 설정은  알림판 - 도구 - AZIndex  에 위치한다.   
Index는 글 목록을 보여주는 단위. Add New을 통해 우선 Index를 만들어야 한다.   
Index이름을 정하고 이 인덱스에서 관리할 카테고리 명을 정한다.  columns수는 2개로 하고 Options에서 National Language Support를 체크한다.   
생성된 Index ID를 확인하고 Page에서 숏태크 형식으로 Index ID를 입력한다. [az-index id ="1"]  

##### AVH Extended Categories Widgets
WP의 기본 카테고리 위젯은 숨기고 싶은 카테고리가 있어도 숨길 수 없다. 웹사이트 내의 모든 카테고리는 무조건 전부 보여줘야만 함.  
이 플러그인은 카테고리의 선택,해제 후 보여줄수 있고 카테고리를 종류별로 나눠서 분류 할 수도 있다.  
플러그인 검색 후 설치. 설치하면 알림판-Top메뉴에 AVH메뉴가 등록됨.  
위젯에는 3개의 위젯이 추가됨.   
AVH Extended Categories 위젯을 사이드바에 추가한다.   
Title 입력. 선택한 카테고리만 보여주기 위해 Show selected categories only를 체크하고 하단에서 보여주기 원하는 카테고리 선택  

##### Yet Another Related Posts Plugin
해당 포스트와 관련된 글 목록 보여준다.   
플러그인 검색 후 설치  
설치 후 알림판 - 설정 - 관련 글(YARPP)에 메뉴가 등록.  
기본설정으로도 사용에 문제가 없다.    
기본 Mysql이 설치된 경우 InnoDB 엔진을 사용한다. 하지만 YARP에서 titiles, bodies의 기능을 사용하기 위해서는 MyISAM storage engine을 post가 저장되는 table의 속성으로 적용해야 한다.   
ALTER TABLE `wp_hk_post` ENGINE = MyISAM  
phpmyadmin에서 손쉽게 업데이트 가능. 명령어 확인 후 Type이 MyISAM으로 변경되었는지 체크.  

##### FD Feedburner Plugin
WP는 도메인 주소 이외의 별도의 RSS주소를 제공한다. WP에서는 http://웹사이트주소/feed 형태로 생성  
현재 구글리더서비스는 종료되었지만  피드버너는 여전히 서비스 진행중.  
피드버너의 탁월한 서비스 기능   

- 웹사이트 주소가 변경되어도 피드 주소는 유지.
- 구독자 통계
- 이메일 구독 지원

알림판 - 위젯 부분에서 그 밖의 기능 위젯을 추가한다. 여기에서 글RSS부분을 누르면 해당 블로그의 Feed 주소를 알수 있다.  
일반적으로 http://웹사이트주소/?feed=rss2  
이 주소를 확인한다.  
피드버너(http://feedburner.google.com) 에서  
Burn a feed right this instant 에서 feed 주소를 입력한다. Next  
Feedburner에서 사용할 Feed title과 Feed address를 지정한다. (사용자가 임의로.)  
최종적으로 자신의 RSS주소는 http://feeds.feedburner.com/"Feed address"  
플러그인에서 추가한다.  
fd feedburner plugin  
알림판-설정-Feedburner 메뉴가 생성.  
Redirect my feeds here 부분에 feedburner  주소를 입력.   
자신 블로그의 주소포트가 변경되었다면 Edit Feed Details 메뉴에서 자신의 RSS주소를 변경한다.  

#####Google Analytics for Wordpress Plugin 
구글 웹로그 분석 웹사이트 통계  
http://google.com/analytics 이동 후 구글계정으로 로그인.  
상단 메뉴 우측 관리 실행.  
새 계정 만들기  
입력후 하단 '추적ID가져오기  
하지만 80포트가 아닌 임의의 포트를 사용하면 이곳 구글통계를 이용할 수 없다.  
추척 ID를 확인한다.  
UA-xxxxx  
 플러그인 추가하기에서 google analytics for wordpress  를 검색해서 설치.  
알림판 - 설정 - Google Analytics  실행.  
우선 Click here to authenticate with Google  실행.  
Google analytics에서  이 플러그인의 허용을 허락한다.   
인증에 성공하면 UA ID를  선택해서 등록한다.  

설정완료 후 부터 통계 기능이 작동.  

##### Print Friendly and PDF Button Plugin
블로그 글을 프린터로 보기 좋게 출력 또는 PDF로 변환할수 있도록 하는 플러그인  
알림판 - 설정 - Print Friendly & PDF 에서 설정  
설치 후  프린트를 하면 미리보기 화면이 팝업창 형식으로 나타난다. 마우스를 가져가면  
형광색으로 영역이 지정. 크기 조절, 삭제가 가능. (단 실제 삭제되는 것은 아님)  


##### 독특한 글상자 만들기
숏코드를 이용해서 총 5가지의 글상자를 아이콘과 함께 표시해준다.  
note,important, warning, tip, help  
WP-Note를 검색해여 설치  
따로 설정부분은 없음.  



##### MySql 데이터베이스 최적화하기
WP CleanFix
데이터 베이스에 불필요하게 남아 있는 파일을 주기적으로 정리해주기. PC의 레지스트리정리기와 같은 구실.   
데이터 베이스를 점검하여 임시 저장된 불필요한 자료를 보여주고 최적화했을때 복원되는 양을 보여준다.   
패쓰. 이건 유료화 됨.  



##워드프레스 테마
---

테마의 구조 레이아웃의 계층은   
테마 안애 플러그인이 포함된 구성. 즉 플러그인은 어떤 테마를 적용하더라도 기능을 사용할 수 있다.   
테마와 플러그인 아래에 WP가 존재한다.  WP는 OS위의 웹서버와 DB서버위에 존재한다.   

WP화면은 기본적으로 4개의 영역으로 구성

- 헤더 영역 : 로고와 네비게이션이 위치함.
- 본문 : 포스트 글 목록. 슬라이드와 포트폴리오 등을 보여주기도 한다.
- 사이드 바 : 다양한 위젯이 위치하는 곳
- 푸터 영역 : 푸터 위젯과 저작권 등이 위치함.

웹사이트 첫화면의 본문 영역은 슬라이드, 포트폴리오, 글 목록등으로 구성된다.   

테마는 여러개의 PHP와 CSS로 구성. 테마하나에 여러개의 PHP 화일이 존재. 각 영역별로 요소별로 따로따로 작성이 됨. CSS파일은 웹페이지에 보일 가 작료의 배치와 형태를 결정.  

외모-테마에서 설치와 관리가 가능.    
보통 테마설치는 직접다운로드(zip화일형태) 후 알림판에서 업로드하는 방식이 일반적임.  

테마설치화일은 zip화일 형태로 배포하며 압축을 해제하면 documentation폴더와  demo폴더를 확인한다. 각각 설치방법과 데모콘콘텐트의 내용을 확인할 수 있다.   


###목적에 맞는 테마 고르기
좋은 테마의 기준.
지속적인 업그레이드
테마 제작사에서 기술지원을 하는지.
다양한 설정을 할수 있는지.
다양한 숏코드와 템플릿을 지원하는지.
테마에서 제공하는 다양한 숏코드와 템플릿. 하지만 타회사의 테마를 적용하는경우 템플릿과 숏코드는 사용할수 없는 경우가 대부분이다.
차별화된 첫 화면 - 요즘은 글목록과 간단한 사이드바에서  슬라이드와 포트폴리오 등 다양한 콘텐츠를 매력적으로 보여준다.
또한 별도의 플러그인 없이 다양한 기기에서 최적화된 화면을 보여준다.

###쓸 만한 무료 테마 찾기
구글 엔진

- wordpress free themes 검색.  
- 무료테마를 받을 때는 반드시 테마의 내의 의심스러운 코드나  링크가 숨어 있는지 검사하는 TAC 플러그인으로 반드시 체크하도록 한다.(Theme Authenticity Checker)  

유료테마 Best

- 테마 포레스트(http://themeforest.net)
- 30%의 수수료가 있으며 전문테마제작사들이 아닌 개인이나 소량의 테마 개발사들이 업로드 함
- 자매사이트인 http://codecanyoun.net/category/wordpress 에서는 유료 플러그인을 판매한다. 다양한 슬라이드와 숏코드 지원

우테마

- 회사 홈페이지에 사용하는 비즈니스 테마에 강점이 있음.  WooCommerce라는 뛰어난 전자상거래 모듈 제공.

WP Zoom

- 매거진 테마를 전문으로 제작하는 회사

엘라강트 테마 (http://elegantthemes.com)

- 맴버쉽 제도만 운영. 유료 테마 제작회사 중에는 가장 저렴

템플라틱(http://templatic.com)

- 독특하고 다양한 형태의 테마사용.

스튜디오 프레스(http://studiopress.com)

- 유명 블로거 데런 로즈가 설립한 테마 전문 회사. 비즈니스 테마와 개인 블로그에 적합.

테마 프레임워크

- 제공하는 기능과 숏코드, 테마의 설정 방법이 비슷. 동일한 계열 회사의 테마의 기본 기능과 테마 설정 화면 등 테마에서 사용하는 공통 기능들을 묶어서 모듈화시키는 모음.

- 테마 선정은 다용도로 사용하는 멀티기능형 테마보다는 자신이 용도에 적합한 테마를 선택하는 것이 중요.

- 타 사이트의 WP에 적용된 테마는 소스보기의 themes 키워드를 통해 확인이 가능. 또는 style.css 가 포함된 링크를 찾아 클릭하면 제작사의 정보를 확인 할 수 있다. 

###검색엔진 최적화
SEO(Search Engine Optimization)  나의 웹사이트가 잘 검색되도록 검색엔진의 색인에 설정하는 것.   
SEO향상을 위한 가이드  

- 검색에 유리한 고유주소 방식 사용 : 주소에 =, &등의 특수문자가 있으면 유동적인 웹페이지로 인식. 색인되기 어려움.
WP에서 고유주소 방식으로 변경할것.
- 이미지정보 입력
포스트 입력시 alt에 포함되는 대체 텍스트 항목을 반드시 기입할 것. 검색엔진의 색인에 도움이 된다.  
- 포스트 제목을 먼저 표시  
웹페이지 제목은 인터넷 브라우저 왼쪽 상단에 표시. 표시방식은 WP의 테마에 따라 달라짐
포스트제목|웹사이트 방식으로 변경하는 것이 좋다. (Plugin사용)
- 포스트 제목은 60자 이내로
- 메타정보는 충실하게. head 태그에 포함되는 Keyword와 description항목.  SEO plugin을 통해 페이지 별도로 설정가능
- 검색엔진이 잘 검색할 수 있도록 사이트맵 만들기

#### 검색엔진 최적화 플러그인 
많은 테마들이 SEO를 지원하지만 테마를 변경하면 사용할수 없게 되므로 plugin을 사용하는 것이 바람직.  
All in One SEO Pack 플러그인을 검색하여 설치.  
설치 후 웹사이트 제목, 설명, 키워드를 등록하면 홈페이지의 태그에 그대로 등록된다.  
또한 각 글쓰기에는 SEO를 각각 설정할수 있는 메뉴가 추가 된다.   
몇 개의 키워드를 추가로 등록해서 검색엔진에 잘 색인되는 키워드를 선택한다.   


#### 사이트맵 만들기, 구글 웹마스터 등록
사이트맵은 웹사이트가 어떻게 구성되었는지 보여주는 일종의 지도, 웹사이트의 약도  
웹사이트 제작자가 직접 프로그래밍을 통해 sitemap.xml이라는 이름의 파일 형태로 웹사이트 서버에 첨부하게 됨.  
플러그인을 통해 이러한 과정을 간단히 마치고 사이트맵을 각종 검색 사이트에 제출할 수 있다.  

Google XML Sitemaps 플러그인 검색  

- 설치 후 www 경로의 디렉토리권한을 수정할것. (안그러면 xml화일 생성에 오류 발생)
- chmod 777 or 755 권한으로 변경
- 알림판 - 설정 - XML Sitemap 선택.  파일권한에 문제가 없으면 생성완료 됨. 생성위치는 www 아래에 만들어짐. (플러그인 설치 위치가 아니라 www 경로에 생성됨)

##### 구글과 빙 웹마스터 등록
알림판 - 설정 - XML Sitemap 을 선택하면 우측 화면에 웹마스터 링크가 존재.  
구글 웹마스터 선택.  
사이트 추가를 통해 자신의 주소를 입력.  
html화일을 다운로드받아 자신의 www 경로에 업로드  
확인 버튼을 누르면 인증 완료.  
웹마스터 도구 에서 우측 하단 Sitemaps 구역에서 자신의 sitemap.xml을 업로드  
구글은 화일을 업로드 하는 방식이 아니라 단순히 위치만 (www경로) 알려주면 자동으로 등록되어 색인작업이 이루어진다.  

빙은 라이브 메신져 로그인 또는 회원 가입을 통해 아이디 만들것.  
www.bing.com/toolbox/webmaster  
로그인 후 웹마스터 도구 가입  
사이트 추가 후 자신의 웹사이트 주소를 입력 후 별표로 기재된 필수 정보 입력(이름, 국적 등등)  
소유자 인증과정은 구글과 동일  
소유권 인증방식은 총 3가지를 지원하는데 xml 다운로드후 자신의 홈페이지에 업로드 후 인증하는 방식이 제일 간단하다.  
사이트 맵 등록은 FTP업로드 방식이 아닌 url방식이다.  

** 국내사이트 등록 **  
네이버  

- https://submit.naver.com  
- 매장등록의 메뉴에 포함되어 있다.   
- 인증은 네이버 회원정보에 등록된 휴대폰으로만 인증가능.  
- 인증번호 입력 후 사이트명, 업종 등의 필수 정보 입력.  
- 서비스 반영은 업무일 기준 7일 정도 소요됨.  

다음

- https://register.search.daum.net
- 신규등록하기
- 검색등록은 사이트검색,
- 사이트 등록 과 전화번호 등록 후 등록조회 결과.
- (그런데 사이트가 접속이 잘되는데 등록되지 않는다. 고객센터에 연락)

포스트 하나하나가 검색된다. 블로그 RSS 등록하기.  
특히 우리나라 포털업체는 RSS등록을 하지 않더라도 자동으로 RSS를 수집해서 포스트들을 보여준다고 하지만 타 회사(설치형 블로그포함) 서비스를 사용하는 블로그는 등록하지 않으면 잘 보여주지 않는다.   

블로그 RSS등록 

- 네이버는 자동등록. 자신의 RSS가 노출이 안된다면 고객센터에 직접 문의
- http://help.naver.com/ops/step2/miles.nhn?=catg=547&upCatg=264
- 다음은 직접등록 (tistory는 자동등록되지만 나머지는 모두 등록해주자)
- https://register.search.daum.net/index.daum
- 블로그 RSS등록. (역시 연결이 안되어 고객센터에 문의)

##워드프로세스의 보안
---
악의적인 크래킹을 막는 두가지 원칙  
FTP등을 통해서 기본 골격에 접근하지 못하도록 하는 것.  
접속할 권한을 별도로 나누어 두는 것.  
해외에서의 FTP, SFTP, SSH, Telnet  접근을 막는 것이다.   
##### Geoip 모듈 설치
- IP주소만으로 해당국가를 알수 있는 모듈. 이미 정해져 있으며 주기적인 업데이트가 필요하다.

소스코드

	root@storycube:/tmp# wget http://www.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
	--2013-10-16 17:20:05--  http://www.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
	Resolving www.maxmind.com (www.maxmind.com)... 108.168.255.243, 2607:f0d0:3:8::4
	Connecting to www.maxmind.com (www.maxmind.com)|108.168.255.243|:80... connected.
	HTTP request sent, awaiting response... 200 OK
	Length: 1074829 (1.0M) [application/octet-stream]
	Saving to: `GeoIP.tar.gz'
	100%	[================================================================================================>] 1,074,829    419K/s   in 2.5s

	2013-10-16 17:20:08 (419 KB/s) - `GeoIP.tar.gz' saved [1074829/1074829]
	root@storycube:/tmp# tar xvf *.gz
	./GeoIP-1.4.8/
	./GeoIP-1.4.8/aclocal.m4
	./GeoIP-1.4.8/apps/
	./GeoIP-1.4.8/AUTHORS
	…
	2013.10현재 1.4.8 버젼

	소스풀고난뒤
	우선.
	cd 소스코드
	사전작업
	libtoolize -f
	apt-get install libtool
	
	컴파일
	./configure
	make check
	make
	make install
	
	설치완료후 생성된 dat확인.
	
	root@storycube:/usr/share/GeoIP# ls -la
	total 7340
	drwxr-xr-x   2 root root    4096 10월 17  2012 .
	drwxr-xr-x 297 root root   12288  6월 12 00:29 ..
	-rw-r--r--   1 root root 1773423  6월 11  2012 GeoIP.dat
	-rw-r--r--   1 root root 5724363  6월 11  2012 GeoIPv6.dat
	root@storycube:/usr/share/GeoIP#

GeoIP 아파치 모듈 설치
	
	root@storycube:/usr/share/GeoIP# apt-get install libapache2-mod-geoip
	패키지 목록을 읽는 중입니다... 완료
	의존성 트리를 만드는 중입니다
	상태 정보를 읽는 중입니다... 완료
	다음 패키지가 자동으로 설치되었지만 더 이상 필요하지 않습니다:
	  linux-headers-3.5.0-17 linux-headers-3.5.0-17-generic
	Use 'apt-get autoremove' to remove them.
	다음 새 패키지를 설치할 것입니다:
	  libapache2-mod-geoip
	0개 업그레이드, 1개 새로 설치, 0개 제거 및 235개 업그레이드 안 함.
	14.9 k바이트 아카이브를 받아야 합니다.
	이 작업 후 81.9 k바이트의 디스크 공간을 더 사용하게 됩니다.
	받기:1 http://us.archive.ubuntu.com/ubuntu/ quantal/universe libapache2-mod-geoip i386 1.2.7-1 [14.9 kB]
	내려받기 14.9 k바이트, 소요시간 0초 (22.4 k바이트/초)
	Selecting previously unselected package libapache2-mod-geoip.
	(데이터베이스 읽는중 ...현재 216510개의 파일과 디렉터리가 설치되어 있습니다.)
	libapache2-mod-geoip 패키지를 푸는 중입니다 (.../libapache2-mod-geoip_1.2.7-1_i386.deb에서) ...
	libapache2-mod-geoip (1.2.7-1) 설정하는 중입니다 ...
	Enabling module geoip.
	To activate the new configuration, you need to run:
	  service apache2 restart
	root@storycube:/usr/share/GeoIP#

모듈 등록 및 아파치 restart

	root@storycube:/usr/share/GeoIP# a2enmod geoip
	Module geoip already enabled
	root@storycube:/usr/share/GeoIP# service apache2 restart
	 * Restarting web server apache2                                                                                                          apache2: Could not reliably determine the server's fully qualified domain name, using storycube.kr for ServerName
	 ... waiting apache2: Could not reliably determine the server's fully qualified domain name, using storycube.kr for ServerName
	
	phpinfo명령을 통해 check한다.
	GEOIP_로 시작하는 변수값을 확인한다. 

####강력한 비밀번호.
만일 비밀번호를 분실했을 경우 발송하는 email 보안에도 각별히 신경을 써야 한다. 


####회원 등급 관리
멤버십을 활성화 했다면 일반일의 경우 가장 낮은 구독자로 설정한다.

####.htaccess 파일 보안성 적용

우선 mod_rewrite 가 활성화 되어야 한다.
활성화되고 apache conf에 해당 모듈이 추가되어야 한다.
특히 설정 -옵션에서 고유주소를 설정했을 때 페이지를 찾을 수 없는 메세지가 뜨는 경우
이 모듈이 apache에 의해 활성화 되지 않아서 발생한다.

a3enmod명령으로 활성화 확인 후 

	root@storycube:/var/www# a3enmod rewrite
	No command 'a3enmod' found, did you mean:
	 Command 'a2enmod' from package 'apache2.2-common' (main)
	a3enmod: command not found
	root@storycube:/var/www# a2enmod
	Your choices are: actions alias asis auth_basic auth_digest authn_alias authn_anon authn_dbd authn_dbm authn_default authn_file authnz_ldap authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cern_meta cgi cgid charset_lite dav dav_fs dav_lock dbd deflate dir disk_cache dump_io env expires ext_filter file_cache filter geoip headers ident imagemap include info ldap log_forensic mem_cache mime mime_magic negotiation php5 proxy proxy_ajp proxy_balancer proxy_connect proxy_ftp proxy_http proxy_scgi reqtimeout rewrite setenvif speling ssl status substitute suexec unique_id userdir usertrack vhost_alias
	Which module(s) do you want to enable (wildcards ok)?
	^C
	root@storycube:/var/www#
	root@storycube:/var/www# a2enmod rewrite
	Module rewrite already enabled
	
	Debian계열은 apache에서 기본적으로 rewrite모듈이 활성화 되어 있지 않다. 
	/etc/apache2/apache2.conf 를 열어서 아래의 내용을 추가한다.
	 # Added by HK.JO 2013.10.16
	 # rewrite mod active
	 <IfModule mod_rewrite.c>
	 rewriteEngine On
	 </IfModule>

또한 /etc/apache2/sites-enbaled/000-default 에서도 아래와 같이 수정

       <VirtualHost *:80> 
        ServerAdmin webmaster@localhost

        DocumentRoot /var/www
        <Directory />
                Options FollowSymLinks
                AllowOverride None
        </Directory>

        <Directory /var/www/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride all    <--- none 에서 all로 수정할것.
                Order allow,deny
                allow from all
        </Directory>

서비스 재시작

	 root@storycube:/etc/apache2/sites-enabled# service apache2 restart
	* Restarting web server apache2                                                                                                          	apache2: Could not reliably determine the server's fully qualified domain name, using storycube.kr for ServerName
	... waiting apache2: Could not reliably determine the server's fully qualified domain name, using storycube.kr for ServerName  [ OK ]
	root@storycube:/etc/apache2/sites-enabled#


####분산 설정 화일.
아파치서버에 디렉토리별로 설정을 따로 지정할 수 있도록 하는 파일.  예를 들어 아파치서버를 사용하는  웹호스팅.  
사용자들이 자신의 디렉토리별로 아파치 서버의 설정을 변경하고 싶은 경우 사용.   
이 파일을 사용하면 웹호스팅의 서버 전체 설정과는 상관없이 자신의 WP 디렉토리에만 서버의 특징 설정을 적용 할 수 있다.  
서버설정에 관련된 추가 명령어를 추가하여 보안을 강화 할 수 있다.  

	 # protect the htaccess file
	 <files .htaccess>
	 order allow,deny
	 deny from all
	 </files>
	 
	 # disable the server signature
	ServerSignature Off
	 
	 # limit file uploads to 10mb
	 LimitRequestBody 10240000
	 
	 # protect wpconfig.php
	 <files wp-config.php>
	 order allow,deny
	 deny from all
	 </files>
	 
	 #who has access who doesnt use deny to block specific IPs
	 order allow,deny
	 #deny from 000.000.000.000
	 allow from all
	 
	 # disable directory browsing
	 Options All -Indexes
	 
	 #disable hotlinking of images with forbidden or custom image option make sure stealingisbad.gif exists
	 RewriteEngine on
	 RewriteCond %{HTTP_REFERER} !^$
	 RewriteCond %{HTTP_REFERER} !^http://(www\.)?youresite.com/.*$ [NC]
	 #RewriteRule \.(gif|jpg)$ – [F]
	 #RewriteRule \.(gif|jpg)$ http://www.youresite.com/stealingisbad.gif [R,L]
	 
	 #WP code goes here
	
	
	   #protect the htaccess file
	   <files .htaccess>
	   order allow, deny
	   deny from all
	   </files>
	   
	   #disable the server signature
	   ServerSignature Off
	   
	   #limit file uploads to 10mb
	   LimitRequestBody 10240000
	   
	   #protect wpconfig.php
	   <files wp-config.php>
	   order allow,deny
	   deny from all
	   </files>
	   
	   #disable directory browsing
	   Options All -Indexes
	   
	   #disable hotlinking of images with forbidden or custom image option make usre stealingisbad.gif 


####wp-config.php의 보안 추가
수동으로 wp-config.php를 만들었다면 Authentication Unique Keys and Salts 부분의 key를 반드시 업데이트 한다.  
설치본으로 정상 생성된 wp-config.php는 unique key가 적용되어 있다.)  
https://api.wordpress.org/secret-key/1.1/salt  에 접속합니다. 나타나는 8줄의 라인을 wp-config. php에 업데이트 합니다.


####보안 관련 플러그인
WP-Security Scan -- 이건 더이상 업데이트가 안되고 있음. X  
새로운 보안 스캐너 중에 all-in-one-wp-security and firewall  받음.  
**설정**  
phase 1 

- admin 계정명을 변경 hk.jo
- 특히 WP는 관리자 권한을 가진 계정이 admin이다. 따라서 Brute Force Login 공격의 시도에 대비하기 위해서는 반드시 기본 admin계정의 이름을 변경하는 것이 좋다.

phase 2

- 로그인 시의 user name과는 다르게 nickname과 Display name을 가져가는 것이 좋다.
- 알릴판-프로필 - 개인설정 에서 변경한다.
- 사용자명은 로그인 이름이며 변경이 불가능하지만 위의 보안 플러그인을 통해 변경했다.
- 닉네임과 공개적으로 표시할 이름은 사용자명(login name)과 다르게 설정한다.

phase 3

- 패스워드 강도
- 적어도 6년이상의 강도로 패스워드를 조정할 것.

phase 4

- WP File Access
- WP 설치때 생성되는 readme.html, licesn.txt, wp-config-sample.php등과 같은 파일에 접근하지 못하도록.

phase 5

- Firewall 5G 활성화
- 기본적인 URL 해킹, 크래킹을 차단하는 FW활성화

phase6

- Files Change Detection
- 1주일에 한번씩 파일이 변경되면 자동으로 메일로 알려주도록 하는 기능 활성화


##백업과 이사하기
---
**재설치 절차**

- 설치된 모든 플러그인을 비활성화
- FTP접속 후 sitemap.xml과 .htaccess, wp-config.php 파일을 다운받고 wp-content도 통째로 download.
- WP의 모든 화일 삭제
- WP최신버젼 다운로드 후 wp-config -sample.php파일을 이전 wp-config.php와 동일하게 변경하고 WP 프로그램 업로드
- 디렉토리에 sitemap.xml, .htaccess 화일, wp-content폴더를 업로드
- 플러그인 다시 활성화.
- 특정 테마로 충돌 또는 테마 수정 변경시 오류가 발생한다면 wp-content 티렉토리에서 해당 테마를 삭제. 원본 테마를 업로드하여 복원.

####WP 콘텐츠 백업하기.
**WP XML 파일로 내보내기 **  
WP의 포스트와 댓글을 백업하는 방법은 도구 - 내보내기를 이용한다. xml화일 형태로 백업파일이 생성된다. 
xml화일에는 이미지 파일이 아닌 이미지 정보만 저장되므로 원본 이미지를 삭제하지 않도록 주의해야 한다. 

**wp-content 디렉터리 다운로드**    
기본 WP 설치 후 추가적으로 생긴 파일들을 보관하는 곳. 
이중에서 특히 uploads 디렉터리는 웹사이트의 페이지에서 사용중인 이미지들이 보관되므로 웹사이트를 백업받을 때는 꼭 다운로드 받아서 별도로 저장할 것. 

####데이터 베이스 백업
호스팅업체를 이용하는 경우 업체에서 제공하는 mysql 백업을 이용할 수 있다. gzip or zip

플러그인을 이용해서 백업 가능

- Updraft plus 설치. (최근까지 꾸준하게 업데이트가 이루어지고 있는 플러그인)  
- 설치 후 설정메뉴에 추가됨.  
- 클라우드상에 백업 화일을 저장할 수 있다.  이를 위해서는 curl 설치가 필요하다.  
- phpinfo()를 통해 curl extension이 설치되었는지 확인하고  설치되어 있지 않다면 apt-get install curl - libcurl3 libcurl3-dev php5-curl 를 설치한다.  
- 설치완료후 apache는 자동으로 재기동 됨. 설치 후 phpinfo()를 확인하면 curl 모듈이 설치되었음을 확인할수 있다.  
- curl설치 확인 후에 updraft 설정을 저장한 후에 링크 설정 후 dropbox의 인증을 한번 진행한다.   

다른 운영체제로의 이전을 위한 테이터베이스 백업.   

- 이경우 phpmyadmin을 이용하여 백업할 DB의  내보내기 항목을 클릭. 

####전체백업을 통해 웹 호스팅 이전.
웹호스팅 업체를 변경하는 경우.
기존 WP디렉토리에서 wp-content 폴더만 다운로드. 
도구의 내보내기를 이용해 덧글과 본문 컨텐츠 export, DB가 유실되더라도 본문과 댓글은 이를 통해 복원가능
wp-config.php도 백업
MySQL백업받기.
새로운 웹호스팅 업체에 기존 도메인 연결
최신의 WP 다운로드후 새로운 호스팅에 설치. 
wp-config.php파일은 기존의 백업한 화일과 동일하게 정보를 변경 저장.
백업받은 wp-content 폴더를 새로운 호스팅 업체의 제공 디렉토리에 덮어쓰기
백업받은 DB upload
특히 중요한 건 웹호스팅 업체의 이전이 완료되면 마지막으로 관리자 화면에서 설정->고유주소 부부분을 이전의
사용방식대로 똑같이 변경해야한다. 새로운 주소체계로 하면 이전 주소로  검색엔진에 등록된 게시물은 접근이 안됨.

#### 다른 서비스에서 워드프레스로 이사오기
이글루스 - TC - WP로의 지난한 이전. 게시물 참고

#### 테마편집의 기본 CSS
테마편집시 설치한 테마의 원본은 별도로 백업 후 (PC또는 테마복제) 복사본으로 수정한다.
새로운 테마 설치시 기본 스펙 확인이 중요

- 최대폭
- 포스트 본문(content) 폭
- 사이드바 폭
- 헤더 이미지 크기

style.css 파일의 layout 부분을 살펴보면 헤더, 본문, 사이드 바의 영역이 구분. 각각의 스타일이 지정됨.
하지만 content, primary, secondary의 각각의 수치를 정확히 조율하지 않으면 레이아웃이 틀어짐. 

####워드프레스에 한글 폰트 적용하기
구글웹폰트를 사용할수 있지만 style.css 파일을 수정하면 WP에 적용되는 모든 글꼴, 글꼴의 생상, 크기 줄간격을 바꿀수 있다.  다음의 예는 WP 기본 테마의 경우.
style.css의 global element 검색. Fonts 영역의 textarea진 부분에 윈도우7의 기본 글꼴인 '맑은고딕'을 나타내는 "mal-gun gothic" 을 입력한다.  **이때 쌍따옴표는 글꼴이름이 띄어쓰기를 포함한 여러개의 단어인 경우에만 붙인다. 한단어의 경우 따옴표는 필요 없음. **  
단 이방식은 사용자의 PC에 해당 서체가 설치되어 있어야 한다. 지정한 폰트로 화면에 출력된다. 

#### WP에 나눔 글꼴 적용하기
fontface.kr에 접속하면 나눔 글꼴 적용이 가능.  이 폰트는 블로그에 방문했을때만 보이며, 구독기에서는 적용되지 않음. 또한 Firefox 브라우저에서는 웹폰트가 적용되지 않으며 글꼴이 적용될때 delay발생. 

- fontface에서 제공하는 스크립트 코드를 header.php 파일의 맨 아레 </header> 태그 위에 붙여넣기 한다.
- 스크립트코드 입력 후 style.css파일의 글꼴 변경부분을 찾아 Nanum-Gothic을 입력한다. 

#### 사용자 정의 필드
사용자 정의 필드는 반목적인 포스팅을 할때 필요한 기능. 일종의 테이블 데이터베이스.  포스트 편집창 아래쪽에 사용자 정의 필드 입력창이 있다.  편집장에서 사용자 정의 필드를 만들고 특정 코드를 PHP파일에 추가해야 한다.
정의 필드가 입력된 컨텐츠 위치에 <?php the_meta();?> 코드를 삽입한다.  이미지활용, 박스, 테이블과 같은 스타일을 지정하는 기능도 있다. 

#### 숏코드 활용(Short Code)
편집창에서 간단한 명령어를 넣어 정의한 특정기능을 수행할 수 있도록 하는 것. 포스트 본문의 어떤 영역이든 상자, 에드센스, 동영상등을 간단히 삽입 가능.
사용자가 직접 정의할수도 있으며 많은 플러그인에서 자신의 플러그인 기능을 본문에 적용하기 위해 숏코드를 정의해두고 사용자에게 지원한다. 

#### 프런트 페이지 만들기
front page or landing page는 웹사이트 첫 페이지에 워드프레스 글목록 대신 별도로 제작한 웹페이지가 보이도록 하는 것. HTML/CSS에 익숙하다면 WP 프런트페이지를 원하는 다른 모양으로 다양하게 꾸밀 수 있습니다. 

- 프런트 페이지는 우선 페이지-New Add를 클릭하여 빈페이지를 먼저 생성한다. 그리고 이 페이지의 고유주소(Permanet Link)를 복사해 둔다. 
- 웹사이트 도메인 주소로는 블로그의 첫페이지에 접근이 불가능하므로 빈 페이지를 만들고 이 페이지의 링크를 프런트페이지에 연결해야 한다. 
- 별도의 front.php정도의 php화일일 작성한다.
- 빈페이지 고유주소와 보여줄 이미지가 포함된 php화일 작성
- 이 파일을 FTP로 현재 적용된 테마파일이 있는 폴더에 업로드
- 새로운 페이지 작성. 페이지 속성에서 템플릿을 기존에 작성한 템플릿 이름을 선택.  제목을 템플릿 이름으로 저장하고 페이지를 발행. 
- 설정-읽기에서 정적인 페이지에 체크하면 전명 페이지와 글 페이지 체크란이 활성화됨. 
- 글 페이지는 blog로 선택(페이지 이름).  이제 자신의 WP 웹사이트에 다시 접속하면 기존 테마가 적용된 WP 웹사이트가 아니라 HTML로 넣은 프런트 페이지가 등장.

#### 콘텐츠 작성 노하우 10가지
- 이미지는 항상 최적화 할것. 800 px를 넘지않도록 이미지 업로드. 구글 피카사와 같은 외부 이미지 저장공간을 제공하는 웹사이트에 이미지 업로드후 이미지 링크나 플러그인을 사용하는것이 유리하다.
- 동영상 역시 직접 업로드 보다는 유튜브나 비메오와 같은 업로드 사이트를 이용하여 임베드 코드로 삽입
- 자신의 블로그 전체 주제와 어울리는 카테고리, 태그, 슬러그를 사용하여 분류.정돈
- 포스트 작성시에는 항상 키워드에 집중. 웹의 콘텐츠는 검색을 통해서만 웹에 노출됨.
- 콘텐츠 제작과 관리를 편하게 할 수 있는 다양한 플러그인을 활용할것.
- WP테마는 항상 가볍고 쾌적하게 유지. 테마에 너무 많은 위젯과 스크립트 코드를 사용하지 말것. 

## 여러 사이트를 한곳에서 운영하기 - 멀티 사이트
---
장점

- 여러개의 사이트를 만들더라도 워드프레스는 한번만 설치
- 각각의 사이트별 관리자와 사용자를 체계적으로 관리
- 각각 사이트별로 테마와 플러그인을 독립적으로 사용
- 테마 , 플러그인의 리소스를 통합해서 관리. 설치/삭제/업데이트를 한번으로 통합

워드프레스에서의 멀티사이트 기능은 워드프레스 뮤 인데. 3.0이후 기본 core 프로그램에 통합되면서 쉽게 운영이 가능해짐.  자세한 기능은 http://mu.wordpress.org 참고

- wp-config.php화일에서 `/* That's all, stop editing... */` 윗부분에 추가한다. 

	`/* Wordpress MU */`  
	`define('WP_ALLOW_MULTISITE', true);`
- 워드프레스 재로그인. 알림판 - 대시보드 - 도구.  네트워크 설정 메뉴가 추가됨. 서브도메인방식과 서브 디렉터리 방식이 있는데 서브 도메인 방식 추천. 처음에 설정한 내용은 다시 변경 불가.
- 네트워크 생성을 위한 설정을 하고 설치 버튼.  서브도메인은 당연히 도메인 업체에 해당 도메인을 추가로 등록해야 한다.  이제 사이트별 데이터가 저장된 디렉터리도 만들고 wp-config. php화일과 .htaccess 파일 수정필요
- 서브디렉토리 만들기. `wp-content` 디렉터리 아래 폴더 생성. 디렉토리 권한은 777로 지정
- wp-config.php화일 수정. 대시보드 - 도구에서 2번 항속의 소스를 추가한다.  
- .htaccess 파일 수정. 3번 항목의 내용을 추가한다.  이로서 네트워크 설정 완료

멀티사이트 대시보드 및 기본 설정

- 관리자툴자 - 네트워크 관리자 - 대시보드 메뉴는 개별 사이트가 아니라 네트워크 전체를 관리하는 대시보드로 이동한다. 
- 이곳에서 사이트 신규 개설, 사용자 추가관리, 테마와 플러그인등의 리소스까지 통합관리가능
- 새로운 사이트를 추가하기 전에 [설정-네트워크 설정]에서 기본적인 설정을 먼저 해야 한다.
- 운영환경 설정 - 네트워크 이름과 네트워크 관리자 설정
- 등록설정. 처음에는 사이트와 사용자를 추가하는 권한이 네트워크 관리자에게만 있다. 개발사이트 관리자가 사용자 추가 및 사용자 사이트등록을 할수 있도록 하리면 사용자 추가 필요. 
- 업로드 설정. 언어설정. 메뉴 설정.
- 사이트생성과 사용자 등록. 사용자 등록을 허용했다면 회원 가입 형태로 사이트와 사용자 등록을 할수  있다. 

멀티사이트의 개발 사이트 관리

- 네트워크 관리자 메뉴에서 [Sites]를 클릭하면 네트워크 내 모든 사이트 확인이 가능. 
- 사이트 생성 후 상단의 관리자 툴바에서 추가한 사이트 확인 가능.
- 기존 사용자가 사이트를 새로 만들려면 최소 한 개 이상의 사이트에 사용자로 등록되어 있어야 한다. 
- 사이트 비활성화 가능. 사이트목록에서 붉은 색으로 표시.  삭제한 사이트는 복구가 불가능하지만 비활성화 사이트는 언제든지 활성화 가능
- 목록에서의 사이트 편집(수정)은 네트워크 관리자만 가능

여러사이트의 사용자 관리

 - 네트워크 관리자가 모든 사용자를 관리 할수 있다. 새로운 사용자를 등록 한후 이 사용자가 추가될 개발사이트를 등록한다. 
 - 네트워크 관리자가 삭제한 사용자는 영구 삭제가 되지만 개별 사이트 관리자가 사용자를 삭제하면 해당 사이트에서만 제거되고 네트워크에는 남아 있다. 
 
멀티사이트 테마 적용
 
 - 테마를 한번만 네트워크에 설치하면 모든 개별 사이트에서 공유해서 사용 할 수 있다. 
 - 테마를 '네트워크 활성화'한다는 것은 네트워크에 속해 있는 모든 사이트에게 테마 사용 권한을 준다는 의미
 - 특정 사이트에만 테마 사용권을 줄수 있다. 
 - 개별 사이트에서 테마의 코드나 CSS를 수정할 수 없고, 네트워크 관리자만이 테마 수정이 가능.
 - 개발 사이트 관리자가 테마의 색상, 폰트등의 설정을 변경해도 같은 테마를 사용하는 다른 사이트에는 영향을 주지 않는다. 

멀티사이트 플러그인 설치

- 플러그인을 네트워크 활성화하면 개별 사이트에 사용권을 주는 것이 아니라 강제적으로 적용 한다는 점.
- 네트워크에서 활성화된 플러그인은 개별 사이트 관리자가 비활성화 할 수 없음
- 네트워크 관리자가 [네트워크 설정]에서 플러그인 메뉴를 개별 사이트에서 사용할 수 있도록 설정해 주어야 한다. 
- 플러그인은 테마와 달리 네트워크 관리자가 특정 사이트에만 선택적으로 활성화시킬수 없다. 
- 스팸 방지등 모든 사이트에 필수적인 플러그인만 네트워크 활성화로 등록하고 특정 사이트에서 필요한 플러그인은 네트워크 비활성화 상태로 두어, 개별 사이트에서 활성화시킬수 있도록 한다.

##한규 WP 수정 내용.
현재  pure 테마 설치. 하지만 제목 폰트가 너무 크다.
- 구글의 개발자도구를 통해 제목라인의 태그확인 및 style.css  라인 확인완료.

	#content h1 a, #content h2 a, #content h3 a, #content h4 a, #content h5 a{   	
	color: #363636 ;  }
	
	#content h1 a, #content h2 a, #content h3 a, #content h4 a, #content h5 a{   	
	color: #363636 ;    
	font-size: 20px}  // 추가



