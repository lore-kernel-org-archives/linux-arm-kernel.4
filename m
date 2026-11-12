Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DFD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y9RSXod/;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kL8QUXsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dc1pVTlT0A65hfWlRac9f8PxKehnfAkimZIQLveqD68=; b=Y9RSXod/PsgKo0/geeXnH3x+9z
	fPBTxUGkZmvL/dpz8cirGrOsPBnbkRWYWMVsxym9loFfrDaIYOL77VQh623MDuQxtN1i5eH3hxCa7
	XdQiPpWWEtfvV9JKktgwo2duu2hLmtKx2asnuepg2QlKt1Gilij9gymO/mTZPnBGWTDYGG7qa5l3V
	w08TgDwn3jGK2FxQiFr8AFB6Ck1SIf0cvIiSkvm+6VIYyxYznzFcMdOKeuoEqzkO6Fj0Eoxy2P6FH
	i9rPCflHqYwpl7bkLsPYV3Mo609OlR696ZYFB6O4rKGrGClf2qcdHFD9PCsH7aU5s5EdpnqhzGzBu
	2PJATkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP5O-00000008uMb-0KAk;
	Thu, 12 Nov 2026 07:19:06 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP4n-00000008uHa-2Y6B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=kL8QUXsyI8CnO+Bb/rYbltxmYcnzmyAHr7/Os0v3Ud3RFMj3rmrpai/86gvjBXJgNmrgXxfBtS6iW
	 6ZkmpQfI3MAiskaL6utFg124kjrefzNdNwBtc4M5dJafvStsD7bRXCPBoMXoJdjXIP58jgSTLNddfZ
	 9HcSxJ4jOLbrB54k=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af56823405-e4861;
	Thu, 12 Nov 2026 15:17:59 +0800 (CST)
X-RM-TRANSID: 2ee96af56823405-e4861
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af5682633c-f689f;
	Thu, 12 Nov 2026 15:17:59 +0800 (CST)
X-RM-TRANSID: 2eea6af5682633c-f689f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: pxa-ssp: Release the SSP port when clock lookup fails
Date: Thu, 12 Nov 2026 15:17:57 +0800
Message-ID: <20261112071757.154652-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_231839_231111_58D8AF0B 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pxa_ssp_probe() reserves the SSP port before looking up extclk. If the
clock lookup returns an error such as -EPROBE_DEFER, the private data
is freed but the port remains reserved. A later probe attempt cannot
request that port and fails with -ENODEV.

Release the reserved SSP port before the existing private-data cleanup
when the optional clock lookup fails.

Fixes: 90eb6b59d311 ("ASoC: pxa-ssp: add support for an external clock in devicetree")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/pxa/pxa-ssp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 9a98246ad19c..53682c9f2ccc 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -772,6 +772,7 @@ static int pxa_ssp_probe(struct snd_soc_dai *dai)
 		priv->extclk = devm_clk_get_optional(dev, "extclk");
 		if (IS_ERR(priv->extclk)) {
 			ret = PTR_ERR(priv->extclk);
+			pxa_ssp_free(priv->ssp);
 			goto err_priv;
 		}
 	} else {
-- 
2.51.0




