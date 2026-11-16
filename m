Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F333A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GHw8n5JQ;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uTzXgKX7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Io1BI6qoNCZuXyB0hpVKaDQ4e+kSz3Jj0EHD4cdk5bI=; b=GHw8n5JQv09kmf
	GBra+dh7QS3NiTPwFMeYfNItlHmd90tYc2FaNXHLE9aRrJZUIlBMtaNA/YdkNcfDBy/4cKjoTUzYR
	uJ6MiH1N50L+5miCRNUD11oKUzRhh0UDqfdw13qRV7TTdlqHKgs1uC9oqYq+CzTueO3XsT851Ezva
	B3skbFQYKbynlQx31KrmdxC+FbQwgaHgEzHdEZNbYfQUNA6JbBXgHoquRHCD1l2VwUjnrXAnn/exM
	upR1ebg4Cf2AR7TkDSNW4+DSUP9kFBNlo885HBsJyZG4kTl52LMLXWl8UEqh05kgDaOX6EbQxgM6v
	ucfoUB+bGKI35d5mOHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx8X-00000002i5G-40SL;
	Mon, 16 Nov 2026 13:52:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx8T-00000002i2L-11wU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:52:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E51B91A168D;
	Mon, 16 Nov 2026 13:52:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B45B26023F;
	Mon, 16 Nov 2026 13:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7814D11BC0465;
	Mon, 16 Nov 2026 14:52:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837155; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Io1BI6qoNCZuXyB0hpVKaDQ4e+kSz3Jj0EHD4cdk5bI=;
	b=uTzXgKX7TZ5HexcBNzk+bN4X/4RHGFmVz7b7qxT4jii4fbopEUoC9Mv2zUCyQ8NT7CEFYH
	p6Q4yVi0RnR2wv+HC5VGmn2Z+Dtv6P239jvLZWQ3Tgu9k8n+nshgcD5o0Cf5pQf3Yuyu5Y
	ElKLGT8JOuQEvLk1sKwSBN4LD1Fc3B87JBteLSb5OlhcZxKmu+iydgkoH739pOza4Q6gQ9
	kaUAcRFeRglYg9GIhgcE5TBVp0xdRmH8nhHK3HqbNM3bZ4bBxtrN3bcJYMnwo2858qThjp
	kdcp04d9jxkzoxwHPbcsTYdX/hHWaFddmQ1l9ieYbMtx003M7bv9Hcgff7lQ4w==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v3 1/2] clkdev: Improve clock discovery with clk_find()
Date: Mon, 16 Nov 2026 14:52:16 +0100
Message-ID: <20261116135217.37038-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116135217.37038-1-paul.cercueil@bootlin.com>
References: <20261116135217.37038-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055241_449620_36136B11 
X-CRM114-Status: GOOD (  13.23  )
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

With a setup where a clock provider registers a clock with a device name
"mydev" and a clock name "myclk", calling clk_find("mydev", NULL) would
not actually return any match.

Update the code so that we can support this while maintaining the
existing behaviour:

- clk_find("dev", "con") matches in order of priority ("dev", "con"),
  ("dev", *) and (*, "con");
- clk_find(NULL, "con") matches (*, "con");
- clk_find("dev", NULL) matches the first case of ("dev", *).
  Note that in that case we don't handle wildcards for the device name
  or it would end up matching everything.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>

---

v3: New patch. Imported from
    https://lore.kernel.org/linux-arm-kernel/20261103084915.8405-1-paul.cercueil@bootlin.com/T/

    Originally sent separately to go through different trees, but the
    context was lost which didn't help reviewing.
---
 drivers/clk/clkdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 919fc680ae4d..ee6c0afd6ec0 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -53,7 +53,9 @@ static struct clk_lookup *clk_find(const char *dev_id, const char *con_id)
 			match += 2;
 		}
 		if (p->con_id) {
-			if (!con_id || strcmp(p->con_id, con_id))
+			if (!con_id && !p->dev_id)
+				continue;
+			if (con_id && strcmp(p->con_id, con_id))
 				continue;
 			match += 1;
 		}
-- 
2.47.3


