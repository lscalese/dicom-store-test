Class demo.dicom.Production Extends Ens.Production
{

Parameter SETTINGS = "ShutdownTimeout,UpdateTimeout,StorageLocation";

/// This is the storage location for the DICOM streams to be stored
Property StorageLocation As %String [ InitialExpression = "/home/irisowner/dev/dicom/iris-storage/" ];

XData ProductionDefinition
{
<Production Name="demo.dicom.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.DICOM.Service.File" Category="" ClassName="EnsLib.DICOM.Service.File" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">/home/irisowner/dev/dicom/archives/</Setting>
    <Setting Target="Adapter" Name="FilePath">/home/irisowner/dev/dicom/in/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.dcm</Setting>
    <Setting Target="Host" Name="TargetConfigName">demo.dicom.StorageProcess</Setting>
  </Item>
  <Item Name="EnsLib.DICOM.Operation.TCP" Category="" ClassName="EnsLib.DICOM.Operation.TCP" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">host.docker.internal</Setting>
    <Setting Target="Adapter" Name="IPPort">4200</Setting>
    <Setting Target="Adapter" Name="LocalAET">IRIS</Setting>
    <Setting Target="Adapter" Name="RemoteAET">PACS</Setting>
    <Setting Target="Host" Name="DuplexTargetConfigName">demo.dicom.StorageProcess</Setting>
  </Item>
  <Item Name="demo.dicom.StorageProcess" Category="" ClassName="demo.dicom.StorageProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="OperationDuplexName">EnsLib.DICOM.Operation.TCP</Setting>
    <Setting Target="Host" Name="StorageLocation">/home/irisowner/dev/dicom/iris-storage/</Setting>
  </Item>
</Production>
}

}
