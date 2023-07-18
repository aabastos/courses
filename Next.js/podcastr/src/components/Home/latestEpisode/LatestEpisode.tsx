import Image from 'next/image';
import Link from 'next/link';

import styles from './styles.module.scss';

interface Props {
    id: string;
    title: string;
    members: string;
    publishedAt: string;
    duration: string;
    image: string;
}

export function LatestEpisode(props: Props) {
    return (
        <li className={styles.lastEpisodeContainer}>
            <Image
                width={192}
                height={192}
                objectFit='cover'
                src={props.image}
                alt={props.title}
            />

            <div className={styles.episodeDetail}>
                <Link href={`/file/${props.id}`}>
                    <a>{props.title}</a>
                </Link>
                <p>{props.members}</p>
                <span>{props.publishedAt} - {props.duration}</span>
            </div>

            <button className={styles.playButton}>
                <img src='/play-green.svg' alt='Tocar podcast' />
            </button>
        </li>
    )
}