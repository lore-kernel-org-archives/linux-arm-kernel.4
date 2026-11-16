Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F82606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mZUzGrK3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+J/+BLB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F4ur6QQF1zfwW0GccFtcSQ/AKccCErCW2OP1q88a0fY=; b=mZUzGrK3be5yTM
	x9wixgTznpnhs+H0tAuxFFqLK/Ud1XEO1JvFi5Y5CbWw5b0+hUt4Ty0VI7XyMDMbTyYsvDRHR3p1n
	no3LFYnefR1RtTiJcJPYpqoxSjEWNVdNrSQwWTWpbq9ix27XFUBFBCGq+xaiLy7Flz9InJLhq8P7x
	r4SS6bbSXexhVmQ/KWZepGoQXHslKiM9w+czGWCHsoPvcUbzEgjI3aNygfrv5q6ZXYXFWdE6u7KMs
	uaV9fPWHfW/Qe9VBlYfUhHy8EPOPysZMXnnVC7b4K2E6bWAeo3KAczcPoSz8u9+pV7p1YB7ypqye7
	BnuyIVylAsHzVcQTJE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT02y-00000003LVv-0nhW;
	Mon, 16 Nov 2026 16:59:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT02x-00000003LVh-01Eo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:59:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEBB14392E;
	Mon, 16 Nov 2026 16:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BF11F000C9;
	Mon, 16 Nov 2026 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794848350;
	bh=F4ur6QQF1zfwW0GccFtcSQ/AKccCErCW2OP1q88a0fY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R+J/+BLBz+v52V9EodmNskSXjI2QqourwXmDMgYvUbT0Ub4f/14FFzmxeLVLTXwDZ
	 X67lDVVo3CPtZYv7EqpPzrhrDECuAP2Yywv2k7CByL57487wrLHryTKwlT/I+Q26zP
	 mhaMxAJWvSgnVQh8Ls3ZPImmprsNBNi2bFt0jmEQhyzFdKq+Kod6dewfhoi0bTZ0nN
	 +AtP0/JKrPvy12U2L8HhD/XWZzfUU9xwhDrT35EnFaZza8C2RBL+vDfqWxNehBavKw
	 DRye2gVa0ew179KbWnn0t9Ryy30XfI0vvFls6xe73+QUZvRWh1NpjR3W+wJVj468S8
	 guvkwKmZ30QGA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ilya Titov <ilya.titov@wirenboard.com>, linux-clk@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
References: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
Subject: Re: [PATCH v2 0/2] clk: sunxi-ng: h616: PLL output gate and GPU
 notifier order
Message-Id: <179484834812.3674093.743014872311780954.b4-ty@kernel.org>
Date: Tue, 17 Nov 2026 00:59:08 +0800
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

On Mon, 16 Nov 2026 08:45:06 +0000, Arun Iyengar wrote:
> Patch 1 gates the H616 PLLs with their output enable bit instead of
> powering them down. Patch 2 registers the GPU PLL notifier before the
> mux notifier, as Ilya Titov's 0ec5e7572ddc did for the CPU.
> 
> No Cc: stable: the patch 1 crash needs out-of-tree H616 HDMI, and the
> old GPU notifier order never failed here.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/2] clk: sunxi-ng: h616: Gate the PLLs with their output enable bit
      https://git.kernel.org/sunxi/linux/c/5aae0639bcc6
[2/2] clk: sunxi-ng: h616: Register GPU PLL notifier before mux notifier
      https://git.kernel.org/sunxi/linux/c/3f8438336a3b

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


