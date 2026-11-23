Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F9606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yyDN4ggr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGez+3Tb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S1Gp2Tv8FiLL9zGaZkwNFKOWLqDNS1bHIMrQXS8jtIQ=; b=yyDN4ggrrowrXs
	Hw2CWxSKyTlgA3ILPA6dPXvAZlMsZvYbWnHdFWeURut5Q1JSyAieMdTJW72heU5RMQnZZCrBII3t3
	Tus8c9eznHlSc3yMSh/oEk5+d4HyIhTdQlZimD+uOmSXulXlmSpjxVl/miiU1FAymqrR6FwnMoboD
	UYQs7jrpGmv7If8ykYFpq8HYrcJAQNWybR4PTVjoVtl7S/35+roNJxemxPE4dr7RhEHbFyPTGmUYp
	V0oMZ2pPXB/qjoZTQ0ap4nzpE5GFOC6BI+zEyZqTYMLF1YTgKNuiNG238dVTqt7OWYUseQUzuTVol
	uoIxQqDJznLwmbWaZ9Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXEX-00000004FVn-2hYE;
	Mon, 23 Nov 2026 16:49:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXEW-00000004FVM-2UEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:49:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 598D642489;
	Mon, 23 Nov 2026 16:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEE51F000EE;
	Mon, 23 Nov 2026 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452576;
	bh=S1Gp2Tv8FiLL9zGaZkwNFKOWLqDNS1bHIMrQXS8jtIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WGez+3TbhzDNmdt3TH3qQ2mUFSBDqJipZdrUehk+BuWGlCZygu3oxgjQAavQVtsu/
	 +OysUCxOj/tDJTC7Kl2fFGLJEZJ83KK3yP7eEehbi+PGQVLDf300s85Z4+F0Bekk26
	 +bb3PTVFJ6WBZsSKZ8O0L1IY4fvnerVFsVA79cZuINjM6RCckp0A/3LFH2PrRETDes
	 NR81R+HKsMKHm7SZIdaYCV6IXdBKb+ooanP0zaUYm5rfqwCWd2Ylnt9SfqqcO5Fn24
	 Ixqnj6MB/a0mXHnqHvCCdAI0fgOV0ne8wzS5dZnkTEVCpxWqtcTzHsJtSFNor2q6Ls
	 MEJbNoTnIQL3g==
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
	Thomas Abraham <thomas.ab@samsung.com>,
	Chander Kashyap <k.chander@samsung.com>,
	Amit Daniel Kachhap <amit.daniel@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Marian Mihailescu <mihailescu2m@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 07/10] clk: samsung: exynos5420: Terminate PLL rate tables with sentinels
Date: Mon, 23 Nov 2026 16:47:40 +0000
Message-ID: <20261123164834.3330320-8-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123164834.3330320-1-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
into pll->rate_table.  However, exynos5420_pll2550x_24mhz_tbl,
exynos5422_bpll_rate_table, exynos5420_epll_24mhz_tbl, and
exynos5420_vpll_24mhz_tbl all omit a terminating zero sentinel, causing
out-of-bounds reads into adjacent read-only data and populating
pll->rate_table with bogus entries.

Append a sentinel entry to each of the four PLL rate tables.

Fixes: ca5b40293822 ("clk: samsung: register exynos5420 apll/kpll configuration data")
Fixes: 9842452acd3d ("clk: samsung: exynos542x: Add EPLL rate table")
Fixes: 8b4a7acf7b30 ("clk: samsung: add BPLL rate table for Exynos 5422 SoC")
Fixes: b92981de92cb ("clk: samsung: exynos5420: Add VPLL rate table")
Closes: https://sashiko.dev/#/bug/linux-553831f9-0a7b-4e94-be60-222de60ca8c3
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos5420.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 400a5c59815c..35baeabf3ccb 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1419,6 +1419,7 @@ static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __ini
 	PLL_35XX_RATE(24 * MHZ, 400000000,  200, 3, 2),
 	PLL_35XX_RATE(24 * MHZ, 300000000,  200, 2, 3),
 	PLL_35XX_RATE(24 * MHZ, 200000000,  200, 3, 3),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
@@ -1430,6 +1431,7 @@ static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
 	PLL_35XX_RATE(24 * MHZ, 275000000, 275, 3, 3),
 	PLL_35XX_RATE(24 * MHZ, 206000000, 206, 3, 3),
 	PLL_35XX_RATE(24 * MHZ, 165000000, 110, 2, 3),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
@@ -1448,6 +1450,7 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
 	PLL_36XX_RATE(24 * MHZ,  49152000U, 197, 3, 5, -25690),
 	PLL_36XX_RATE(24 * MHZ,  45158401U, 90, 3, 4, 20762),
 	PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
@@ -1459,6 +1462,7 @@ static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
 	PLL_35XX_RATE(24 * MHZ, 266000000U,  266, 3, 3),
 	PLL_35XX_RATE(24 * MHZ, 177000000U,  118, 2, 3),
 	PLL_35XX_RATE(24 * MHZ, 100000000U,  200, 3, 4),
+	{ /* sentinel */ }
 };
 
 static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
-- 
2.56.1.750.gf70dc682cf-goog


