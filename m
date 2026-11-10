Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cudUp+Na;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QsG2EvCk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BTymXE5L5Js89oaWDphghi1DfhAjrm1CDfc/pBp0mQw=; b=cudUp+NamM8CKjubQy4equT8u1
	haiz9Eefrx03MHJc8/iG/qSjkSS86EEx8KHVOrVk3pCEiNn8E4uadjXoXrRvZAKfHAK3sZ7KgoqWc
	ZOKQ4mpjFQy0hJ34UqCDQlAkqXyWxC2J2kLnSbWXNP25CiFG3VKwqPLhKc8uS/Qa4IJCtW+GxOe7D
	szVLNyQ1su0+WyS+egJB1lo3gGSRnJ2SXwzBx4WSKN40NNwsZ0Qt7PdtZc8teaCY8gJxmNzbhkCIp
	vMPbZ3+TNO6TlYw5MnWzKtcwLzhRpNVfrTWfSGZsFX162PENHLnyga83KCmOgmq8/zvBL+Wh48kkC
	UxorX4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf0a-00000002bii-2647;
	Tue, 10 Nov 2026 06:07:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf0Z-00000002bia-3xDf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:07:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A54060E01;
	Tue, 10 Nov 2026 06:07:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290823;
	b=AeAici4+Tl55zcfo3W8HfO6BjQvMx3Vetzc80NjmOErzKpqEzDWe8DcHJCOzCOhBjmtc
	 eFddUUl3ZYulu15OGS8+LeL5NlB2oUs70M9PgpkWUl6CVIOJgiYeYm0ZRDMl4aeq1wVGu
	 8OzKRe+GvcgQxvMX29RCfXhIsfZLs42eJoRgvI+fD22EBEy/fr6Zz6zkDx+FBy7N+H9bU
	 jTL6FqLmGBXzaDAg2yN9sjIwM1YtarT9isQL1B989pPcS7AaTFPczt0FrgwJQkw0qxHn6
	 lGdBiQXwZT0OURoTV4g7tjkGEzu2jFmGRPytFJ6iIMqcamVFKydiuHqkCwUGE5jMJ2w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290823;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BTymXE5L5Js89oaWDphghi1DfhAjrm1CDfc/pBp0mQw=;
	b=kAoiIjsSoPm6cibM+JgoxsCi060ZSHm4hnPOB83ajF+WWQGAIYCe9QN2i06jVSo2DhKb
	 h2lJ2Gb3QcaolQez9YBl6cgBQJgSOdt3YHVZf9y2ExTohUAhS+q84/mcRrUQiuelfUIpd
	 xqCgNjv8IZBmX56QK5yKFzqK5ojBiZsQINfvpFcW1A2sq8O+ZcjURavTAM6+J9krSEAdE
	 IJrnIUM0O7XVp5NxXhhP76v67GFijZtsU/Y9lNYTdeKQrkNbvImDbBfC6EYdvblMLwQaC
	 PKx3K5RDM3p5WCv+pfbM2fRUDCLSJABr9h59+DnpRyYIi3RFuZeXcbcvhochBSKs3ig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 535EF1F0089F;
	Tue, 10 Nov 2026 06:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290823;
	bh=BTymXE5L5Js89oaWDphghi1DfhAjrm1CDfc/pBp0mQw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=QsG2EvCkR0MjvhcBgNUlwQsTAK+5q8xAbwrVqc0U/BWaSz7WYiJ73t8n6iVlU/F3z
	 2lAho56yGt5xuk1uTfQrg+sfq/1GRAbFlzGI7RKd1xpCiMAlWxyib8ZAmylyk5JWxd
	 66RXhZU+biLFH3Q2hvlkJqCIahMRv6fMpm02vLBcXP/mCSkV0DrQVLXJlXgjRStsiU
	 u/ly/R5LIpDhTV80MbIZGN+iZdlXE1W2wstNCCvytedppxmx+nreQN/QQLAc1oKE5E
	 XndCWC4VkO4mEYbMHp6p0ACiiwHJpQTo2U1WRhmJVqQOrevZlGNV5fAS/rrLtLpxZF
	 siHW6+IaFdDjA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C21B0488AF;
	Tue, 10 Nov 2026 06:07:01 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 06:07:02 +0000
