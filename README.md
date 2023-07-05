# HospitalAdmission-smart-contract-using-Functions-and-Errors handing 
The HospitalAdmission smart contract facilitates the admission and discharge of patients in a hospital. It maintains a list of patients and their admission status.
require(), assert(), and revert() statements used in the HospitalAdmission smart contract
#Description
## Patient Status
Patients in the system can have two possible statuses:
- Admitted: The patient is currently admitted to the hospital.
- Discharged: The patient has been discharged from the hospital.
# Description
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
# Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HospitalAdmission.sol). Copy and paste the following code into the file:

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HospitalAdmission.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HospitalAdmission" contract from the dropdown menu, and then click on the "Deploy" button.

Interact with the deployed contract: Once the contract is deployed, you can interact with it by calling its functions. In the case of the HospitalAdmission contract, you can call the admitPatient, dischargePatient, or getPatientStatus functions to admit a patient, discharge a patient, or retrieve a patient's status.
## Additional Information
- The maximum capacity of the hospital is set to 2 patients. If the capacity is reached, further admissions will fail.
- The patient list can be accessed publicly via the patients array.
- The contract uses the SPDX-License-Identifier "MIT".

# Authors
Vinay Kumar (https://github.com/VinayKumar2004)
# License
This project is licensed under the MIT License - see the LICENSE.md file for details
