Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF97606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iPA0MkzF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwmWQL/v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qHLkF6tVlZ+i0QFCbA67HWU+g83dxZTEV5zaNmKwHJw=; b=iPA0MkzFbYeAY2+7IJH6lzVCXv
	LoyI5ZjJoEvx8lOsp8/ewBBBCu2C2RgtZakev/dHx5ooh6KlFGhzcPWu093VTAXDAocf/BmRCfmnn
	5OzARj7XzNGAHIMkJ6MTkNLa2a2G1wS+PDsSNA1KdNqoLkGosxjCo6A5pfviWPRHYaVFKOfDToGxE
	f4PawzSqiALjVeHdHQDEKqjdMYPRe56e7SoepUSFw1W5HqLCoy7w1b4fEXe1Lo9Ni9Zy+0k72F2XW
	hsCh0vIOqsrebZNqdUag8XUvrEM+fpD4a1+IKs0+Lq9zN8ayelnF/2Au3b7EitimIHpRom4NdIciL
	R7IKh2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7ml-0000000DCsq-3OoP;
	Thu, 19 Nov 2026 19:27:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7mk-0000000DCsU-1T4m;
	Thu, 19 Nov 2026 19:27:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA8C1415BF;
	Thu, 19 Nov 2026 19:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1071F000C8;
	Thu, 19 Nov 2026 19:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116425;
	bh=qHLkF6tVlZ+i0QFCbA67HWU+g83dxZTEV5zaNmKwHJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AwmWQL/v/ILoQCm/U7h+szaU1lXZ97cfrHmUU/UJY4ndFIy3jRXc1LnA6fqPFTvCm
	 ke2KBzPrsmNVGkAgIWvoGYMmU7USgqhecOiyiV72n/3XZG9dKGAKT3/GUUa9R1DYUZ
	 4ATP93XyuGRLJGK80xRLfrKBNZzyYswx15FmcgsaQLKUJOU7m5ObEOa9egP9mrcwQ5
	 f7f3xN5weFYaRmraMcSM5QS06LtBY9BreGaz+MLrVZhi8OfAIFhDI5Jg2d7yUY0frl
	 ma2GHg5sBYzHkllBEiNfhAjpX3nzOEcuXbmo6lyX6bG42UVAAdgjtqBWX+MeyJXhEV
	 0icLKCkVOT3aA==
Date: Thu, 19 Nov 2026 19:27:00 +0000
From: Lee Jones <lee@kernel.org>
To: Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Subject: Re: [PATCH 2/4] mfd: rk8xx-core: keep the PMIC interrupt disabled
  during system suspend
Message-ID: <179510313469.63755.466425546513135743@kernel.org>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
 <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-2-cb12621c1fb4@cherry.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-2-cb12621c1fb4@cherry.de>
X-AI-Review-Draft: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-2-cb12621c1fb4@cherry.de>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
>
> When the system is woken up by the PMIC (e.g. by the power key), the
> PMIC interrupt is handled as soon as interrupts are re-enabled on
> resume. At that point, the bus to the PMIC may not have resumed yet, so
> reading and acking the interrupt status fails. On RK3588 with an RK806
> on SPI:
>
>   spi_master spi2: noqueue transfer failed
>   rk8xx-spi spi2.0: Failed to ack 0x79: -13
>
> Disable the interrupt at the end of rk8xx_suspend() and re-enable it at
> the start of rk8xx_resume(). Both run in the regular suspend/resume
> phase, while the parent bus controller is active. If the interrupt is a
> wakeup source, it stays armed while disabled, and the pending event is
> replayed by enable_irq() on resume.
>
> Store the interrupt number in struct rk808 for this.

SoB?

> ---
>  drivers/mfd/rk8xx-core.c  | 19 ++++++++++++++++++-
>  include/linux/mfd/rk808.h |  1 +
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 21182df45d1b6..2ae9107fc5161 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -851,6 +851,8 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
>  	if (!irq)
>  		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
>
> +	rk808->irq = irq;
> +
>  	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
>  				       IRQF_ONESHOT | dual_support, -1,
>  				       rk808->regmap_irq_chip, &rk808->irq_data);
> @@ -929,7 +931,20 @@ int rk8xx_suspend(struct device *dev)
>  		break;
>  	}
>
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Keep the interrupt disabled while the bus to the PMIC may be
> +	 * suspended: otherwise a wakeup event (e.g. the power key) is handled
> +	 * as soon as interrupts are re-enabled on resume, before the bus has
> +	 * resumed, and reading/acking the interrupt status fails. If the
> +	 * interrupt is a wakeup source, it stays armed, and the pending event
> +	 * is replayed by enable_irq() on resume.
> +	 */
> +	disable_irq(rk808->irq);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(rk8xx_suspend);
>
> @@ -938,6 +953,8 @@ int rk8xx_resume(struct device *dev)
>  	struct rk808 *rk808 = dev_get_drvdata(dev);
>  	int ret = 0;
>
> +	enable_irq(rk808->irq);

This is early - are you sure you want to do this right away?

> +
>  	switch (rk808->variant) {
>  	case RK809_ID:
>  	case RK817_ID:
> diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
> index 7ffc904c864c9..1255de484ab51 100644
> --- a/include/linux/mfd/rk808.h
> +++ b/include/linux/mfd/rk808.h
> @@ -1461,6 +1461,7 @@ enum {
>
>  struct rk808 {
>  	struct device			*dev;
> +	unsigned int			irq;
>  	struct regmap_irq_chip_data	*irq_data;
>  	struct regmap			*regmap;
>  	long				variant;
>
> -- 
> 2.47.3
>

-- 
Lee Jones

