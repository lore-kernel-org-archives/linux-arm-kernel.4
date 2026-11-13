Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C853606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 23:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O/6DSRSD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVHrIAPA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pXGSM9Y3EpP8jnrBzAJoxv43kXDNPaxem0R/Fx5BGmM=; b=O/6DSRSDjf2c1r
	9rLMgWnEkJ9lcqNuoXfbfbsQK9I4/8Buzik99hgogkpCf+3URykVZhhXrPwuU7u6btO+nbwbIu69C
	EnsNrpFVyXhzEdAPchQev+m6OghHr5VRdhq1WY2VoUhla5ubzJD7xE01XRyfYYu6Uh9LMmbxMdKKi
	z9HVkOU1cJNn24Yd69KSe+WOOLUJIYuIFjto+kII1UYPJhPoIt0lIExOMXFS6NkgEckjea0j4zb0l
	Hwbb1o4JES21qsCUcARUWqWTv4oB5+kXfa5pFXP3Netm5NWQSUfXP2NCXU39Wt/Z+v0rD1sXCcoIS
	+rfaqOBjPuS1di3nBUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0Tk-0000000En1L-0LVq;
	Fri, 13 Nov 2026 23:14:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0Tj-0000000En19-2Jpz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 23:14:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F7B8611C7;
	Fri, 13 Nov 2026 23:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2461B1F000C4;
	Fri, 13 Nov 2026 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794611682;
	bh=pXGSM9Y3EpP8jnrBzAJoxv43kXDNPaxem0R/Fx5BGmM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EVHrIAPA8Wn6pkqAi/ZJrxxnCngTzoj3f9VE7VrK5fQqQtpk3Vk+H50eYTjek62Vb
	 rkuPr4HAka6aT/QEzVS14ihKp4AVkV5n46BZnN4K+E5tFhOugKbJoZ7J8XaQGV82Mp
	 pD5j8zOc3lGY4n9V1YJZO80cQPx39ae8GP4gdbkgXwxDr8QxmQVOZCTncHhkY7XvR4
	 woDxioWwlHY9ycLUdUtvTYQlBP/yWXc7q03HrLrPqlgGC9kDlu1nvi7qryK/xddYcC
	 mPfeOY6Dk+COgktruhoKFA4uEN96yh5iTNJF/LBpet2i+9LqU68+tibm2tvVtd1Gd4
	 IYcJiNgBXOtmg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 5498C328C243;
	Fri, 13 Nov 2026 23:14:37 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] spi: sun6i: Add dual read support for the H616
From: Mark Brown <broonie@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com>
References: <20261110-spi-sun6i-h616-dual-read-v1-1-59bea5a897d4@gmail.com>
Date: Fri, 13 Nov 2026 23:14:36 +0000
Message-Id: <179461167656.590303.12402709871115244251.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=789; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rr0+rqD3HhJ16MSAH8jAU6LM9LnKj9iXMGerOv/Xe6k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+z7y79hmDSpxcRO3Lgh3ts9fdW/34mcq1FV9bp3Qeb
 N638egum45SFgYxLgZZMUWWuCzul/Ulr9fwHVzYBjOHlQlkCAMXpwBM5N0lRobPh8pUWG86us72
 KvAOWBaedufA7Yd/VQs18jcELY19+LWG4Z9lVk9+2DXFVJ9r5gJZkheL92zg/8j2QWqprv7X/bl
 HJbkB
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The H616 SPI controllers are bound through the "allwinner,sun8i-h3-spi"
> fallback, whose configuration advertises no dual or quad modes. The

> @@ -785,6 +791,7 @@ static const struct sun6i_spi_cfg sun50i_r329_spi_cfg = {
>  static const struct of_device_id sun6i_spi_match[] = {
>  	{ .compatible = "allwinner,sun6i-a31-spi", .data = &sun6i_a31_spi_cfg },
>  	{ .compatible = "allwinner,sun8i-h3-spi",  .data = &sun8i_h3_spi_cfg },
> +	{ .compatible = "allwinner,sun50i-h616-spi", .data = &sun50i_h616_spi_cfg },
>  	{ .compatible = "allwinner,sun50i-r329-spi", .data = &sun50i_r329_spi_cfg },
>  	/*
>  	 * A523's SPI controller has a combined RX buffer + FIFO counter

This new compatible needs a corresponding DT binding update.

-- 
Mark Brown <broonie@kernel.org>

