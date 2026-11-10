Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E67860A261D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E24MWPIS;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DSPKXf9H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e6tmUSbTA8kI3wpkqOhoSuw/zjQHagh6vk2l/7Qyg7s=; b=E24MWPISW2yrxV
	dvc9/8hk7cE7oyqEoQlSbPJ14530UntERx/WicH0MmHjESyr+VBAGSj/rZ7hun032rtM6NLKGj8sC
	g3EgXsyRIoSkHQ2UUvnNVyzWkSJ4GdSy9NgWy7fDHu0HZPUTaWOj7JLNr5uaX6R9JdXnX1PFrYQxM
	jlOkGWbig/kRxNBhLVcjbxUWZZM0dWK40WSQ6qykH7MKx2p7/BE/W9Ba8g6vCoeFEN+ESY5sMUNSa
	HjmLcG+9iWsG3WSERRLo0Hsi2z15JcVaLaAGdyqxPlCPeMulYTTcPD38Rv8Q7ZAqyoidCVhzVSUox
	3C5ZBV8LaEYmT6ZoNyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn2L-00000004F7b-41d9;
	Tue, 10 Nov 2026 14:41:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn2I-00000004F47-0NXl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794321681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6tmUSbTA8kI3wpkqOhoSuw/zjQHagh6vk2l/7Qyg7s=;
	b=DSPKXf9H0iFM7EF7oyvqkZVY1Qy2DmvSvdig9nhXxMjag/UkTQ58u8suqOe1zovHBLx0Se
	jllnOflUn8n7ggXw6eFRVCSV4HieQeqZoo3T9KdObgO7UK5Ciz3qv8/t6OGMEtYT9lqhBb
	Y90J2KJ/O82sd94aV3lzgiM9NiI75v8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-Kv3R0i2YOeyu_6B7nrI9Gw-1; Tue, 10 Nov 2026 09:41:16 -0500
X-MC-Unique: Kv3R0i2YOeyu_6B7nrI9Gw-1
X-Mimecast-MFC-AGG-ID: Kv3R0i2YOeyu_6B7nrI9Gw_1794321675
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4afef353dd2so22596445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321675; x=1794926475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6tmUSbTA8kI3wpkqOhoSuw/zjQHagh6vk2l/7Qyg7s=;
        b=Rui0in5aEonkPMa4X2pC3sPcz0nVNUWHrR+FAxP/ah8FiQ76uIm77NFFB37NwbYXoE
         5PZPsZaGIGQsDCV5KWO59ubHY+9nTy+QDLZvnFHpa8nwFHtGriQnNVhtg7JxYDVsrVGn
         nYDorCbqmRjxXnEt7AyH5PewBZQRUDCxtToHnfR7lwlncMCQbZOQKidiYfBKZ/dpJp/r
         1Fzt5TDgz5FNUKtSSBdtEol1EwOsqPVwMa0RFHhzWyh/mRaEW15D9s2nfecrMSxLcwLi
         +Q8CmKqnGg5j7OipZesIqmFraaeonUwS4/ynxKrcdrmzqUfls5iUafkKehcxddIRRH28
         NxnQ==
X-Forwarded-Encrypted: i=1; AL+hErHSkZC426xr//1f8vFA6xp0ej4fp6JdEwSYG606KNf65iNXnx1CyfI1fqd1ccfmAdjc0WNSjQZlw8+iKxau9Tya@lists.infradead.org
X-Gm-Message-State: APuU4Z8VA03cDbnWX+V3GiMG6whJTXtkHJbqGDpZgLaJ/eLNeDtpFXwo
	8jsS55O798khhq1y0MPTZdOCL2soe7XuP46Ourym+kaZfpWrezsDaMHh6gurFFIQ1MIanlrN97V
	MEJ21bD/5+RJdVwr8bb/TZUHqUHs3zNoxfqkt4dwgUJuflkvJuzcWT0hLASfYQukpaHoUQS3QB9
	A7
X-Gm-Gg: AYBFou3wwS7/gMHQMH0wpoaoR3VH34AUAQFjtMyYXVK0S8VyFKg81Z7RenbMKN5avC4
	eSOLLCO3BLi5dC3KKEe8KAga+BvjQWHDPpC8McphQ1gcjOCKDvsN78Nulmty4qWcPSi7+Cl7MRk
	f0WWU+PZrhUUV5+dWF4n2ZVzFa8W1nOgGaFWXT6Yi3HDVEJYVvdx/BZMx8r/aV/UkmuhsKZCv7h
	PFAgpqVQsH2vuYBdx93oHi1m0CtmqfE9FppE79N/O8YS6/NQfEz1BstsgzS6f4Ei1/8OAwvLQZq
	GL6omobBw2HnD0vOVEqOpSBK7ZltjHO3oA3QEZWVTsL1pX1iWezpJRcRitAaG7Nrt8MrnI0bbM0
	Fl4FZ+Z5jMApCPrKOq6DAZ8k5JKpgQNKMOPvjDtZFDDct3ZdxLULVXwcp298VWSarxhG5DDHejQ
	dWEigyW9+JTHdcOdG2DHJwDfqOyfj9jZ/b/1o5yJd5ozbe
X-Received: by 2002:a05:600c:190f:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ba02336807mr53183015e9.6.1794321675115;
        Tue, 10 Nov 2026 06:41:15 -0800 (PST)
X-Received: by 2002:a05:600c:190f:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ba02336807mr53182425e9.6.1794321674505;
        Tue, 10 Nov 2026 06:41:14 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm78127275e9.9.2026.11.10.06.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:41:14 -0800 (PST)
Message-ID: <1754e4c8-3b6e-4983-a7fb-d3444c1156c1@redhat.com>
Date: Tue, 10 Nov 2026 15:41:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] net: pcs: xpcs: make supported_interfaces
 authoritative
To: Coia Prant <coiaprant@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Fabio Baltieri <fabio.baltieri@gmail.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261102212506.3348537-1-coiaprant@gmail.com>
 <20261102212506.3348537-4-coiaprant@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102212506.3348537-4-coiaprant@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3RKPucVKtLYs5l_9Vn197QyK2hSGvMz17uKZHpjU-Wk_1794321675
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_064122_388578_CEF6B34F 
X-CRM114-Status: GOOD (  12.86  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 22:25, Coia Prant wrote:
> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> index 6f0a110e32d2..25fdc9c6b72c 100644
> --- a/drivers/net/pcs/pcs-xpcs-rk.c
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> @@ -483,6 +483,7 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
>   	struct platform_device *pdev;
>   	struct dw_xpcs_rk *pxpcs;
>   	struct dw_xpcs *xpcs;
> +	DECLARE_PHY_INTERFACE_MASK_ZERO(supported_interfaces);

Please respect the reverse christmas tree order above.

>   
>   	if (!of_device_is_available(pcs))
>   		return ERR_PTR(-ENODEV);
> @@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
>   		return xpcs;
>   	}
>   
> +	/*
> +	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
> +	 */
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);

Sashiko thinks this last statement is a no op:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261102212506.3348537-1-coiaprant@gmail.com

I don't think this is 'net' material, I suggest resubmitting for
net-next.

/P


