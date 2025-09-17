package com.sist.client;

import java.awt.*;

import javax.swing.JButton;
import javax.swing.JPanel;
import javax.swing.table.*;
import java.awt.event.*;
public class GenieMusic extends JPanel{
	ControllerPanel cp;
	JButton[] btns=new JButton[7];
	String[] titles={"Top100",
			"가요",
			"POP",
			"OST",
			"트롯",
			"JAZZ",
			"CLASSIC"};
	public GenieMusic(ControllerPanel cp)
	{
		this.cp=cp;
		//setBackground(Color.gray);
		setLayout(null);
		JPanel p=new JPanel();
		p.setLayout(new GridLayout(1,7,5,5));
		for(int i=0;i<btns.length;i++)
		{
			btns[i]=new JButton(titles[i]);
			p.add(btns[i]);
		}
		p.setBounds(200, 15, 600, 35);
		add(p);
	}
}
