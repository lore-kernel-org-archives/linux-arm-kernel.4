Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB5B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=huSPvtvR;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=G+gTxcRt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JbbcS+ed9y83OaOFK5PUKHNOgSt/0NxFFt6TN7c/NeA=; b=huSPvtvR/GL+OtOTpvlYOLBHCO
	oMwQ5Vp9vyEkV6l1qxB7uYKWaiMVsnXxbBw7xZwFDfaCCVK4ko+p+J1j+NHkVM0PR8zfoLnI5zC3P
	GuMU80aQSn6xzcEfON9HHa7poFYzSistWRLWcMpqQviNv0tkNru7zIoZVSnuyf0xm253Wp3ShDRvW
	XcTD7rcx6GxSATKumWHfHzLnasXdyIeagw1SVNAYqFBpD/wX+hwL/zjOmURR6K9Hr7W7VaiKwvasV
	n0TnBP1UcbEr4xjyJyioDCVGrHoNNtOpJLGEGtjCFUV/CZPilaZ1oUhn3QY4fQgddy9Iq+bPytrHA
	UYigiwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqya-0000000FE3F-3AXA;
	Fri, 27 Nov 2026 08:06:36 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqyX-0000000FE2r-1wAM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:06:34 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 604994C951;
	Fri, 27 Nov 2026 19:06:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795766785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JbbcS+ed9y83OaOFK5PUKHNOgSt/0NxFFt6TN7c/NeA=;
	b=G+gTxcRtm4bOeWErhAYSCvXdMO4Bxvk3TOeLqL39u+qA7X/I0/tnjaEGVs3WT1JKSLA049
	IcAI6me3PpclK7uj/3ywUxecNd/mskIu6f7yezwmsfXzxULzw2dFTcJTciRJOVqcoXSf4d
	DXBCF7vi6QfvN980XdEY3XV4eGQpftlZMVhpO4gZDs8FgUQjAKB/XH0knd+dHFKtJ5M4x3
	Yq0+kL9keWotR2MrMV8KzUjnoT8D8gWGNcvvwTbSwsx78DLf9XQLgVjnPog02IcqkFPrbT
	7gHx8e0NJlOETq70G7LLz2tqvJjaUFJEsjPrTXb3JcoiwWZMdY5DozRfjBQs8A==
X-GPT-Reason: legitimate; the message is a technical software patch
	(kernel/driver update) that perfectly aligns with the personal
	mailbox (alastair@d-silva.org); the sender domain (d-silva.org)
	matches the recipient domain, indicating a personal/professional
	correspondence; the content contains standard git-style diffs and
	"Signed-off-by" headers with no marketing, phishing, or scare tactics
	present.
From: Alastair D'Silva <alastair@d-silva.org>
To: Ulf Hansson <ulfh@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH] pmdomain: sunxi: pck600: Initialize pd->pck in probe
Date: Fri, 27 Nov 2026 19:06:25 +1100
Message-ID: <20261127080625.1982574-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_000633_651316_6E75273E 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

sunxi_pck600_pd_set_power() dereferences pd->pck->dev on timeout.
sunxi_pck600_probe() never sets pd->pck, causing a NULL dereference.

Assign pd->pck = pck during probe.

Fixes: 76e4310115ca ("pmdomain: sunxi: add driver for Allwinner A523's PCK-600 power controller")
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/pmdomain/sunxi/sun55i-pck600.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
index 81c3b18a38a4..46632278b8f4 100644
--- a/drivers/pmdomain/sunxi/sun55i-pck600.c
+++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
@@ -175,6 +175,7 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 		pd->genpd.power_off = sunxi_pck600_power_off;
 		pd->genpd.power_on = sunxi_pck600_power_on;
 		pd->genpd.flags = pd_desc->flags;
+		pd->pck = pck;
 		pd->base = base + PPU_REG_SIZE * i;
 
 		sunxi_pck600_pd_setup(pd, desc);
-- 
2.53.0


