package com.iandmbank.subscriberservice.receiver

import org.slf4j.LoggerFactory
import org.springframework.amqp.core.Message
import org.springframework.stereotype.Service

@Service
class CustomMessageListener {

    companion object {
        private val log = LoggerFactory.getLogger(CustomMessageListener::class.java)
    }

    //@RabbitListener(queues = ["appGenericQueue"],exclusive = true)
    fun receiveMessage(message: Message) {
        log.info("Received message as generic: {}", message)
    }


    //@RabbitListener(queues = ["appSpecificQueue"])
    fun receiveMessage(customMessage: String) {
        log.info("Received message as specific class: {}", customMessage)
        //Thread.sleep(1000)
    }


}
