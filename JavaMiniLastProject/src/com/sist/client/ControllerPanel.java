package com.sist.client;
import javax.swing.*;
import java.awt.*;
public class ControllerPanel extends JPanel{
    HomeForm hf;
    ChatForm cf=new ChatForm();
    BoardList bf=new BoardList();
    FoodFind ff;
    CardLayout card=new CardLayout();
    public ControllerPanel()
    {
    	hf=new HomeForm(this);
    	ff=new FoodFind(this);
    	setLayout(card);
    	add("HF",hf);
    	add("CF",cf);
    	add("BF",bf);
    	add("FF",ff);
    }
}