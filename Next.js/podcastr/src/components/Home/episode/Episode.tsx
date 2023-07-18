import Image from 'next/image';

import styles from './styles.module.scss';

interface Props {
    id: string;
    thumbnail: string;
    title: string;
    members: string;
    publisedAt: string;
    duration: string;
}

export default function Episode({ thumbnail, title, members, publisedAt, duration }: Props) {
    return (
        <tr className={styles.row}>
            <td>
                <Image
                    width={72}
                    height={72}
                    objectFit='cover'
                    src={thumbnail}
                    alt={title}
                />
            </td>

            <td>
                <a href=''>{title}</a>
            </td>

            <td>
                <p>{members}</p>
            </td>

            <td style={{
                width: 110
            }}>
                <p>{publisedAt}</p>
            </td>

            <td>
                <p>{duration}</p>
            </td>

            <td>
                <button type='button'>
                    <img src='/play-green.svg' alt='Tocar podcast' />
                </button>
            </td>
        </tr>
    );
}