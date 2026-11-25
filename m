Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB4A606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LgCgLNe+;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a25X4E02
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4/x7j50MQJx15iZQDZRl//Wy8YqZBKp5oVRm2ztPBoI=; b=LgCgLNe+D3P9dR
	XokHC3+30LZln3D4MDFRIy9e0OC3xNRBg1u8yqctIAFpoQcD0Gvy38RksnR5dlkV5j9M2KuVjQfRf
	MB0C3FEYbR/nERufDkPKKAGNdqRLpokJrw4zOOAf/5wOpqTo85Pxbe9zxiKiPbtS3EBbBjGo4EJxF
	6wq67RYhOG5hRq52HrjdUOlGMBAaHphHy1c6LGufLjzUH+RJjni8AV8xg8z4uEP/7IOTbwY23x9AU
	GJeRmBbl0iIViTmpbXtbI51JQGssvJynXzXkH8643uXbWcf01zvN4ngWsH78lrtOSJHswMzmQlWIW
	jR0wtsLaaZf6tC6BzQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8N7-000000094qA-1q4v;
	Wed, 25 Nov 2026 08:28:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8N4-000000094nc-0vHx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:28:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 28188C2BB3B;
	Wed, 25 Nov 2026 08:28:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A9EF60480;
	Wed, 25 Nov 2026 08:28:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBC2411E6993C;
	Wed, 25 Nov 2026 09:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795595329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4/x7j50MQJx15iZQDZRl//Wy8YqZBKp5oVRm2ztPBoI=;
	b=a25X4E02hlHdAZLeh5VeHxN6+rjmKkzW9i2wpZ/aAVuugJ3MhGFp/MhlILboBpFeQrLS6p
	btaDqDM2H7xJlrfcz+RX7BjG78aD4/ETSqwQCSyqhGkrbhsHwEkozspZam4CAi6QNErfla
	X4cZFjL4zk+R+7axwU3Lts82blj93HcjkzkiSEjLEnO8XGY6cNRu5eTaAvhT9TaGGAsCH6
	EYOgRgkcR8ifvWMI22u/GwqXqhKoPjneZf8UAyjxbj9neMT5lNZwyFv5sqMrod0fIPcK23
	tFEf+qgwfm2eO9AZ/3N8Hwxzz7t37W+uw5aQMybCXkIfmRgiNX5ApaBhMAAuyg==
Message-ID: <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
Date: Wed, 25 Nov 2026 09:28:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: zhu xin <zxyan0222@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261118025528.2703790-1-zxyan0222@gmail.com>
 <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
 <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_002854_418826_A3584F1E 
X-CRM114-Status: GOOD (  10.02  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/26 09:22, zhu xin wrote:
> Hi Maxime,

> Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s a
> PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
> about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
> FSM is still timed during a flow-control stall, that would raise a
> spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
> link locally to verify it, and the databook only hints at a large-mode
> (LTMRMD) without being explicit. Would you prefer bumping the default to
> 4s to be safe, or is 1s acceptable?
> 

Yup, this should do the trick. If I'm not mistaken, you'll add some
better controls once you start upstreaming the glue for your XGMAC
device, right ?

Maxime


