Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14BB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uARO2/v1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahOqZNj9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RX9M2Q9yHe35cQMeMTw9O3Neu5+DoenTf9tNEWOOjXg=; b=uARO2/v1WJix6n
	JyPyBAS+aOGTZxvkekvu8K/zGzUc8kl1xmZ1lbnoxhwDCL/j6PQyowGjVCiIh5jyGN5xMuljDoqDz
	QVU7ssd2wTP0yZi8fH/8cpoZxFl5remCWXhQmtaE+yEdJbu+aFnJtIvUmv2AoDWYELGgzCGSRPr9N
	X/HZGOGvttzKGcTfnzM5XovScShjC4ii3K5NuJeEZ5xB+F+FpkfFIdPCiPM4qMWZAC31NbwGaunWI
	4dCsdHqmMy+fiCz+OWL0xJ0aA3h0giRxURC9knOTbIkAmB8deHmJF4tWRbKlK5/EVfQk/5xyCnGIk
	xpq9g2lVxDW+cTsEB1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWjq-0000000HLOK-25Ac;
	Sun, 15 Nov 2026 09:41:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWjo-0000000HLOC-2qzq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:41:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E84743A57;
	Sun, 15 Nov 2026 09:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2BE1F000C4;
	Sun, 15 Nov 2026 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794735687;
	bh=RX9M2Q9yHe35cQMeMTw9O3Neu5+DoenTf9tNEWOOjXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ahOqZNj9pHkSthlPWL8OW7Aua6Zten/GwqyJ51FQc4krJQmLsf5YcdAdb344vBMFG
	 br0JsDqDkTEHpDedsRkPDwFRIyQtnkBdEHMykVmgywDidDfX1jOJ0O/uMiMSqQROoI
	 kqHtQJzDtM1T0ec8M73V41Ag+ObF51sAO+CJaiifEpdWSgL3Wj1sBvtUdfdaYDzPJV
	 wEzAOfqEXdWySoa/fLIOs2Xef9z75uh5WnLcn2k2PVhgRkceJC5GCtHrCF0nWngSrp
	 1OeYGrrDFXJ8hXdvp1PFygJ81LX6RMrtmml9ea3MMAEcKGpfohutqUZHuvzoSo+qkC
	 rm7cZf8mf4qGw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261110163904.1098187-1-jernej.skrabec@gmail.com>
References: <20261110163904.1098187-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h6: Keep both parents running while
 switching VP9 clock
Message-Id: <179473568594.3056166.4191724693999844076.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 17:41:25 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 17:39:04 +0100, Jernej Skrabec wrote:
> The VP9 clock mux only switches while both parents are running. Its
> reset default parent is pll-ve, which is off at boot. When the Hantro
> driver sets the clock rate to 300 MHz, the clock gets reparented to
> pll-periph0-2x, but the mux doesn't actually switch until pll-ve is
> enabled for the video engine. Until then, the VP9 decoder has no clock
> and every frame times out.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/1] clk: sunxi-ng: h6: Keep both parents running while switching VP9 clock
      https://git.kernel.org/sunxi/linux/c/b6844de23cd2

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


