Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC46B606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0v/tZlG7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EplhOPHT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XtZw9RiZ9ZP/coTCe+5jx9QB2zpmHdqGFtZ4US7R/6Q=; b=0v/tZlG7i9Aiy1
	DWCilVkaVCYr6gi1KvSjLnMqfjIi6RltS44De+wUr9l+OrsrfKmjA069eNmB570ZIEEj7FUHCTjgB
	KlMTS5Li6WF51pP9zv5bWoMDrHflYk3fGQMHSt2I5jKEP0u7J3yIB2aMS8NOjqisk4yUWSiSs6UqQ
	R1lxBfDb+pStZFQMpcisZ09Wa11Jlv0ChA1vb9pL/Ohmv2aFFIctavdzO6yGXASSAOXZsi9zWhyAn
	/0hcFnqImD+3ZPPYbae+X1IJsz6sTh5Dspz5KahcMCFa3ywcRn3ylqTXDT8g49/o0DcZWx1KfS5eG
	LThblG8kJkv8Ei19DgeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWK9-00000001gwO-19eM;
	Mon, 09 Nov 2026 20:50:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWJy-00000001grv-0ulY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:50:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48F326127B;
	Mon,  9 Nov 2026 20:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6D91F0089F;
	Mon,  9 Nov 2026 20:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257429;
	bh=XtZw9RiZ9ZP/coTCe+5jx9QB2zpmHdqGFtZ4US7R/6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EplhOPHTPfyf6pU+s2WLgVAGOzyCjAna86YBf/9xKnVVz8iE/GCKKi3h+ec/H4JDy
	 NpzQztqRWuyb/mvG513Q5HuELmPtL4fhkcWFP66bgKsKSWyfCLrcaMlFHI9aNikun/
	 CVaDf/SIbrdaArrC52hbcdTzrIdqc+vkRi5s0jFujmW6oMpqcxmrV4GG6FJsLxu2zV
	 5sgCOhnBUUuDWNJgSHTqRQ+Y5sKh9Aa6Z9wYOqe6SQ05AWd7LHseuwBFtZEMmQZ9DF
	 42orcjm7aCh/nCHvTRzjuxwt2BqwKzlrUWtbQBedTD0vdBmsvPrNZHavVhXj1thepv
	 HDqWuHEP2Bx1g==
From: Joshua Crofts <crofts@kernel.org>
Date: Mon, 09 Nov 2026 21:50:04 +0100
Subject: [PATCH 3/6] i2c: imx: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-i2c-remove-dont-use-autosuspend-v1-3-49a08b8daf36@kernel.org>
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Joshua Crofts <crofts@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794257409; l=1098;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=dFiUdJiKgbqssTJINy3nJUb9IlGxYj++ayLzL29F92s=;
 b=tAWNJPuvEVeEADlATh8dc1kcMG2aU+Hci2YxATHsp1CxFbSi5iEfbo6ebkUZOAUS1F8+8Wjz7
 TzWaFDnmWFQDu4tKdvvkEdFx50Cy9fncwaTUrBCu6ntf1zOClX7RE/J
X-Developer-Key: i=crofts@kernel.org; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/i2c/busses/i2c-imx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 89f2b764bbc4..05906ddafbfa 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1964,7 +1964,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	return ret;
 }
 
@@ -1999,7 +1998,6 @@ static void i2c_imx_remove(struct platform_device *pdev)
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 static int i2c_imx_runtime_suspend(struct device *dev)

-- 
2.56.0


