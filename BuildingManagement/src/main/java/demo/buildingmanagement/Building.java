package demo.buildingmanagement;

/**
 * This class was automatically generated by the data modeler tool.
 */

@org.kie.api.definition.type.Label("Building")
@org.kie.api.definition.type.Description("Represents a Building")
public class Building implements java.io.Serializable
{

   static final long serialVersionUID = 1L;

   @org.kie.api.definition.type.Description("Building Identificiation")
   @org.kie.api.definition.type.Label("Identification")
   private java.lang.String id;
   @org.kie.api.definition.type.Description("Building Name")
   @org.kie.api.definition.type.Label("Name")
   private java.lang.String name;
   @org.kie.api.definition.type.Description("Latitude of the Building")
   @org.kie.api.definition.type.Label("Latitude")
   private java.lang.Double lat;
   @org.kie.api.definition.type.Description("Longitude of the building")
   @org.kie.api.definition.type.Label("Longitude")
   private java.lang.Double lon;

   public Building()
   {
   }

   public java.lang.String getId()
   {
      return this.id;
   }

   public void setId(java.lang.String id)
   {
      this.id = id;
   }

   public java.lang.String getName()
   {
      return this.name;
   }

   public void setName(java.lang.String name)
   {
      this.name = name;
   }

   public java.lang.Double getLat()
   {
      return this.lat;
   }

   public void setLat(java.lang.Double lat)
   {
      this.lat = lat;
   }

   public java.lang.Double getLon()
   {
      return this.lon;
   }

   public void setLon(java.lang.Double lon)
   {
      this.lon = lon;
   }

   public Building(java.lang.String id, java.lang.String name,
         java.lang.Double lat, java.lang.Double lon)
   {
      this.id = id;
      this.name = name;
      this.lat = lat;
      this.lon = lon;
   }

   public void call911() {
   }
   
   public void soundAlarm() {
   }
}