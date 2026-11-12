Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E3606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LRMiichO;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1PCGT95C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X4JjXtJ1L6Xx0jfMzbPGhAv98kNldnZcwoBSADhWKuo=; b=LRMiichObBgpzP
	kQDS9ycCX5/4sEffujVo2oAmhpVGNNsZq48Kw7PGKsAa0upM4DcGsUq6TnlwMWEUo6iG+0Gdz1XBk
	tl9vLjZeqFJfaAupiPJSAKA/QOIdxH2tR81XqVpYIdeNDBi8NqV5/fSrLyX52epXguUGwElQ3pdaG
	k13qZoO/2DtyEkKZUgd1wxMvgIKvF4HJsZ+k3UoWFpg82slJ6YfafTSZBtaTJOp+Kj05y3nBWnRvm
	/I18/9AM22tkNzV31ytWvsaQjafxifbAazW1T+RGwuVGi3NgoEz4RzNrQh+r0bdS7iLTTeMQjaQN7
	fdCN9tMcJ7d2mMFuC6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYGm-0000000AiHw-30Ig;
	Thu, 12 Nov 2026 17:07:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYGh-0000000AiGi-3QMz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:07:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 07D104E41593;
	Thu, 12 Nov 2026 17:07:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5D96601AD;
	Thu, 12 Nov 2026 17:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A33311BC1418;
	Thu, 12 Nov 2026 18:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794503234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=X4JjXtJ1L6Xx0jfMzbPGhAv98kNldnZcwoBSADhWKuo=;
	b=1PCGT95CLQu5QZQ5HRqpIMTkHxVpNI+eZZsE9BjMSI/ow+JTL9Ummy4xex4y/SLM6XUoz0
	EZl531/umaSiFBxQAi1pjOvowbhVmp64gC398B+xOmossoWwpmnJvzpHIcWfCrlqeNO+OM
	9/dMfdfyuyLJU1ZOCAsQChGuP2W7l4XITq4Ik6xZgYnHtMw9fKlw/28w2f362IkoK2VrZB
	4k/8RzxkGmRrc0IKSO0YsuCvP0flcP92MxeOJ4yVUjtTdgKo9ZKuuDWWnetFfM8Bm9+WwH
	OXcag23TvuhhzGmQQv6enXgmPu//4QC4rVH0f/0EQsom3vVGHoia9xZGe5023Q==
Message-ID: <ea9ae0f9-d373-4e97-b96b-3855c01100ee@bootlin.com>
Date: Thu, 12 Nov 2026 18:07:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: re-base EST after PTP settime64
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_090724_175489_C248050B 
X-CRM114-Status: GOOD (  17.19  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On 11/11/26 10:54, Lorenzo Bianconi wrote:
> stmmac_set_time() initializes the PTP clock through
> stmmac_init_systime() (TSINIT) while holding only ptp_lock.  It neither
> takes est_lock nor disables and re-bases EST around the step, unlike
> stmmac_adjust_time(), which performs TSUPDT through
> stmmac_adjust_systime() under est_lock.
> 
> Both operations change the PHC system time, so both invalidate the
> absolute EST base time.  With settime64, a concurrent
> tc_taprio_configure() can read the pre-step clock through gettimex64()
> and program EST with a base time that is already stale once TSINIT
> lands.  Separately, a taprio offload installed before the clock_settime()
> is never re-based and keeps running with its old base time until taprio
> is reconfigured.
> 
> Take est_lock for the whole disable/step/reprogram sequence, as
> stmmac_adjust_time() does: disable EST before initializing the clock and
> call __stmmac_setup_est() afterwards so the base time is recomputed from
> the reserved taprio base time and the new clock.
> 
> This keeps the established est_lock -> ptp_lock ordering:
> stmmac_init_systime() only uses readl_poll_timeout_atomic() under
> ptp_lock, and __stmmac_setup_est() takes ptp_lock through gettimex64().
> 
> Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

This LGTM, the return values from stmmac_est_configure/__stmmac_setup_est are 
ignored though, the [cl|s]ashiko gang may not like that.

Besides one of the EST commands timing out, it seems unlikely though.

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index 31a66e855d6b..6370bdc6c58b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -129,10 +129,19 @@ static int stmmac_set_time(struct ptp_clock_info *ptp,
>  	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
>  	unsigned long flags;
>  
> +	mutex_lock(&priv->est_lock);
> +	if (priv->est && priv->est->enable)
> +		stmmac_est_configure(priv, priv, priv->est,
> +				     priv->plat->clk_ptp_rate, false);
> +
>  	write_lock_irqsave(&priv->ptp_lock, flags);
>  	stmmac_init_systime(priv, priv->ptpaddr, ts->tv_sec, ts->tv_nsec);
>  	write_unlock_irqrestore(&priv->ptp_lock, flags);
>  
> +	if (priv->est && priv->est->enable)
> +		__stmmac_setup_est(priv);
> +	mutex_unlock(&priv->est_lock);
> +
>  	return 0;
>  }
>  
> 
> ---
> base-commit: 22b7cb932c6a0f7566d41072be6956cb6c8af4e1
> change-id: 20261111-stmmac_set_time-est_lock-f74f4ce678b7
> 
> Best regards,


