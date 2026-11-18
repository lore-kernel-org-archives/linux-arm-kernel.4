Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB9606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X/RzbpfX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2dBeig7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FxeoPm60QVZSm59ulzAY58PXfMyI5k+SSmZhx0UOq5Q=; b=X/RzbpfXsvbaIY
	x9AIpZvazgF+DJXyC0bfF9hNC0Mz9adLU9BDlTq/3U6J7zGpUBO6jJnS58R67j76mXUXdw1b2QpH6
	rSB7LemabWS4IzGOIsnvXEyQJSuMwhbr7f7JAGyIidsnd1cFLsmUfqXpmXjvNTOLfS81eZu0tFqZ6
	2CQIFwSS3nLmsdVfkE2kgb2LvO/yHNfJIxVfrK2JsmS75GykUDfLOH6kQ/nrdLzJ611oyLHPACum7
	NWT7cVvQn/ytODs2QywoIYyVzj4YLMG5/to3+GOSv9QkxJvDH86F//69Rs6+QxWdyHZKlE1A15O0R
	k2Jx/3NeBUznhSczBFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTky1-0000000A4Cy-2JzL;
	Wed, 18 Nov 2026 19:05:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkxz-0000000A4CW-2Ks5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:05:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE87A46850;
	Wed, 18 Nov 2026 19:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB51C1F000C4;
	Wed, 18 Nov 2026 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028710;
	bh=FxeoPm60QVZSm59ulzAY58PXfMyI5k+SSmZhx0UOq5Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A2dBeig7h0YkWh6HUDt7R8Ja2BFbPmhxxju3lJ+ceYWprjBaAgEGWWCkd5FyuB/k5
	 ieIMepElfSib/pFL+BfgCcBytc2MPGX3Vr0LWzopFuMBE1RB3KBQFPlRKkrqjMu+US
	 WU9657uNXpAaEjeECZF2WwOm7C0xstCxfIPqmh20VM8U5S0ScvNkvGiNgAb+pKseUv
	 yv6TCSgGoV8tPQ4DG2664zqWwtMmiuX59hNLSNxBuB6mauOVegXO1L+6ju1kd0a0fY
	 GGI8LztAXJ1y98doEboXFvqy7QDp5kH/YkTKLC4nc7rRa/5fN+tfSQc3DvSBALxHCx
	 HnyECVzAtfSoQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261108-zx29clk-v14-1-48694e5a9d10@gmail.com>
References: <20261108-zx29clk-v14-1-48694e5a9d10@gmail.com>
Subject: Re: (subset) [PATCH v14] mfd: zx297520v3: Add a clock and reset
 MFD driver
Message-Id: <179502870951.74035.5648389534512059774.b4-ty@b4>
Date: Wed, 18 Nov 2026 19:05:09 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Sun, 08 Nov 2026 23:42:28 +0300, Stefan Dösinger wrote:
> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clock child will be driven by the already committed
> clk/zte/clk-zx297520v3 driver and the reset part by a separate reset
> driver.

Applied, thanks!

[1/1] mfd: zx297520v3: Add a clock and reset MFD driver
      commit: f0cf38211337b303ce5b86a474d44a1f5ed77176

--
Lee Jones [李琼斯]


