package dash.pojo;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.glassfish.hk2.api.AnnotationLiteral;
import org.glassfish.jersey.message.filtering.EntityFiltering;
/*
 * Message Detailed View
 * @Author CarlSteven
 */

@Target({ElementType.TYPE, ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@EntityFiltering
public @interface MessageDetailedView {

	/**
	 * Factory class for creating instances of {@code ProjectDetailedView} annotation.
	 */
	public static class Factory extends AnnotationLiteral<MessageDetailedView>
			implements MessageDetailedView {

		/**
		 * 
		 */
		private static final long serialVersionUID = 6206854287244874702L;

		private Factory() {
		}

		public static MessageDetailedView get() {
			return new Factory();
		}
	}
}
