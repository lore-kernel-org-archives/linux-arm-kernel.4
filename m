Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDBE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 22:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h+V5nnP4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAmfgtHb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CidRQbh2gFHizXgn/3nltDcqC87nf+9JADmfwJgFtmU=; b=h+V5nnP4lJutLX
	g+S+sZqOK2FQlp2ECx8UxkErf57lWeNl6YtA7i7bUZQn5xYVPK5oMqwHXd/Cf7pu5+0Rf32mYLGkD
	PBWsb8vcsJX8q7PuldnDrqwRMuZv1mpSmiFKwgaqnWcWmwahZ8+GtlC08a/TPsbtYVxw6OFfq6I1Q
	ne/BFAHL2iqypbu9LzXr6zPAix0dv7xmTNGmSZrUfvx0S/eMBQ3aXtvXx26gfcH8MWZgpnKIJl4Ak
	Md6LYJqhNkUPs7+mS5MmEqRTyOcWBTzS54iNLS0LulA66yMHzKIWCEDancIpNPXgm9A95HBRimyH7
	7aj/Wz4wzLIJEnGfLEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXSM-00000001qCe-00gq;
	Mon, 09 Nov 2026 22:03:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXSK-00000001qC6-3lhL;
	Mon, 09 Nov 2026 22:03:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A7A4415E8;
	Mon,  9 Nov 2026 22:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2941F008A1;
	Mon,  9 Nov 2026 22:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794261792;
	bh=CidRQbh2gFHizXgn/3nltDcqC87nf+9JADmfwJgFtmU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IAmfgtHbahuGzrwt5S2CdtfDct24IdyI/F871t2gLdvbcQ+AEpi7VJeNnr2npNsnz
	 aa5bmAB0UYBFCgenmJYp7R8/m2M9So96P5oiC77kQ/ismwwhBuNQBNjAx1YE3aQI7R
	 BMnFCK+ZI/MwfeYcxrHrpQsrYvXgYvHILyE/ZCKiw0VAFE8eluxASb0iQ4t8a+cs4Y
	 BMnB2wdQYvtW/k9bHw1I4+9LHwxt+dw53BWShkGQR2ncaSoBW3lakC6o5BVnpPHVXv
	 lueCwILLcFZGlBbgz6qK44f8S0X9TsMZpXMUG66nZq+53aBvWY1FekSyBW5L3fZgye
	 ZhXC+eK7zvyYA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 58F803021CAB;
	Mon, 09 Nov 2026 22:03:04 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] spi: Add infrastructure for atomic sync transfers
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: broonie@kernel.org, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 quentin.schulz@cherry.de, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>
In-Reply-To: <20261106181824.1361235-2-heiko@sntech.de>
References: <20261106181824.1361235-1-heiko@sntech.de>
 <20261106181824.1361235-2-heiko@sntech.de>
Date: Mon, 09 Nov 2026 22:02:46 +0000
Message-Id: <179426176654.3711751.13650000545363860741.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8xKsPk8JaGfgfmUb29t/RDu26Xy0LDupWmUhlaAY30w=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+ObNvfR+/817uz8PL1hzcrH1cv1/ocbNUVEu6iHWq3
 oqNTRP7O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAnCTrzH8lXD7pL/kaXrA0U8B
 m6535QdI3HouG9gowKfs6lxWkTFdk5GhtbXsHcPV+J3HV99jKFv/Ji6krsziqWyz0zE3/r8+G30
 5AQ==
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

> There are cases where SPI transfers are needed during times without
> interrupts like shutdown when a PMIC should turn off the system.

> I2C already has atomic transfers for exactly that case, so introduce a
> similar concept for SPI. Similar to I2C, this is and should stay a
> corner-case, so is only allowed during the shutdown stages of the kernel,
> when interrupts are already turned off.

> So add a in-atomic check stolen from I2C and an optional transfer_atomic
> callback drivers can implement to do immediate uninterrupted transfers
> and let spi_sync() determine if the state is late enough to use it.

> spi_async() does not require a sleeping context for itself, so while it
> could in theory also be included, its called waiting for the completion
> can sleep, so would still cause the splat about it.

> +static int __spi_sync_atomic(struct spi_device *spi, struct spi_message *message)
> +{
> +	struct spi_controller *ctlr = spi->controller;
> +	unsigned long flags;
> +	int status;
> +
> +	if (!ctlr->transfer_atomic) {

We do have some existing users that appear to rely on using spi_sync()
to power off like SC27xx.  I suspect they are tolerating the splats, or
just don't work, but either way we should try to preserve the current
behaviour for them.

> +	status = spi_maybe_optimize_message(spi, message);

Message optimisation may try to do things like allocations that are a
bad idea in atomic context - it seems safer to just use the message as
is in this context.

-- 
Mark Brown <broonie@kernel.org>

