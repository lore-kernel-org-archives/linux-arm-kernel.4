Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148BF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 23:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mRcZVRrd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9JEzgMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0HKgOf2neF8BsNKIMfwNTXBbMcaQ/qjnZDjWn2cWxT8=; b=mRcZVRrdaDrf5IlQYylTZT2hKQ
	J3qTCyeTcWziFRzkpNCdUsL82j1lr2IRPqvLCBcifRhk91RQKDqV5K1hI5kVh1aoO/sidudan622b
	15PUhw/Yo2GrPMD/JXDYm0gcBD9DBfIU/jt2XQsE66Kyj8Bjvw8U1w4qZwzPS7xeAizmYQqtwmOA0
	RAvIvQtuKkk2h373Uw5AjXV6r8LfkX9Uep4Tt73yT+m9w3GB9gq8HuV3dCjyGMghC28eoiMXoKqAo
	gwWRajrxpICB8vDKr37u2sKGXuVjBDLV6xLSyRyKnedfHQf4/moeVsHEWIBMwfadsvSfZ2i+MwUbF
	1XFG5g1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5aP-00000000CJQ-02SC;
	Fri, 27 Nov 2026 23:42:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX5aN-00000000CJI-3QkD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 23:42:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3152C60621;
	Fri, 27 Nov 2026 23:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2266A1F00893;
	Fri, 27 Nov 2026 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795822953;
	bh=0HKgOf2neF8BsNKIMfwNTXBbMcaQ/qjnZDjWn2cWxT8=;
	h=From:Subject:Date:To:Cc;
	b=D9JEzgMnxeoZtCXLy2bp7by/IYxROo7J7yJyAfyPP3jgcWjDfL7W8iD7ZzuEsS+P7
	 Z7hkK2V5aLU+zPjyZjd7DiyqSLt6LjyE/tQ0/lLZY3LR3OyaUVgnUTLyV5ROoS3ghR
	 j7R0tcWhZl6B6NtbVBGnhnLgftbKh6eJq6mPF0ZAzB7PGpVNN3XlbWt3Dw0uY5q/CS
	 DixVsJXEXHdh6ox62F2HW/Tz1Dhuwhx15LXiBhZNPcwMlGQHdNUk4WVUQ3NQlN1AuO
	 o+lYlxg7+dCe57xPa1A8FvOa5uLfNJQ/ZG/mvPAL5JhjHHbUDwQY/2plOKo941Fc74
	 j+iChQZBWyB9g==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/6] Move DB8500 PRCMU clock policy into the clock
 subsystem
Date: Sat, 28 Nov 2026 00:42:28 +0100
Message-Id: <20261128-ux500-prcmu-clock-move-v1-0-77c49daad1d2@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MSwqEMBAFwKs0b21DEohIriKzcJJWGz+RBEUQ7
 z4wdYB6UKWoVAR6UOTSqnlHINsQ4jzsk7AmBIIzrrXWeT5vbwwfJW4nxzXHhbd8CadOxuSdaf1
 3QEM4iox6/+P+874/+ybPVWgAAAA=
X-Change-ID: 20261125-ux500-prcmu-clock-move-d8efd52065ba
To: Ulf Hansson <ulfh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev
X-Mailer: b4 0.16.0
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

The U8500 clocks will need some extended features going forward
and I don't want to force Lee to review clock patches just
because there is half a clock driver in the MFD PRCMU
driver.

Move ARMSS rate selection and CLKOUT, peripheral, PLL and DSI clock
register programming into the Ux500 clock drivers.

The MFD driver continues to own the shared register mapping,
SoC PLL/SYSCLK firmware commands and mailbox synchronization.

Drop the unused partial-25% APE mode, which was emulated by
changing clock dividers in MFD.

The final patch removes a bit of policy from the PRCMU
driver, it will be managed by the clock subsystem.

An LLM helped with the mechanics in this patch series.

This series requires the following prerequisite patch:
"mfd/regulator: db8500-prcmu: Remove EPOD regulators, v2"
https://lore.kernel.org/mfd/20261127-ux500-epod-regulator-removal-v2-1-0ccab0f430fd@kernel.org/

---
Linus Walleij (6):
      clk: ux500: Select ARMSS firmware operating points in the clock driver
      clk: ux500: Move CLKOUT programming to the clock driver
      mfd: db8500-prcmu: Drop unused partial APE clock divider mode
      clk: ux500: Move PRCMU clock register handling out of MFD
      clk: ux500: Separate the PRCMU DSI clock implementation
      mfd: db8500-prcmu: Always submit an explicit APE OPP request

 drivers/clk/ux500/Makefile        |   2 +-
 drivers/clk/ux500/clk-prcmu-dsi.c | 352 ++++++++++++++
 drivers/clk/ux500/clk-prcmu-hw.c  | 492 ++++++++++++++++++++
 drivers/clk/ux500/clk-prcmu-hw.h  |  39 ++
 drivers/clk/ux500/clk-prcmu.c     | 163 ++++++-
 drivers/mfd/db8500-prcmu-regs.h   | 128 ------
 drivers/mfd/db8500-prcmu.c        | 937 +-------------------------------------
 include/linux/mfd/db8500-prcmu.h  |  40 +-
 8 files changed, 1041 insertions(+), 1112 deletions(-)
---
base-commit: eaf11176791570b235e10c43bed920659745615b
change-id: 20261125-ux500-prcmu-clock-move-d8efd52065ba

Best regards,
--  
Linus Walleij <linusw@kernel.org>


