Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA5606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 04:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eUDzNISn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtZznDKI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dRexF36N57Z46Z1WRdsd2m/GPXEarnkSgvBnWou7EuA=; b=eUDzNISn4Bp8Pn
	7PXQdoMos3pk+aLaSbux3CgLEFPajb57hfdw2e2pKMVkReNLoMuj1oEnwHE94uWDoKnbr6kb1qJg2
	PB4sreLUBOlUkeT4W4We1nt8YuAWKfbzSuKNuyt/KICk8ucXh9xxyQV3zIcBpW7H1hBKC7zDhO+9J
	I5Ds1cXM6KCnAOy3DuBSoFDSbpkDrPngyGAWGnMZC2GBdqRX1WRY8s+zSdG/1pDN3TQQzBk3KZOSY
	lZOkyrl25Cqbjo3N2Pm3EF6+v5IdGB/ggyXyVIpRphr2YskEiCMoJFjHAN3LbGiXUJ5Ql19hloaJY
	5GhSy45VUbHbKmaDV+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPXa1-0000000EA92-0L7l;
	Sat, 07 Nov 2026 03:59:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPXZz-0000000EA8v-1Ado
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 03:58:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8641441B6A;
	Sat,  7 Nov 2026 03:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A45C1F0089F;
	Sat,  7 Nov 2026 03:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794023938;
	bh=dRexF36N57Z46Z1WRdsd2m/GPXEarnkSgvBnWou7EuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DtZznDKISdnKZ0FGYvWYiT5NSn+rIogg1rCnMr8u6Z2eY2+D4VWOi7cEJN1+OcZEf
	 ltIqVeyCdy3Z0TWV6Dr2vfXfUBOdIQqcAWR+Z13aDYb1Wmd81QPIpQRfZOXu4pNIXc
	 PDSf9dLQA/voAgEe/589gopb5Sl25HwhZNXQA/AUFx9iaZ9gC9gI0jOYMbe2IdaiPg
	 W6CMADXkFe2P3SgkGMaxVZYd6FsGufDGiCQ7Q5mbQ4C8KrpzxinPEIK4VQWyXFFzpZ
	 oALunCcd2IEriAcRxIhF6v04rQ/yA4hP5iV9r68a9BvOWPQPlTck8iuJzF+xRSnm6o
	 j6M0CO69YXtcA==
Date: Sat, 7 Nov 2026 03:58:51 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Joshua Crofts <crofts@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Eugen Hristev
 <ehristev@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Haibo Chen <haibo.chen@nxp.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 00/10] iio: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20261107035851.0c8cb3e5@jic23-hlaptop>
In-Reply-To: <20261105121635.1612-1-crofts@kernel.org>
References: <20261105121635.1612-1-crofts@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu,  5 Nov 2026 12:16:25 +0000
Joshua Crofts <crofts@kernel.org> wrote:

> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
This sort of series I particularly like.

Applied!

Jonathan

