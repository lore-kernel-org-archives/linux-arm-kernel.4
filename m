Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05375606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/eqUxTA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ne+u+HRj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qe14tgxTCMfnyxp7bch1qUtRx5SdNgj5ROLZ22SbLsw=; b=t/eqUxTAAo5Ye9
	MnqXrBc5L4H9zsbBqhqbRH01eQ0EsikGz/i2AZXuHJoCQ+qcohxXWaM72QqDkQ1I+HDCoLokOcbvw
	/5NaRXfbsWEnfxWK4X/r8h4amca63r35a7Ui9L9n0uBT0tN4UrJn4P1rAzpr9FNw4RXVTuyVkl3zi
	E6KJYRrbVE9ZfwSR3XpRgtuy/ngRrqvhZVqWWxgymMTSLPCittHxjS8zpHcK0ZEizzBKod+zB8+3W
	RY3mZBgL3j+ZMEnODEOIAqDGlf1SPEuLMSYG6fxtWAorgVxELtuolqDZwVPwLvosfe8z4BbXD6c/E
	T6X57U5SF5C/cnRE9h4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0JJ-0000000HLhr-08Zo;
	Fri, 27 Nov 2026 18:04:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0JF-0000000HLhJ-2GLY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:04:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0294561EEB;
	Fri, 27 Nov 2026 18:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6636C1F00893;
	Fri, 27 Nov 2026 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802672;
	bh=Qe14tgxTCMfnyxp7bch1qUtRx5SdNgj5ROLZ22SbLsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ne+u+HRj00++BdWk3T7wUB6ThytNoyacf0tNpaP9od9pUDdyZ+Vqi9d8Rqv6QZFc6
	 +tnx40B9oeYkM9E+dvOCx8KrvJ+AAO18LrWIweb4WOUhJTAz44bwa6K+cGK/RpvZla
	 MDQpC8B6jKPz22CLFsTA8DZiGXoXY0s/V1aB9yk0NGiq54gFP+eTHHpBDyAe4Y/5KI
	 Mk5ToF0hZXrODsbw3zwtG7sWIqpL4yIfy34IbybbgHSbjEiq4enbf5sHvTTZpTanGV
	 +VB4aYE9HDboJ9T1/cmmQpJZFYzjN8x4J2LC8mqgs1m360jkCEeFZGznLZ1j8lFY6o
	 LJ/fsuw/Ldb1w==
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
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 01/12] clk: samsung: exynos5-subcmu: Detach power domain on add failure
Date: Fri, 27 Nov 2026 18:03:09 +0000
Message-ID: <20261127180416.3277544-2-lee@kernel.org>
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

exynos5_clk_register_subcmu() attaches &pdev->dev to its generic power
domain via of_genpd_add_device().  If platform_device_add() then fails,
it frees pdev via platform_device_put() without detaching it from the
power domain, leaving a dangling device pointer in the genpd device
list.

Record the return value of of_genpd_add_device() (keeping attachment
non-fatal when power domains are disabled) and call
pm_genpd_remove_device() before putting pdev if platform_device_add()
fails.

Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
Closes: https://sashiko.dev/#/bug/linux-0f461223-0d95-4e2c-b3d1-eac8e585e532
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-exynos5-subcmu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index 373129847301..b0781e9f5640 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -137,7 +137,7 @@ static int __init exynos5_clk_register_subcmu(struct device *parent,
 {
 	struct of_phandle_args genpdspec = { .np = pd_node };
 	struct platform_device *pdev;
-	int ret;
+	int genpd_ret, ret;
 
 	pdev = platform_device_alloc("exynos5-subcmu", PLATFORM_DEVID_AUTO);
 	if (!pdev)
@@ -145,10 +145,13 @@ static int __init exynos5_clk_register_subcmu(struct device *parent,
 
 	pdev->dev.parent = parent;
 	platform_set_drvdata(pdev, (void *)info);
-	of_genpd_add_device(&genpdspec, &pdev->dev);
+	genpd_ret = of_genpd_add_device(&genpdspec, &pdev->dev);
 	ret = platform_device_add(pdev);
-	if (ret)
+	if (ret) {
+		if (!genpd_ret)
+			pm_genpd_remove_device(&pdev->dev);
 		platform_device_put(pdev);
+	}
 
 	return ret;
 }
-- 
2.56.1.839.g22a8290db9-goog


