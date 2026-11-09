Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E1606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0eHznEsX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZVfZc6uh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ega1vQ2CDY/HzdEsbyX1IiM/sEcRjuH77QeUKn5VUh0=; b=0eHznEsXjDMB7s
	2Q9N7guMSSlVGV489HrzkTEkolakV4qJwxn08S+MKrf00lxyQBFZkbYTtUn/sP2yN7SWx5RbuYUrI
	eSdKiGsKdHqe1OQIS1eDJ9UzcsOP2jqgF38dDRdFK/COiEs5wMILtEutjcHMUscPV3jpS/wNLD3xj
	Dm8eBoupIi+/INpmVnUqg395AfIEQwX/RFekN99j1kih265bJuvxk6CM7wAhek4IB/N8n8zWFPn9R
	Fzzt0Pi4fkRxtdkTpENz0z6imXZtYdQSkVh3u+9tuAHiZZLAAikDEdfGj//b3EUcVGDDedesBTJWd
	u7e9SN8PttL6Fz2691Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWJy-00000001gs9-0jSy;
	Mon, 09 Nov 2026 20:50:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWJs-00000001gr8-1yhX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:50:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CF014582B;
	Mon,  9 Nov 2026 20:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E5E1F008A1;
	Mon,  9 Nov 2026 20:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257424;
	bh=ega1vQ2CDY/HzdEsbyX1IiM/sEcRjuH77QeUKn5VUh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZVfZc6uhCnWKWT7yjeZaaFliUPH67rtfP9YvS+RAzc9EYIRj5KsdxSljTh+HzP6wN
	 8oT7BwTCgfwxyUtJvMoWBchM1IQeo/3F1Ji7HihLhGlluo2cmJw9wv4iXiZcQYRDxs
	 4KEt8+gClZDhjzai9o8bNZ93LD+COKQyj/cBj6fwqiEt2/936uUf6DjxsEpcK9zrRs
	 BuVPRehYgu5dAwqWvlPg3JZtp6pIXLvfAqHMCS2QmBZX6suzqk9ZAaKs7xiFs1cmjz
	 ZsyYa9n6o2neoiBspLFrUY/+BdOfnljqDS3l/I2XbAel3kg913mXuMGPpuqJspZRiI
	 yf5taFtq85QJA==
From: Joshua Crofts <crofts@kernel.org>
Date: Mon, 09 Nov 2026 21:50:03 +0100
Subject: [PATCH 2/6] i2c: img-scb: remove redundant
 pm_runtime_dont_use_autosuspend() call
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-i2c-remove-dont-use-autosuspend-v1-2-49a08b8daf36@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794257409; l=849;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=NodHhw1ykeg2hVN9scG0KViJ0ETpgpTWRaROalsumsk=;
 b=MgGri77pJ3gRjcUCX0+nBVvyiHYhN+Y4cV6mXpDSwFGS8nu0ny/pA3mgQKzpT5/fXEC79dYYI
 zkkfFeOPVTZDiSkoQL6V98YCp1SkK/ASR3511i9DsoEHzhjwhCh2azM
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

Remove the redundant function call.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/i2c/busses/i2c-img-scb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 9d2ee449a40b..9b7142bf0059 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1403,7 +1403,6 @@ static int img_i2c_probe(struct platform_device *pdev)
 	if (!pm_runtime_enabled(&pdev->dev))
 		img_i2c_runtime_suspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	return ret;
 }
 

-- 
2.56.0


