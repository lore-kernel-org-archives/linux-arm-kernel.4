Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F75606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lyT2z3+u;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+LQZT4h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k5W8eUr54vtLOaFvvTfttf7XeRTOKahAOriCJdbS9q0=; b=lyT2z3+uF7G4jX
	oiLvtBa8fmi42/GlrwABeEL355rSE0QkWgsXcnBWRzsdZCFozaeBhh+nckS6fOtBUPRPTaf99djXq
	9HDHIk6oYBeqwIcMarKiWAISYbddMaBjqUyLUQUD6rKbu8fehm154+sLjPPkPeNv9dDi8FKPBDJNH
	NGS5Yc1XR8g3kw/tT5Q6LYvUZao+hV21XBcHcBibBlSBD0icDj2ginaVAOpqKMhScqOFVyqYhmj23
	48eGfPkuH+TV4V2DK8+wWt+FZJbWLsXiwu52bpL5jSPvrcEnHr7CSjctiSZ4fsxQkTsf6pMW6RViV
	IbdYy2U75lP6fqVW45xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5BF-0000000GM4Q-16wI;
	Sun, 08 Nov 2026 15:51:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ar-0000000GLRt-2wFq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70EC8414B0;
	Sun,  8 Nov 2026 15:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A587F1F0089F;
	Sun,  8 Nov 2026 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153077;
	bh=k5W8eUr54vtLOaFvvTfttf7XeRTOKahAOriCJdbS9q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=k+LQZT4hoXOs+cs3k4QR2/eWIOUoikILi4g6lJU9nOTZ5RVrBjGNNMW+3mtWoKel7
	 ihURhAh8Jv4+HlIt9KyQSEupupRaaR7tS6Qbn7VBdg3pTE1Az9/suEinBU88QDmY5g
	 JsbRTCCIxjkMqpR9Kf0ymCMkv1/sEYawPcgS6mtGunA81fPIU+pCLw0z4+DaBksOct
	 11+cl+igwS9xxfAZYT/97TXbTX2hNF41hdHVY5zDf0KyqNyqoVTfPHo+QdfHtnafC0
	 g7Nc/o8eaIVJ4+YRUnCH3vfyMIepXFqMTaY/HIGU8Jmyrc8OzzGtFyh0ns025zVbgb
	 3aH2fGW+1cXLQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:11 +0100
Subject: [PATCH v2 15/15] ARM: configs: u8500: Enable compressed firmware
 loading
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-15-13b701e66cbd@kernel.org>
References: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
In-Reply-To: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allow firmware requests to load XZ- and Zstd-compressed files, as used
by postmarketOS firmware packages. This lets the existing device drivers
use compressed firmware without requiring uncompressed copies.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index c43b2e39d295..90309291c657 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -92,6 +92,9 @@ CONFIG_NFC_SHDLC=y
 CONFIG_NFC_PN544_I2C=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER_COMPRESS=y
+CONFIG_FW_LOADER_COMPRESS_XZ=y
+CONFIG_FW_LOADER_COMPRESS_ZSTD=y
 CONFIG_GNSS=m
 CONFIG_GNSS_SIRF_SERIAL=m
 CONFIG_ZRAM=y

-- 
2.56.0


