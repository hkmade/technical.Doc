#egloos 이전 프로젝트

###개요
이글루라는 블로그 플랫폼에서 글을 끄적거린것이 벌써 10년이 다되어간다.  많은 인연을 만났고 아직도 이곳 지인들의 소식을 블로그를 통해 접하게 된다. 이제 SNS로 많이 이동했지만 여전히 이곳의 글과 지난 나의 발자취는 소중하다.

많은 우여곡절이 있지만 더이상 이글루라는 블로그 플랫폼이 나에게 주는 미덕은 없다고 판단했다. SK에서 분사한지 몇개월이 지나도록 검색과 동영상 업로드가 안되는 건 치명적인 서비스 부재와 암울한 이글루스의 미래를 보여준다. 

다행이 개인이 이글루스 블로그를 백업받을 수 있는 도구를 만들어 배포하고 있으며 이를 토대로 블로그를 무사히 이전할 수 있었다. 이 문서는 이러한 블로그 데이터의 백업 - 1차 복원 - 2차 복원에 걸쳐 이글루스 블로그 플랫폼에서 집안 거실 노트북의 Wordpress 플랫폼으로 블로그 데이터를 이전을 위한 가이드이다. 

티스토리가 xml 백업파일을 이용한 블로그 복원 서비스를 지원하는 올 상반기 까지는 이글루스 블로그의 백업은 순조로워 보였다. 아래 설명한 백업프로그램을 이용해서 티스토리로 자신의 컨텐츠를 그대로 이전할수 있었기 때문이다. 하지만 지금 티스토리는 더이상 블로그 복원 서비스를 제공하지 않는다.

따라서 아래의 백업 프로그램은 크게 두가지 용도로 활용이 가능하다.

* 자신의 PC에 이글루스 블로그의 모든 컨텐츠를 백업받는다.  
* 설치형 블로그로 이글루스 블로그를 이전한다.

첫번째의 경우는 간단하다. 프로그램다운받아서 이글루의 환경설정에서 몇가지 설정하고 실행하면 끝.
하지만 두번째 경우라면 절차가 조금 복잡하다.
우선 설치형 블로그에 대한 경험이나 지식이 필요하며 이에 따른 시스템 운영을 위한 Linux 기반 지식이 필요하다.
티스토리의 정책변경으로 인한 것인데.. 

* 타 블로그로 컨텐츠를 이전하고자 한다면 서비스형 블로그(티스토리)로의 이전은 현재 불가능하다.
* 블로그서비스로의 이전은 오로지 textcube라는 설치헝 블로그에서만 가능하다.
* WP(워드프레스)를 블로그 플랫폼으로 사용한다면 textcube에서 export하여 이전이 가능하다.
  

###데이터 이관 방법
블로그 데이터를 이전하는 전체레이아웃은 아래와 같다.

* 이글루스 블로그 내용 백업
* 백업데이터를 기반으로 TTXML 화일 생성
* textcube 설치형 블로그 설치
* textcube의 관리자 기능을 이용해 xml을 통한 블로그 복원 실행
* wordpress (이하 줄여서 wp) 설치형 블로그 설치
* textcube의 관리자 기능을 이용해 ttxml형태로 백업파일로 저장
* wp의 ttxml 지원 플러그 인을 이용해 textcube에서 백업 받은 xml을 로드하여 데이타 복원

###블로그이전의 특징
* 이글루스 블로그 백업은 nosyu님이 배포하고 있는 TTXML백업툴 사용. (win32기반 program)
* 현재 ttxml 화일을 이용한 블로그 복원 서비스는 설치형블로그인 textcube와 wordpress가 지원한다.
* 올해 중반까지 tistory에서도 블로그 복원 서비스를 지원을 했고 이 사이트를 많이 사용으나 관련서비스를 중단하였으며 결국 블로그 데이터의  이관은 설치형 블로그만 가능
* wordpress의 ttxml 플러그인은 nosyu님의 프로그램을 통해 생성한 xml화일 load에 실패
* **따라서 nosyu님의 프로그램을 통해 생성한 xml화일을 textcube에 import하고 textcube에서 export한 화일을 최종적으로 wp에 로드하는 방식을 이용.**
* 이 프로젝트의 핵심은 nosyn님이 배포한 툴을 이용해서 이글루스의 데이터를 오류없이 다운로드 하는 것이다.

