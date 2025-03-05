/*
DTO (Data Transfer Object):
DTO là một design pattern dùng để đóng gói và truyền dữ liệu giữa các thành phần/layer trong ứng dụng
Là một class đơn giản chỉ chứa các thuộc tính (properties) và các phương thức getter/setter
Không chứa bất kỳ business logic nào
Mục đích chính là đóng gói dữ liệu để truyền qua network hoặc giữa các layer
 */
package dto;

/**
 *
 * @author tungi
 */
public class UserDTO {
    private String Username;
    private String Name;
    private String password;
    private String Role;

    public UserDTO() {
    }

    public UserDTO(String Username, String Name, String password, String Role) {
        this.Username = Username;
        this.Name = Name;
        this.password = password;
        this.Role = Role;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "Username=" + Username + ", Name=" + Name + ", password=" + password + ", Role=" + Role + '}';
    }

    
}