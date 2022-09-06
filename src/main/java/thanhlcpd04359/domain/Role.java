package thanhlcpd04359.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="roles")
public class Role {

    @Id
    private String id;

    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "role")
    private Set<Authoritie> authorities;
}
