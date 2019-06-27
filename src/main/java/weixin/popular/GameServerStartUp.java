package weixin.popular;



import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
//@EnableEurekaClient // service provider
//@EnableFeignClients // srevice consumer
//@EnableHystrix // 斷路器
public class GameServerStartUp{

	private static final Logger logger = LoggerFactory.getLogger(GameServerStartUp.class);
	
	private static long startUpTime;

	private static ConfigurableApplicationContext run;

	private static GameServerStartUp instance;
	
	
	public static void main(String[] args) throws Exception {
		startUpTime = System.currentTimeMillis();
		try {
			run = SpringApplication.run(GameServerStartUp.class, args);
		} catch (Exception e) {
			logger.error("", e);
			System.exit(-1);
		} catch(Error e) {
			logger.error("", e);
			System.exit(-1);
		}
		
		logger.info(" ================================ 服务器启动成功 ！！！ 共耗时 :" + (System.currentTimeMillis() - startUpTime) / 1000 + "秒====================================");
	}

	public GameServerStartUp() {
		
	}

	public static GameServerStartUp getInstance() {
		return instance;
	}

	public <T> T getBean(Class<T> clz) {
		return run.getBean(clz);
	}

	@PostConstruct
	public void init() throws Exception {
		instance = this;
		
	}

}
