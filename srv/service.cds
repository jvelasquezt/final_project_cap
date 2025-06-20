using {final_project as entities} from '../db/order';

service FinalProject {
   entity Header as projection on entities.Header;
   entity Items  as projection on entities.Items;
   entity Status as projection on entities.Status;
}
