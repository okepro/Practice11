package logic;

import javax.ejb.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Stateful
public class DataBaseHand {
    @PersistenceContext(unitName = "persistenceUnitName")
    private EntityManager entityManager;
    List<Emp> allEmp = new ArrayList<>();
        public List<Emp> showAllEmp() {
            Query query = entityManager.createQuery("select entity from Emp entity");
            return query.getResultList();
        }

        public List<Emp> showEmpByNumber(String empno) {
            try (Connection connection = DBUtil.getDataSource().getConnection()) {
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT empno, ename, job, hiredate, deptno FROM emp WHERE empno = (?)");
                preparedStatement.setInt(1, Integer.parseInt(empno));
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    Emp emp = new Emp(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getDate(4), resultSet.getInt(5));
                    allEmp.add(emp);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
            return allEmp;
    }
        public List<Emp> showEmpByName(String ename1) {
                try (Connection connection = DBUtil.getDataSource().getConnection()) {
                    PreparedStatement preparedStatement = connection.prepareStatement("SELECT empno, ename, job, hiredate, deptno FROM emp WHERE ename = (?)");
                    preparedStatement.setString(1, ename1);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    if (resultSet.next()) {
                        Emp emp = new Emp(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getDate(4), resultSet.getInt(5));
                        allEmp.add(emp);
                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return allEmp;
        }

        public boolean addNewEmp(String empno, String ename, String job, String mgr, String hiredate, String sal, String comm, String deptno) {

            Emp emp = new Emp();
            emp.setEmpno(Integer.parseInt(empno));
            emp.setEname(ename);
            emp.setJob(job);
            emp.setMgr(Integer.parseInt(mgr));
            emp.setHiredate(Date.valueOf(hiredate));
            emp.setSal(Integer.parseInt(sal));
            emp.setComm(Integer.parseInt(comm));
            emp.setDeptno(Integer.parseInt(deptno));
            entityManager.persist(emp);
            return true;
        }

    public void deleteEmp (String empno) throws SQLException {
        Emp emp = entityManager.find(Emp.class, Integer.parseInt(empno));
        entityManager.remove(emp);
        }
}

