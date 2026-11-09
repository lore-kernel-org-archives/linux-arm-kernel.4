Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 22:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TtyBMwvH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4XcDj/y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5fhIsFIkZ4LdQ5n51OKo+Ec9EiIwq3J+ggnXRosBuV0=; b=TtyBMwvH0+dG0o
	UvA796mcLznSNtF4G0putKX9bdliE5S9xw5yQzGOKKIgZj/VhHFSlr8EUR0jq3QlLftu0TheRmGJs
	wPr2g27QlipjCPxZAbCtSma3V/+SdjQe5EVJVDC0ZnYnUDa4whTfnJVfQSXmXJR+37Ze4NzUmU7ye
	TNadbdU49++JBQBt2WsfEEbuOhh6Xbg9nHLGRoXYyM0PxZ6kbwo7in/K2mgmfxIu/EwIhGkx0Sxqa
	G5nk1tCWPnQqkzR/UeTPzhXNXKG//W8GDDT0xKwHxACoR0dOi7pTKmgAdUBq49I8Iz7QeblmfjZ3a
	88Hiz21c0WmcNk8tYKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXSQ-00000001qES-3Kvb;
	Mon, 09 Nov 2026 22:03:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXSL-00000001qCP-2Wkl;
	Mon, 09 Nov 2026 22:03:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF2F962F4C;
	Mon,  9 Nov 2026 22:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC961F0089F;
	Mon,  9 Nov 2026 22:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794261792;
	bh=5fhIsFIkZ4LdQ5n51OKo+Ec9EiIwq3J+ggnXRosBuV0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=M4XcDj/ySUy93StASaTwfHJCKkLzlAXG3gXwjwZyy8v9Q2+ByiEfj7UTrrSMq6yss
	 ig73Vs9xRVrorca0tCIh13fQ0SqfMn5ajSZHQ2g9Ajp6PAjxKf2mZGRwr06xTfy+BX
	 0LNdDN3ccKH8Eftn7HEY3b7WPIOU1RKDAts2Y+OQ6JwayWv2Js2b9Yx4LnBTJqiEUI
	 twyhFzWSoSKEWliXejADbCeL9n3LrquRDii626pN8ZU+bsawOmJUWIjzFVUiM9U5Ji
	 6JmnI6iJ5WYUlgb7/IqJ4kJuAAxuCopiqfSmWWELnsH/4rq3d/ijbPIRV2+e6iqHxo
	 s4Mihtv3dprew==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 605163021CAC;
	Mon, 09 Nov 2026 22:03:04 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] spi: rockchip: add an atomic transfer function
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: broonie@kernel.org, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 quentin.schulz@cherry.de, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>
In-Reply-To: <20261106181824.1361235-3-heiko@sntech.de>
References: <20261106181824.1361235-1-heiko@sntech.de>
 <20261106181824.1361235-3-heiko@sntech.de>
Date: Mon, 09 Nov 2026 22:02:46 +0000
Message-Id: <179426176656.3711751.13626253291583121519.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hIdjP33i7ScW9DXNN0xZU7V5Fza7A95kmMy3uYeIb18=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+OUvc4lNbkP3sc6jhaq/Fx8JWX9zW1DyhW/PrN5svN
 osuaF9K6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE3gowMlzjO79gTU6ohNQG
 gXstlt9NDnAI33Rf1JmoOvnD/s7Cg/MZGWaEcD7IEPlb/vyUj/eJWd56PWcfGFSIVb6ybvQMYyu
 Yxw0A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Rockchip SPI controllers are often used to handle SPI connected PMICs that
> also handle system power-off events, like the RK806.

> +static int rockchip_spi_transfer_atomic(struct spi_device *spi, struct spi_message *msg)
> +{
> +	struct spi_controller *ctlr = spi->controller;
> +	struct rockchip_spi *rs = spi_controller_get_devdata(ctlr);
> +	bool cs_en = (spi->mode & SPI_CS_HIGH) ? 1 : 0;
> +	struct spi_transfer *xfer;
> +	int ret = 0;
> +
> +	pm_runtime_get_sync(rs->dev);

The check in spi_in_atomic_sync_mode() is true for SYSTEM_RESTART and
SYSTEM_SUSPEND which would get rather messy if something ends up with a
device that tries to do something in there.  Not sure if that's worth
worrying about or not.

> +	rockchip_spi_set_cs(spi, cs_en);

This won't DTRT with GPIO chip selects, that's normally handled by the
core.

> +		while (rs->tx_left || rs->rx_left) {
> +			u32 status = readl_relaxed(rs->regs + ROCKCHIP_SPI_SR);
> +
> +			if (rs->tx_left && !(status & SR_TF_FULL))
> +				rockchip_spi_pio_writer(rs);
> +
> +			if (rs->rx_left && !(status & SR_RF_EMPTY))
> +				rockchip_spi_pio_reader(rs);
> +		}
> +
> +		wait_for_tx_idle(rs, false);

This uses jiffies which don't advance in poweroff, and there's no
overall timeout here.

> +		if (xfer->cs_change && !list_is_last(&xfer->transfer_list, &msg->transfers)) {
> +			rockchip_spi_set_cs(spi, !cs_en);
> +			ndelay(10 * NSEC_PER_USEC);

udelay().

> +static int rockchip_spi_power_off(struct sys_off_data *data)
> +{
> +	struct rockchip_spi *rs = data->cb_data;
> +
> +	/* enable controller for possible calls from shutdown handlers */
> +	return pm_runtime_get_sync(rs->dev);

Would it not be safer to just eat the error here rather than refuse
poweroff?  Also pm_runtime_resume_and_get() is the more modern thing.

> +	ctlr->transfer_atomic = rockchip_spi_transfer_atomic;

The driver supports target mode as well, probably best to only register
this for host mode.

-- 
Mark Brown <broonie@kernel.org>

