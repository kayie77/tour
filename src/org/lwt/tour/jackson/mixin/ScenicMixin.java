package org.lwt.tour.jackson.mixin;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

public class ScenicMixin {
	@JsonIgnoreProperties(value={"city","scenicClass"})
	public static class BasicInfo {
	}
}
