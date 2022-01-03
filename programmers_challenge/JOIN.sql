-- 01. 없어진 기록 찾기
SELECT A.animal_id, A.name
FROM animal_outs A
    LEFT JOIN animal_ins AS B ON A.animal_id = B.animal_id
WHERE B.animal_id IS NULL;

-- 02. 있었는데요 없었습니다
SELECT A.animal_id, A.name
FROM animal_outs A
     LEFT JOIN animal_ins B ON A.animal_id = B.animal_id
WHERE B.datetime > A.datetime
ORDER BY B.datetime ASC;

-- 03. 오랜 기간 보호한 동물(1)
SELECT A.name, A.datetime
FROM animal_ins A
    LEFT JOIN animal_outs B ON A.animal_id = B.animal_id
WHERE B.datetime IS NULL
ORDER BY A.datetime ASC
LIMIT 3;

-- 04. 보호소에서 중성화한 동물
SELECT A.animal_id, A.animal_type, A.name
FROM animal_ins A
    LEFT JOIN animal_outs B ON A.animal_id = B.animal_id
WHERE sex_upon_intake != sex_upon_outcome;
