## HospitalAdmission-smart-contract-using-Functions-and-Errors handing 
The HospitalAdmission smart contract facilitates the admission and discharge of patients in a hospital. It maintains a list of patients and their admission status.
require(), assert(), and revert() statements used in the HospitalAdmission smart contract
#Description
## Patient Status
Patients in the system can have two possible statuses:
- Admitted: The patient is currently admitted to the hospital.
- Discharged: The patient has been discharged from the hospital.
## Contract Functions
### admitPatient
function admitPatient(string memory _name) public

This function allows the addition of a new patient to the system. It requires a non-empty patient name. The patient is marked as "Admitted" upon admission.

require(bytes(_name).length > 0, "Patient name must be provided."):

This **require()** statement ensures that the provided patient name is not empty. If the condition evaluates to false, the transaction reverts with the given error message.
assert(patients.length < MAX_CAPACITY): 

This **assert()** statement checks if the number of patients in the system is less than the maximum capacity defined by MAX_CAPACITY. If the condition evaluates to false, indicating that the capacity has been reached, the assertion fails, and the transaction reverts.
### dischargePatient
function dischargePatient(uint256 _patientIndex) public

This function allows the discharge of a patient from the hospital. It requires the index of the patient to be discharged. The patient's status is updated to "Discharged" upon successful discharge.
require(_patientIndex < patients.length, "Invalid patient index."): 

This **require()** statement checks if the provided patient index is within the valid range. If the condition evaluates to false, indicating an invalid index, the transaction reverts with the given error message.
require(patient.status == PatientStatus.Admitted, "Patient is not currently admitted."): 

This **require()** statement checks if the patient at the given index is currently admitted. If the condition evaluates to false, indicating that the patient is not admitted, the transaction reverts with the given error message.
### getPatientStatus
function getPatientStatus(uint256 _patientIndex) public view returns (string memory)

This function retrieves the status of a patient based on their index. It returns a string indicating whether the patient is "Admitted" or "Discharged".
require(_patientIndex < patients.length, "Invalid patient index."): 

This **require()** statement checks if the provided patient index is within the valid range. If the condition evaluates to false, indicating an invalid index, the function reverts with the given error message.
revert("Unknown patient status."):

This **revert()** statement is reached if the patient's status is neither "Admitted" nor "Discharged". It reverts the function execution with the given error message.
