#egloos 이전 프로젝트
---
우선 개인이 개발한 xml export tool을 이용해서 blogger로 이전 후 다시 WP로 이전하는 방식을 진행.
다시 수정.
현재    xml방식의 블로그 복원을 지원하는 서비스는 티스토리, 텍스트큐브,  WP등이 있는데.
티스토리는 더이상  xml방식의  import를 통한 블로그 복원 서비스를 지원하지 않는다.
또한 WP의 TTXML 플러그인 방식 또한 나같은 경우 게시물 타이틀은 가져오지만 컨텐츠는 import되지 않는다.

따라서 설치형 블로그인 textcube를 통해 import하고 ttxml로 다시 저장후에 WP로 이전하는 것으로. 
텍스트큐브 또한 설치형  블로그로 명성이 높았지만 더이상 업데이트가 되지 않고 있으며 WP로 이관한다.

http://nosyu.pe.kr

이글루 백업프로그램 개발 배포.
2013.09월 현재 0.0.11.2 버젼 배포 중(2013.04.28)
http://nosyu.pe.kr/2811

해당 파일 다운로드 방식이 조금 독특한데.   숫자, 영문을 제시한 대로 입력후 submit을 눌러야 download 버튼이 생기므로 주의할것.
기존 PC버젼 URL보다는 모바일 URL을 추천하고 있다. 
나의 경우 http://hkmade.egloos.com/m  이 모바일 주소가 된다. 

	모바일 페이지 선택
	아이디, 패스워드는 egloos 사용 계정
	새로운 블로그 주소 (이전 대상 블로그 없으면 공란으로 비워도 됨)
	자료 불러온 후 TTXML파일 만들기
	XML은 하나보다는 적당한 크기로 나누는 것이 추후에 업로드 할때 로드를 줄일 수 있다. 
	하나의 xml당 포함하는 게시물 갯수를 지정할 것. (나는 100개씩 지정)

이 작업을 진행하기 전 우선 해야 할 작업은  이글루 블로그 글 설정에서 

	미분류로 카테고리를 지정하지 않은 글들을 카테고리에 넣는 작업이 필요
	트랙백 목록을 확인하여 스팸성 트랙백은 모두 삭제

* 특히 미분류 글이 많을 경우 warning메세지가 많이 발생하는데 이게 어느정도 메세지가 많아지면 프로그램이 중단되는 경우가 발생했다.
* 또한 특정 게시물에서 hangup이 걸린것 처럼 멈추는 경우가 있는데 2-3번 정도 retry를 하고 skip형식으로 넘어가면서 error로그를 남긴다. 
* 물론 이 과정에서 더이상 진행하지 못하고 종료되는 경우가 있는데.. 나의 경우 다시 처음부터 재작업을 하하면서 최종적으로 성공했다. 
* 이미지는 외부링크 이미지 또는 이글루 기본 업로드 이미지도 가끔 백업에 실패하는데 이러 한 경우 작업이 완료된 이후 해당 폴더에 error_xxx로 시작하는 에러메세지를 보면 실패한 게시물과 해당 이미지의 정보가 나오므로 이를 토대로 수동으로 download할 수 있다. 
* 특히 백업을 받다 실패한 후 재작업을 하는 경우 반드시 data폴더의 백업본은 삭제한 후(data폴더 자체를 삭제하거나 rename) 진행해야 한다. 

###TEXTCUBE 설치
---
####텍스트큐브의 역사

2010년 이후로는 더이상 업데이트 되지 않고 있는 설치형 블로그의 제왕이 될뻔 했으나 구글에 인수되면서 멸족한 가문.
물론 텍스트큐브(줄여서TC)는 다음의 티스토리의 근간이 되어있지만 더이상 TC로서의 이름은 멸문되었다고 봐도 무방함.
2010년 최신버젼(??)은 PHP 5.2이상, MySQL 4.1, PostgreSQL8.3, Cubrid2008이상에서만 구동되니 확인 할것. (요즘 리눅스 배포판은 당연히 모두 이보다는 버젼업이니 크게 신경 안써도 될듯)

####설치개요

다운로드 후 APM환경에 설치
WP와 크게 다르지 않다. 
우선 phpmyadmin에서 DB하나 생성하고..

다운로드는 기본형으로 받자.

####설치전 준비사항

TC설치 전 우선 DB생성 필요.
phpmyadmin 또는 command line에서 DB생성.
http://siteurl/phpmyadmin

MySQL connect collation 은 utf8_general_ci 가 기본임.
DB생성 인코딩 셋도 기본값으로 유지하자. 
tc  라는 DB생성 할것

Apahce 설정 변경 (Rewrite 모듈 활성화하기)

apache2 이상부터 기존 설정화일의 구성이 많이 변경되었다. (좀더 구조화되었다는데..)
rewrite mod 추가 
 
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


웹서버에 업로드.
우분투 서버의 경우 기본 htdocs(웹root경로) 는 /var/www 
이곳에 압축헤제 
/var/www/tc 경로아래에 TC의 모든 화일이 위치한다.  웹브라우저에서는 
http://siteurl/tc  실행

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
	
	
####설치후 세팅
설치 완료후 관리자 화면 로그인 오류 발생. 브라우저에서 500 internal error 발생
root@storycube:/var/www/tc/library/view# vi ownerView.php

143라인에서 

	echo "\t\t\n".call_user_func($editor['initfunc'], $editor)."\t\t\n";
                                 
위와 같이 수정할것.  (마지막 라인에 & 문자가 포함되어 있다. 이걸 삭제 해야 한다.)


