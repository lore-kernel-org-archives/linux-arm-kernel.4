Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8D6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bUgctGuV;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=P+O7Mgq3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lL4D7R9KxDf+22sv9+j/sxEZCecScCAzSX1cEImABW8=; b=bUgctGuV2L8eOFlAxGzd/6imiD
	SMsz/LGMxRufTgkYHOCipZFQFKwFhmQXJsR0bXCctjk0SeuCeYXvU8TOubstCfBt/yWKlM785M/xI
	YW7BB+pdXzZijmkpOQhtqbIpEPfeAiETuVwvmiazvVkiMc2sVBj1kByqTXELZVgL9u3sYuHCu+/fj
	Nv9OROOe+3qKFw4O/rG8+YpkeLmGWUEnMGZlY0MrmxL8pKr/Qr83+WrZDEhK5eCGyYyAZsGzsPhM1
	vUpYt96Ants3x1lY0tPhi6nwHaT9pYBvSzAuFoEQEg+QJCZ21EqXfogGvGojNwYKT9wYmYTAe+jOb
	wqIv9rSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWg7s-0000000ESwx-1NDU;
	Thu, 26 Nov 2026 20:31:28 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWg7p-0000000ESwZ-1dyz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:31:26 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jb7Vb3zTGzMljx;
	Thu, 26 Nov 2026 21:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795725079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lL4D7R9KxDf+22sv9+j/sxEZCecScCAzSX1cEImABW8=;
	b=P+O7Mgq3XY/A52unPjO6kVgrXbL5V40AafZ2SGmfMKZYd1rMJVlmCMQTSLkgNHyeCWOkXG
	XJApf6uNOFSilZ6nuModLLKdjAFH1O8jQsb4rKmh9z/TWiywJTsk4oR+DtktjxD42HRXOd
	AZ8KVP0/dcn9VlIJqrb1yj20euv3vei3min2AutQnT4LnPZNXFY7aGpLUPMbw4Y9DGbply
	oym3hlxcij2OSpsRzb6ygSDIPo7Om2f4dwPKmTamsLsaa8PZQRh94K0UUjyIhzH8Jy4Id2
	WhI+3pRxfanUEtD2qzR9s/LMVUS/C+JdjGfK5VwNMvyAXKWk87J8949LZ0folQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-pcm-rpmsg: fix kernel-doc
Date: Thu, 26 Nov 2026 21:30:39 +0100
Message-ID: <20261126203039.1777085-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d782bbe52c75f34ceeb
X-MBO-RS-META: ohjh36gga4w6sbm5enryspnsho44jfi9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123125_570032_C4468146 
X-CRM114-Status: GOOD (  11.57  )
X-Spam-Score: -2.8 (--)
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

Correct typo in kernel-doc, fixing:
  $ ./scripts/kernel-doc --none sound/soc/fsl/imx-pcm-rpmsg.h
  Warning: sound/soc/fsl/imx-pcm-rpmsg.h:419 expecting prototype for struct param_s. Prototype was for struct param_r instead

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 sound/soc/fsl/imx-pcm-rpmsg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.h b/sound/soc/fsl/imx-pcm-rpmsg.h
index 8286b55f00..52f2529724 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.h
+++ b/sound/soc/fsl/imx-pcm-rpmsg.h
@@ -397,7 +397,7 @@ struct param_s {
 } __packed;
 
 /**
- * struct param_s: send rpmsg parameter
+ * struct param_r: send rpmsg parameter
  *
  * @audioindex: audio instance index
  * @resp: response value
-- 
2.56.0


