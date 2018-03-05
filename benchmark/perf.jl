using FileIO, CSVFiles, DataFrames

N = 1_000_000;  K = 100;
pool = "id".*dec.(1:K,3);
pool1 = "id".*dec.(1:N÷K,10);
nums = round.(rand(100).*100, 4);

df = DataFrame(
        id1 = rand(pool,N),
        id2 = rand(pool,N),
        id3 = rand(pool1,N),
        id4 = rand(1:K,N),
        id5 = rand(1:K,N),
        id6 = rand(1:(N/K),N),
        v1 = rand(1:5,N),
        v2 = rand(1:5,N),
        v3 = rand(nums,N));

df2 = DataFrame(
            id1 = [rand(Bool) ? missing : i for i in rand(pool,N)],
            id2 = [rand(Bool) ? missing : i for i in rand(pool,N)],
            id3 = [rand(Bool) ? missing : i for i in rand(pool1,N)],
            id4 = [rand(Bool) ? missing : i for i in rand(1:K,N)],
            id5 = [rand(Bool) ? missing : i for i in rand(1:K,N)],
            id6 = [rand(Bool) ? missing : i for i in rand(1:(N/K),N)],
            v1 = [rand(Bool) ? missing : i for i in rand(1:5,N)],
            v2 = [rand(Bool) ? missing : i for i in rand(1:5,N)],
            v3 = [rand(Bool) ? missing : i for i in rand(nums,N)]);

            FileIO.save("df_fileio.csv", df)
            FileIO.save("df_fileio2.csv", df2)

