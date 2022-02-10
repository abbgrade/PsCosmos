
using System.Management.Automation;
using Microsoft.Azure.Cosmos;

namespace PsCosmos
{
    [Cmdlet(VerbsCommunications.Disconnect, "Instance")]
    public class DisconnectInstanceCommand : PSCmdlet
    {

        [Parameter(
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        public CosmosClient Client { get; set; } = ConnectInstanceCommand.SessionClient;

        protected override void ProcessRecord()
        {
            Client.Dispose();
        }

    }
}