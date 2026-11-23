Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34822606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ihFcN5zH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ajeor/5M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qW83tcu1nLaIvW9H5AFKzLtLc7tyDERd4OY7y1H/lAw=; b=ihFcN5zHPkz1oE
	h5CTWFuoTVOXFuvaGXybwGgRmTTVyy/vNo4vgcdlcjX+jQhT5vBN519lPUrhV1RwAT+TJx4fpUaqg
	uxR7V6NKsdMex6oSKDyXzZnpwUarIxfSOX5k7rqZuk17ylxGNAVTUXowytyvNyHSjrhyaDm8F7y/q
	DsZW2EvbW6b21lSc1z6bF1yGdJGUnBYTQD9IOB1zU+hTgvsTmSmhFf34g101jTTuV5pIqeFhHwCGR
	jJlucZgjfOwviA3i4lnu912gMX+hMK/gWhLBJ+Ny86qC/j9eLLUgMH7WpwOLHye15vVfz66g078Cu
	SU+4RrWB7cmsr6e2p4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPc8-00000002ajN-48jo;
	Mon, 23 Nov 2026 08:41:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPbs-00000002agC-07u2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:41:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FEF261EDD;
	Mon, 23 Nov 2026 08:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2823D1F000EB;
	Mon, 23 Nov 2026 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423271;
	bh=qW83tcu1nLaIvW9H5AFKzLtLc7tyDERd4OY7y1H/lAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ajeor/5MmfIU6zEsUYcWnXAVwc5fK1+cstxm2Je/i/wUEpmUb8tnYqqVATLxWDaNh
	 YzKKJco0hur5jU6bJhdPl1imMk4YqPTI0Jvn5vZD/Fj3DvrsF3tsXLuEPcG1I2Yfyk
	 922JMAMS9Uhv0+Y2CA9+r8Fe09o057SZSwfyL5c5DECCkh3Ok+Y6QX5s79adsZJ37e
	 TRdtiWfqoZfLOd/cf8580aWKfglYKjm3FnQh+0k6gfUuLBvRKcDtEbI6QbiDXydK9T
	 y+DdJBp/QtAAMEamcP+NQMIDgBLH4UsUEDazLQrQbiiLxLIil4NcCeelLr6dwknM1g
	 LnsbhbPFKfo9w==
Message-ID: <316fe254-813f-4871-b0ac-428bf5bee6f7@kernel.org>
Date: Mon, 23 Nov 2026 09:41:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] i2c: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chris Brandt <chris.brandt@renesas.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09-Nov-26 21:50, Joshua Crofts wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
> 
> Remove the redundant function calls.
> 
> NOTE: Some drivers in drivers/i2c/ still keep their calls because they either
> rely on pm_runtime_dont_use_autosuspend() before pm_runtime_disable() to flush
> pending autosuspend delays and trigger synchronous runtime suspension,
> or operate on a parent device rather than the platform device itself.
> 
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
> Joshua Crofts (6):
>       i2c: cadence: remove redundant pm_runtime_dont_use_autosuspend() call
>       i2c: img-scb: remove redundant pm_runtime_dont_use_autosuspend() call
>       i2c: imx: remove redundant pm_runtime_dont_use_autosuspend() calls
>       i2c: riic: remove redundant pm_runtime_dont_use_autosuspend() calls
>       i2c: stm32f7: remove redundant pm_runtime_dont_use_autosuspend() calls
>       i2c: xiic: remove redundant pm_runtime_dont_use_autosuspend() calls
> 
>  drivers/i2c/busses/i2c-cadence.c | 1 -
>  drivers/i2c/busses/i2c-img-scb.c | 1 -
>  drivers/i2c/busses/i2c-imx.c     | 2 --
>  drivers/i2c/busses/i2c-riic.c    | 2 --
>  drivers/i2c/busses/i2c-stm32f7.c | 2 --
>  drivers/i2c/busses/i2c-xiic.c    | 2 --
>  6 files changed, 10 deletions(-)
> ---

Hi, gentle ping on this series.

-- 
Kind regards,
Joshua Crofts

