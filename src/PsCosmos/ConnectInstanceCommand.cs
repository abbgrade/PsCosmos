
using System.Management.Automation;
using Microsoft.Azure.Cosmos;

namespace PsCosmos
{
    [Cmdlet(VerbsCommunications.Connect, "Instance")]
    [OutputType(typeof(CosmosClient))]
    public class ConnectInstanceCommand : PSCmdlet
    {
        internal static CosmosClient SessionClient { get; set; }

        [Parameter(
            Position = 0,
            Mandatory = true,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        public string Endpoint { get; set; }

        [Parameter(
            Position = 1,
            Mandatory = true,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        public string ReadKey { get; set; }

        protected override void ProcessRecord()
        {
            var options = new CosmosClientOptions();
            options.ConnectionMode = ConnectionMode.Gateway;

            SessionClient = new CosmosClient(Endpoint, ReadKey, clientOptions: options);
            WriteObject(SessionClient);
        }

    }
}