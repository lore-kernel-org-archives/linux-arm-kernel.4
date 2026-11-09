Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A003606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3x+qX7/X;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCR+mA6F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7miTEOiplQxcmJ88x1q2T7iLbj4kl+6UoeaymDMDFLo=; b=3x+qX7/Xf2ztPC
	jpTOHw3u7RPe6DXJgymqF/7vAsbqUpau5V2jUg2vYm5r1eCIFb2siTfeWdE89J7MKfqpaRSYYRRs0
	gCm3OB5VB2P3tsqStDOYywPwglr9kEHkEN7liZJXAjlAgBTmIFymtPg0QTZf/YHE4d/QhN4bPR4GM
	AXUVA6dTopSkMhbUOPB1V1XgQR5rlusDj+oxxiMELi316RtPCCU5LaZxYiQyumHnLO6lRfKKC0Sje
	uHFWJpndIgx+eRrBObQFizEFNdf5IbQtKB6JCrnn/TJ1KMwqMdDSfjF1BwshaFFZKTbbqLPwwc9jR
	gL5ME4ph6uEAYv8xJMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWJo-00000001gpV-3l1U;
	Mon, 09 Nov 2026 20:50:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWJn-00000001got-3GsZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:50:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B9FE4581B;
	Mon,  9 Nov 2026 20:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4471F0089F;
	Mon,  9 Nov 2026 20:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257419;
	bh=7miTEOiplQxcmJ88x1q2T7iLbj4kl+6UoeaymDMDFLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WCR+mA6FhrXWzBVl/1COK51IUdy8LfFnqMehYmnxGdjBSB/luoY3wOvfhxJP4KH8U
	 NSgoj3liX65nPulNP3UdtUf3XxOo+HF4tl2Ql7+n0MRTPRKQZBMAFKQ79vfrwSQO++
	 syunUMGE0glhowcAbxypI1wZfx3ipJrdjio4YOAuYKWcPjquYhjFIfX4CTT/qYzbkY
	 CeYGGyOgoDHKCLJZBxE+xy2D0PgTZNGFOyviTQqNdqzEabC9t1oMFpUzcisaMG2Esn
	 fvDEpw9XKNS5wQAgeygD6VfU2WODjW4iMwu/i0J/n+zjLtMuwDhwOklzkCnT5NWqn3
	 QCeLu42Fmrocw==
From: Joshua Crofts <crofts@kernel.org>
Date: Mon, 09 Nov 2026 21:50:02 +0100
Subject: [PATCH 1/6] i2c: cadence: remove redundant
 pm_runtime_dont_use_autosuspend() call
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-i2c-remove-dont-use-autosuspend-v1-1-49a08b8daf36@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794257409; l=889;
 i=crofts@kernel.org; s=20261015; h=from:subject:message-id;
 bh=x0cVAUy8IYjp+jUMgpdBKfb2DOQoqoodKMXtnZKYq4A=;
 b=Jnfhon4DZRhrhz8foy+27RAp2SH+92NVbHheQRsorpw5srsM50CwbNsPxenkwav2DT07DMMxI
 Bv1lWNDJp4aDrvZXLh5zIU6+LnAkp8IffMOZPXZc5eEkOVKIIL1KGc0
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
 drivers/i2c/busses/i2c-cadence.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 0c6887da47d1..8e65ea474a84 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1628,7 +1628,6 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);

-- 
2.56.0


