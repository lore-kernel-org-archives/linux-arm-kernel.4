Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFDC606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bowsyWuG;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oaqhTp3S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=; b=bowsyWuGyixCZzGcJpidZ9nt6p
	hUX6q1qVZOLnE94HTuMvzyj2cxFngdXJLl95+SGPKgHnWmlNKWusTKDH87SbOR06YuOXX6c7CqfKB
	xgsZKS7rztbbT3gsa6eon4B1Zhin9RMBBb9+qYIddz1Wl6V7frKUipv7nI83NpJ3Be9CKJALkNBSP
	72xblV1mGbgnk/u4eLXT8KX4F2bweJX3IgGKLPCbdF+wBlGRtx1pDQ5qkTh/IjPFp/ljy3h2vHtDK
	Ec8H2B5xQlWotKpBiAkv546W7LgraLqM56c5KacsSKIAFOTt11EamQugmf/80/vnTYF2AJH5ooQeu
	PWXlTitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Fw-0000000ChuS-00fi;
	Thu, 19 Nov 2026 16:45:04 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Ft-0000000ChtL-0HBl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:45:03 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso437733a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 08:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795106700; x=1795711500; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=;
        b=oaqhTp3Sog9tIEiIQld6BhCdZXoR0+piiYbXxuZn+5aXgG7GU9p2yE+y9YOXEid0aX
         iI9FwTQ65/q1uze+9UrJJDDZkIebjGZVZIoU7zlaAiCKpA7GdU0T0QJesLqI2ZLXjOIQ
         p55H3hYsV4g5Tyg80Sxzserd/o/ny3PFiwQj+K3PghFYbEu1q8tRHWZhFgBrxept70ok
         yiycetXRW+A5GYnrNA73q5n7VuPQO84r0DDgiKQxF5LUDXHH4JqbnLfRWS8oGljY3WG9
         lJ/EKVdKZ21i819OEtSFr9VNEPWqlzO0BmlMNP8juclZtwuyKaU+8sdmahsmlTsLFbrh
         ZYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106700; x=1795711500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2K05ih4wGBAK3pt5nK5wgIDHef2c+4NlLu8emj0KCg=;
        b=grgkEWpYQCZAcpFSlhq0DW0EqamQJ5y2Q4ZnDv50aMObf2uwUjerAZixJPN6uO4Wig
         G/lIlOig9Mz5MH04tEtxqbhOO1Py0WtHhsB+vUci3tQAmmDsV7neQkaqVQe8ahIBCgVE
         uGemM8Mq63wG792QHHmejrn+muFM6rgSiLLskph0QH2LajGYgZwZoXnlKFsLO4uHNvnI
         RRTCiFi/pLr4RiRlre9PCJ9on3T3pggkZ0sWgKqk812MWveyt3gxdYgLWD01oqxdLAEV
         TXdE8rCNrEWaHPmc78hbGmw4Ckf6OgzgewILTNZQrcLetM7jczrUiuHkR6FZsEQ5sJSk
         /bsw==
X-Forwarded-Encrypted: i=1; AL+hErGjFnYmLd8qdjpGw4qnbK3BigVKS9YHMZP0tzr5z0jSipwgBj9OMwbHduCCbfLnuJKcgX5SmnOWeDjVkp8DZGR0@lists.infradead.org
X-Gm-Message-State: APuU4Z93rbZ5giahoW2ffr6x7TfNM6UUT6L6ALkMY00fqP9UbR1KB3PN
	zTPbE1JZ8swgD04z4as/fR5oBkXbYj7dy/vUzTmjbjuFSYnDuKu/V5YRS8mXO+0B1nHKU/zQrUH
	Afxyu
