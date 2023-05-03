package org.persapiens.crde;

import edu.umd.cs.findbugs.annotations.SuppressFBWarnings;

import org.springframework.beans.factory.BeanCreationException;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@SuppressFBWarnings("SPRING_CSRF_PROTECTION_DISABLED")
@Configuration
@EnableWebSecurity
@EnableConfigurationProperties(ApplicationUsers.class)
public class SecurityConfig {

    /**
     * Configure security.
     *
     */
    @Bean
    public SecurityFilterChain configure(HttpSecurity http) {
        try {
            http.csrf((t) -> {t
                .disable();});
            http.authorizeHttpRequests((authorize) -> authorize
                .requestMatchers("/").permitAll()
                .requestMatchers("/login.faces").permitAll()
                .requestMatchers("/jakarta.faces.resource/**").permitAll()
                .anyRequest().authenticated());
            http.formLogin((formLogin) -> {formLogin
                .loginPage("/login.faces")
                .permitAll()
                .failureUrl("/login.faces?error=true")
                .defaultSuccessUrl("/");});
            http.logout((logout) -> {logout
                .logoutSuccessUrl("/login.faces")
                .deleteCookies("JSESSIONID");});

            return http.build();
        } catch (Exception ex) {
            throw new BeanCreationException("Wrong spring security configuration", ex);
        }
    }

    /**
     * UserDetailsService that configures an in-memory users store.
     *
     * @param applicationUsers - autowired users from the application.yml file
     * @return InMemoryUserDetailsManager - a manager that keeps all the users'
     * info in the memory
     */
    @Bean
    public InMemoryUserDetailsManager userDetailsService(ApplicationUsers applicationUsers) {
        PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        InMemoryUserDetailsManager result = new InMemoryUserDetailsManager();
        for (UserCredentials userCredentials : applicationUsers.getUsersCredentials()) {
            result.createUser(User.builder()
                    .username(userCredentials.getUsername())
                    .password(encoder.encode(userCredentials.getPassword()))
                    .authorities(userCredentials.getAuthorities().toArray(new String[0])).build());
        }
        return result;
    }
}