###이글루스 백업 프로그램
* nosyn님의 이글루스 백업 툴은 모든 글과 사진,댓글, 트랙백을 블로그넘버링에 맞추어 모두 PC로 다운로드 해준다.
* 블로그이전 뿐만 아니라 단순백업용으로도 자신의 글과 사진을 저장하는 용도로도 매우 유용한 도구이다.
* 배포처는 `http://nosyu.pe.kr/2811`  이며 현재 2013년 4월 버전이 최신이다.
* 모든 컨텐츠를 다운로드한 후 xml화일을 생성하며 textcube에서는 이 xml화일을 import해서 블로그 데이터를 복원한다
* wordpress에서도 이 xml을 import하는 플러그인이 있지만 계속 오류가 발생하고 있고 import가 성공해도 본문이 없는 블로그타이틀만 나타나고 있다. (내경우)


##### 이글루스 사전 작업
자신의 이글루 블로그에서 환경설정을 확인한다.

	미분류로 카테고리를 지정하지 않은 글들은 카테고리를 지정하여 분류한다
	트랙백 목록을 확인하여 스팸성 트랙백은 모두 삭제
	또한 블로그 스킨은 이글루에서 기본으로 제공하는 HTML화이트로 변경한다. 

#### egloos2TTXML 실행

Download Site
**`http://nosyu.pe.kr/2811`** 

해당 파일 다운로드 방식이 조금 독특한데.   숫자, 영문을 제시한 대로 입력후 submit을 눌러야 download 버튼이 생긴다.
기존 PC버젼 URL과 모바일 URL을 선택할 수 있는데 블로그 스킨을 이글루에서 제공하는 기본 HTML화이트로 변경하는 경우 PC URL을 사용할 수 있다. 

	PC 페이지 선택
	아이디, 패스워드는 egloos 사용 계정
	새로운 블로그 주소 (이전 대상 블로그 주소로 바꿔치기하는 것이며 없으면 공란으로 비워도 됨)
	자료 불러온 후 TTXML파일 만들기
	XML은 하나보다는 적당한 크기로 나누는 것이 추후에 업로드 할때 로드를 줄일 수 있다. 
	하나의 xml당 포함하는 게시물 갯수를 지정할 것. (나는 400개씩 지정)

* 미분류 글이 많을 경우 warning메세지가 많이 발생하는데 이게 어느정도 메세지가 많아지면 프로그램이 중단되는 경우가 발생한다.
* 특정 게시물에서 hangup이 걸린것 처럼 멈추는 경우가 있는데 2-3번 정도 retry를 하고 skip형식으로 넘어가면서 error로그를 남긴다. 
* 물론 이 과정에서 더이상 진행하지 못하고 종료되는 경우가 있는데 이럴 경우 다시 재실행을 한다. 
* 이 백업작업은 특히나 이글루스 서버측에도 부하를 주는 것이고 실행하는 PC에서도 부하가 발생한다.
* 네트웍트래픽을 점유하는 다른 프로그램이나 로드를 유발하는 다른 프로그램은 모두 종료하고 이 백업 프로그램만을 실행하는 것을 추천한다. 
* 이미지는 외부링크 이미지 또는 이글루 기본 업로드 이미지도 가끔 백업에 실패하는데 이러 한 경우 작업이 완료된 이후 해당 폴더에 error_xxx로 시작하는 에러메세지를 보면 실패한 게시물과 해당 이미지의 정보가 나오므로 이를 토대로 수동으로 download할 수 있다. 
* 특히 백업을 받다 실패한 후 재작업을 하는 경우 반드시 data폴더의 백업본은 삭제한 후(data폴더 자체를 삭제하거나 rename) 진행해야 한다. 

###TEXTCUBE 설치
####텍스트큐브의 역사

우리나라의 IT역사 그중에서 WEB의 대중화 기간동안 가장 중심에 서 있었던 두가지 플랫폼을 뽑자면 당연히 zero보드와 테더툴스의 "textcube(이하 줄여서 TC)" 라고 할수 있다. 공통적으로 지금은 멸족한 가문이라는 점. 제로보드는 XE로 재탄생되었으나 예전의 위상을 잃어버린지 오래되었으며 TC는 2010년 이후로는 더이상 업데이트 되지 않고 있는 설치형 블로그의 제왕이 될뻔 했으나 구글에 인수되면서 지금은 멸족한 가문이라 할 수 있다. 물론 텍스트큐브는 다음의 티스토리 블로그 플랫폼의 근간이 되어있지만 더이상 TC로서의 맥은 끊어졌다. 
하지만 잊혀진 2010년 이후로 업데이트조차 되지 않고 있는 TC가 이글루스의 블로그 컨텐츠를 받아줄수 있는 우리의 유일한 희망이다. 2010년 최신버젼(??)은 PHP 5.2이상, MySQL 4.1, PostgreSQL8.3, Cubrid2008이상에서만 구동되니 확인 해야 하지만  요즘 리눅스 배포판은 당연히 모두 이보다는 버젼업이니 크게 신경 안써도 된다. 