X-Gm-Gg: AZFdTZe/2cAVDy/IAGy+aiAb5a1tiXuB9Iucc6Tsu7bKibusMoLrIJM5h0OSAHMF8BV
	KoGrF5zoDBGvlZj2fX4Rt03CZfq3brFWvBT5M3uHv25N9Tk7nB25GKZN8wbjccch/GDj9J9GySn
	Vmc6P2Ga+BnICEoSdEiM1q8RWyRoKTaEN961HZcKcLd+w/o9/VQ+snrtNLT8kb5K2BeVtGsicVt
	iCPrUWGoOZNcEIvpQ04V9AdZkFmwSVus7IN/Vmc0bFBo3zkINPbxE1bnDZQVMHXeajVzETOCMea
	SBdtLPb27aM2AFt1VPvhXitk+AOILk7TPv5OiyRFZ9VCR7k/l2MlHKHdh+S0qGBfQ7J3Kf7A+HC
	zPlLe8DGWEy6zQobFuv4uiw7ogZz8Nb8OSWejHuOjIS5bJ+8ccHLVeQBqNFD41X/xWt3gxIgCMn
	dzmnH1U5qOmv8+vQGW/e3gWZ2xIXtfjgVs52dQjOZQA/omL8xIkjywFK5Ucz9abxYdBnegmV1Il
	Ua3RbqvRN8BcePbpu/PFdGAHrz++axQJ8cc71Er/RcHKRZ8Pup9ENM5B9mbgc3a4iGcY2xxTPUN
	uo4aQpgMm7nTJBwkkblqZiu3WJdFn9Ai+6gpV/nGsqrwMDr5jTjZ7w==
X-Received: by 2002:a17:90b:3c83:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b3d06a2564mr6512769a91.7.1795106699866;
        Thu, 19 Nov 2026 08:44:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm3203028a91.16.2026.11.19.08.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:44:59 -0800 (PST)
Date: Thu, 19 Nov 2026 10:44:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO
 direction after PL reconfig
Message-ID: <av8niGRg4Er7YP8K@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-3-ben.levinsky@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105051902.1646651-3-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084501_144311_41A40255 
X-CRM114-Status: GOOD (  27.75  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:18:58PM -0800, Ben Levinsky wrote:
> Partial reconfiguration of the programmable logic restores the AXI GPIO
> that drives the soft-core reset to its hardware default direction, but
> gpiolib keeps its cached output direction. gpiod_set_value_cansleep()
> then only updates the data register, so the processor never sees a
> reset transition: remoteproc reports it as running while the newly
> loaded firmware never starts.
>

Where does the "partial reconfiguration of the programmable logic" happens?
What makes it partial?  Shouldn't that be fixed instead?
 
> Use gpiod_direction_output() for every reset transition so the output
> direction is re-established, and assert reset briefly before releasing
> it so each start produces a clean reset pulse after the firmware has
> been loaded.
> 
> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
> Assisted-by: Claude:claude-opus-5.5
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
> index 6cf33c7b7e64..da621f62f7df 100644
> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
> @@ -16,6 +16,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> @@ -94,8 +95,24 @@ static int amd_bram_rproc_start(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	/*
> +	 * Partial reconfiguration restores the PL GPIO hardware defaults but
> +	 * leaves gpiolib's cached direction unchanged. Re-establish the output
> +	 * direction and generate a reset pulse after firmware has been loaded.
> +	 * gpiod_set_value_cansleep() is insufficient here because it changes the
> +	 * value without restoring an output direction lost during DFX.
> +	 */
> +	ret = gpiod_direction_output(priv->reset, 1);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
> +		clk_disable_unprepare(priv->clk);
> +		return ret;
> +	}

Why is this needed now rather than when this driver was introduced?

> +	/* Hold reset asserted long enough to provide a clean reset pulse. */
> +	usleep_range(10, 20);
> +

I really don't like random wait times, please find another way like polling the
GPIO line for an expected value.  I also thougth the GPIO subsystem was already
dealing with de-bouncing.  And the question from above still stands, i.e what
changed to required sleeping that wasn't there when this driver was first
submitted?

>  	/* Deassert reset and let the processor run. */
> -	ret = gpiod_set_value_cansleep(priv->reset, 0);
> +	ret = gpiod_direction_output(priv->reset, 0);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
>  		clk_disable_unprepare(priv->clk);
> @@ -110,8 +127,8 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
>  	struct amd_bram_rproc *priv = rproc->priv;
>  	int ret;
>  
> -	/* Assert reset before disabling the processor clock. */
> -	ret = gpiod_set_value_cansleep(priv->reset, 1);
> +	/* Restore the output direction after DFX and assert reset. */
> +	ret = gpiod_direction_output(priv->reset, 1);
>  	if (ret) {
>  		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>  		return ret;
> -- 
> 2.34.1
> 

