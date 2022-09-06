package thanhlcpd04359.domain;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="accounts")
public class Account implements Serializable{
	
	@Id
	@Column(length = 30)
	private String username;
	
	@Column(length = 70, nullable = false)
	private String password;

	private String fullname;
	private String email;
	private String photo;

	@JsonIgnore
	@OneToMany(mappedBy = "account")
	private Set<Authoritie> authorities;

	@JsonIgnore
	@OneToMany(mappedBy = "account")
	private Set<Order> orders;

}
