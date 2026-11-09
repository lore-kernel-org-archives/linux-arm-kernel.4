Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC02606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fKfYyNjh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BE059w0B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ydw1s0x1RNP+qqUMo8W/mYY50hHq5MXJ/cd70aJJung=; b=fKfYyNjhhrpFJE
	KwooSWREoIYWW94GXd3xmGRkadHAmqfS1CGOrdpcB2lkWLjpA0mM2WRy96+gSl7GPw18YP6WsTYA+
	lm1zzMIVQzAftHBmtmj1vsxi7sthk9qHc1svpgiLAqjfnnDkwwZ3x0097cB6zDRIMZw8M0qw37NQg
	XR8pjn3FSfyxX5dNNtu/2ONC4S7IfzSJqYPyrCbcb3G8JLY8WRlkxudBw+MfVLVxj+ouK4k60rm1G
	ZYzSMWDp/lpcUnnVt/6kAL65FNHIyHqtzdySeqpgHDFXky46qJ2LGOIH7XTLKTIiQFALHKqxxm+SP
	1c1fEIiCyILPT/U48N0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRRO-000000012nA-0WvO;
	Mon, 09 Nov 2026 15:37:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRRL-000000012lT-0Nqt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:37:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so164255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238665; x=1794843465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydw1s0x1RNP+qqUMo8W/mYY50hHq5MXJ/cd70aJJung=;
        b=BE059w0BcLzOj2g4QUSbsbu1ekoOzUhHahNjKag1kRXbLP6bYAtcVNBzHzB6P/smDD
         zhMkknKocauxuBaHWR+yVKGE1IRP1F4DpStMH7B63EUkXowhkulkFRsz2jIDjGl6Lw0I
         cI28pb/tm1lOlIm4gM3/Ezn2CEXEZK9wf7gd1U9/MgRBwIzW7IRJHso01JBEdEgpEU3d
         Ky4oZRCSaGT1NZSp3hIGjmYIo/p3KByXYdZp0eE4FkqCa8G/VFiWf2QvDUJLepFJFfT3
         ykSaK981Gc5XCRSF7IRy8Dei6Pxiyj/Wf8cO8BPYXyQhs5fljTWIcmSZNWZT4teUbHEZ
         7ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238665; x=1794843465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ydw1s0x1RNP+qqUMo8W/mYY50hHq5MXJ/cd70aJJung=;
        b=Cfx2TpJHi/6pSqGiSw+Arb8tPPNU4aYlNymIAyWxPc+qZeuF79L7iqlvmzGxktGjmZ
         Or+PzHe1+cJJvJhiH5Z/nypgcr5YpqbWWkYu0nrjnO8hLvSjCsGl+suR5ZUIorKyr+++
         Ep2TGV4raRD8XVXoV0B34uCk46Ztu3BTi7FT/4cViF2Ex74gNWJIJLPVafyFf7EAzUAg
         p5F0lk7lMZoz3nvFo9EJBDNrQgr4nQTH/+Q1rVVhvvIKKX7nxnZXziyYVxWEQ1kZC3Rl
         dwpG4uGqeiOF72Vnx5n8X3ix7ddIKDGiPtTmiaE9F+NA9oCFzCNVQvSo19bdgbbr5RRx
         Owdg==
X-Forwarded-Encrypted: i=1; AL+hErFEn8K2+S1sGakhg5H7h127RHruwrBALe1Qtmwe4NoPc/JDk1jG9QpFywYQ0BKhebN5sH56Rdd8p9sJ4ygDBxHi@lists.infradead.org
X-Gm-Message-State: APuU4Z9xWHu1+zO+ZsVHdbDUMbbd2094BGeDs6Qpv0Ft4+BNvMy7CA5U
	P0JHuF31g/Q0xNaDzjrtoEj8lmrbRSVEcBcljz77p95zWuPtTDctgwsI
