Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2LZHe+c;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTRHFAcs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YUuho9BdRijfF9IGiPy/MBiVnwS2llm6jmaZgMATH6g=; b=F2LZHe+c4qPEly
	Ca2YN699GKbDHl0Wk3PiO2SVuK/V7gnGGB+hgfGyUYDucPwuDhV6fHhhARIKgVQL3RtzyKDrt10oA
	2+3sq1WLsiQRAI3b1hocYAa5E5I8mHEZ7bSkxEFr2yA7vh8ksJcKQJo/pPZfdDJl7KXEyRL9rGDST
	qs/tS8UMEYskT+ucDSZ9EnGA5VJSPIFxyayPz/JGd6MKX6htBEWZU51E1/XJfmmAzhuI39d4965Ll
	MKH6ppDP56KPOE1IIPtJOAFTqeDqb4CsuczI58g2learUclTkvrR67D4L06kgWwOzxoQsGM9A7h3E
	HZYxiJN6F4UeGuLi+Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1bB-0000000HY2c-1W4P;
	Fri, 27 Nov 2026 19:27:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1bA-0000000HY2D-0uTu;
	Fri, 27 Nov 2026 19:27:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14D2A44E24;
	Fri, 27 Nov 2026 19:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0551F000C1;
	Fri, 27 Nov 2026 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795807627;
	bh=YUuho9BdRijfF9IGiPy/MBiVnwS2llm6jmaZgMATH6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fTRHFAcsdjlwm5/xTwv1+BwJ5KlAyUW9pQuwes272RniHs3GiQNz1ge7ZeoObNbcE
	 a/JU4TtRDV8tS2hLxbY0tnE6S3tr3M+RUtfVh6a3EOfBH/9UyI8c8ES2pb8csLTMci
	 7tVLLH8AcpUwgYWHWXU/nEmWuKbE5FetoDd6blt2XncWcD1BJUoGmAIExtySKaXaAy
	 ae8fcGQkBiNNkoAtXsd9I366TU9W6Ssur3KXx/TRSeZKbdnXTJZ3fzfNB9HGN/VnHw
	 ffb+Oc2coeaYKp6hxx86OJ4yO6y4YLi35H2tDU0BD8YNrjrm1Lpxy+l3KWYZO+T74z
	 el5E0QMmNFgVg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Thomas Abraham <thomas.ab@samsung.com>,
	Doug Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 05/10] clk: rockchip: cpu: Allocate rate_table before registering notifier
Date: Fri, 27 Nov 2026 19:25:29 +0000
Message-ID: <20261127192620.3443537-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127192620.3443537-1-lee@kernel.org>
References: <20261127192620.3443537-1-lee@kernel.org>
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

rockchip_clk_register_cpuclk() registers cpuclk->clk_nb before
allocating cpuclk->rate_table, and on clk_register() failure frees
cpuclk->rate_table before unregistering the notifier.  A concurrent
parent rate change can therefore observe a NULL rate_table while
rate_count is already non-zero, or dereference the freed rate_table
before clk_notifier_unregister() completes.

Allocate and populate cpuclk->rate_table before calling
clk_notifier_register(), and reverse the error-path teardown so the
notifier is unregistered before cpuclk->rate_table is freed.

Fixes: f6fba5f6967d ("clk: rockchip: add new clock-type for the cpuclk")
Closes: https://sashiko.dev/#/bug/linux-c0f18cf6-69e2-4cc3-8b2b-7b25245ccd06
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/rockchip/clk-cpu.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index eb6b8b878e4d..27d5b6f6987d 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -360,36 +360,36 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 		goto free_alt_parent;
 	}
 
-	ret = clk_notifier_register(clk, &cpuclk->clk_nb);
-	if (ret) {
-		pr_err("%s: failed to register clock notifier for %s\n",
-				__func__, name);
-		goto free_alt_parent;
-	}
-
 	if (nrates > 0) {
-		cpuclk->rate_count = nrates;
 		cpuclk->rate_table = kmemdup_array(rates, nrates, sizeof(*rates),
 						   GFP_KERNEL);
 		if (!cpuclk->rate_table) {
 			ret = -ENOMEM;
-			goto unregister_notifier;
+			goto free_alt_parent;
 		}
+		cpuclk->rate_count = nrates;
+	}
+
+	ret = clk_notifier_register(clk, &cpuclk->clk_nb);
+	if (ret) {
+		pr_err("%s: failed to register clock notifier for %s\n",
+		       __func__, name);
+		goto free_rate_table;
 	}
 
 	cclk = clk_register(NULL, &cpuclk->hw);
 	if (IS_ERR(cclk)) {
-		pr_err("%s: could not register cpuclk %s\n", __func__,	name);
+		pr_err("%s: could not register cpuclk %s\n", __func__, name);
 		ret = PTR_ERR(cclk);
-		goto free_rate_table;
+		goto unregister_notifier;
 	}
 
 	return cclk;
 
-free_rate_table:
-	kfree(cpuclk->rate_table);
 unregister_notifier:
 	clk_notifier_unregister(clk, &cpuclk->clk_nb);
+free_rate_table:
+	kfree(cpuclk->rate_table);
 free_alt_parent:
 	clk_disable_unprepare(cpuclk->alt_parent);
 free_cpuclk:
-- 
2.56.1.839.g22a8290db9-goog


