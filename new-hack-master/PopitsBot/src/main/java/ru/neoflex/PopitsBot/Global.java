package ru.neoflex.PopitsBot;

import redis.clients.jedis.Jedis;

public class Global {
    public static Jedis jedis = new Jedis("redis-18061.c275.us-east-1-4.ec2.cloud.redislabs.com", 18061);

    public static double cryptoBTC = 0.0;
    public static double percentBTC = 0.0;

    public static double cryptoETH = 0.0;
    public static double percentETH = 0.0;

    public static double cryptoBNB = 0.0;
    public static double percentBNB = 0.0;

    public static double cryptoDOGE = 0.0;
    public static double percentDOGE = 0.0;

    public static double cryptoDOT = 0.0;
    public static double percentDOT = 0.0;

    public static double cryptoADA = 0.0;
    public static double percentADA = 0.0;
}
