Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08753606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fhpL5mxj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehO0nWie
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QPBj2OiHEsD8oSSw9ct6pezY21YN5Ixn4FQ3VxqCYUE=; b=fhpL5mxj6R/x8E
	CWSk9TIaz79Op603QaScB4jiV19llFVs2QhcPcjKP3PgqCF731l4k/kIpxpoAlLWE+dDKJul6Q+ze
	UY5ZsFq4Agoichjd6cwtgbVPOw4eX/B2Qd1YrAgW+zMgZWXNZOhsSIftAEcmh6r82byHQdHPN4Ohn
	2SHeVJkJXkI3FvlHCwXsrObOoaFrb/fo49E9BB+zuPqhSeJNKe2b7kYUgmXNkdg1BeIHKz8F4Hq6z
	7u0gIY01bzLQpmUac1cOj08/8uSZ5/6jPi/FsrLnNlFR8iHgGstCeB+2zAP6SzjsKRPM6K0g4mSNs
	Lq7lxyOFpgdN+iARgqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1si-00000003gZO-0sFL;
	Mon, 16 Nov 2026 18:56:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1sh-00000003gZF-0AMq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:56:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1861061E0B;
	Mon, 16 Nov 2026 18:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1041F000C4;
	Mon, 16 Nov 2026 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855401;
	bh=QPBj2OiHEsD8oSSw9ct6pezY21YN5Ixn4FQ3VxqCYUE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ehO0nWie3OgQn1m4ccsYGi9+2nJiGb+rA5FI+/MBk/fy+WAfsvXOSt4u5Ka1VxN6J
	 4L/OIo6XoAYx+2NzjpM7lKhHX4GXxaWpW9OXysumThPNdIGJulqh7mqX96IgbUUw+r
	 6HtDr83dLU9V+oFMFyRHxCqm9jxBLNYGQpWQyeKR7abWEZjxmcAWqdv6PB27UAUqvx
	 raIDiceFGm6kbbc9FY+n7oS6fgUS1txDFV8LnEh7XGbh8ktVdh7T4Azy9dUgNW1WmY
	 mJ/sxkXj3TfaXak9acb3qvrRMdpY+QU/0H6Vr1omES+5MOZRPV3j9cFpG+7qhYgdv1
	 a51cZQCev8NaQ==
From: Brian Masney <masneyb@kernel.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
Subject: Re: (subset) [PATCH v3 0/4] clk: ti: fapll/dm816x: clock tree and
 calculation fixes
Message-Id: <179485539142.153342.17977965808888261924.b4-ty@b4>
Date: Mon, 16 Nov 2026 13:56:31 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-ca76d
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=s8Tw7ZNGmtvgURa5ttmZPdTGfAUInI9PvqI1Tfk0Qig=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ+Bz6sPyjw6kPqxe2vGb5XS7+ptDe8wOtdqrf//X+Nk
 uJEx4kmHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkVYmRYUtnhMyV1OIHjudM
 6u+ZNayNeSk5q2Yiu0D51wuLj+XYpzH8T12XpyYSa/Ki8jmv7yTd+DKnL57n6prPrrljvGTGWVF
 fZgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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


On Fri, 13 Nov 2026 22:30:46 +0100, Ettore Chimenti wrote:
> clk: ti: fapll/dm816x: clock tree and calculation fixes
> 
> During TI DM8168-EVM board testing we found that the clock hierarchy and
> clock calculation was broken already on 6.12:
> 
>     main_pll_clk1       <--- main PLL should be parent of other PLLs.
>        sysclk1_ck
>        main_pll_clk7
> 		...
>        main_pll_clk6
> 		...
>        main_pll_clk5
> 		...
>        main_pll_clk4
> 		...
> 
> [...]

Applied, thanks!

[1/4] clk: ti: fapll: remove ti_dt_clk_name helper
      https://git.kernel.org/clk/linux/c/b8cec302edf5
[2/4] clk: ti: fapll: Fix clock speed calculation
      https://git.kernel.org/clk/linux/c/7f64adfdf118
[3/4] clk: ti: fapll: print clock name that fails to register
      https://git.kernel.org/clk/linux/c/9d081472626d

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


