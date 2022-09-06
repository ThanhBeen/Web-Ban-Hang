package thanhlcpd04359;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import thanhlcpd04359.config.StorageProperties;
import thanhlcpd04359.service.StorageService;


@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class AsmJava6Application {

	public static void main(String[] args) {
		SpringApplication.run(AsmJava6Application.class, args);
	}
	
	@Bean
	CommandLineRunner init(StorageService storageService) {
		return(args->{
			storageService.init();
		});
	}

}