Subject: [PATCH] clocksource/drivers/sun5i: Allow enabling the driver on
 64-bit sunxi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-sun5i-hstimer-arch-sunxi-v1-1-9016f63e186f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqDMAyF4VeRXC9gCir4KmMXbc1shHUjURHEd
 7fOy+/A+XcwVmGDvtpBeRWTby6gRwUx+TwyylAMrnYtEdVoS24Ek83yYUWvMV3TJkhtx95xiGH
 ooNx/ym/Z/unn67YtYeI4Xz04jhMsPfcIfAAAAA==
X-Change-ID: 20261110-sun5i-hstimer-arch-sunxi-167ea2ebcbd7
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794290821; l=2552;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JuIHgoMW4UEdB04flY1z4eCSsxuIeVm+zZ4kA091Ln8=;
 b=qT9bZuPBCA4Hv8LzVHeLlQ9t6bZS2UTSiDBMfA2GoO3ow4Zi8c5uqjz0rwUkGwKsLY4zchDjQ
 uZVIryz/vz7Buw5w8euq7lOs32V14cdbWJEkLjIeTxYh5nSCXywOtA8
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The high-speed timer driver binds "allwinner,sun20i-d1-hstimer", which
the H616 device tree uses as the fallback compatible of its
"allwinner,sun50i-h616-hstimer" node and the D1/T113 device tree uses
directly. SUN5I_HSTIMER, however, only has a prompt under COMPILE_TEST
and is selected by the 32-bit sunxi machine Kconfig alone, so arm64 and
RISC-V sunxi kernels cannot enable it and these nodes never probe.

Make the prompt visible on ARCH_SUNXI. The driver registers its
clocksource and clockevent at rating 340: below the architected timer's
clocksource (400) and below the sun4i timer (350), which ARCH_SUNXI
already selects on arm64 and RISC-V. Enabling it therefore adds a
second hardware time base without changing which one the kernel uses.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
The H616 and D1/T113 hstimer nodes and the D1 driver support were merged
for 7.2, but the driver still cannot be enabled outside COMPILE_TEST on
arm64 and RISC-V.

Tested on an Orange Pi Zero2 (H616) with a 7.3 kernel carrying this
patch and CONFIG_SUN5I_HSTIMER=y: the hstimer node at 0x3005000
probes and available_clocksource lists "arch_sys_counter timer
hstimer".

This patch was developed with Claude (Anthropic) as a coding
assistant. It investigated the problem and wrote the code and the commit
message; I reviewed it, and it was tested on an Orange Pi Zero2 (H616)
as described above.
---
 drivers/clocksource/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..971491d2e584 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -172,12 +172,17 @@ config SUN4I_TIMER
 	  Enables support for the Sun4i timer.
 
 config SUN5I_HSTIMER
-	bool "Sun5i timer driver" if COMPILE_TEST
+	bool "Sun5i timer driver" if COMPILE_TEST || ARCH_SUNXI
 	select CLKSRC_MMIO
 	depends on COMMON_CLK
 	help
 	  Enables support the Sun5i timer.
 
+	  The 32-bit sunxi platforms that have this timer select it. On
+	  64-bit (ARM64, RISC-V) sunxi SoCs such as the H616 and D1 it
+	  registers an additional clocksource and clockevent device, rated
+	  below the ones the kernel already uses there.
+
 config TEGRA_TIMER
 	bool "Tegra timer driver" if COMPILE_TEST
 	select CLKSRC_MMIO

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261110-sun5i-hstimer-arch-sunxi-167ea2ebcbd7

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



