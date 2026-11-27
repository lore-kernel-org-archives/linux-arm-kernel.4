Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A33606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u/BDefKL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GMRgcfc4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ev4/79lezZGUalRaCRxsS6Gn+Fl+AdLb3ry7Ayy3jz4=; b=u/BDefKLA8NsPO
	YV3vbZPSu8eEJMpO6+TABREWJZaLYbKXToWl5u7ohGUePnhzxBt2vjZfSapbNZSFyJ95PdF2jMwHQ
	5cJxkahnIR52w49iB7C+JBYnhKJPyVSSNMIXhsDCRgr/FwblFzg8BsEWa1yV/ThguLIt/9DHHLV/a
	n220IOAvorfxoiurv7l6mJxg2fQli5AO2R8h5SUKEqPzw0pTqIKOFg8/s+3LJ3JRY+qWBELnksnge
	M3UtU4sxLZ3tmh6YK+c1Ks4mA5xyJeebKkzyX97C+aRP1n2F7wzAxu1wbykBsyEqMI3VTQLl8LqKd
	WnqOHbIcNXBMc2Ewu1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Jq-0000000HLxf-3LgK;
	Fri, 27 Nov 2026 18:05:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Jh-0000000HLtS-1kUq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:05:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C5C643A18;
	Fri, 27 Nov 2026 18:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C411F00897;
	Fri, 27 Nov 2026 18:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802700;
	bh=Ev4/79lezZGUalRaCRxsS6Gn+Fl+AdLb3ry7Ayy3jz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GMRgcfc43cGYsQ6hN0eNTI5tDt743WMHsEJC+LGalD7orx5aE3O4g9Kt+gdD4Bu4K
	 cGI3TIxr38zxEFRFB7YBTZ4UHv6YQ7dwBm4NEUzwzgrRXLERTqC4dShwI87N3cDGpQ
	 ZpZHeev1A8xuLaLu5Jwvuysgah5nRyU0LTpGgDdG3KIYr4JWtZAMrOc187IZ+h8E66
	 YCUF5RkRDz4nPhPEkYn/cNiPr42/Yg2mVuOBD0gaeGuV9MJ8CIJJNXNLIlX5lqbOcO
	 lr+suu9Uro/Il5rp/BLeS7WIBsX6KHmOqGNGgqIKZiOQ0ZphLqT1dWffKI1yORZdNt
	 CoQ4miZHKbdfg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Ravi Patel <ravi.patel@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 04/12] clk: samsung: artpec9: Terminate PLL rate tables with sentinels
Date: Fri, 27 Nov 2026 18:03:12 +0000
Message-ID: <20261127180416.3277544-5-lee@kernel.org>
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
into pll->rate_table.  However, artpec9_pll_audio_rates,
artpec9_pll_cpucl_rates, and artpec9_pll_fsys1_rates all omit a
terminating zero sentinel, causing out-of-bounds reads into adjacent
read-only data and populating pll->rate_table with bogus entries.

Append a sentinel entry to each of the 3 PLL rate tables.

Fixes: 85cc5be65b82 ("clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-artpec9.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-artpec9.c b/drivers/clk/samsung/clk-artpec9.c
index 2eaf8117638c..aee5a9283de4 100644
--- a/drivers/clk/samsung/clk-artpec9.c
+++ b/drivers/clk/samsung/clk-artpec9.c
@@ -176,6 +176,7 @@ static const unsigned long cmu_cmu_clk_regs[] __initconst = {
 
 static const struct samsung_pll_rate_table artpec9_pll_audio_rates[] __initconst = {
 	PLL_A9FRACO_RATE(25 * MHZ, 589824000U, 94, 1, 3, 6238440),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_clock cmu_cmu_pll_clks[] __initconst = {
@@ -490,6 +491,7 @@ static const struct samsung_pll_rate_table artpec9_pll_cpucl_rates[] __initconst
 	PLL_35XX_RATE(25 * MHZ, 1400000000U, 56, 1, 0),
 	PLL_35XX_RATE(25 * MHZ, 1100000000U, 44, 1, 0),
 	PLL_35XX_RATE(25 * MHZ,  850000000U, 34, 1, 0),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_clock cmu_cpucl_pll_clks[] __initconst = {
@@ -815,6 +817,7 @@ static const unsigned long cmu_fsys1_clk_regs[] __initconst = {
 
 static const struct samsung_pll_rate_table artpec9_pll_fsys1_rates[] __initconst = {
 	PLL_35XX_RATE(25 * MHZ, 2000000000U, 80, 1, 0),
+	{ /* sentinel */ }
 };
 
 static const struct samsung_pll_clock cmu_fsys1_pll_clks[] __initconst = {
-- 
2.56.1.839.g22a8290db9-goog


