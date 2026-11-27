Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607F5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MKNWRTHT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bs1q28KR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=; b=MKNWRTHTxYmRmZ
	7M/jWqpOxwig9GENhRZUEBjCQ9n3MqXbPyhsuIg5iSE88llNM8fjjw4otGdmWuDwqUAzN1imFPS/U
	m55ALplj7oBU82qGfGvbou+2JO+LXv06MuJ21Zaj7SIWNKh7TvrnooPpkiwMm3LTQHaoUF64UOizw
	iAEqTlghLx1B/pg4ntw+htK8+9FckRdb9oPMtvEDyTFgNDVy5IkTWgRmDSh6/jfGmMo2234dMZFfy
	Zz+GtlY9+Tg2YyQcqRC5YdSf1Wp3qHR7LK962qA/crzkKe9X6hX/34gATDvqJnRVsQmcYaMw6FM7p
	DrYjv8zy4n3l30m3wqOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtlO-0000000FjbO-0zmw;
	Fri, 27 Nov 2026 11:05:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtlL-0000000Fja0-0oFv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795777504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
	b=Bs1q28KRG+Q+EutZdVt1HQ5lRo5QWfQAf6QBol5yH1DOebcRFcZbeXeUZymFwSIUbK4S2Y
	ORgat4tyec+fTmHLO1BN6WkSDqp5wTBm8oJWMo61G5jtFxxGiUH3cRJ3IaxBhyJQnFxvGK
	s5XLa6qZHfhiy+e4253lK7WJGq5cWpk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-yTnMmGZAOxuztqXpldoSZQ-1; Fri, 27 Nov 2026 11:05:02 +0000
X-MC-Unique: yTnMmGZAOxuztqXpldoSZQ-1
X-Mimecast-MFC-AGG-ID: yTnMmGZAOxuztqXpldoSZQ_1795777501
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49337a224a8so4820926f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 03:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777501; x=1796382301;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcpX6YwnHTFKfGu87lTd7oqauZWlHU08Aks6/ht/Glk=;
        b=Qd75pnfmFWDh80hOzaPrVRWQxmvoCWe/1ciXR3KSLAGsE6bkWeQue1NjYC+m3CXhuc
         BbaGNXU2gG+8CpZ9m+ZZWKeP2iL86JExRdRfBL7Xn2e/LVjT+hz+XCtUIhu4WVn5uc8o
         GZRME+mqCxHAQsFmkKLg3YUdceYQ3m6NCN7Hh/8z60GaPOgO5LiIH41HDeKorPtBDn6x
         3yMHXgykco8Dnc1JYiZw5+4BRrpVA82vmhKN7SvvpICphva1pHvYefkKiGt11+H2M9Y5
         MNiNyHDPufzrit+3TlwuMJabCs9I6b6ZLkNJwE78epplRglez6FCvspe01b9MgdF3s6T
         WtZw==
X-Forwarded-Encrypted: i=1; AL+hErFUZAJ2sMtVomBz0a6ztNWtG8Lk2kg/PiTFYfL7199AaURki+W5fFfY/mfzzmuj6O9rcMORQRjYkur9DtcMruhF@lists.infradead.org
X-Gm-Message-State: APuU4Z8MroRPi/pj3deIVDJRLyZYl6ZvD6fQNI3WBSRDpmynKk3FutER
	+bCS8gkRyUcl744iPzc1bxUxSPFA0Yrc8jRzKIP2Ohh6t2HUnEqxgZuYhtEl/pVKFdz+sBaEzoY
	yBFF1/eXvUoQiWEo7zXzgEtAf4GyCBFysbRIQM1Vd0+KOQ8RvWm29VSSNjR5Eg20JQ/cvxaTEej
	o/lu8WHWE3
X-Gm-Gg: AZFdTZcyrmHI41/350FIRM0ZKOiA88Maftv4+AfGzUKTAyxaiZKGVsd4MoI3TLwoGA/
	ReiALc4LRZDkh3fUMzKgzxHlYuk5X9SZ85BZCqMh2KXfbB/0EUGR6UC9mYhvNzuA5+b+v0TkWzc
	gpKzxV+/tAZGp1jF16uDyH5hAFVSlmhCx7GwOCqbJX8DSEOiXnXBAfmG+nzWylwaJzby6xP+oCd
	7v9UvWcCMN9aslr0csVCTt5yWOKTVRh7uBoGlhc8OwiP9fV5NZB48G6+hOeGTW2N4VD/gRVqunP
	EZALO1Qd96Vz9zoOjgrZg776Ezgs8sHDW5rBH+5t8UE7hGy1TBm8FW4vnnZq1Mqy2QfCFsI8gmz
	pVYi6o8+DGJDb9zjXUgB633QDMvk25lOcyBtUMK7bHp12xjacPFbczuVQUS5aSNHDuFFiam9n4F
	U5Oz7acQiEvuKVYEjOe84ZTlPtURbLzTY1zJdZT/7S3SvP
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr43599208f8f.36.1795777500990;
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr43599159f8f.36.1795777500541;
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm46514173f8f.51.2026.11.27.03.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:05:00 -0800 (PST)
Message-ID: <fa61e083-d6c0-40d2-b25a-f83cad368397@redhat.com>
Date: Fri, 27 Nov 2026 12:04:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 8/9] net: dsa: netc: add PTP two-step
 timestamping support
To: wei.fang@oss.nxp.com, xiaoning.wang@nxp.com, andrew@lunn.ch,
 olteanv@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 richardcochran@gmail.com, linusw@kernel.org, linux@armlinux.org.uk
Cc: wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
 <20261119030534.1892935-9-wei.fang@oss.nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119030534.1892935-9-wei.fang@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 237b86nr_pLIwHgP2qAUkuFBPg2yHTlUBnUlcPXgX8M_1795777501
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_030507_386832_0F639F38 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/19/26 04:05, wei.fang@oss.nxp.com wrote:
> +static void netc_port_tstamp_timeout_work(struct work_struct *work)
> +{
> +	struct netc_port *np = container_of(work, struct netc_port,
> +					    tstamp_timeout_work.work);
> +	struct sk_buff_head free_list;
> +	struct sk_buff *skb, *skb_tmp;
> +
> +	__skb_queue_head_init(&free_list);
> +
> +	spin_lock_bh(&np->tstamp_lock);
> +	skb_queue_walk_safe(&np->tstamp_queue, skb, skb_tmp) {
> +		if (time_is_after_jiffies64(NETC_SKB_CB(skb)->ptp_tx_time +
> +					    NETC_TSTAMP_TIMEOUT))
> +			continue;

Not a blocker, but I think that starting from the tail would be better:
the loop can be stop as soon as non expired skb is seen.

In the hopefully common scenario of no timeouts, the worker will peek
a single skb, instead of traversing a possibly long list.

Can be a follow-up.

/P


