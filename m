Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F9606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ctA6ZWVo;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ELpIaBJp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PSYYKqvNBHQRpRXqr6rKxOfnsA0fN/waXWV83fOGwXE=; b=ctA6ZWVoNPOaMKyDdjzqradlpt
	EurCngZ3RGU4/bJ0xGzy4v/KGW3GZ+e2Rl9r1jhvXaHbJzWjU6w2M+5+atR25S2+rG6KhOt50f0ha
	AJX4j94kr9HwZcOExx/G9wVpuGXyo0dYbC3Gwc1pvdjdNTBN4jN3umLmX8ZaElbZmYYfwnJD45dkK
	NOZCi5NEefLJ9QoGJq4/5rXcLOZHX4raKVn76zgfTzfQGsdcENt4PRozx89Ta/wF3JVTUelFnbP0V
	tvU4+K1fmxt3gAoqp9fKRhVMebpcIKiVLci+kU44FWz0i0xs9bnlSfGjr4tUlg4F/p20RPOF0CrS0
	9Mr00Axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKb9-00000008WZn-2Tn0;
	Thu, 12 Nov 2026 02:31:35 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKb3-00000008WXo-0TNY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ELpIaBJpKA9J7AdD2NrAn+mvJYewlQpidOK53oTm3s7AO1Qt4pudeJZfGiVrr4C6sItXD40FChFuP
	 c2u6Xh6hsgwucdOx9YtDJnx91RB7aly0D8+xEapgjWG4k1m8OCk2w6hjlMBOMwNoqT9OlzXKvnneGA
	 hO/ZuC/eTcMScZO4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af524ff6e2-a9421;
	Thu, 12 Nov 2026 10:31:27 +0800 (CST)
X-RM-TRANSID: 2ee66af524ff6e2-a9421
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af524feafc-eee32;
	Thu, 12 Nov 2026 10:31:27 +0800 (CST)
X-RM-TRANSID: 2ee86af524feafc-eee32
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: wens@kernel.org
Cc: jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] soc: sunxi: sram: Release node references when claims fail
Date: Thu, 12 Nov 2026 10:31:26 +0800
Message-ID: <20261112023126.118228-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_183129_744273_B0D9043A 
X-CRM114-Status: UNSURE (   6.19  )
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

When claiming an SRAM region fails, sunxi_sram_claim() leaves the phandle
iteration before it can release the current node. The rollback loop also
parses each previously claimed region without releasing the returned
node reference.

Put the iterator's current node before rollback and release each node
after undoing its claim.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: be99eb936b4f ("soc: sunxi: sram: Support claiming multiple regions per device")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/soc/sunxi/sunxi_sram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 2ccaeacf8c70..4667661b2003 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -294,12 +294,14 @@ int sunxi_sram_claim(struct device *dev)
 	return 0;
 
 err:
+	of_node_put(it.node);
 	while (count--) {
 		struct of_phandle_args args;
 
 		of_parse_phandle_with_fixed_args(dev->of_node, SUNXI_SRAM_PROP,
 						 SUNXI_SRAM_CELLS, count, &args);
 		sunxi_sram_release_one(args.np, args.args[0]);
+		of_node_put(args.np);
 	}
 
 	return err;
-- 
2.51.0




