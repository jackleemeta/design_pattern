//
//  VisitorPattern.swift
//  DesignPattern
//
//  Created by part on 2020/9/1.
//  Copyright © 2020 jacklee. All rights reserved.
//

/// 访问者
class Visitor {
    func getName() {}
    func getScore() {}
    func visit(course: Course) {}
}

/// 访问者子类
class SubVistor: Visitor {
    override func getName() {}
    override func getScore() {}
    
    override func visit(course: Course) {
        debugPrint("课程名称 = \(course.name)")
    }
}

/// 课程类
class Course {
    var name = ""
    func accept(visitor: Visitor) { }
}

class MathCourse: Course {
    // MathCourse 接受访问
    override func accept(visitor: Visitor) {
        visitor.visit(course: self)
    }
}

class EnglishCourse: Course {
    // EnglishCourse 接受访问
    override func accept(visitor: Visitor) {
        visitor.visit(course: self)
    }
}

/// 对象结构
class ObjectStructure {
    
    var courseAry = [Course]()
    
    let aMathCourse = MathCourse()
    let aEnglishCourse = EnglishCourse()
    
    /// 对象结构添加一个课程
    func add(course: Course) {
        courseAry.append(course)
    }
    
    /// 本对象结构接受一个访问者
    func accept(vistor: Visitor) {
        courseAry.forEach { course in
            course.accept(visitor: vistor) // 课程接受访问者的访问
        }
    }
}


// 客户端代码（调用方代码）
class Test {
    
    func testFunc() {
        let aEnglishCourse = EnglishCourse() // 创建英语课
        aEnglishCourse.name = "英语课"
        
        let objStructure = ObjectStructure() // 创建对象结构
        
        let subVistor = SubVistor() // 创建一个访问者

        objStructure.add(course: aEnglishCourse) // 对象结构添加英语课

        objStructure.accept(vistor: subVistor) // 整个对象结构接受访问者的访问
    }
    
}



