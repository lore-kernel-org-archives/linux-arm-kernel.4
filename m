Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D57606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wLmgmxF/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BN6v2nd9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LN7OfULWwyuiTNDpJx71gHGXtOMINgXhvBjanVT0HKo=; b=wLmgmxF/8Ru2SN
	ZBtP9JZxNoyLxAsdlqiVp9bc5KA8FTRkkocznf17WyJz+W7OrApcSQR2f4mJB+l0XvU6APiHyzvIN
	cDf49lbXHpxPNrkiU64mJp2dPD2+HjcBGXK7uwvJopXcSu134qGSq7B60X2CjTKiBnvowCo7RQmW6
	g3kRotXBgtJKusmXUqc7QoWVASq94FqBXIRDDU9riiaWYpS/aW0JVZsTTQJpVipLxIdk/O5wjnU9l
	jWAC1JSnWaJktFwX4gaKTgayOs4JUvNTHy9tx4wryB8nsIGEusIaQLulW49N1lc0KqZkrupAJDYnO
	6ujsDOx3KbINLeix8jdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSeL-00000001H0m-1E0d;
	Mon, 09 Nov 2026 16:55:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSeJ-00000001H0W-1igg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:55:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D6B743E90;
	Mon,  9 Nov 2026 16:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2881F008BD;
	Mon,  9 Nov 2026 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243315;
	bh=LN7OfULWwyuiTNDpJx71gHGXtOMINgXhvBjanVT0HKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BN6v2nd9yb9AboaWPxCoS6KZKzGGNZ7nOKlwF+761IoJ9vNo1e7/YJAKzpidP5rJG
	 psZsEfO2xg1d661Xm1ufeEwaYLhE2lTWWuhdmEYfEe4qA2LY4c5C9yIvn3VNmmijBb
	 c5qduoFYJ3Z82DLBioBD6fw9qw7Cdf/UXy8lSlTm6oJ/LzEPIPYBvaJX/6EQaLLJQd
	 V98yUgcmcBwwLXNlaDo+k4RkwxpxOaXR2Ge5fv7/uDM80kLCG+HpQChH/k2drcjdTz
	 UiqG4PHwsFKwJvaGynZjW7EOT0Q5UBq177/DWLGSjsYvj3PfL9fUJlGngQCb1xDHSw
	 17jlWOlzuHdZg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104185027.883011-1-jernej.skrabec@gmail.com>
References: <20261104185027.883011-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h6: Let the SPDIF clock set the audio
 PLL rate
Message-Id: <179424331293.1081044.6611467485377241437.b4-ty@kernel.org>
Date: Tue, 10 Nov 2026 00:55:12 +0800
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

On Wed, 04 Nov 2026 19:50:27 +0100, Jernej Skrabec wrote:
> Unlike the I2S clocks, the SPDIF clock can't change the audio PLL rate,
> so it can only divide down the rate the PLL already runs at. That covers
> only one of the 44.1 kHz and 48 kHz sample rate families, and the other
> one is sent at the wrong rate.
> 
> Propagate rate changes to the parent, like the I2S clocks do.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/1] clk: sunxi-ng: h6: Let the SPDIF clock set the audio PLL rate
      https://git.kernel.org/sunxi/linux/c/280af24c8605

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