####설치개요

다운로드 후 APM환경에 설치. APM이 무엇인지,  설치형 블로그를 어떻게 Install하고 설정하는지는 모른다면 이단계 이후의 골치 아픈 이야기는 다 때려치우고 PC에 백업받은 이글루스 블로깅의 데이터에 만족하자. 
WP와 크게 다르지 않다.   우선 phpmyadmin 또는 command line에서 DB하나 생성하고 (tc정도면 무난하다. ) 2010년 버젼이니 요즘 환경에서 맞지 않는 설정화일과 요상한 에러를 발생하는 오류를 수정하면 tc의 설치가 완료된다. T.T

####TextCube 설치
##### DB생성
TC설치 전 우선 DB생성 필요.
phpmyadmin 또는 command line에서 DB생성.

MySQL connect collation 은 utf8_general_ci 가 기본임.
DB생성 인코딩 셋도 기본값으로 유지하자. 
tc  라는 DB생성 할것

##### Apahce 설정 변경
URL Rewrite 모듈의 활성화가 필요하다. 

apache2 이상부터 기존 설정화일의 구성이 많이 변경되었다. (좀더 구조화되었다는데..)
아래 구문을 설정화일에 추가 해야 한다. (Unbuntu Linux 기준)
 
	vi /etc/apache2/sites-available/default
	#Rewrite Engine enable for Textcube installation. 2013.09 HK.JO Added 
        <Directory "/var/www/tc">   
                Options FollowSymLinks  
                AllowOverride FileInfo   
        </Directory> 

rewrite mode 활성화

	root@storycube:/etc/apache2/sites-available# a2enmod rewrite
	Enabling module rewrite.
	To activate the new configuration, you need to run:
  	service apache2 restart

apache2 resart

	root@storycube:/etc/apache2/conf.d# service apache2 restart
 	* Restarting web server apache2                                                                                                  apache2: 
	..
	..
	[ OK ]

재기동시 에러메세지 확인

	root@storycube:/etc/apache2/conf.d# tail -f /var/log/apache2/error.log
	..
	..
	[Wed Sep 04 10:14:03 2013] [notice] caught SIGTERM, shutting down
	[Wed Sep 04 10:14:04 2013] [notice] Apache/2.2.22 (Ubuntu) PHP/5.4.6-1ubuntu1.2 configured -- resuming normal operations

#####웹서버에 TC설치
우분투 서버의 경우 기본 htdocs 경로는 `/var/www`   
이곳에 압축헤제 .  /var/www/tc 경로아래에 TC의 모든 화일이 위치한다.   
웹브라우저에서는  http://siteurl/tc  실행

	작업유형 - 새로운 텍스트큐브 설치
	데이터베이스 관리 시스템 - MySQL
	데이터베이스 서버 - localhost (기본값)
	데이터베이스 포트 - 3306 (기본값)
	데이터베이스 이름 - tc (phpmyadmin에서 생성한 그 DB이름)
	데이터베이스 사용자명 - 반드시 입력
	데이터베이스 암호 - 반드시 입력
	테이블 식별자 - tc (기본값)
	
	단일사용자 - 단일블로그
	관리자정보 등록 - 이메일, 비밀번호, 블로그 식별자, 필명

최종단계 ( 7단계 데이터베이스 준비단계) 에서 MySQL 5.1 이상을 사용하는 APM환경에서는 `테이블을 생성하지 못했습니다. 에러발생`
MySQL 5.1 이상에서는 테이블 만들때 반드시 engine=MyISAM 같은 형식을 준수해야 한다. type=xxx 방식은 지원하지 않는다. 
따라서 tc의 setup.php를 아래와 같이 수정한다. (1133라인)	

	$charset = 'ENGINE=InnoDB DEFAULT CHARSET=utf8';
	// $charset = 'TYPE=MyISAM DEFAULT CHARSET=utf8';		
	
