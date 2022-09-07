package ru.neoflex.PopitsBot.repo;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import ru.neoflex.PopitsBot.Global;

@Component
public class RedisRepo {

    public double parse (String s, String name) {
        JSONObject json = (JSONObject) JSONValue.parse(s);
        return (double) json.get(name);
    }

    @Scheduled(fixedRate = 1000)                                //1 секунда
    public void getValCrypto() {
        Global.cryptoBTC = parse(Global.jedis.get("BTC"), "close");
        Global.percentBTC = parse(Global.jedis.get("BTC"), "percent");

        Global.cryptoETH = parse(Global.jedis.get("ETH"), "close");
        Global.percentETH = parse(Global.jedis.get("ETH"), "percent");

        Global.cryptoBNB = parse(Global.jedis.get("BNB"), "close");
        Global.percentBNB = parse(Global.jedis.get("BNB"), "percent");

        Global.cryptoDOGE = parse(Global.jedis.get("DOGE"), "close");
        Global.percentDOGE = parse(Global.jedis.get("DOGE"), "percent");

        Global.cryptoDOT = parse(Global.jedis.get("DOT"), "close");
        Global.percentDOT = parse(Global.jedis.get("DOT"), "percent");

        Global.cryptoADA = parse(Global.jedis.get("ADA"), "close");
        Global.percentADA = parse(Global.jedis.get("ADA"), "percent");
    }
}




