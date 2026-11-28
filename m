Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DFC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ONnIRSKH;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Ud+5qX5O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2F9+UIFjXyl8E+cBoEl3XN/WAmI7L6Ci3kyI3dG+pGs=; b=ONnIRSKHQFvBEB
	o0dc7K6kGprQyZtTcqHg20v8OOw9SJFpOIdIt88FGmAe9guML5LuRNeIX6NtFAEzVRLFErNOSUEfV
	+xrBKIsPUBpWnx0MqVyg6Ozq26kXMA8nI1itN2skjAf8QoKnNfLOJYTHAf+1Sc5sYE6t/AG0oG3Ka
	5eEaYfMAlEZu8yCe3k86MyU23Yurv/fggXZPej+wcn91pJChZCqC3K7ayh+sYHBHrj2chlKwOeZUb
	qhvMHILZEBdtvmStEMVaQlOhufqjZz69xB0DhysC++V9bH9/gnF6JHjNaq+OOTs8l6W9bt5dBLNg4
	sDuajAtL2ykKtnYuVS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEzQ-00000000br4-12ky;
	Sat, 28 Nov 2026 09:45:04 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEz4-00000000bl8-1mhb;
	Sat, 28 Nov 2026 09:44:44 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b083f;
	Sat, 28 Nov 2026 17:44:38 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	mturquette@baylibre.com,
	eric@anholt.net,
	swarren@wwwdotorg.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] clk: bcm2835: Fix potential use-after-free on unbind
Date: Sat, 28 Nov 2026 17:44:37 +0800
Message-ID: <20261128-f81b700d6c-u05-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u05-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u05-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218ade3c03a1kunm53a27565451fdf
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEkfVktLQhgYTR1OTktOSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=Ud+5qX5O8tLaxElZYoQuCpbTAEVUYBF1yHVbkwytMXHhs4lWRf5FVCnWBhmWqwFAriePpTwS+72c3VztdXhjxfIzRepm4ZurwTJgbQCCp/HdIQIsR9JHr++v8IMoRbHs7jlt6HH6rGbKsKVKnToAZPS9lJP9kBv0fe469+4FJho=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=2F9+UIFjXyl8E+cBoEl3XN/WAmI7L6Ci3kyI3dG+pGs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014443_211644_51EF7DC5 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: -2.1 (--)
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

The OF clock provider outlives the managed CPRMAN data when the
driver is unbound. Subsequent lookups can access the freed onecell
array.

Use managed provider registration to remove it before releasing the
clock data.

This issue was found by our static analysis tool under development.

Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/bcm/clk-bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index b668c406512a..34eb318285a4 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -2322,8 +2322,8 @@ static int bcm2835_clk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				      &cprman->onecell);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					 &cprman->onecell);
 }
 
 static const struct cprman_plat_data cprman_bcm2835_plat_data = {
-- 
2.43.0


