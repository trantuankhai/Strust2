package com.struts.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import com.struts.*;
import com.struts.model.Departs;

public class DepartsDaoImpl implements DeapartsDAO {
	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

	public List<Departs> listDeparts() {
		Session session = sessionFactory.openSession();
		List<Departs> listDeparts = null;
		try {
			session.getTransaction().begin();
			Query<Departs> query = session.createQuery("from Departs");
			listDeparts = query.list();
			session.getTransaction().commit();

		} catch (HibernateException e) {
			if (session.getTransaction() != null) {
				session.getTransaction().rollback();
			}
		} finally {
			session.close();
		}
		return listDeparts;
	}

	public int addDeparts(Departs departs) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		int id = -1;
		try {
			session.getTransaction().begin();
			id = (Integer) session.save(departs);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			if (session.getTransaction() != null) {
				session.getTransaction().rollback();

			}
			e.printStackTrace();
			id = -1;
		} finally {
			session.close();
		}
		return id;
	}

	public String editDeparts(int id, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public String deleteDeparts(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public long sumPage(long showInPage) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Departs> showPagination(int min, int max) {
		// TODO Auto-generated method stub
		return null;
	}

	public long countStaffsInDeparts(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
