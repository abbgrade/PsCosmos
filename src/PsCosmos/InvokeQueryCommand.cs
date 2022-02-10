
using System;
using System.Collections.Generic;

using System.Data;
using Microsoft.Azure.Cosmos;
using System.Management.Automation;
using Newtonsoft.Json.Linq;

namespace PsCosmos
{

    [Cmdlet(VerbsLifecycle.Invoke, "Query", DefaultParameterSetName = nameof(CommandType.Text))]
    [OutputType(typeof(PSObject))]
    public class InvokeCommandCommand : PSCmdlet
    {

        [Parameter(
            ParameterSetName = nameof(CommandType.Text),
            Position = 0,
            Mandatory = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        public string Text { get; set; }

        [Parameter(
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        public CosmosClient Client { get; set; } = ConnectInstanceCommand.SessionClient;

        [Parameter(
            Mandatory = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        public string Database { get; set; }

        [Parameter(
            Mandatory = true,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        public string Container { get; set; }

        [Parameter(
            Mandatory = false,
            ValueFromPipelineByPropertyName = true)]
        [ValidateNotNullOrEmpty()]
        public int? Timeout { get; set; }

        protected override void BeginProcessing()
        {
            base.BeginProcessing();

            if (Client == null)
            {
                throw new PSArgumentNullException(paramName: nameof(Client), message: "execute Connect-CSqlInstance before.");
            }
        }

        protected override void ProcessRecord()
        {
            var database = Client.GetDatabase(Database);
            WriteVerbose($"Database { database.Id } connected.");

            var container = database.GetContainer(Container);
            WriteVerbose($"Container { container.Id } connected.");

            var query = new QueryDefinition(query:Text);
            var options = new QueryRequestOptions();

            if (Timeout.HasValue) {
                Client.ClientOptions.RequestTimeout = new TimeSpan(hours: 0, minutes: 0, seconds: Timeout.Value);
            }
            WriteVerbose($"Query with timeout after { Client.ClientOptions.RequestTimeout.TotalSeconds } seconds.");

            using var iterator = container.GetItemQueryIterator<dynamic>(query, null, options);
            while (iterator.HasMoreResults)
            {
                try
                {
                    var result = iterator.ReadNextAsync().Result;
                    WriteVerbose($"Result is { result.StatusCode }.");
                    WriteVerbose($"Result page has { result.Count } rows.");
                    foreach (var item in result)
                    {
                        PSObject output = ToPsObject(item);
                        WriteObject(output);
                    }
                }
                catch (AggregateException ex)
                {
                    WriteError(new ErrorRecord(exception: ex, errorId: "-1", errorCategory: ErrorCategory.InvalidResult, targetObject: null));
                    break;
                }
            }
        }

        private PSObject ToPsObject(dynamic input)
        {
            switch (input.GetType().Name)
            {
                case "JObject":
                    return JObjectToPsObject((JObject)input);

                case "JValue":
                    return JValueToPsObject((JValue)input);

                case "JArray":
                    return JArrayToPsObject((JArray)input);

                default:
                    throw new PSNotSupportedException($"Conversion of {input.GetType().Name} to PsObject is not supported.");
            }
        }

        private PSObject JArrayToPsObject(JArray input)
        {
            var output = new List<object>();

            foreach (var item in input)
                output.Add(ToPsObject(item));

            return new PSObject(output);
        }

        private PSObject JValueToPsObject(JValue input)
        {
            switch (input.Type)
            {
                case JTokenType.Null:
                    return null;
                default:
                    return new PSObject(input.Value);
            }
            
        }

        private PSObject JObjectToPsObject(JObject item)
        {
            var output = new PSObject();

            foreach (JProperty column in item.Properties())
            {
                output.Members.Add(
                    new PSNoteProperty(
                        name: column.Name,
                        value: ToPsObject(column.Value)
                    )
                );
            }

            return output;
        }

    }
}