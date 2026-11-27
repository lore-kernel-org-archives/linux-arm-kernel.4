Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40670606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 20:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ssT0HJg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABzQGIpr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wb5sLgyTJ9ciByxdIv0xU7QJ6xtgseRf/O5NmmuNpEI=; b=2ssT0HJg4+1HEV
	Uc6wXaSQJrwkiCLMndsYFxlskqlqkPCEAqiBISGA8Xz7m9jM7JbXrQWKPBCrK36fjecxJg8lFxhwI
	fUJdNhWx6NA+/SOUAwf26RLtIAtw1VWmlGKQ9O1iqV6XPC7MpvR/IcD4uMnPIGJ2W0/+98Fe8yb3u
	03P/xANjYIemrph1eELvNG5unF1DwOGLhlt2XJUHaQ0o3NQ8HuXUTo82QjG8CfG1oG6lrhSYIb/yY
	tobDTWxf99wTs+si+Uu5XJzWKwrwvn6BiszI6mNlswUkHTxZsr6WzjuVOTx5QOCvSl1uLLFC2ULwN
	JiZwMPaV9WoHVwg9lwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2IF-000000002il-1UHK;
	Fri, 27 Nov 2026 20:11:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2IA-000000002iJ-1gbn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 20:11:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D38F161B10;
	Fri, 27 Nov 2026 20:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE381F00899;
	Fri, 27 Nov 2026 20:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795810293;
	bh=Wb5sLgyTJ9ciByxdIv0xU7QJ6xtgseRf/O5NmmuNpEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ABzQGIprL1UtFlBfzIhPYycookg6YVp9jM53YfxK6OdpGVYSO0CcYRMK9aW5ETyW/
	 u9p6r+pcwrj43udHBImlUVoVUZlyeuBPZvmKl9PTUGqoMPYUa+z5FKAjpEwDZUAXhQ
	 PzFgJDiR1tI08BIJlX/4BMb9PuYDuct5TMjHx24oE1AmO6dwMYmCprh+38Nw9Alejc
	 9jDvv9n1va57awVo4reFUQgHAdTge0qQWcbSDrL+VOk2tU+1TCfpLtsLgGl/q14s7n
	 RRjmT1p/+i/SEtmTI9eIW7YVm1qqz8OngRRed4kdb5tBEJUiUoi9iUPzpZ32XL9BAE
	 SYrVJ+UCief+w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	David Heidelberg <david@ixit.cz>,
	Andi Shyti <andi@etezian.org>,
	Rob Herring <robh@kernel.org>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 05/10] Input: stmfts - fix i2c_smbus_read_i2c_block_data() check in status sysfs
Date: Fri, 27 Nov 2026 20:09:59 +0000
Message-ID: <20261127201050.3532488-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127201050.3532488-1-lee@kernel.org>
References: <20261127201050.3532488-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

i2c_smbus_read_i2c_block_data() returns the positive byte count on
success or a negative error code on failure.  stmfts_sysfs_read_status()
checks if (err) and returns err directly, so a normal 4-byte read
returns 4 without formatting buf (exposing unpopulated sysfs buffer
bytes), while a 0-byte read formats uninitialised stack memory.

Return negative errors immediately and require sizeof(status) bytes to
be read, matching stmfts_read_system_info().

Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
Closes: https://sashiko.dev/#/bug/linux-bd87edf0-6f79-4318-8780-d69205787e7d
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/input/touchscreen/stmfts.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 2054c2254947..aada03f96940 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -699,9 +699,12 @@ static ssize_t stmfts_sysfs_read_status(struct device *dev,
 
 	err = i2c_smbus_read_i2c_block_data(sdata->client, STMFTS_READ_STATUS,
 					    sizeof(status), status);
-	if (err)
+	if (err < 0)
 		return err;
 
+	if (err != sizeof(status))
+		return -EIO;
+
 	return sysfs_emit(buf, "%#02x\n", status[0]);
 }
 
-- 
2.56.1.839.g22a8290db9-goog


