package com.sist.main;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.table.*;
public class BoardList extends JPanel{
	JLabel la1,la2;
	JTable table;
	DefaultTableModel model;
	JButton b1,b2,b3;
	private BoardMainFrame bm;
	TableColumn column;
	public BoardList(BoardMainFrame bm)
	{
		this.bm=bm;
		la1=new JLabel("게시판",JLabel.CENTER);
		la1.setFont(new Font("맑은 고딕",Font.BOLD,40));
		la2=new JLabel("0 page / 0 pages");
		b1=new JButton("새글");
		b2=new JButton("이전");
		b3=new JButton("다음");
		
		String[] col={"번호","제목","이름","작성일","조회수"};
		String[][] row=new String[0][5];
		model=new DefaultTableModel(row,col)
		{

			@Override
			public boolean isCellEditable(int row, int column) {
				// TODO Auto-generated method stub
				return false;
			}
			
		};
		table=new JTable(model);
		JScrollPane js=new JScrollPane(table);
		for(int i=0;i<col.length;i++)
		{
			DefaultTableCellRenderer rend=
					new DefaultTableCellRenderer();
			column=table.getColumnModel().getColumn(i);
			if(i==0)
			{
				column.setPreferredWidth(35);
				rend.setHorizontalAlignment(JLabel.CENTER);
			}
			else if(i==1)
			{
				column.setPreferredWidth(350);
			}
			else if(i==2)
			{
				column.setPreferredWidth(100);
				rend.setHorizontalAlignment(JLabel.CENTER);
			}
			else if(i==3)
			{
				column.setPreferredWidth(100);
				rend.setHorizontalAlignment(JLabel.CENTER);
			}
			else if(i==4)
			{
				column.setPreferredWidth(50);
				rend.setHorizontalAlignment(JLabel.CENTER);
			}
		}
		table.getTableHeader().setReorderingAllowed(false);
		table.getTableHeader().setResizingAllowed(false);
		table.setRowHeight(30);
		table.getTableHeader().setBackground(Color.pink);
		
		setLayout(null);
		la1.setBounds(10, 15, 610, 50);
		add(la1);
		b1.setBounds(30, 75, 80, 30);
		add(b1);
		js.setBounds(30, 110, 580, 350);
		add(js);
		JPanel p=new JPanel();
		p.add(b2);p.add(la2);p.add(b3);
		p.setBounds(30, 470, 580, 35);
		add(p);
	}
	
}
