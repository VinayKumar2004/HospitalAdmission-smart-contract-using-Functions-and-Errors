// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HospitalAdmission {
    enum PatientStatus { Admitted, Discharged }

    struct Patient {
        string name;
        PatientStatus status;
    }
    Patient[] public patients;
    uint256 public constant MAX_CAPACITY = 2;

    function admitPatient(string memory _name) public {
        require(bytes(_name).length > 0, "Patient name must be provided.");

        assert(patients.length < MAX_CAPACITY);
        Patient memory newPatient;
        newPatient.name = _name;
        newPatient.status = PatientStatus.Admitted;
        patients.push(newPatient);
    }
    function dischargePatient(uint256 _patientIndex) public {
        require(_patientIndex < patients.length, "Invalid patient index.");
        Patient storage patient = patients[_patientIndex];
        require(patient.status == PatientStatus.Admitted, "Patient is not currently admitted.");
        patient.status = PatientStatus.Discharged;
    }
    function getPatientStatus(uint256 _patientIndex) public view returns (string memory) {
    PatientStatus status;
    if (_patientIndex < patients.length) {
        status = patients[_patientIndex].status;
    } else {
        revert("Invalid patient index.");
    }
    if (status == PatientStatus.Admitted) {
        return "Admitted";
    } else if (status == PatientStatus.Discharged) {
        return "Discharged";
    }
    revert("Unknown patient status.");
}
}



