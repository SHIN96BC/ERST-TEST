import logo from './logo.svg';
import './App.css';
import {useState} from "react";
import React from 'react';

function App() {
    let post = "강남 우동 맛집";
    let id = "tag-h4";

    let [subject, setSubject] = useState(['남자 코드 추천', '강남 우동맛집', '파이썬독학']);

    let [likeList, setLikeList] = useState([0, 0, 0]);

    let [modal, setModal] = useState(false);

    let [index, setIndex] = useState(0);

    let [input, setInput] = useState('');

  return (
    <div className="App">
        <div className="black-nav">
            <h4>ReactBlog</h4>
        </div>

        <button onClick={() => {
            let copy = [...subject];
            copy.sort();
            setSubject(copy);
        }}>가나다순 정렬</button>

        <button onClick={() => {
            let copy = [...subject];
            copy[0] = '여자코드 추천';
            setSubject(copy);
        }}> 글 변경 </button>

        {
            subject.map(function (s, i) {
                return (
                    <div className="list" key={i}>
                        <h4 onClick={() => {
                            if (index === i) {
                                setModal(!modal);
                            }
                            setIndex(i);
                        }}>{s} <span onClick={(e) => {
                            e.stopPropagation();
                            let likeListCopy = [...likeList];
                            likeListCopy[i] += 1;
                            setLikeList(likeListCopy);
                        }}>👍</span> {likeList[i]} &nbsp;&nbsp; <button onClick={(e) => {
                            e.stopPropagation();
                            // &nbsp; 는 띄어쓰기를 의미합니다.
                            // 먼저 해당하는 인덱스의 글을 삭제합니다.
                            let subjectCopy = [...subject];
                            subjectCopy.splice(i, 1);
                            setSubject(subjectCopy);

                            // 좋아요 State 추가
                            let likeListCopy = [...likeList];
                            likeListCopy.splice(i, 1);
                            setLikeList(likeListCopy);

                            // 배열의 삭제 함수
                            // splice(삭제를 시작할 인덱스, 몇개 지울건지, 새로 추가할 값) == 특정 인덱스의 값을 지웁니다.
                            // shift() == 배열의 첫번째 값 삭제
                            // pop() == 배열의 맨뒤에 값 삭제
                            // filter() == 파라미터로 콜백함수를 입력해서 반복문 없이 특정 값을 삭제할 수 있습니다.
                        }}>삭제</button></h4>
                        <p>2월 17일 발행</p>
                    </div>
                );
            })
        }

        <input onChange={(e) => {
            setInput(e.target.value);
        }}/>
        <button onClick={() => {
            // 배열의 맨 뒤에 추가하는 push 대신에 맨 앞에 추가하는 unshift 를 사용합니다.
            // 제목 State 추가
            let subjectCopy = [...subject];
            subjectCopy.unshift(input);
            setSubject(subjectCopy);

            // 좋아요 State 추가
            let likeListCopy = [...likeList];
            likeListCopy.unshift(0);
            setLikeList(likeListCopy);
        }}>작성</button>

        {
            modal ? <Modal color='skyBlue' subject={subject} setSubject={setSubject} index={index}/> : null
        }

    </div>
  );
}

function Modal(props) {
    return (
        <div className="modal" style={{background: props.color}}>
            <h4>{props.subject[props.index]}</h4>
            <p>날짜</p>
            <p>상세내용</p>
            <button onClick={() => {
                let copy = [...props.subject];
                copy[[props.index]] = '여자코드 추천';
                props.setSubject(copy);
            }}>글수정</button>
        </div>
    );
}

class Modal2 extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            // State 만드는 법은 이런식으로 constructor(생성자)에 Object 형식으로 넣어주면 됩니다.)
            name: 'kim',
            age: 20
        }
    }
    render() {
        return(
            <div>{this.state.name} {this.props}
                <button onClick={() => {
                    // setState 를 사용해서 State 값을 변경하는 법
                    this.setState({age: 21});
                }}>버튼</button>
            </div>
        );
    }
}

export default App;