수정후 웹브라우저 refresh

#####설치후 발생하는 오류 FIX
설치 완료후 관리자 화면 로그인 오류 발생. 브라우저에서 500 internal error 발생
아래 화일의 143라인의 수정이 필요하다. 라인 끝의 \t\t\n부분에 &문자가 포함되어 있어 발생하는 오류다

	root@storycube:/var/www/tc/library/view# vi ownerView.php
	..
	echo "\t\t\n".call_user_func($editor['initfunc'], $editor)."\t\t\n";
 

####TC로 이글루스 백업 파일(xml)을 import
 
웹브라우저에서 `http://siteurl/tc`  로 접근.  

	상단 Control Panel로 접근하면 로그인창이 뜬다. admin계정으로 로그인.
	풀다운메뉴의 설정 - 데이터 관리 
	데이터 복원
	egloos2TTXML로 백업받은 xml화일을 선택한다. (복수개로 생성했다면 순차적으로 업데이트 한다.)

데이터 복원 완료 후 `http://siteurl/tc` 로 접근해서 게시물들을 확인 한다.  
나의 경우 댓글 정보가 일정 기간이 경과한 오래된 글의 댓글은 정상적으로 import되지 않았다. (무시하고 진행)  

중요한 점은 본문에 포함된 이미지 들이다. 이미지가 정상적으로 표시되지 않고 기존 이글루스에서 사용하던 내부 html code들만 보여진다.  
하지만 egloos2TTXML에서 백업한 데이터원본에는 컨텐츠과 사진이 모두 보존되어 있다.  
TC에서 WP로 이전을 하면 본문에 포함된 사진이미지는 정상적으로 모두 복원되었음을 확인 했다.  

####TC에서 데이터 백업 
이제 TC에서 다시 데이터를 백업 할 차례이다.  

	상단 Control Panel에서 
	풀다운메뉴 설정 - 데이터관리
	데이터 백업

TC에서의 TTXML화일은 하나의 xml화일로 백업하여 저장한다. 

####WP설치
웹호스팅업체를 이용할수도 있고 나처럼 집안 거실 노트북에 설치할수도 있고 설치형 블로그이니 이건 사용자의 선택이 필요하다.
WP 설치와 커스터마이징. 이건 방대한 분량이니. SKIP.. 

####WP로 TC의 백업화일 import
WP에서는 개발자 만들어 등록한 티스토리와 텍스트큐브의 백업화일을 import하는 플러그인을 활성화시킨 후 Import하는 과정을 거친다.  
WP가 정상적으로 설치된 환경에서 아래의 URL을 통해 알림판에서 부터 시작한다.  
`http://siteurl/wordpress/wp-admin`

	알림판-플러그인-설치된 플러그인
	TTXML Import 활성화하기
	
	도구 - 가져오기
	TTXML 선택
	업로드 방식 - 로컬컴퓨터에서도 가능하며 xml화일을 원격에서 http://방식으로 호출 할 수도 있다.
	
local에서 xml를 로드하는 것은 3G가 한계이며 TC에서 백업할때 이것에 유의해야 한다. 

###결론
무사히 이 여정을 마치면 WP에 이글루스의 블로깅의 역사가 그대로 보존된다. 
물론 이글루스의 이미지갤러리는 결국 수작업을 해야 하고 옛날 글들에 포함되어 있는 댓글들이 잘 보존되지는 않았지만 솔직히 나는 처음부터 글을 하나씩 copy & paste로 옮기자 라는 말도안되는 고민을 하기도 했었다. 그에 비하면 비록 티스토리의 블로그 복원이 중단된것이 매우 치명적이지만 
우여곡절끝에 WP로 무사이 이전을 완료했다.

이글루스 지인들과 백업 혹은 이사에 관심있는 이글루스 블로그 유저들에게 참고가 되었으면 한다.
특히나 egloos2TTXML을 만들고 고민하고 배포하신 nosyn님께 다시한번 감사의 인사를 전한다. 

참고로 나의 거실노트북에서 운영하고 있는 WP에 잘 보관되어 있는 이글루스 글과 댓글은 아래와 같다.   
![WP 알림판](https://www.monosnap.com/image/N32HorvYifL9FOlAwY8QUjZiZ.png)





 
 

