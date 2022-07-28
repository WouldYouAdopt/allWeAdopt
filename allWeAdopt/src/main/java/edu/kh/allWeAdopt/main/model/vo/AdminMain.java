package edu.kh.allWeAdopt.main.model.vo;

import java.util.List;

import lombok.Getter;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class AdminMain {
	
	private int askCount;
	
	private int adopterCount;
	
	private int fundingCount;
	
	private List<Anal> adopterGraph;
	
	private List<Anal> fundingGraph;
	

}
