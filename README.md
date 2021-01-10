# (오산시) 어린이 교통사고 위험지역 도출 

[공모전 페이지](https://compas.lh.or.kr/subj/competition/info?subjNo=SBJ_2012_001)

## directory and file
- data : 비공개로 되어있는 자료도 있어 github에 올리지 못하므로 kakao talk으로 공유한 내용을 
           압축 해제 후 "data"로 이름 변경해 사용할 것
- notebooks : R이나 python, jupyter notebook 파일을 저장하는 곳
  - 예시 R script로 ggmap_test.R로 태스트 코드 올려둠
- models : python 학습 모델을 올리는 곳
- config.yml : api key등 중요한 정보를 저장하는 곳
    - [api키 발급받는 법](https://happist.com/568746/구글맵-활용법-구글맵-api-key-발급방법)
    - 예
```angular2html
default:
  GOOGLE_MAP_API_KEY: "<발급받은 코드>"
```

## branch 
- 반드시 main에 바로 올리지 말고 새로운 브런치를 파서 업로드 할 것.
    - 예시) 김상엽 12 ~ 20번 과제 분석, (notebooks에서만 작업함)
    
```angular2html
git pull
git checkout -b data_analyze_12_20
// 코드 작성 후
git add notebooks/*
git commit
git push
git checkout master
```

## 데이터 요약
- 회의 후 문서로 작성 필 (data_abstract.md에)
