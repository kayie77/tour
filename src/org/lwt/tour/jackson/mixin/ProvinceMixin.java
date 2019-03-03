package org.lwt.tour.jackson.mixin;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

public class ProvinceMixin {
	@JsonIgnoreProperties(value={"country","citys"})
	public static class BasicInfo {
	}
}
