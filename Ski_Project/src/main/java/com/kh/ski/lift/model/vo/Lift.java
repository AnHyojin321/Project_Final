package com.kh.ski.lift.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Lift {

	private int liftNo;
	private String liftType;
	private int liftPrice;
	private String liftAge;
}
