package demo.buildingmanagement;

/**
 * This class was automatically generated by the data modeler tool.
 */

@org.kie.api.definition.type.Label("Role")
public class Role implements java.io.Serializable
{

   static final long serialVersionUID = 1L;

   @org.kie.api.definition.type.Description("The name of the Role")
   @org.kie.api.definition.type.Label("Name")
   private java.lang.String name;

   public Role()
   {
   }

   public java.lang.String getName()
   {
      return this.name;
   }

   public void setName(java.lang.String name)
   {
      this.name = name;
   }

   public Role(java.lang.String name)
   {
      this.name = name;
   }

}