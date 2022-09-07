package ru.neoflex.PopitsBot.bot;

import org.apache.commons.codec.digest.Crypt;
import org.apache.logging.log4j.core.config.Scheduled;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.ReplyKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.KeyboardButton;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.KeyboardRow;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import ru.neoflex.PopitsBot.Global;
import ru.neoflex.PopitsBot.model.User;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;



public enum BotState {

    Start {
        @Override
        public void enter(BotContext context) {
            sendMessage(context, "Привет!");
        }
        @Override
        public BotState nextState() {
            return EnterCrypto;
        }
    },



    EnterCrypto {
        @Override
        public void enter(BotContext context) {
            sendMessage(context, "За какой криптовалютой следить?");
            sendMessage(context, "/BTC");
            sendMessage(context, "/ETH");
            sendMessage(context, "/BNB");
            sendMessage(context, "/DOGE");
            sendMessage(context, "/DOT");
            sendMessage(context, "/ADA");

        }
        @Override
        public void handleInput(BotContext context) {

            String crypto = context.getInput();

            switch (crypto) {
                case ("/BTC"):
                    sendMessage(context, "Курс BTC: \n" + Global.cryptoBTC + "\nИзменение: \n" + Global.percentBTC + "%");
                    break;
                case ("/ETH"):
                    sendMessage(context, "Курс ETH: \n" + Global.cryptoETH + "\nИзменение: \n" + Global.percentETH + "%");
                    break;
                case ("/BNB"):
                    sendMessage(context, "Курс BNB: \n" + Global.cryptoBNB + "\nИзменение: \n" + Global.percentBNB + "%");
                    break;
                case ("/DOGE"):
                    sendMessage(context, "Курс DOGE: \n" + Global.cryptoDOGE + "\nИзменение: \n" + Global.percentDOGE + "%");
                    break;
                case ("/DOT"):
                    sendMessage(context, "Курс DOT: \n" + Global.cryptoDOT + "\nИзменение: \n" + Global.percentDOT + "%");
                    break;
                case ("/ADA"):
                    sendMessage(context, "Курс ADA: \n" + Global.cryptoADA + "\nИзменение: \n" + Global.percentADA + "%");
                    break;
            }
        }

        @Override
        public BotState nextState() {
            return Output;
        }
    },


    Output(false) {
        @Override
        public void enter(BotContext context) {
            //sendMessage(context, "Курс валюты");
        }

        @Override
        public BotState nextState() {
            return Start;
        }
    };


    private static BotState[] states;
    private final boolean inputNeeded;

    BotState() {
        this.inputNeeded = true;
    }

    BotState(boolean inputNeeded) {
        this.inputNeeded = inputNeeded;
    }

    public static BotState getInitialState() {
        return byId(0);
    }

    public static BotState byId(int id) {
        if (states == null) {
            states = BotState.values();
        }

        return states[id];
    }

    protected void sendMessage(BotContext context, String text) {
        SendMessage message = new SendMessage()
                .setChatId(context.getUser().getChatId())
                .setText(text);


        try {
            context.getBot().execute(message);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }









    public boolean isInputNeeded() {
        return inputNeeded;
    }

    public void handleInput(BotContext context) {
    }

    public abstract void enter(BotContext context);
    public abstract BotState nextState();
}
