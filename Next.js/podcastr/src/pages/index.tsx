import { GetStaticProps } from 'next';
import api from '../service/api';
import { format, parseISO } from 'date-fns';
import convertDurationToTimestring from '../utils/convertDurationToTimestring';
import { LatestEpisode } from '../components/Home/latestEpisode/LatestEpisode';

import styles from './home.module.scss';
import Episode from '../components/Home/episode/Episode';

interface Episode {
  id: string;
  title: string;
  description: string;
  url: string;
  thumbnail: string;
  members: string;
  publishedAt: string;
  duration: number;
  durationAsString: string;
}
interface Props {
  latestEpisodes: Episode[];
  allEpisodes: Episode[];
}

export default function Home({ latestEpisodes, allEpisodes }: Props) {
  return (
    <div className={styles.home}>
      <section className={styles.latestEpisodes}>
        <h2>Últimos Lançamentos</h2>

        <ul>
          {
            latestEpisodes.map(episode => {
              return (
                <LatestEpisode
                  key={episode.id}
                  id={episode.id}
                  title={episode.title}
                  members={episode.members}
                  publishedAt={episode.publishedAt}
                  duration={episode.durationAsString}
                  image={episode.thumbnail}
                />
              )
            })
          }
        </ul>
      </section>

      <section className={styles.allEpisodes}>
        <h2>Todos episódios</h2>

        <table>
          {/* <tr> */}
          <thead>
            <th />
            <th>Podcasts</th>
            <th>Integrantes</th>
            <th>Data</th>
            <th>Duração</th>
            <th />
          </thead>
          {/* </tr> */}

          <tbody>
            {allEpisodes.map(episode => {
              return (
                <Episode
                  key={episode.id}
                  id={episode.id}
                  thumbnail={episode.thumbnail}
                  title={episode.title}
                  members={episode.members}
                  publisedAt={episode.publishedAt}
                  duration={episode.durationAsString}
                />
              )
            })}
          </tbody>
        </table>
      </section>
    </div>
  )
}

export const getStaticProps: GetStaticProps = async () => {
  const { data } = await api.get('episodes', {
    params: {
      _limit: 12,
      _sorter: 'published_at',
      _order: 'desc'
    }
  });

  const timeToRevalidate = 60 * 60 * 8; // 8 hours;

  const episodes = data.map(episode => {
    return {
      id: episode.id,
      title: episode.title,
      members: episode.members,
      thumbnail: episode.thumbnail,
      description: episode.description,
      url: episode.file.url,
      duration: Number(episode.file.duration),
      durationAsString: convertDurationToTimestring(episode.file.duration),
      publishedAt: format(parseISO(episode.published_at), 'dd MMM yy')
    }
  });

  const latestEpisodes = episodes.slice(0, 2);
  const allEpisodes = episodes.slice(2, episodes.length);

  return {
    props: {
      latestEpisodes,
      allEpisodes
    },
    revalidate: timeToRevalidate
  }
}