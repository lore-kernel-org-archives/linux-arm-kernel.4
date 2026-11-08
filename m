Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69DA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5G9PrcB0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gO6nI77g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V8AG57F3h0HYJ7tWI/du+5oz+4d7R7eRzkKKAI0tT+E=; b=5G9PrcB0nXssjZ
	zq5CN9bV7y+3VRJbP4it45b7F4uGimxt7kYuuHoLOn3Dpwa0nG1eJ9MVE6l2wwZ3GqEMGsIrT6aBZ
	1/pYO8unPbD2f1p3Eh/jBEcClZc1cQZAkRCf99kJAPzCf7FiBzXjMVV/eHFpE4I3cqvlYgSCjOuox
	DM/7hz0A/feYjwKbHMR9QT99EEQa0i8oMdKKAdeE341QFlOKPexaCiLn3DU5Cx+7nVzqTg2nddH8H
	XNhEct30Dzy4MUoLqalP4NKSYXOow6oWRfhztGw+gAo8q6XfPhu5/yu7haYmHyEQl1EpnonV/N5iO
	U6x9JDjnM1hf8giE83KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Aq-0000000GLPA-316A;
	Sun, 08 Nov 2026 15:51:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ah-0000000GLGY-0Ckt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E82360008;
	Sun,  8 Nov 2026 15:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888CB1F0089F;
	Sun,  8 Nov 2026 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153066;
	bh=V8AG57F3h0HYJ7tWI/du+5oz+4d7R7eRzkKKAI0tT+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gO6nI77grDrQYEWENqALu1482jPXRsTeHs5eC2QxriqP6lQtGJH6XZaP38T2FLtq1
	 pHYZ/kURk0MYx6JXbPZrx964vxXixu0uVrFgdjW9t/scdzpzAbqnSUBWOEsuMXjueY
	 UR2a0j35vfMhKnR/ErWk4P0AuUMuMI+rXjc6WArN40PSdhYKetVwIFni4dgODYW/b4
	 ELSeAl4t8YRhoYGklqj60yO8bu/vodgQVLLNF13UgxwprS4PPxTS69A91e6Qv/RJZN
	 6axefcv1Oc52JkDr3+/BwYPiTiWtz3eoQmaLT6ZYF8wgndthzMGyy2zc86FEymtGIp
	 Z0rDsDkukVcQA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:01 +0100
Subject: [PATCH v2 05/15] ARM: configs: u8500: Enable storage support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-5-13b701e66cbd@kernel.org>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable SCSI generic, device mapper, encrypted volumes, block integrity
and swap support. Disable the unused Kyber and BFQ I/O schedulers.

Add zram with its default lzo-rle compressor and loop devices. Build
FUSE, overlayfs and Squashfs as modules, with Squashfs extended attributes
and XZ decompression for compressed filesystem images.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 184644a5e94b..d1cb4b76fa52 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -42,9 +42,12 @@ CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_BLK_DEV_INTEGRITY=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BLK_DEV_THROTTLING=y
-# CONFIG_SWAP is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_IOSCHED_BFQ is not set
 CONFIG_CMA=y
 CONFIG_LRU_GEN=y
 CONFIG_LRU_GEN_ENABLED=y
@@ -71,8 +74,16 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_GNSS=y
 CONFIG_GNSS_SIRF_SERIAL=y
+CONFIG_ZRAM=y
+CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_SCSI=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_CRYPT=y
+CONFIG_DM_UEVENT=y
 CONFIG_NETDEVICES=y
 CONFIG_SMSC911X=y
 CONFIG_SMSC_PHY=y
@@ -194,10 +205,15 @@ CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=m
+CONFIG_OVERLAY_FS=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_SQUASHFS=m
+CONFIG_SQUASHFS_XATTR=y
+CONFIG_SQUASHFS_XZ=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y

-- 
2.56.0


