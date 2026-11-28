Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD203606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z03RkGU4;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=L16Tevyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LeTJPQ8F+2oDfibSjW4LKZzG+pGWKb7dMHJ7EBLdZmQ=; b=z03RkGU4hkKqFmUcUPif4ikIlO
	I5rkViuZufzEmJbnjHSIVOflHp8KLx1pij5rwDtuXeCt3SkzuMUWhMXr+K1cSFGCf/soKkq6peBKU
	qz9UJ+4vr8q6d1jBmvIBje8htuyAe7DD2mZ4eL2IiYz4TlwNlWgGirHIIX6/vIAWxSgm8pIchqiEW
	sOy3aXBmhfYuhw9akOnYLOmv+lDi4qB+uYS3Meb5QYPjbPqELvbh9nv2QvR5iiMAnCXJqYPRBuo5X
	Ej2X/PGwNYf0hIRF7nhs/dcCzBGjD9D4G+8syoPXlxvZj0WkwUtczJladYrA8N+QV1/UnBpcBFXCI
	MVN7yw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEwj-00000000bLK-0DZq;
	Sat, 28 Nov 2026 09:42:17 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEwd-00000000bHn-1Dax;
	Sat, 28 Nov 2026 09:42:13 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0816;
	Sat, 28 Nov 2026 17:42:06 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: andi.shyti@kernel.org,
	afaerber@suse.de,
	mani@kernel.org,
	wsa@kernel.org,
	peda@lysator.liu.se
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: [PATCH] i2c: owl: Fix potential adapter use-after-free on unbind
Date: Sat, 28 Nov 2026 17:42:05 +0800
Message-ID: <20261128-f81b700d6c-u02-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa221888ad103a1kunm52475e97451dd4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGU9KVkgZTx9CHRpMSkNJGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=L16Tevyzygb2yz/VcuIPL0qFotMEHbXNTzdWBL9fGrBOo6rEFjXrOrIbu6AfDStzCybqmVnFbevCN+ofwx4tkLUf4f6lrKBAa0sZ9EECAUcvlWB5ofCAZq8dYJGFaGg+F4ox4oZTZ+2LFTQfDiUHQVWGB03BUk22mpD6GBmYjko=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=LeTJPQ8F+2oDfibSjW4LKZzG+pGWKb7dMHJ7EBLdZmQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014211_847302_2C569087 
X-CRM114-Status: UNSURE (   8.19  )
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

owl_i2c_probe() registers an adapter embedded in device-managed
private data. Unbinding the controller frees that data while the
adapter remains registered.

Use devm_i2c_add_adapter() to unregister the adapter before the
controller resources are released.

This issue was found by our static analysis tool under development.

Fixes: d211e62af466 ("i2c: Add Actions Semiconductor Owl family S900 I2C driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/i2c/busses/i2c-owl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 1937a2467512..f122a60b24a6 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -495,7 +495,7 @@ static int owl_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return i2c_add_adapter(&i2c_dev->adap);
+	return devm_i2c_add_adapter(dev, &i2c_dev->adap);
 }
 
 static const struct of_device_id owl_i2c_of_match[] = {

base-commit: eeb63983deb23d68ddc47e5d1944a7d64acdaf22
-- 
2.43.0


