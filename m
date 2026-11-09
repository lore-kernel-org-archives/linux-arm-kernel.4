Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D57606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HpWqg0P3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTzqnqju
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=; b=HpWqg0P3W1CMcF
	3zMB62IX/zlDCGfj0mLkxXppf1SXCGBnoooYjsJ3IgPhDAmA8x2rrL5Dc+ja7ZyQSzZRrDMwzTTYF
	J3Ept+XJTcXnlszNy8Qo3rG1e6bTqTGY159rm0NGjDimrFoRdZyYhxY0/s6Y3+ZVSSFiWqOY8TxOO
	xpnDBY4SoB7qkJymm4TeGOzc7kL98tj1WeEQJfGrrTNARjGxHMhX1NhE0VdebXJAqN+CGNj/L3Jto
	9ZBgiIEd3aqoP6Z/vhBQ4cFk88V7uo2DLtBmB7coyuVadMwrqRLmVncRIwLj6QhJfZyH9ym8sut42
	OKLZo7BM3M+W4x607cfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQD1x-0000000GwnU-12o9;
	Mon, 09 Nov 2026 00:14:37 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQD1u-0000000Gwn9-3b6J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:14:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so193153b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183273; x=1794788073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
        b=gTzqnqjuTSVyrAnL4f0dNf1fK0yov1H+Z3nAH01MURATEX32ygjkLxfXyxerQtO9MI
         ZeUB4skXFst5WDdaGzTsH1djabkjPyfm5iQ3eT/N9MTOxmXCfy9Lz2WvjzLZ100gZxGS
         TXmblw5PLImsVx2TGRwCihGs8fVE0j4/gQ3RE6CL6T/vKp7qovT834OplLpKUJdxi9rJ
         H+xPmGLNqTMX8DunJll+l0BqGI837a5nBq2wsKmC7mIYyjvv5G3bOSQFJb72bMpyzu77
         FwHgC+pv5jVRKF/dtfdA/tDDqG6VKEBmnYS+f5jwt8sjReSeoYYEsgbi5BuZVqWVVXFG
         VFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183273; x=1794788073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKbaPQsHHOhvacrmvvpMN5t1cCuxJyoRdKRaZq+8jRY=;
        b=xNH4PoZO0Hl9w2eoBqaRasKu8tQpaKX7y8sQiyw1BrGjKaFd0OL4yJmjL9wJiRY6Ll
         9YSm1fM7j4m1qq3bxPk1ayGyEV49gu1w3s5a1fEd/yZYDgDko6lMsqldd6GR2PEUhJI8
         oSezGUGuDQaEXlCJ7B2ok3ykiGmWizFWtf4UstgsRo6+6Go4WslsfkkJPA29UjhRsUUm
         tMSCmEULYeqIah+zMCbeHHT4kEkGDj1ZOf7e9zoiKWfH8Hbjf9BW0Fe03NjI9EgJ+Y4f
         0kY4rhFqN9dAJH0Zk4neWaCX3/70b9H4BSDsrCux2KtDxhd2qPKM8x7+b+q0YVFMVv0I
         +o3g==
X-Forwarded-Encrypted: i=1; AL+hErHxOXdbdh6xGZyz9nLMAkJRY4eDirQhZDWyHNTspRH8u8QDYdbu2wmK3PyS8kitOiqXxJhpS0v03pkfQkNYbd4H@lists.infradead.org
X-Gm-Message-State: APuU4Z8c9jjQZYUoE79dRW9h8PfGA9GSBfZgsvJfnvpvDMGIoLtNjQVw
	rqs+yHmDgbP2fGjR67dxRdEzqK/OY1plSOSJpfAXWiWO6mb/3E+kA10+
X-Gm-Gg: AYBFou28EgG9nIixYbe/mBl/d6gPkz+zoHkjRHvYjp3LmgrJ5vJ6ERpmrYM3w+jifxv
	pzodmJReHYp39aDhGquRQh0s3KlB5Ij5eBQjLJMia/4yw7fwDSDR2HzoiPXgkWjUMJL9OVmUJvC
	uPkzYvtPlYFew1yk+ZFZsN8CJ3XWaDoKEexVAQhK+pMjwF9qdxMJPvOuvr8NOBOP0aR/cpRv2gd
	AqT2vUfRqNTb4aPG1Bw9Ll1Yd97Xp0K/db80lt6ThWKSWMvpT5ZU5VkXhakUr6sfF+BPn2oMdJb
	NhZwHCwR/K5LsgiDMjNsH1VZGDjQMScSUYl1FQc/iojtkjuATuP3eG4vybGqhm/K6lzrFiw5Vcp
	zPb0W5oGfjeKwvtz36+u1Ml4Af9hKkk2uzBjffEhDZJyDQKUz6nBzvihyoA5wvQzD7GYMhDv2QI
	xq9ggQF8qTHU3muomdr3Q4jK4MlUsH3CAxH/S5oIwO8u7QAO94vI5TVUHEIrD8boomjHzqc4079
	G07qIY09rbWuJOSdJiDhdm/d3Zn6zfSvZkrlfq7aPnIqcSFCblH5aukEk0YfirQ6s10ILJcQK0Y
	feycBKUHJHOH0jdMEuuUVLirTvz7wIhilnGtX+vrsaiHCIUwlgIveWU7NfFY73wg2b1zKiCbDjB
	ZXW4=
X-Received: by 2002:a05:6a00:9a3:b0:897:ffff:c18a with SMTP id d2e1a72fcca58-8b66c3a7923mr2227291b3a.7.1794183272958;
        Sun, 08 Nov 2026 16:14:32 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821abesm777951b3a.34.2026.11.08.16.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 16:14:32 -0800 (PST)
Message-ID: <faa957ac-badf-4027-b86b-e12b8dd4bc7e@gmail.com>
Date: Mon, 9 Nov 2026 08:14:16 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <au4GkvPTXmcvReoj@monoceros>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <au4GkvPTXmcvReoj@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_161434_902927_4C63F51F 
X-CRM114-Status: GOOD (  10.67  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dear Uwe,

Thanks for your review.

On 11/7/2026 12:57 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Nov 03, 2026 at 10:22:02AM +0800, Shan-Chun Hung wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.
I will remove it.
> 
> Best regards
> Uwe

Best Regards,
Shan-Chun

