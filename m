Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B00C606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ieWq5mNW;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=z4PgQUru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8YuqZ8GuOBbpaf2Sgoc++9V1NZuSh8t13c1nFKdqRWA=; b=ieWq5mNWk7jIqN3hnv1ulwrhXT
	TBYXpofVifA8XNGx6hKKiY+TdHWmPn3+2UHrx/egOeNcCgh9GzdHEfmxJ3EWqT89cgAgcq40YcWYn
	MyQhLOPX7csHOkm+D437DPxZFFBj9niXALgpvRKtL5vBb4hvKLV2CsszUqfHk/kgVRIx+3ScPysXq
	wywfNQoZadr1lmlXyqH3wxJyMcUkFr+wz2APnO8W4FF97PtadjbOU+3PvtGarDyEVhUbwoQETVc75
	ocsDszD/cFqqrY4ozI2Pp7knzI1+74D32MKCmX7GrZY6q54aRs+3tHDU/s9Iq1yfeOVflUe0npy5R
	RCCwO9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOBb-0000000F1s7-0a8C;
	Fri, 20 Nov 2026 12:57:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOBY-0000000F1rF-3NDT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:57:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 410134E41638;
	Fri, 20 Nov 2026 12:57:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 151D9601B9;
	Fri, 20 Nov 2026 12:57:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C2BE11BC015E;
	Fri, 20 Nov 2026 13:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179462; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8YuqZ8GuOBbpaf2Sgoc++9V1NZuSh8t13c1nFKdqRWA=;
	b=z4PgQUruRl3diP1nWHVI9Lr5iUhZI/TxDwzvxPQ9fUqVE4C1zGYJS7BJ6Pr5kymiy4yzWh
	iPMYuRtmSYzIC2fareRhD0doytvLHtCQ22N0Xj2qulK6g5Tb+gBThvB48P9A9fRFVx0KPP
	CBwb/Hetjge0fRHlNAfp5dTusNoF+bKBTw6F7YEVwZSlkQV69n400bqBpEwPv5rqfI4H8z
	NYZu/om3WESiQk+8paIRxncDwSob6S+HpgDo4z5T/6MG8Pu9EQKgE/6gHGfBHTPWFTYx13
	wpPoBo8Q93PhTudE9NwXlrvzznid504yyeUB46hWyeb0k6laBq5XF4CwXukD/w==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 0/2] ACPI: platform: ACPI 6.5 fixed clock support
Date: Fri, 20 Nov 2026 13:57:20 +0100
Message-ID: <20261120125722.209609-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_045748_981949_033BC5B8 
X-CRM114-Status: GOOD (  10.02  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rafael, Russell,

Here's the v4 of my patchset that adds partial support for ACPI 6.5
clock resources.

Sashiko complained about the clock names being too long still, as
ACPI device names can be up to 17 characters and the limit of clock
names is 16 characters; so I now name them "acpi-clkX".

Note that I expect warnings from Sashiko that I got on my v3 and didn't
correct, because they are bogus.

On the clkdev patch:
"When clk_find(dev_id, NULL) is called, does incrementing match here
give a (dev_id, con_id) entry a higher score than an exact
(dev_id, NULL) entry?"

My answer is that you call clk_find(dev_id, NULL) when you know you only
have one clock provided, so you don't need to care about matching
priorities.

On the ACPI patch:
"Should the con_id argument to devm_clk_hw_register_clkdev() be NULL
instead of name? [...] Setting con_id to "<dev_name>-<idx>" instead of
NULL prevents wildcard connection matching in clk_find(), so any
consumer driver calling clk_get(dev, con_id) with a non-NULL con_id
fails with -ENOENT."

That's completely ignoring the first patch, which addresses this issue.

So I consider that those two issues can be ignored.

Changelog since v3:

- [2/2]:
  - Change clock names to "acpi-clkX", because ACPI devices names can be
    up to 17 characters long, and our clock name must be 16 characters
    max.

Cheers,
-Paul

Paul Cercueil (2):
  clkdev: Improve clock discovery with clk_find()
  ACPI: platform: Add basic support for ACPI 6.5 fixed clock resources

 drivers/acpi/acpi_platform.c | 64 ++++++++++++++++++++++++++++++++++++
 drivers/clk/clkdev.c         |  4 ++-
 2 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.47.3


