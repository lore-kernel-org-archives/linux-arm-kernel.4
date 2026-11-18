Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A85A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rUhOkQVm;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qMOUxDEU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YF3rO8Ic6p5GJpGsgevV8sf20D+3CyakkHcPRmAnado=; b=rUhOkQVmCry4xGmoRd1GBg/usG
	39DYcQ9fVV2XRe/KfCjypF/CDGg9oUJGU0LPAzg1mUMecBT9H9Kmb2z1hk/WObo9jMW9uy09vOjZv
	WgzsRWcrZ96X0Ui2CfAWuaqDMjpbhUaHM6we1Y647bDtJv9J5LH2lRHkhc/6X6Z0ahz4x11t1896d
	Ljk/o0osxeKV5q4ShpbZhDg6FPVgXiREZEa6v6whw1yTgLRshtmCN3sMHVyyuwZNeurgaxThmKCD+
	6HTKwzStMcdXjwaYq+lMxRa8qy/9MHudxUy8JBrw1kOBv63H5WWTn+0hxJXcpZYdokQh52y7vX8Gp
	t5uAtnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg7y-0000000910h-3Tox;
	Wed, 18 Nov 2026 13:55:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg7v-00000009108-2EI1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:55:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CBCDEC4F77E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:55:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1BB95FE9B;
	Wed, 18 Nov 2026 13:55:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 345E111BC0D19;
	Wed, 18 Nov 2026 14:54:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795010100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=YF3rO8Ic6p5GJpGsgevV8sf20D+3CyakkHcPRmAnado=;
	b=qMOUxDEUnq3J4RmzyKFaA1qhwDGw0B/Z0ERt7BUovrptTMIC9ccmikfxpjmmLytK5alGnk
	1pgXzAgfFwQxiEsnfTpKJBWjCT5h9knDegr7EQXpIT4Zv8ipAED2U36+iyYZYcLNTV1caS
	aQz7SgOQdeiC9zVpt80a1wtrk7a8OhpOXFjX3KNRQ233+LxPUWEaf0ABFARF0zXK4kpGAv
	0IX3bAhdR94ZZ54i8OKv2ZjJlffvqjkDN76nR6LutiP6IqD7q0EbZH1KDG/8rtbFxQz1i1
	syACs5IjfS3ZVPpRENrBAsR5wUAgK37ZO+bO7itWXaFlerGeXa63QwXL66VfLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] spi: ma35d1-qspi: Fix continuous reads
Date: Wed, 18 Nov 2026 14:54:54 +0100
Message-Id: <20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-v1-0-e5066ad2efe3@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NSw7CMAwFr1J5jSWcirbiKohFSEzxok6Iy0eqe
 ncslvNGerOBcRM2OHcbNH6LSVEHOnSQHlFnRsnOEI5hIKIJP6K3ohlf1dbGcRGdcYn9KRM+rQq
 moiu6yHiXLwaOUz9yijwO4J+1sc//3uW67z/ywMNlfwAAAA==
X-Change-ID: 20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-2ea837ecae76
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_055507_748257_177AE8C8 
X-CRM114-Status: UNSURE (   7.76  )
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

The controller is arbitrarily limiting the size of the SPI
accesses. Patch 1 drops that limitation, which makes it suitable for
flash continuous reads.

Patch 2 is a general improvement follow-up.

Patch 3 is a proposal to step up as co-maintainer of the MA35D1 SPI
controller driver, because I do care about it at the moment and
constantly seeing it break is a bit annoying.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (3):
      spi: ma35d1-qspi: Drop a pure software limitation
      spi: ma35d1-qspi: reschedule during long PIO transfers
      MAINTAINERS: Add myself as Nuvoton MA35D1 SPI controller driver maintainer

 MAINTAINERS                   |  7 +++++++
 drivers/spi/spi-ma35d1-qspi.c | 16 +++-------------
 2 files changed, 10 insertions(+), 13 deletions(-)
---
base-commit: 69dbffe2d549f5dc52058d8182623ba9721dc06a
change-id: 20261118-winbond-upstreaming-ma35d1-qspi-cont-read-fix-2ea837ecae76

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


