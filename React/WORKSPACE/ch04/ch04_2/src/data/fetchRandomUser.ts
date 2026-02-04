import axios from "axios";

export type IRandomUser = {
  email: string;
  name: { title: string; first: string; last: string };
  picture: { large: string };
};
const convertRandomUser = (result: unknown) => {
  const { email, name, picture } = result as IRandomUser;
  return { email, name, picture };
};
export const fetchRandomUser = (): Promise<IRandomUser> =>
  new Promise((resolve, reject) => {
    fetch("https://randomuser.me/api/")
      .then((res) => res.json())
      .then((data: unknown) => {
        console.log(data);
        const { results } = data as { results: IRandomUser[] };
        resolve(convertRandomUser(results[0]));
      })
      .catch(reject);
  });

export const axiosRandomUser = async (): Promise<IRandomUser> => {
  try {
    // api 서버 통신 후 결과를 response에 저장
    const response = await axios.get("https://randomuser.me/api/");
    const { results } = response.data as { results: IRandomUser[] };
    console.log(results);
    return convertRandomUser(results[0]);
  } catch (error) {
    console.log(error);
    throw error;
  }
};
