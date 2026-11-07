Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FED606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2n4BtVum;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MbmNWtfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8Ug3zsrw3hMyB08E82SI0s/LpxJ07OTjoo3RCvK3O7o=; b=2n4BtVumlZbiai
	2oqPduZ9z2DEIOI4SCc8pwLgo2WKwS4XNyTXpRr8X8i7Vf5E5jFy2v6QXZEXD8Er3iu1y4SR5X6Tb
	d7HDxea8pOTK87Uls/VgtiGiCT8CdBK4vPLiPdF1GibtceC1RwRnlLzCl0yKYvcQl8Onsjssj2dKW
	DbbFQkxb7zR2jQXbxsk9wlmKjila9F5aaUu0qflH6IFe66j8DyV1zk3QkP2tyG+Y7+hO5akLsrsn4
	x+FwAg9p7M2e046eUyVsrGSiT3k6deKF9cNbpdsCdjvofeZMS0SzLlTSzszBjzK3G23yXB1rsATFA
	jsjcp3vdfSYYCCEerc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaMh-0000000EILU-2zT4;
	Sat, 07 Nov 2026 06:57:27 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaMe-0000000EIL1-3LHT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=8Ug3zsrw3hMyB08E82SI0s/LpxJ07OTjoo3RCvK3O7o=;
	b=MbmNWtfQFrmF0p43YnByegf78XlnGoPNoGzxC1w3OteVb3TLh6IISRFtYZHVaZ
	SMx5UvO5RWV6QE/ak9HijbMNSXsH4pBAOLLC95mcTl2Bqt9xVqvJxosYRq/2Ys9C
	BsJt9e9or9IA/uGjVZnY/gjz5FMOC1S1gjHzdzHGdcrfw=
Message-ID: <abf91f63-473a-441b-8264-2573067fef3c@163.com>
Date: Sat, 7 Nov 2026 14:56:54 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] coresight: funnel: inport schedule by priority can
 not take work
To: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
 leo.yan@arm.com, alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261027151457.5713-1-xuchao066@163.com>
From: Chao Xu <xuchao066@163.com>
In-Reply-To: <20261027151457.5713-1-xuchao066@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X_u2y+5q7AmfGA--.20947S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5Kw48GF4xKw15Xr1xAFb_yoW8Aw4rpF
	Wqk3yYvF1rKr4jyw47tF4kWF1UtwsavayIgryrKw48uF15tFykur48KF1kKrn29FW8Gryf
	tr4ayFyIga4UW3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3hL5UUUUU=
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC6Bp3vWruy7oL+AAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_225725_245706_614750D3 
X-CRM114-Status: GOOD (  14.09  )
X-Spam-Score: -1.8 (-)
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


在 2026/10/27 23:14, Chao Xu 写道:
> The CoreSight SoC-600 TRM, section 10.11.2, PRIORITYCONTROL, a funnel
> rejects priority register writes whenever any port is enabled. The
> current sequence therefore prevent the configured priorities from
> taking effect. Write the priority register before enabling the
> first port.
>
> Signed-off-by: Chao Xu <xuchao066@163.com>
> ---
>   drivers/hwtracing/coresight/coresight-funnel.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..500ff72a83c8 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -62,13 +62,15 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
>   		rc = coresight_claim_device_unlocked(csdev);
>   		if (rc)
>   			goto done;
> +
> +		/* Update priorities while all ports are disabled */
> +		writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>   	}
>   
>   	functl &= ~FUNNEL_HOLDTIME_MASK;
>   	functl |= FUNNEL_HOLDTIME;
>   	functl |= (1 << port);
>   	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
> -	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>   done:
>   	CS_LOCK(drvdata->base);
>   	return rc;
Hi Leo, Suzuki,

Gentle ping on v2 of this patch, sent on Oct 27.

In v1 you suggested moving the priority write into the first-port
branch [1]; v2 implements exactly that, and adds the TRM reference
you asked for (SoC-600 TRM, PRIORITYCONTROL). It still applies
cleanly on top of the latest coresight/next.

[1] https://lore.kernel.org/lkml/20261027084133.GA766279@e132581.arm.com/

Thanks,
Chao


