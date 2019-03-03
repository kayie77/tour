package org.lwt.tour.jackson.mixin;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

public class CityMixin {
	@JsonIgnoreProperties(value={"province","scenics"})
	public static class BasicInfo {
	}
}
