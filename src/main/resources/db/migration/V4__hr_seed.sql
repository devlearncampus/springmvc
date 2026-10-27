------------------------------------------
-- 역할 
------------------------------------------
insert into hr_role(hr_role_id, role_code, role_name) values(seq_hr_role.nextval, 'ROE_EMPLOYEE', '일반 사원');
insert into hr_role(hr_role_id, role_code, role_name) values(seq_hr_role.nextval, 'ROE_MANAGER', '팀장');
insert into hr_role(hr_role_id, role_code, role_name) values(seq_hr_role.nextval, 'ROE_HR_ADMIN', '인사 관리자');

------------------------------------------
-- 권한  
------------------------------------------
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_MY_INFO_READ', '내 정보 조회');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_LEAVE_REQUEST', '내 휴가 신청');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_MY_LEAVE_READ', '내 휴가 조회');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_TEAM_MEMBER_READ', '내 팀원 조회');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_TEAM_LEAVE_APPROVE', '팀원 휴가 승인/반려');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_EMPLOYEE_READ', '전체 사원 조회');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_EMPLOYEE_CREATE', '신규 사원 등록');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_EMPLOYEE_UPDATE', '사원 정보 수정');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_EMPLOYEE_RESIGN', '퇴직 처리');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_DEPARTMENT_MANAGE', '부서 관리');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_JOB_MANAGE', '직급 관리');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_LEAVE_ALL_READ', '전체 휴가 현황 조회');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_ACCOUNT_MANAGE', '계정 발급/상태 관리');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_ROLE_ASSIGN', '계정 역할 부여');
INSERT INTO permission (permission_id, permission_code, permission_name) VALUES (seq_permission.NEXTVAL, 'PERMISSION_ROLE_MANAGE', '역할별 권한 설정');

------------------------------------------
-- 역할 별 보유 권한  
------------------------------------------
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 1, 1);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 1, 2);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 1, 3);

INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 2, 1);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 2, 2);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 2, 3);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 2, 4);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 2, 5);

INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 1);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 2);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 3);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 4);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 5);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 6);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 7);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 8);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 9);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 10);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 11);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 12);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 13);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 14);
INSERT INTO hr_role_permission(hr_role_permission_id, hr_role_id, permission_id) VALUES(seq_hr_role_permission.NEXTVAL, 3, 15);


------------------------------------------
-- 부서  
------------------------------------------
insert into department(department_id, department_code, department_name) values(seq_department.nextval, 'HR', '경영지원팀');
insert into department(department_id, department_code, department_name) values(seq_department.nextval, 'DEV', '개발팀');
insert into department(department_id, department_code, department_name) values(seq_department.nextval, 'SALES', '영업팀');

------------------------------------------
-- 직급  
------------------------------------------
insert into job(job_id , job_code, job_name) values(seq_job.nextval, 'STAFF','사원');
insert into job(job_id , job_code, job_name) values(seq_job.nextval, 'ASSOCIATE','대리');
insert into job(job_id , job_code, job_name) values(seq_job.nextval, 'MANAGER','과장');
insert into job(job_id , job_code, job_name) values(seq_job.nextval, 'SENIOR_MANAGER','차장');
insert into job(job_id , job_code, job_name) values(seq_job.nextval, 'DEPARTMENT_MANAGER','부장');


------------------------------------------
-- 사원 정보  
------------------------------------------
insert into emp(emp_id, ename, email, phone, hiredate, department_id, job_id, status, annual_leave_days)
values(seq_emp.nextval, 'minzino', 'zino1187@naver.com', '010-2222-9999', '2026-10-25', 2, 3, 'ACTIVE',10);


-- 변경사항 확정
COMMIT;
