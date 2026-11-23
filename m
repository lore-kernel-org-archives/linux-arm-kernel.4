Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60836606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fShk6Sfs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9ne85SY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R4qvVaogBx4Zjf6QOGG8yQdtjuPAVQH+Dr+P8xaLQb0=; b=fShk6SfsYbLrs7
	glN2KCDR41CRLkZ5E9sZKqgKIScNwc55BVQHpejAduMQEjensdTs5v++BQr+ZyLLwdsxCgHgTgzXa
	RRxQaQ0y77Ig4DDAMfXbAne6vWssX8TLeC2WtoElWaBJxr2lzakycjcoesEPUk+iXb2TkreYKmj5D
	n3yGt2XfXUrOn9xZTwOHnD292Ljxdyv+vF0npbSitACHhkahZ56+wd88q8cRlNO4Lxdc6ll41kQZZ
	SIgZUBbU6y9KKvDQuxm5Gcwrc09N+KFYGFNYoWJnMkMGkajGEOYwQ5rvxDXokYTuWyW7canWkKTyc
	zpS57kzWoZi6xJe8c2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXkT-00000004LJu-1k5W;
	Mon, 23 Nov 2026 17:22:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXkO-00000004LIi-1iUW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:22:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E669458F9;
	Mon, 23 Nov 2026 17:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CF81F000E6;
	Mon, 23 Nov 2026 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795454552;
	bh=R4qvVaogBx4Zjf6QOGG8yQdtjuPAVQH+Dr+P8xaLQb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H9ne85SYIIFKSD/71YeWjgga4nghJ7QJ7jg+llf/w2qwek9nMwqW9QaQMonmZJgCM
	 d8X+HQQjvbLu4BaqZzdpEGIszuX/S2zmISD/rR5J9gzRc4MLgIDqOtP10gE1DLC2Dn
	 ap/pyoEQ+fkZK8cb/PgTFvxwt5iAPRC5r+VGu1n4ePQXjXtlluaXwqqikIUGwr7VkJ
	 yd5r73y0uHmIA09X2lnKauppqrFFZaTGF/26Pgxg3xDRhLufrpUy38BSs55BxzJWZy
	 wwWB0x5rOwtUew7/RbXmXOzWfQqR2IwglOWOYG2ezTvK34j1pizpMVHgIaKHB/+yOY
	 vi52lC49K2dnA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 06/10] remoteproc: imx_rproc: Register SCU cleanup after resource acquisition
Date: Mon, 23 Nov 2026 17:20:50 +0000
Message-ID: <20261123172140.3547896-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261123172140.3547896-1-lee@kernel.org>
References: <20261123172140.3547896-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

imx_rproc_scu_api_detect_mode() registers the imx_rproc_put_scu()
devres cleanup action before attaching power domains or registering the
SCU partition reboot notifier and enabling its interrupt group.  If
imx_sc_rm_get_resource_owner() or imx_scu_irq_register_notifier() fails,
imx_rproc_put_scu() runs during failure unwind and unregisters an
unregistered notifier block while disabling an unconfigured interrupt
bit.  Worse, if imx_scu_irq_group_enable() fails, the error path
explicitly unregisters priv->rproc_nb and devres subsequently invokes
imx_rproc_put_scu() to unregister the same notifier block a second time.

Defer devm_add_action_or_reset() until power-domain attachment or SCU
notifier and interrupt setup have completed.

Fixes: 9b2451658afa ("remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup")
Closes: https://sashiko.dev/#/bug/linux-1230a154-7627-4ce2-96f3-d0033709ba4e
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/remoteproc/imx_rproc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a77a3342e1ed..9ff2cd50acb6 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1083,10 +1083,6 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	else
 		priv->core_index = 0;
 
-	ret = devm_add_action_or_reset(dev, imx_rproc_put_scu, priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to add action for put scu\n");
-
 	/*
 	 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
 	 * and Linux could only do IPC with Mcore and nothing else.
@@ -1095,7 +1091,11 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 		if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
 			return -EINVAL;
 
-		return imx_rproc_attach_pd(priv);
+		ret = imx_rproc_attach_pd(priv);
+		if (ret)
+			return ret;
+
+		goto add_scu_action;
 	}
 
 	priv->rproc->state = RPROC_DETACHED;
@@ -1126,6 +1126,11 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 		return ret;
 	}
 
+add_scu_action:
+	ret = devm_add_action_or_reset(dev, imx_rproc_put_scu, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add action for put scu\n");
+
 	return 0;
 }
 
-- 
2.56.1.750.gf70dc682cf-goog


