package vn.iotstar.services.impl;

import vn.iotstar.dao.IUserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.entity.User;
import vn.iotstar.services.IUserService;
import vn.iotstar.utils.EmailUtility;

public class UserServiceImpl implements IUserService {
    private IUserDao userDao = new UserDaoImpl();

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public boolean register(String username, String password, String email, String fullname) {
        if (userDao.findByUsername(username) != null || userDao.findByEmail(email) != null) {
            return false;
        }
        String otp = EmailUtility.generateOTP(6);
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setFullname(fullname);
        user.setActive(false);
        user.setOtp(otp);
        user.setRoleid(2); // Role user thông thường

        userDao.insert(user);

        // Gửi OTP qua email
        try {
            String subject = "Mã xác thực đăng ký tài khoản";
            String content = "<h3>Chào " + fullname
                    + ",</h3><p>Mã OTP kích hoạt tài khoản của bạn là: <b style='font-size: 20px; color: blue;'>" + otp
                    + "</b></p>";
            EmailUtility.sendEmail(email, subject, content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean verifyOTP(String email, String otp) {
        User user = userDao.findByEmail(email);
        if (user != null && otp != null && otp.equals(user.getOtp())) {
            user.setActive(true);
            user.setOtp(null);
            userDao.update(user);
            return true;
        }
        return false;
    }

    @Override
    public User login(String username, String password) {
        User user = userDao.findByUsername(username);
        if (user != null && user.getPassword().equals(password) && user.isActive()) {
            return user;
        }
        return null;
    }

    @Override
    public boolean resetPassword(String email, String newPassword) {
        User user = userDao.findByEmail(email);
        if (user != null) {
            user.setPassword(newPassword);
            user.setOtp(null);
            userDao.update(user);
            return true;
        }
        return false;
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }
}