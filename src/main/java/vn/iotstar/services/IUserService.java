package vn.iotstar.services;

import vn.iotstar.entity.User;

public interface IUserService {
    User findByUsername(String username);

    User findByEmail(String email);

    boolean register(String username, String password, String email, String fullname);

    boolean verifyOTP(String email, String otp);

    User login(String username, String password);

    boolean resetPassword(String email, String newPassword);

    void update(User user);
}