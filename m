Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F04C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RULNHUlZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LZIY7jhV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fDXUMKPJMrDufyiYxPC4NDHMrvqkg/Y3/64a4fBpYwg=; b=RULNHUlZsnBse4
	5/cII6PspS6amTqM259PauRZpJ9aQBaLmGmJC3ZRHDVrDtB/uj1Ft3yWN42oF7IQCfTvlh93uDx8t
	KGrwb+FjBfoh9XDuallw+pqbCQX2cKHw3RTLT5hnNr/HHI1GII8Uo9zynsunrJ/u8deYxdELmDcV2
	xtDCdSvmw8rVZzUYJq2phwgTcJXaMAh1UUbiuU+Qakz+JnlJFYnvnPQRRGzsWB/6JYZJIWFaCvvSt
	LBLMRU7Cx/sRpFItJ7HZjsPB/QPn/IEfvHs6UL5dRr1Qa+lKIq1oPusvjpgEr7enxJwQBRGMjlQr1
	chV2oL2qMqqT0sH1DFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0LH-0000000HMa9-09qk;
	Fri, 27 Nov 2026 18:06:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0KY-0000000HMOr-33yx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 300F962420;
	Fri, 27 Nov 2026 18:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CB71F00927;
	Fri, 27 Nov 2026 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802753;
	bh=fDXUMKPJMrDufyiYxPC4NDHMrvqkg/Y3/64a4fBpYwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LZIY7jhVSoraM3HaQ/qrctab3KAipDa6HW6vFLqAL+dqfJhQTBqBMM8+V72WLW6iI
	 cyJTxHzhkpv/G6QmJcyDtOo4qQz4OE0iL+qXERH6gIoBeRM8hdO0XpkzkrkKZFHyNB
	 6qNGyXAauptQjRd9yhHdJhojq0dmJZbFXknkHkssH6tSnEFIhXEO5cGBGRqTc+VHvd
	 zintHdH+xLbWeUdKuWWqRRL+Tr4qw0pc6CPgnk4/pVLziQJLJS7ezswhD/AvjN35YQ
	 MqanPq3amskOt/quBG/BcA1zrAQPXGzcHKlkFXyAkoOkF/A1c8VSkeAnj1aVwRbTEH
	 /C6Hjaclr2rrQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Raghav Sharma <raghav.s@samsung.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Sunyeal Hong <sunyeal.hong@samsung.com>,
	Shin Son <shin.son@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 11/12] clk: samsung: exynosautov920: Terminate PLL rate table with sentinel
Date: Fri, 27 Nov 2026 18:03:19 +0000
Message-ID: <20261127180416.3277544-12-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127180416.3277544-1-lee@kernel.org>
References: <20261127180416.3277544-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

_samsung_clk_register_pll() sizes each PLL rate table by scanning until
it encounters an entry with .rate == 0, then copies the counted entries
into pll->rate_table.  However, cpu_pll_rates omits a terminating zero
sentinel, causing out-of-bounds reads into adjacent read-only data and
populating pll->rate_table with bogus entries.

Append a sentinel entry to cpu_pll_rates.

Fixes: 59636ec89c2c ("clk: samsung: exynosautov920: add cpucl0 clock support")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynosautov920.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index a938f3cc7b57..7c4e9ab25624 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -1077,6 +1077,7 @@ static const struct samsung_pll_rate_table cpu_pll_rates[] __initconst = {
 	PLL_35XX_RATE(38400000U, 1152000000U, 120, 4, 0),
 	PLL_35XX_RATE(38400000U, 576000000U, 120, 4, 1),
 	PLL_35XX_RATE(38400000U, 288000000U, 120, 4, 2),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_clock cpucl0_pll_clks[] __initconst = {
-- 
2.56.1.839.g22a8290db9-goog


