pragma solidity ^0.8.17;
 

contract SimpleStorage {
   uint storedData;
   function set(uint x) public {
      storedData = x;
   }
   function get() public view returns (uint) {
      return storedData;
   }
}
// contract Bloc{ 
//    struct Task{
//     string task;
//        bool isDone;
//    }
   
//    mapping (address => Task[]) private Users;
 
//   function addTask(string calldata _task) external{
//       Users[msg.sender].push(Task({
//           task:_task,
//           isDone:false
//       }));
//    }
   
//    function getTask(uint _taskIndex) external view returns (Task memory){
//        Task storage task = Users[msg.sender][_taskIndex];
//        return task;
//    } 
// }