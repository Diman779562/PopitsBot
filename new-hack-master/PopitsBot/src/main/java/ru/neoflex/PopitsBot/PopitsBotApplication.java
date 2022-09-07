package ru.neoflex.PopitsBot;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.telegram.telegrambots.ApiContextInitializer;

@EnableScheduling
@SpringBootApplication
public class PopitsBotApplication {

	public static void main(String[] args) {
		Global.jedis.auth("ZUBAw2FrqMaEEnixY8crKIPzoNWp4CfI");
		// инициализация библиотеки для бота
		ApiContextInitializer.init();
		SpringApplication.run(PopitsBotApplication.class, args);
	}
}


