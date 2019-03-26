package com.struts.dao;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.struts.model.User;

public class UserDaoImpl implements UserDAO {
	private final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	private final Logger logger = LogManager.getLogger();
	private Transaction transaction = null;
	public User getUser(String userName) {
		User user = null;
		Session session = sessionFactory.openSession();
		try {
			transaction = session.beginTransaction();
			user = (User) session.get(User.class, userName);
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			logger.log(Level.toLevel("1"), e.toString());

		} finally {
			session.close();
		}
		return user;
	}

	public String checkLogin(String userName, String passWord) {
		String result = null;
		Session session = sessionFactory.openSession();
		try {
			transaction = session.beginTransaction();
			User user = session.get(User.class, userName.trim());
			if (user != null) {
				if (user.getPass_word().equals(passWord.trim())) {
					result = "success";
				} else {
					result = "error password";
				}

			} else {
				result = "error username";
			}
			transaction.commit();
		} catch (HibernateException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	}

