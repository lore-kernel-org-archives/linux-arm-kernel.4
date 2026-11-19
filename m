Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3AB606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UG5y7S8s;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Jo1WD+Jm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GgEAf6C345RQ3nj5qc/WkXfCBkox/4455vx8pIAqcaU=; b=UG5y7S8sRsMvS5
	XWCowvwvS7zZfbRZZ+9U+an1yrNQ5TeYqSuZ49TZLRNo5yf1wAv8EjDnXnac2yRn5NIsBd2War4Bk
	NVi3HmfYF8j3U8nNrTT5/y6134zupgsO586RJfGUzks0bmtQ9m4waWnnvI4U+rXgEPUnoNztsSlHo
	eNOitYXs3IXkmOL3UFEqefI32BE93/XN7p4uoCe7bICEBL6eP/6p/oRJjf0VH99zeecA8J36b4C01
	knTga7Ikurdd7b/jp2F6yeBu+k5vF0U4dgjVhTJfSAU+f0Qtggh4wG3AfdLmFRhTtiwlC2y3ZwmCm
	bms2R5jPkHfQtEFxZ/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU45Z-0000000CSWU-2yUa;
	Thu, 19 Nov 2026 15:30:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU45V-0000000CST4-19L2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:30:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C6F641A1711;
	Thu, 19 Nov 2026 15:30:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95C5960237;
	Thu, 19 Nov 2026 15:30:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56DF411BC0B84;
	Thu, 19 Nov 2026 16:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795102210; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GgEAf6C345RQ3nj5qc/WkXfCBkox/4455vx8pIAqcaU=;
	b=Jo1WD+Jmu/Aqe5bAvcqlxSIJQKrJlnKz4rJYk2GX84NWwcf2eFf178YneWAbQH6HkFc5pK
	3g9Ve0BZaQqUI0Iyidi1Lbn5/HJ8Mu+QRB1/eKGMms4Jj2PNcppRhBlLutpqW4VEbXQ6wJ
	FB2EMuKObqcaqRlfPTMhu93T8VOqawawYOFyOFuO0NpT65M2QpBndjSRoC9z3SBdULpZns
	/LfaAhcZnc5ich7GPPAWxx+7nbbvzBZLCcss19UAO0J+B4n2xTjWrrSkqyFIGJjPwjumnc
	pkEKk4gm1GhLByw1eBaiMSf01rKabA5VBFE3iM1/xrRqJFDxpiVlfDeaIlfXwg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 3/3] scmi: driver: Increase timeout for rx response
Date: Thu, 19 Nov 2026 16:29:44 +0100
Message-ID: <20261119152944.276763-4-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119152944.276763-1-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_073013_462285_8D86AE80 
X-CRM114-Status: GOOD (  14.34  )
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

From: George Cherian <gcherian@marvell.com>

The timeout is way off on the Marvell CN10K SoC, where the firmware
processor can take more than 200ms to answer.

Signed-off-by: George Cherian <gcherian@marvell.com>
Co-developed-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index 308736c3ead9..78c38d2644aa 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -380,7 +380,7 @@ static const struct scmi_transport_ops scmi_mailbox_ops = {
 
 static struct scmi_desc scmi_mailbox_desc = {
 	.ops = &scmi_mailbox_ops,
-	.max_rx_timeout_ms = 30, /* We may increase this if required */
+	.max_rx_timeout_ms = 500, /* We may increase this if required */
 	.max_msg = 20, /* Limited by MBOX_TX_QUEUE_LEN */
 	.max_msg_size = SCMI_SHMEM_MAX_PAYLOAD_SIZE,
 };
-- 
2.47.3


