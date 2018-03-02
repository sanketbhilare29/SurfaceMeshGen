
%This function returns faces and vertices boundaries of the geometry
function [points,faces,b] = GetInfo(filename)

    Max = MaxPolygon(filename); %Get # vertices for a polygon with max vertices
    C = Polyhedron(filename,Max); %Read and store geometry information
    
    %v and f indices are stored in Index_Matrix
    Index_Matrix = C{1,1};
    
    %Numeric values from the file are stored in Data_Matrix
    Data_Matrix = C{1,2};

    [n_faces, n_vertices] = Count(Index_Matrix);
    
    points = Data_Matrix(1:n_vertices,1:3); %Get the vertices
    faces = Data_Matrix(n_vertices+1:size(Index_Matrix,1),:);
    
   
    b = boundary(points(:,1),points(:,2),0.3); %boundary vector

end
