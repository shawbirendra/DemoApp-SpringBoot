package com.example.demo;

import org.springframework.boot.diagnostics.FailureAnalysis;
import org.springframework.boot.diagnostics.FailureAnalyzer;

public class FailureAnalyzerImpl implements FailureAnalyzer {

	@Override
	public FailureAnalysis analyze(Throwable failure) {

		return new FailureAnalysis("Server Already Running With This Port. ",
				"Please Stop All The Server That is Running on port : ", failure);
	}

}
