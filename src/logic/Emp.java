package logic;

import java.sql.*;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.ejb.Stateful;
import javax.ejb.Stateless;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "emp")

public class Emp {
    @Id
    private int empno;
    private String ename;
    private String job;
    private int mgr;
    private Date hiredate;
    private int sal;
    private int comm;
    private int deptno;

    public Emp(int empno, String ename, String job, Date hiredate, int deptno) {
        this.empno = empno;
        this.ename = ename;
        this.job = job;
        this.hiredate = hiredate;
        this.deptno = deptno;
    }

    public Emp() {}

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public void setMgr(int mgr) { this.mgr = mgr; }

    public void setHiredate(Date hiredate) { this.hiredate = hiredate; }

    public void setSal(int sal) { this.sal = sal; }

    public void setComm(int comm) { this.comm = comm; }

    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }



    public int getEmpno() {
        return empno;
    }

    public String getEname() {
        return ename;
    }

    public String getJob() {
        return job;
    }

    public int getMgr() { return mgr; }

    public Date getHiredate() {
        return hiredate;
    }

    public int getSal() { return sal; }

    public int getComm() { return comm; }

    public int getDeptno() {
        return deptno;
    }

}
