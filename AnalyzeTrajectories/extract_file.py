# Script written by Ooi Chin Chun
# Institute of High Performance Computing, Singapore
# Copyright (c) 2018. 

# X,Y,Z coordinates are assumed to be located in columns 3,4,5 of the file
def extract_file(input_file,output_file):

    data_File=open(input_file,mode='rU')

    subjects_List = []
    X_start_List = []
    Y_start_List = []
    Z_start_List = []
    X_final_List = []
    Y_final_List = []
    Z_final_List = []

    counter = 0
    cur_part_id = -1
    next_loc_X = '0'
    next_loc_Y = '0'
    next_loc_Z = '0'
    cur_loc_X = '0'
    cur_loc_Y = '0'
    cur_loc_Z = '0'
    for L1 in data_File: ## Go through every line in the file

        if (counter > 17):
            
            L1stripped=L1.strip()## Start by stripping white space from the line 
            values = L1stripped.split('\t')
            
            if (float(values[1]) == cur_part_id):
                cur_loc_X = values[2]
                cur_loc_Y = values[3]
                cur_loc_Z = values[4]

            if (float(values[1]) != cur_part_id):
                subjects_List.append(cur_part_id)
                X_start_List.append(next_loc_X)
                Y_start_List.append(next_loc_Y)
                Z_start_List.append(next_loc_Z)            
                X_final_List.append(cur_loc_X)
                Y_final_List.append(cur_loc_Y)
                Z_final_List.append(cur_loc_Z)
                next_loc_X = values[2]
                next_loc_Y = values[3]
                next_loc_Z = values[4]
                cur_part_id = float(values[1])
                                
        counter = counter + 1

    subjects_List.append(cur_part_id)
    X_start_List.append(next_loc_X)
    Y_start_List.append(next_loc_Y)
    Z_start_List.append(next_loc_Z)            
    X_final_List.append(cur_loc_X)
    Y_final_List.append(cur_loc_Y)
    Z_final_List.append(cur_loc_Z)
                
    data_File.close()  ## Close the file

    out_File=open(output_file,mode='w') ## Output file (opened in write mode)
    for write_str in range(len(subjects_List)):
        if (write_str==0):
            out_File.write('ID,Start_X,Start_Y,Start_Z,End_X,End_Y,End_Z\n')
        if (write_str>0):
            out_File.write(str(subjects_List[write_str])+','+X_start_List[write_str]+','+Y_start_List[write_str]+','+Z_start_List[write_str]+','+X_final_List[write_str]+','+Y_final_List[write_str]+','+Z_final_List[write_str]+'\n') ## separate with commas
     
    out_File.close()
