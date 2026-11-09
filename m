Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F97260A2607
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mR1t3LQj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPV7iv1q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fb45Ep5C1SrmFsY0xupXAmvUNierZf0Cwr6xIMYa+jY=; b=mR1t3LQjesZEUB
	vHX8ISY1vHk6jVZMwoH3A8M4riD/R1JLewJV12n4Uv93KLDQ+2ZQCgCZOfprIJhl5UEavcBKofWnU
	A/cJdMalQUMnk233xWvzjuU7AcD8n1tiP9IZ5cLS+T5AZfvYr9j+Evbg0NdLUpGRGIY9aG4w4pf6h
	tfYRtOvRJTPnw5r1YRYyCwJNnDFACYbpJRuGDPDLESDewXCMAHCkC7Qyv3PTgkwxbwLjON2fXruAQ
	kqLtu6vjH9o1zPaFFjvoRh8SxLwajX5tTUCPYe1uIZ+a1gvOwGd8vYmEK+CTR4349dZj+qq2s2US1
	6hl4/4wSDq3z+Lxpougg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWKE-00000001gyn-05Ag;
	Mon, 09 Nov 2026 20:50:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWK8-00000001gvx-0eCb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:50:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A7C162E32;
	Mon,  9 Nov 2026 20:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D471F008A2;
	Mon,  9 Nov 2026 20:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257439;
	bh=Fb45Ep5C1SrmFsY0xupXAmvUNierZf0Cwr6xIMYa+jY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SPV7iv1qxQdc4E1pQHBdu6Udpwrw2fJcH+ZMvZdMCUitaHaz6KCSlX3p6uqSuqmXq
	 Vq5T5aHSudwAY+CZ0LlgtGo3O4iDrxQNmVJ4Z/gApiLyYlz3NIaWBcoItPzntDjXCN
	 hzTc9LO8V4GmnfNnTQ5KiMbp2vJZq7toDreGBzN+t7mQ/86KuKYjB4XaLZz9lbSGBs
	 ds3fNwzdtWRI48JnWZvYJUAm/FZ5A0skEAzNR6mnMYmXciNSF2MVm1Mp6ivJTX4uKQ
	 2zTsubQpDHDH/KktoTeu705Ar/7DT7ZuKKEfw5Rtv2tTkUcGBckR0Vno7TgoARflRR
	 +h0Zw+RTdu4Qg==
From: Joshua Crofts <crofts@kernel.org>
Date: Mon, 09 Nov 2026 21:50:06 +0100
Subject: [PATCH 5/6] i2c: stm32f7: remove redundant
 pm_runtime_dont_use_autosuspend() calls
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-i2c-remove-dont-use-autosuspend-v1-5-49a08b8daf36@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794257409; l=1230;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=mR3PUAwrVyNnmrif5Ipr/TukEQxQRGcBhfdjxy/Wrrk=;
 b=5L/yIKW2JMwL9uV2e5wlknf75dDMX9mKJgcm/y1LkUGpHdAIJst1pMXqMbGnmGMe66x8n7Njp
 vl2J9SLaDnUBc7pxQoarYbtd1ACtDic+JBwSNUALQ2xtew756vDfqpv
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
 drivers/i2c/busses/i2c-stm32f7.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 2e1cc6a92b81..7904d888550c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2325,7 +2325,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	pm_runtime_put_noidle(i2c_dev->dev);
 	pm_runtime_disable(i2c_dev->dev);
 	pm_runtime_set_suspended(i2c_dev->dev);
-	pm_runtime_dont_use_autosuspend(i2c_dev->dev);
 
 	if (i2c_dev->wakeup_src)
 		dev_pm_clear_wake_irq(i2c_dev->dev);
@@ -2367,7 +2366,6 @@ static void stm32f7_i2c_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(i2c_dev->dev);
 	pm_runtime_disable(i2c_dev->dev);
 	pm_runtime_set_suspended(i2c_dev->dev);
-	pm_runtime_dont_use_autosuspend(i2c_dev->dev);
 
 	if (i2c_dev->dma) {
 		stm32_i2c_dma_free(i2c_dev->dma);

-- 
2.56.0


