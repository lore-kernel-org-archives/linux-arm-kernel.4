Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a7Mtwd7O;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SrrfR7Zc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OchicsanssR3AdJ00LY+3McNXqSzaIMckCwuyN0twwQ=; b=a7Mtwd7O6cM0dy
	f/qlH9nOytaDl5asVwjy7fEhwiKsl1g5b1dLNd13GZDltmE0+uN4g2/ZfXZNYvo38r5x2wovPTHvz
	vnUfXg53RlRWQ3fdD+9Wu/oudydhjy+lUSoFnFEJcIq7Rx1/zeSHv0SEUQxCRHgU1iSaAjPQblR+I
	jbFR1A40zEQyI1vTOJx2sxaWqpiZRR5krXrs3464UgSXoWkEYe3w1aLkg8huRKOi2UhSYLOjchEqt
	wrn8GPAq7rciyP/4tIxj2qo+9XVa/HkDnvy/q9mrdamBWhNIS4LAjk4cRLExVvsQ1eo9bhmHAgYkO
	x81oyaAffyzQQsI96OSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUVu-0000000CLk2-2aK0;
	Thu, 26 Nov 2026 08:07:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUVV-0000000CLf2-2Nan
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:07:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 139E94E417A2;
	Thu, 26 Nov 2026 08:07:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D193F60237;
	Thu, 26 Nov 2026 08:07:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1694B11E6B27F;
	Thu, 26 Nov 2026 09:06:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795680421; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OchicsanssR3AdJ00LY+3McNXqSzaIMckCwuyN0twwQ=;
	b=SrrfR7ZcuX6e8a0vz/8yqbuzwyHlo8IAOY99nK7EZ4yitmDBz+ys/kSQlnNBI08XaLGEp0
	hyr5DkipP6U1pY5olD/YICFVF55Qy96f/N/JEm4q7an5IsYpgVSJsgvejTnW8WL77sqEjc
	ohmJhf8qGOjYK3FqBPqqr7OopELWOLzrrhWpEo2WwcmoLXkAVq4vzUUi3EP+gpmehfqBRR
	Lg+RlnQizk4xVkEhtKOi5RGFMZ8r/hPo4SlZH1LymmR0E2VqwgYUT7LIi3dmShVy14ZVM8
	5M8t2vxicrCABrEDvXJlof+0fT8DoENlVmgMT1iuvs/SncHM2gHPKlnc+J6A6A==
Message-ID: <544205c7-7590-4a6a-8abb-0199768ed283@bootlin.com>
Date: Thu, 26 Nov 2026 09:06:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5] net: stmmac: program the FSM timeout timer
To: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261125111929.3395740-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261125111929.3395740-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_000705_755846_EA94FF53 
X-CRM114-Status: GOOD (  15.88  )
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

Hi,

On 11/25/26 12:19, Zxyan Zhu wrote:
> stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
> MAC_FSM_ACT_Timer register.  Per the databook the checker only fires once
> NTMRMD is programmed with a non-zero duration; NTMRMD == 0 disables the
> timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
> never reported and the advertised timeout protection is ineffective.
> 
> Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
> TMR field (CSR clocks per 1us tic) from the CSR clock rate and using a
> 4s timeout.  4s is chosen because a PAUSE frame with the maximum 0xffff
> quanta stalls the transmitter for about 3.36s at 10 Mb/s, and a shorter
> timeout could wrongly report a flow-control stall as a stuck FSM.
> 
> The NTMRMD field holds a power-of-two microsecond timeout per the
> databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
> 16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
> 4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).
> 
> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
> not reported through the safety interrupt despite TMOUTEN being set.
> 
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

[...]

> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d22..659f5db528d3 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -170,6 +170,18 @@ struct stmmac_safety_feature_cfg {
>  	u32 tmouten;
>  };
>  
> +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> +#define STMMAC_NTMRMD_1US		0x1
> +#define STMMAC_NTMRMD_1MS		0x2
> +#define STMMAC_NTMRMD_16MS		0x3
> +#define STMMAC_NTMRMD_64MS		0x4
> +#define STMMAC_NTMRMD_256MS		0x5
> +#define STMMAC_NTMRMD_1SEC		0x6
> +#define STMMAC_NTMRMD_4SEC		0x7
> +#define STMMAC_NTMRMD_16SEC		0x8
> +#define STMMAC_NTMRMD_32SEC		0x9
> +#define STMMAC_NTMRMD_64SEC		0xa

This whole patch starts to look good, one last comment, sorry I
didn't spot this before. Can you put all these definitions
in the "common.h" file in the driver folder ? These are some
register values (same on dwmac5 and xgmac, but still), so they
should go there.

With that changed, you can send a new iteration with

  Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

pw-bot: cr



