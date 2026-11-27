Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C500606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4o6ajatM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PqNIOC6N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WtO56VJdoJ8x71AZKpomoEjXKBrkJ9C3gxPN3Oka1fs=; b=4o6ajatMMbhKOH
	s3o/PiMNfSpnyJic/Zfaa3s5ay7ATZ0o2b/e9dXAlJ+C2lfqpIF+9RPKZyawBMkCeTKdt9d+hRoCA
	RVb4CjKW0cKgvu8yY2jo8E4KHqWkmEHfYrpJF39VHSVBmrZqpC/qwQHfGHxlkm0w0UQtJVrK/A/ry
	q3nFUTfAX/WIK8/0tyZCo+ELhaQpmk2T15Fgk13K2zaGCMB3P4EVQIgPF0m/Jn3H1oK0Y4tGy2ZHP
	vZECgEpNVVTntRILuM4DDsZoyZZIT9qEFQzj9jpTKJdvZSz6W65stw3ATb0uzXAJNcUYUiyp6XYSH
	YAeO94Kc5gRb/3RvI0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0KM-0000000HMEk-058s;
	Fri, 27 Nov 2026 18:05:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Jx-0000000HM2s-12wU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF34062064;
	Fri, 27 Nov 2026 18:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848691F00897;
	Fri, 27 Nov 2026 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802716;
	bh=WtO56VJdoJ8x71AZKpomoEjXKBrkJ9C3gxPN3Oka1fs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PqNIOC6N48n6D/aVTXmPI3lG4b4TpwVT39vIKcnyP54a16Wvk2Jr3Q+lFRWkn9CuY
	 snFTbMBQ8JRW/TEX3JsI7bl/vImMetuvBwKWnDcGwK3gfS7HqdrPn3fV86ktCv3a96
	 RF3wjW3KOVq+3PUdib6btOOTVVhVbqJvjuKiMk9gatNnX6QigFB4a9WgPa/0Ko/+e5
	 ju8uMeQ0JWBOy6gN2EB2FbjNm5vfQ0FHhggIVqRNgiW05FZOHxNtAjV2MfVycDsPtj
	 M8496tJ9pLuPbRDAjRjqsL3XFoA0406sYkbZqo8L+Plgu+U92E1xTAFx+FQO2DPp2j
	 XaUvjcpzzDK6g==
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
	Rahul Sharma <rahul.sharma@samsung.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 06/12] clk: samsung: exynos5260: Terminate PLL rate tables with sentinels
Date: Fri, 27 Nov 2026 18:03:14 +0000
Message-ID: <20261127180416.3277544-7-lee@kernel.org>
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
into pll->rate_table.  However, pll2550_24mhz_tbl and pll2650_24mhz_tbl
both omit a terminating zero sentinel, causing out-of-bounds reads into
adjacent read-only data and populating pll->rate_table with bogus
entries.

Append a sentinel entry to both PLL rate tables.

Fixes: d39e55e06371 ("clk/exynos5260: add clock file for exynos5260")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos5260.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index 0a5959823370..8417321c1202 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -59,6 +59,7 @@ static const struct samsung_pll_rate_table pll2550_24mhz_tbl[] __initconst = {
 	PLL_35XX_RATE(24 * MHZ, 266000000, 266, 3, 3),
 	PLL_35XX_RATE(24 * MHZ, 200000000, 200, 3, 3),
 	PLL_35XX_RATE(24 * MHZ, 160000000, 160, 3, 3),
+	{ /* sentinel */ }
 };
 
 /*
@@ -83,6 +84,7 @@ static const struct samsung_pll_rate_table pll2650_24mhz_tbl[] __initconst = {
 	PLL_36XX_RATE(24 * MHZ, 133000000, 266, 3, 4, 0),
 	PLL_36XX_RATE(24 * MHZ, 100000000, 200, 3, 4, 0),
 	PLL_36XX_RATE(24 * MHZ, 66000000, 176, 2, 5, 0),
+	{ /* sentinel */ }
 };
 
 /* CMU_AUD */
-- 
2.56.1.839.g22a8290db9-goog


