Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055D3606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4vhWXCBK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgo3lIre
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0a7XVhGn17V8TFpaVOhUo8oPFMgmTGrO/81W2zXpJmE=; b=4vhWXCBKlX5NMy
	um+H61+1kA03zmjpqGWM+L/BJQngsTfVJxQ6BJa9kSawQyj9Dm63ls6eJDYePgSlv+lTwQ6TdlpRn
	gkt5NNolMKqx9FGwN3QmMrLaxyOqwfWUL1UscSV476UfbZD2zBW/WtJrwEMG9L06CDISKaG9he6Lw
	5EOFAXfJdtF24E5MMH7k2QucVnu6pNRAOHk+JSjD9FBhM8/o/vARXQMIVXcVoC5dM2s4Ebg0S/Xwj
	WhbkS40pujOrVMBgTYvu1yJOFu1PbqCfQX0Y1olROATe9Weu41SA0FUkB7XGOed+5Z/YezrM1LWwM
	zWNVApGnfgbhg2osJHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVfo-0000000HF3a-0EDM;
	Sun, 15 Nov 2026 08:33:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVfl-0000000HF3O-3c7G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 08:33:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5132560215;
	Sun, 15 Nov 2026 08:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D672E1F000C4;
	Sun, 15 Nov 2026 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794731593;
	bh=0a7XVhGn17V8TFpaVOhUo8oPFMgmTGrO/81W2zXpJmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Dgo3lIre3q7XG6O5LKbYyGKtZBbPw8+BzJSBCXZp8MBIns/SWJ3FWeI64HN5r6/jS
	 iNPy6I3xlxW34GoIcGrNNLDyUhHtxXLec4ezJecpVaiEl/p5sRqN8RT4bNF4nuvnof
	 6kWmkGxcIsuVD2HFa1JJRLKwg7lMevlGAIPNcC74W3tY+2NcqR/YsNOQqrEkl3/7CS
	 3ZhQ9c1gBvzCSOBmHFEltL85e8sjBvopTzy2pAHBP/LAUw+vap/8EIWTZsFEx755vi
	 5zBqy92Rqdl982HJiT5XQou01qVQF+yJRqYExa7NyDN+nlSepY8/Eh/vyBXc+iiamH
	 M+mGmHuW1mbpA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Ripard <mripard@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>, 
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate
 calculations
Message-Id: <179473159063.3023207.9708704432594076650.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 16:33:10 +0800
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

On Sun, 01 Nov 2026 21:33:36 +0100, Romain TISSERAND wrote:
> The N-K-M rate code computes parent * n * k / m in an unsigned long,
> which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.
> 
> On the A33, pll-mipi (parent pll-video at 297 MHz) with N = 14, K = 2,
> M = 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
> 4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
> picks these factors for a 288 MHz request, and clk_get_rate() reports
> 287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
> ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
> 594 Mbit/s instead of 288 and the picture broke up.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/1] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
      https://git.kernel.org/sunxi/linux/c/e9d9dae0d248

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


