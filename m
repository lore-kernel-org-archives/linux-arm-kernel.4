Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E711606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAu9fWIq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dePSpsDL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=drD5AYux/nAgyk5mlGZWKgdWplCkfZIFBpk/Bqx84bc=; b=MAu9fWIqH3PhA9
	aNkX0j6LqXlt/vGUAL196inVpoZcIpHjSqRBJsxJtKtJxvFJiuT30EbdrtdXaUUwDwySvaYpJDJNk
	/1IXGQB2OENBa8oOCUH5oEaSICIxw9/W0S9/l6bsMBCk8dcJ+tYmF9N9w5BXV+lNCDwG+JsEp5kSF
	qg8z9qLpl+MwrYUivHWKi6F7iUJvQ2PiCT3PFeWZJeLbS0ORidUV3DJQa8FTCZ00Tt8mfK4k13OmI
	5t/yq63rT5CtmdEbWO4z1nqHpMLk7EJSnU/TxrTP7fid8H4jcDgMgaEs5I5UL/ORVv4ZC4FyU4k8W
	GK7Qgbflrz5wTuECkGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0LG-0000000HMZz-3soz;
	Fri, 27 Nov 2026 18:06:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0KR-0000000HMJp-01SI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6931F6230F;
	Fri, 27 Nov 2026 18:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053CB1F00898;
	Fri, 27 Nov 2026 18:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802745;
	bh=drD5AYux/nAgyk5mlGZWKgdWplCkfZIFBpk/Bqx84bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dePSpsDLAvw7PlKB3kE245WttjoohRlSfbQ4Efe/p3We72Um/O3Qx3LhQ+mOKrUk9
	 umuyceNF6By6M6z8ONXbtnOZYx2TkblFNpKek2d9PHJ17QQI3YttdlZ35Ubh95kH37
	 Te1EHYqAPFVQqeLilGZbnwuFyBMqJlFDbnlTxcOC3woL3bH8a9t87uKYEswLWHL9pf
	 nOJRnKT0p1A8cPZsiEGh7gPMptfbKYT0x+D4gr4Su6j/m/1Ft012LlnX+uKVbSVzo6
	 JVQCc8w88GR+a6kTPjRgVAN11CuL5qjCc5JFq/KMb1VhLiE9vzpH2ocDQcaFuOtZgs
	 gYOIcqQ9zrK1w==
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 10/12] clk: samsung: exynos8895: Terminate PLL rate tables with sentinels
Date: Fri, 27 Nov 2026 18:03:18 +0000
Message-ID: <20261127180416.3277544-11-lee@kernel.org>
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
into pll->rate_table.  However, pll_shared0_rate_table,
pll_shared1_rate_table, pll_shared2_rate_table, pll_shared3_rate_table,
and pll_shared4_rate_table all omit a terminating zero sentinel, causing
out-of-bounds reads into adjacent read-only data and populating
pll->rate_table with bogus entries.

Append a sentinel entry to each of the 5 PLL rate tables.

Fixes: 9174fac3b302 ("clk: samsung: Introduce Exynos8895 clock driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos8895.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
index 259481c4276e..daf337f47e4f 100644
--- a/drivers/clk/samsung/clk-exynos8895.c
+++ b/drivers/clk/samsung/clk-exynos8895.c
@@ -478,22 +478,27 @@ static const unsigned long top_clk_regs[] __initconst = {
 
 static const struct samsung_pll_rate_table pll_shared0_rate_table[] __initconst = {
 	PLL_35XX_RATE(26 * MHZ, 2132000000U, 328, 4, 0),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table pll_shared1_rate_table[] __initconst = {
 	PLL_35XX_RATE(26 * MHZ, 1865500000U, 287, 4, 0),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table pll_shared2_rate_table[] __initconst = {
 	PLL_35XX_RATE(26 * MHZ, 800000000U, 400, 13, 0),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table pll_shared3_rate_table[] __initconst = {
 	PLL_35XX_RATE(26 * MHZ, 630000000U, 315, 13, 0),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_rate_table pll_shared4_rate_table[] __initconst = {
 	PLL_35XX_RATE(26 * MHZ, 667333333U, 154, 6, 0),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_clock top_pll_clks[] __initconst = {
-- 
2.56.1.839.g22a8290db9-goog


