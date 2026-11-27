Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE11606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pVcb8mQg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0ag/05+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hJPmeFL4tUBd+lgcZ3/9m6XpdTjdrIyrjYdZJzGiKoM=; b=pVcb8mQgCJHZJ2
	9KaGO8AsLcBA88gashxGFaT3g2GHAWxSKzs7ackVIP5aezFlPh7ivaGZwxSL7F6+lf0fRO9iTHand
	sg1MsBF9BFAoV2Bj2p1PermKMJDCMt8ZmH3g+r0dlVenj+p8w3jbUC8BOGDr32t29A7m529Zrk8mz
	XoYdq5T2Q2oFASS4ErhEqsz9SPL14J3ObeibrUytaxQGI4wQFNodi7PDzXMGScPTai5tn1mr+MrDu
	sM+RkbeemIsanzCo9bzGlR9ommf/9c8Uc1ISBxQr5SIUPvCN8nYUmdFSZs7ROLLBnBtlpT1MFGnJ2
	Act0lwAAjBxMYwCBiCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0JW-0000000HLmN-0xBc;
	Fri, 27 Nov 2026 18:04:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0JM-0000000HLjb-2ZMv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:04:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2389E40BDF;
	Fri, 27 Nov 2026 18:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E0F1F000C1;
	Fri, 27 Nov 2026 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802679;
	bh=hJPmeFL4tUBd+lgcZ3/9m6XpdTjdrIyrjYdZJzGiKoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c0ag/05+vlxEMz1SZVuspjQvws451DB29LEdWu5I7+R8fxhxibje68o6vPIPMvgAZ
	 5/e2rJTAMu9saiao7eZQ7kfTa1G+ByTiQCFNrBCcQjX69LI76ba0CN+BiEZQoHhc1r
	 s2ZgLrxMagQdoRU7EQ0JiH0jYUQveKBsRk8661PUCqm8P48GkQUWZM5+LnrV2s3Eb9
	 WVEt30y9sw6JYxT+wPLwCV6GqWNGSW6NUbxlBTcBVQ4xPyRPlIaRzHii0p+kE9UhES
	 +w2lVy69NNcEYhwgyzy091ah01eFlx+ZbG41TY/G1/akZ8vr3OLlTYga9mlFi4Jpzq
	 tdMpToxBoWEXw==
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
	=?UTF-8?q?D=C3=A1vid=20Vir=C3=A1g?= <virag.david003@gmail.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 02/12] clk: samsung: exynos-arm64: Do not store ERR_PTR in data->clk
Date: Fri, 27 Nov 2026 18:03:10 +0000
Message-ID: <20261127180416.3277544-3-lee@kernel.org>
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

exynos_arm64_enable_bus_clk() assigns parent_clk to data->clk before
checking IS_ERR(parent_clk) or enabling the clock.  Because
exynos_arm64_register_cmu_pm() logs the failure and continues
registering PM callbacks, exynos_arm64_cmu_suspend() and
exynos_arm64_cmu_resume() later pass the error pointer to
clk_disable_unprepare() and clk_prepare_enable(), causing a crash.

Only store parent_clk in data->clk after IS_ERR() and
clk_prepare_enable() succeed, and release the clock reference on enable
failure.

Fixes: f05dc2024316 ("clk: samsung: exynos5433: Extract PM support to common ARM64 layer")
Closes: https://sashiko.dev/#/bug/linux-d237d28a-7387-4379-9bf4-331a7052082c
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos-arm64.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index 35d4de233cc1..360bd5d8421d 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -149,25 +149,33 @@ static int __init exynos_arm64_enable_bus_clk(struct device *dev,
 		struct device_node *np, const struct samsung_cmu_info *cmu)
 {
 	struct clk *parent_clk;
+	int ret;
 
 	if (!cmu->clk_name)
 		return 0;
 
-	if (dev) {
-		struct exynos_arm64_cmu_data *data;
-
+	if (dev)
 		parent_clk = clk_get(dev, cmu->clk_name);
-		data = dev_get_drvdata(dev);
-		if (data)
-			data->clk = parent_clk;
-	} else {
+	else
 		parent_clk = of_clk_get_by_name(np, cmu->clk_name);
-	}
 
 	if (IS_ERR(parent_clk))
 		return PTR_ERR(parent_clk);
 
-	return clk_prepare_enable(parent_clk);
+	ret = clk_prepare_enable(parent_clk);
+	if (ret) {
+		clk_put(parent_clk);
+		return ret;
+	}
+
+	if (dev) {
+		struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
+
+		if (data)
+			data->clk = parent_clk;
+	}
+
+	return 0;
 }
 
 static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
-- 
2.56.1.839.g22a8290db9-goog


