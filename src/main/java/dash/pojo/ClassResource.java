package dash.pojo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dash.errorhandling.AppException;
import dash.service.ClassService;
import dash.service.CoreService;
import dash.service.UserService;

@Component
@Path("/classes")
public class ClassResource {

	@Autowired
	private ClassService classService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CoreService coreService;
	
	@POST
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.TEXT_HTML })
	public Response createClass(Class clas) throws AppException {
		
		Long createClassId = classService.createClass(clas);
		
		List<Core> listCores = new ArrayList<Core>();
		for (Long core_id : clas.getCores()) {
			listCores.add(new Core(core_id, createClassId));
		}
		
		coreService.createCores(listCores);
		return Response.status(Response.Status.CREATED)
				// 201
				.entity("A new class has been created")
				.header("Location", String.valueOf(createClassId))
				.header("ObjectId", String.valueOf(createClassId)).build();
	}
	
	@POST
	@Path("list")
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response createClasses(List<Class> classes) throws AppException {
		classService.createClasses(classes);
		return Response.status(Response.Status.CREATED) 
				.entity("List of classes was successfully created").build();
	}
	
	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Class> getClasses(
			@QueryParam("orderByInsertionDate") String orderByInsertionDate,
			@QueryParam("numberDaysToLookBack") Integer numberDaysToLookBack)
					throws IOException,	AppException {
		List<Class> classes = classService.getClasses(
				orderByInsertionDate, numberDaysToLookBack);
		return classes;
	}
	
	@GET
	@Path("byLocation")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Class> getClassesByLocation(
			@QueryParam("location") Location location)
					throws IOException,	AppException {
		List<Class> classes = classService.getClassesByLocation(location);
		return classes;
	}

	@GET
	@Path("{id}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Response getClassById(@PathParam("id") Long id,
			@QueryParam("detailed") boolean detailed)
					throws IOException,	AppException {
		Class classById = classService.getClassById(id);
		return Response
				.status(Response.Status.OK)
				.entity(new GenericEntity<Class>(classById) {
				})
						.header("Access-Control-Allow-Headers", "X-extra-header")
						.allow("OPTIONS").build();
	}
	
	/************************ Update Methods *********************/
	
	//Full update or creation in not already existing
	@PUT
	@Path("{id}")
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.TEXT_HTML })
	public Response putClassById(@PathParam("id") Long id, Class clas)
			throws AppException {
		clas.setId(id);
		Class classById = classService.verifyClassExistenceById(id);
		
		if (classById == null) {
			// resource not existent yet, and should be created under the
			// specified URI
			Long createClassId = classService.createClass(clas);
			return Response
					.status(Response.Status.CREATED)
					.entity("A new class has been created AT THE LOCATION you specified")
					.header("Location",
							"../classes/"
									+ String.valueOf(createClassId)).build();
		} else {
			// resource is existent and a full update should occur
			clas.setLocation_id(classById.getLocation_id());
			classService.updateFullyClass(clas);
			return Response
					.status(Response.Status.OK)
					.entity("The class you specified has been fully updated AT THE LOCATION you specified")
					.header("Location",
							"../classes/"
									+ String.valueOf(id)).build();
		}
	}

	// PARTIAL update
	@POST
	@Path("{id}")
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.TEXT_HTML })
	public Response partialUpdateTask(@PathParam("id") Long id, Class clas)
			throws AppException {
		clas.setId(id);
		Class classById = classService.verifyClassExistenceById(id);
		
		if (classById == null) {
			// resource not existent yet, and should be created under the
			// specified URI
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity("Class Id not found")
					.header("Location", String.valueOf(clas)).build();
		} 
			
		classService.updatePartiallyClass(clas);
		return Response
				.status(Response.Status.OK)
				// 200
				.entity("The class you specified has been successfully updated")
				.build();
		
	}

	/*
	 * *********************************** DELETE ***********************************
	 */
	@DELETE
	@Path("{id}")
	@Produces({ MediaType.TEXT_HTML })
	public Response deleteClass(@PathParam("id") Long id)
			throws AppException {
		Class clas = classService.verifyClassExistenceById(id);
		if(clas == null)
		{
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity("Class Id not found")
					.header("Location",
							"../classes/"
									+ String.valueOf(clas)).build();
		}
		
		classService.deleteClass(clas);
		return Response.status(Response.Status.NO_CONTENT)// 204
				.entity("Class successfully removed from database").build();
	}

	@DELETE
	@Path("admin")
	@Produces({ MediaType.TEXT_HTML })
	public Response deleteClasses() {
		classService.deleteClasses();
		return Response.status(Response.Status.NO_CONTENT)// 204
				.entity("All classes have been successfully removed").build();
	}

	//TODO: Implement mechanism to limit the number of people that can sign up for a class.
	@POST
	@Path("{id}/MEMBER/{user}")
	@Produces({MediaType.TEXT_HTML})
	public Response addMember(@PathParam("user") Long userId, @PathParam("id") Long id)
	throws AppException
	{
		User user= userService.getUserById(userId);
		Class clas= classService.verifyClassExistenceById(id);
		classService.addMember(user, clas);
		return Response.status(Response.Status.OK).entity("MEMBER ADDED: User "+ user.getUsername()
				+" set as MEMBER for class "+ clas.getId()).build();
	}
	
	@DELETE
	@Path("{id}/MEMBER/{user}")
	@Produces({MediaType.TEXT_HTML})
	public Response deleteMember(@PathParam("user") Long userId, @PathParam("id") Long id)
		throws AppException
	{
		User user= userService.getUserById(userId);
		Class clas = classService.verifyClassExistenceById(id);
		if(clas == null)
		{
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity("Class Id not found")
					.header("Location",
							"../classes/"
									+ String.valueOf(clas)).build();
		}
		
		classService.deleteMember(user, clas);
		return Response.status(Response.Status.OK).entity("MEMBER DELETED: User "+ user.getUsername()
				+" removed as MEMBER from task "+ clas.getId()).build();
	}
	
}
