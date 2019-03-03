package org.lwt.tour.jackson.mixin;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

public class LineMixin {
	@JsonIgnoreProperties(value={"lineClass"})
	public static class BasicInfo {
	}
}
