@GCSDelete
Feature: GCS Delete - Verification of GCS Delete plugin

  @GCS_CSV_TEST
  Scenario: Verify the GCS Delete successfully deletes all objects in the GCS bucket
    Given Open Datafusion Project to configure pipeline
    When Expand Plugin group in the LHS plugins list: "Conditions and Actions"
    When Select plugin: "GCS Delete" from the plugins list as: "Conditions and Actions"
    When Navigate to the properties page of plugin: "GCS Delete"
    Then Enter the GCS Delete property projectId "projectId"
    Then Enter the GCS Delete property objects to delete as bucketName
    Then Validate "GCS Delete" plugin properties
    Then Close the GCS Delete properties
    Then Save and Deploy Pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Verify all the objects in the GCS bucket deleted successfully by GCS Delete action plugin

  @GCS_CSV_TEST
  Scenario: Verify the GCS Delete successfully deletes objects in the GCS bucket path
    Given Open Datafusion Project to configure pipeline
    When Expand Plugin group in the LHS plugins list: "Conditions and Actions"
    When Select plugin: "GCS Delete" from the plugins list as: "Conditions and Actions"
    When Navigate to the properties page of plugin: "GCS Delete"
    Then Enter the GCS Delete property projectId "projectId"
    Then Enter the GCS Delete property objects to delete as path "gcsCsvFile"
    Then Validate "GCS Delete" plugin properties
    Then Close the GCS Delete properties
    Then Save and Deploy Pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Verify objects in the GCS path "gcsCsvFile" deleted successfully by GCS Delete action plugin

  @GCS_READ_RECURSIVE_TEST
  Scenario: Verify the GCS Delete successfully deletes multiple objects
    Given Open Datafusion Project to configure pipeline
    When Expand Plugin group in the LHS plugins list: "Conditions and Actions"
    When Select plugin: "GCS Delete" from the plugins list as: "Conditions and Actions"
    When Navigate to the properties page of plugin: "GCS Delete"
    Then Enter the GCS Delete property projectId "projectId"
    Then Enter the GCS Delete property objects to delete as list of objects "gcsDeleteObjectsList"
    Then Validate "GCS Delete" plugin properties
    Then Close the GCS Delete properties
    Then Save and Deploy Pipeline
    Then Run the Pipeline in Runtime
    Then Wait till pipeline is in running state
    Then Open and capture logs
    Then Verify the pipeline status is "Succeeded"
    Then Verify multiple objects "gcsDeleteObjectsList" deleted successfully by GCS Delete action plugin

  Scenario:Verify GCS Delete properties validation error for mandatory field Objects to Delete
    Given Open Datafusion Project to configure pipeline
    When Expand Plugin group in the LHS plugins list: "Conditions and Actions"
    When Select plugin: "GCS Delete" from the plugins list as: "Conditions and Actions"
    When Navigate to the properties page of plugin: "GCS Delete"
    Then Validate mandatory property error for "paths"

  Scenario:Verify GCS Delete properties validation error for incorrect bucket path
    Given Open Datafusion Project to configure pipeline
    When Expand Plugin group in the LHS plugins list: "Conditions and Actions"
    When Select plugin: "GCS Delete" from the plugins list as: "Conditions and Actions"
    When Navigate to the properties page of plugin: "GCS Delete"
    Then Enter the GCS Delete property objects to delete as path "gcsInvalidBucketName"
    Then Verify invalid bucket name error message is displayed for GCS Delete objects to delete path "gcsInvalidBucketName"