X-Gm-Gg: AYBFou2cYWbxO27lJQNe4r7hiXxBH4RLxUa+t4gbXOOQ05XMdpjHX8334QJTmQ0FO8F
	9GgcwRU1hqOGcZGMB++0TioX0BmRyEL0yLDLhiNiZy9xuFVp/RtKAEUeXAuU4NwTbRg3aJzsfr+
	Jucmwc6yF7XrbOL5pDZbiDtvG/ckAs3d/KgKsbDkHHlQkgBdVBaAOHTalg0De+gCL+CPyN4U6SZ
	yoNJ6i0azW+nf1AqXBj9TRvE3+P4S4HQNs8Mo/2V4xOad1ZgWtEKNihlirZVU4hR31x5Obq+FmO
	IridHREXM/vA4tTuGMrqLLWHYY2XtNUhyKcoXI8mmkklMFKB1cw0Y1SC/hORVdLJx+ikXrTx8uT
	LnU1H7goxhwLHFE+pmJIKa+jLzhtWNhaD7EMPDoOIh+4YY5MN4b/icK1XkQaxFvKdGE7k/08yn0
	VrYQuU4/nnC+w5nujsjqnKirFRceZhJyFo/rZZqzDlw0wv+YY39bPuFZD7StgkS2UepGsLtOx1F
	/+2rYvsKqXy9HQk6mj3cUy0KOT3x5ggqCx78sU0o9ikXG35aqfk6hlSQ6AvCHdSvhwjJtfWlkyV
	nZYxP1+7SiCAfsrvlSeZhy20fsncCPgP4RzMXAeGwlx/mZ12oljvfE1UbTmbE9Qm3ujI3C89c7G
	Ojw==
X-Received: by 2002:a05:600c:37c3:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4b963c89ef2mr78509805e9.17.1794238664475;
        Mon, 09 Nov 2026 07:37:44 -0800 (PST)
Received: from ?IPV6:2a02:e98:40:8091:f0f7:91a3:e60:541a? ([2a02:e98:40:8091:f0f7:91a3:e60:541a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bbd2sm149230065e9.1.2026.11.09.07.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:37:44 -0800 (PST)
Message-ID: <800f8d42-e35d-47ec-bbe6-e437a86d6e70@gmail.com>
Date: Mon, 9 Nov 2026 16:37:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] serial: 8250: Add RX trigger levels for U6_16550A
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Miroslav Ondra <ondra@faster.cz>
References: <20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com>
 <20261109-8250-select-u6-64bit-v1-1-04bc8332fa34@gmail.com>
 <469362ef-f0c5-45f2-746a-b4a3c51876a4@linux.intel.com>
Content-Language: cs
From: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
In-Reply-To: <469362ef-f0c5-45f2-746a-b4a3c51876a4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_073747_140316_3BB94333 
X-CRM114-Status: GOOD (  20.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> On Mon, 9 Nov 2026, Kryštof Černý via B4 Relay wrote:
> 
>> From: Kryštof Černý <cleverline1mc@gmail.com>
>>
>> PORT_U6_16550A has a 64-byte FIFO but no rxtrig_bytes table, so the
>> rx_trig_bytes sysfs attribute is not registered for ports of this type
>> and the RX trigger level cannot be read or changed from userspace.
>>
>> Add a table with 1, 16, 32 and 62 bytes, i.e. 1 character, FIFO 1/4
>> full, FIFO 1/2 full and FIFO 2 less than full. These are the levels the
>> Synopsys DesignWare UART uses for a 64-byte FIFO, and they match the
>> existing PORT_ALTR_16550_F64 table.
>>
>> The default FCR value of the type is unchanged, so the trigger level a
>> port starts with stays at 1/2 full. The only visible change for ports
>> already detected as U6_16550A by autoconfig is the new sysfs attribute.
>>
>> This prepares for 8250_dw selecting PORT_U6_16550A for DesignWare UARTs
>> with a 64-byte FIFO.
>>
>> Co-developed-by: Miroslav Ondra <ondra@faster.cz>
>> Signed-off-by: Miroslav Ondra <ondra@faster.cz>
>> Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
>> ---
>>   drivers/tty/serial/8250/8250_port.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
>> index 36b2b0a2c05c..a7acede62f40 100644
>> --- a/drivers/tty/serial/8250/8250_port.c
>> +++ b/drivers/tty/serial/8250/8250_port.c
>> @@ -163,6 +163,7 @@ static const struct serial8250_config uart_config[] = {
>>   		.fifo_size	= 64,
>>   		.tx_loadsz	= 64,
>>   		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10,
>> +		.rxtrig_bytes	= {1, 16, 32, 62},
> 
> Reusing U6 entry for DW UARTs seems misleading.
> 
> We've better mechanism coming up for defining rxtrig in a one pending
> series so this constant friction with the uart config types can be put
> into rest.
> 
> Please build on top of that other series and help in testing and reviewing
> it.

Thanks for the information, I started the work about a month ago
and not sure if the patch existed before. I will test the other series 
on my hardware. I like that approach more.


