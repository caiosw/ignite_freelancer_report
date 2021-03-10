defmodule FreelancerReportTest do
  use ExUnit.Case

  describe "build/1" do
    test "if file exists, return report" do
      filename = "gen_report_test.csv"

      response = FreelancerReport.build(filename)

      expected_response =
        {:ok,
         %{
           all_hours: %{
             "Cleiton" => 4,
             "Daniele" => 21,
             "Danilo" => 6,
             "Diego" => 7,
             "Giuliano" => 10,
             "Jakeliny" => 14,
             "Joseph" => 3,
             "Mayk" => 19
           },
           hours_per_month: %{
             "Cleiton" => %{"junho" => 4},
             "Daniele" => %{"abril" => 7, "dezembro" => 5, "junho" => 1, "maio" => 8},
             "Danilo" => %{"fevereiro" => 6},
             "Diego" => %{"agosto" => 4, "setembro" => 3},
             "Giuliano" => %{"abril" => 1, "fevereiro" => 9},
             "Jakeliny" => %{"julho" => 8, "março" => 6},
             "Joseph" => %{"março" => 3},
             "Mayk" => %{"dezembro" => 5, "julho" => 7, "setembro" => 7}
           },
           hours_per_year: %{
             "Cleiton" => %{"2016" => 3, "2020" => 1},
             "Daniele" => %{"2016" => 10, "2017" => 3, "2018" => 7, "2020" => 1},
             "Danilo" => %{"2019" => 6},
             "Diego" => %{"2016" => 3, "2017" => 4},
             "Giuliano" => %{"2017" => 3, "2019" => 6, "2020" => 1},
             "Jakeliny" => %{"2017" => 8, "2019" => 6},
             "Joseph" => %{"2017" => 3},
             "Mayk" => %{"2016" => 7, "2017" => 8, "2019" => 4}
           }
         }}

      assert response == expected_response
    end

    test "if file don't exists, return an error" do
      filename = "potato.csv"

      response = FreelancerReport.build(filename)

      expected_response = {:error, "File not found!"}

      assert response == expected_response
    end
  end
end
