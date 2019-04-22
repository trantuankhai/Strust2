package com.struts.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.struts.model.Staffs;

public class StaffsDaoImpl implements StaffsDao {
	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	private final Logger logger = Logger.getLogger(StaffsDaoImpl.class.getName());
	private Transaction transaction = null;

	@SuppressWarnings("unchecked")
	public List<Staffs> listStaffs() {
		Session session = sessionFactory.openSession();
		List<Staffs> staffs = null;
		try {
			transaction = session.beginTransaction();
			staffs = session.createQuery("from Staffs").list();
			transaction.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();

			}
			logger.error(e);
		} finally {
			session.close();
		}
		return staffs;
	}

	public int addStaffs(Staffs staffs) {
		int kq = -1;
		Session session = sessionFactory.openSession();
		try {
			transaction = session.beginTransaction();
			kq = (java.lang.Integer) session.save(staffs);
			transaction.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();

			}
			logger.error(e);
			kq = -1;

		} finally {
			session.close();
		}
		return kq;
	}

	public String editStaffs(int id, Staffs staffs) {
		Staffs staffs2 = getStaffsById(id);
		Session session = sessionFactory.openSession();
		try {
			transaction = session.beginTransaction();
			if (staffs2 != null) {
				staffs.setId_staffs(staffs2.getId_staffs());
				session.update(staffs);
				transaction.commit();
				return "Success";
			} else {
				return "Nhân Viên Không Tồn Tại";
			}

		} catch (HibernateException e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();

			}
			logger.error(e);
			return "Fail";

		} finally {
			session.close();
		}
	}

	public String deleteStaffs(int id) {
		Session session = sessionFactory.openSession();
		try {
			transaction = session.beginTransaction();
			session.delete(session.get(Staffs.class, id));
			transaction.commit();
			return "Success";
		} catch (HibernateException e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();

			}
			logger.error(e);
			return "Fail";

		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Staffs> layKhoangNhanVien(int max) {
		Session session = sessionFactory.openSession();
		List<Staffs> staffs = null;
		try {
			transaction = session.beginTransaction();
			staffs = session.createQuery("from Staffs").setFirstResult(0).setMaxResults(max).list();
			transaction.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();

			}
			logger.error(e);
		} finally {
			session.close();
		}
		return staffs;
	}

	@SuppressWarnings("unchecked")
	public long sumPage(long showOnePage) {
		long page = 0;
		Session session = sessionFactory.openSession();
		try {
			session.getTransaction().begin();
			Query<Long> query = session.createQuery("select count(*) from Staffs");
			long sumPage = (long) query.uniqueResult();
			if (sumPage % showOnePage == 0) {
				page = sumPage / showOnePage;
			} else {
				page = sumPage / showOnePage + 1;
			}
			session.getTransaction().commit();

		} catch (HibernateException e) {
			e.printStackTrace();
			logger.error(e);
		} finally {
			session.close();
		}
		return page;
	}

	@SuppressWarnings("unchecked")
	public List<Staffs> chuyenHuongTrang(int min, int max) {
		Session session = sessionFactory.openSession();
		List<Staffs> staffs = null;
		try {
			transaction = session.beginTransaction();
			staffs = session.createQuery("from Staffs").setFirstResult(min).setMaxResults(max).list();
			transaction.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();

			}
			logger.error(e);
		} finally {
			session.close();
		}
		return staffs;
	}

	public Staffs getStaffsById(Integer id) {
		Session session = sessionFactory.openSession();
		Staffs staffs = null;
		try {
			transaction = session.beginTransaction();
			staffs = session.get(Staffs.class, id);
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return staffs;
	}

	public List<Staffs> getListStaffsByIdDepart(Integer id_departs) {
		Session session = sessionFactory.openSession();
		List<Staffs> staffs = null;
		try {
			session.getTransaction().begin();
			staffs = session.createQuery("from Staffs s where s.departs.id_departs =: id_departs")
					.setParameter("id_departs", id_departs).list();
			session.getTransaction().commit();
		} catch (HibernateException e) {
			if (session.getTransaction() != null) {
				session.getTransaction().rollback();
			}
			staffs = null;
		} finally {
			session.close();
		}
		return staffs;
	}

}
