Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3250606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3qZJZ4lq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oewQcqWK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZXq6N7MbK9ennCGyvQq1ooiKslcMJ1eYGKCpx/Ct7LI=; b=3qZJZ4lq0G5e8U
	xxITa3eWmZ24Y3GZRAp1hn4Khpow/MeKHK97Mtvt9FfBRvpxxxNn27ObmQ9YJBdV30SXZQIkUYHLT
	KE4So+BWYMEgJP8RChsIrX4femecG5x7TNpwUYCUHU8SYPMdI/mYGFWFJzDFgIzwkq4DRP7U/5TUH
	6Yr1gq+rvVDcMNpdOUwuJ8L5pf2GbEPd0RlFl51uqEhoRy/gt8+COmdlDDiiqzBWipaPoHUn6k94u
	nOIUo/ocDlsROXlADFMqxrCbMWM83VZP04nTYrDDvho2D3Ed5gY+vWzoSi25RbMY4H0NvsKD3wEDh
	ddJsIJ7wM2+u8lb9IY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ah-0000000GLHi-2S13;
	Sun, 08 Nov 2026 15:51:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Af-0000000GLFy-1pDf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36C5542E6C;
	Sun,  8 Nov 2026 15:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE061F0089F;
	Sun,  8 Nov 2026 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153065;
	bh=ZXq6N7MbK9ennCGyvQq1ooiKslcMJ1eYGKCpx/Ct7LI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oewQcqWKRdaaX1OWX/d95TOHVjzIwYZUAUbvihrQRl6Bvd+7XHOBkKBzWA8YtN7da
	 jmJ1bDfr/Xmy2mtdh3PrOnm7GU+o1BHaEQGI+l9MGDWfnO37ieqZRNNuBRZwjmIANb
	 aZdi3LI8/qrZmxbmcVzB1QGsNgc3AffXfZX2naX0F3HIUfvRTVF0BxmRN+uRFbRH/X
	 hVb/9daT2Shvl5a9Qe+5AMWT9xrnzPioHE31vu2KFlMhp4zqWtDSjkQK7qP2vywfpb
	 xc2gnjnQEMkPJCbOkHHkdM/cjtDcShVEFM2x+b7n9Q5xhZb04SeLbvbVr2JL6dYiKT
	 ntKaAZxjSXSSw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:00 +0100
Subject: [PATCH v2 04/15] ARM: configs: u8500: Update boot and memory
 configuration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-4-13b701e66cbd@kernel.org>
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

Remove the initramfs root from the built-in command line, disable ARM
PAN explicitly, and enable the XZ decoder and CMA DMA support needed
by the target configuration.

Keep initramfs support available for distribution boot and encrypted
root filesystems. Enable multi-generation LRU by default for memory
reclaim under pressure.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 4d0bb77fab7f..184644a5e94b 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -25,14 +25,14 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_U8500=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_HIGHMEM=y
+# CONFIG_ARM_PAN is not set
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_CMDLINE="root=/dev/ram0 console=ttyAMA2,115200n8"
+CONFIG_CMDLINE="console=ttyAMA2,115200n8"
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_CPU_IDLE=y
@@ -46,6 +46,8 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_BLK_DEV_THROTTLING=y
 # CONFIG_SWAP is not set
 CONFIG_CMA=y
+CONFIG_LRU_GEN=y
+CONFIG_LRU_GEN_ENABLED=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -202,6 +204,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_DEV_STM32_HASH=y
 CONFIG_CRYPTO_DEV_STM32_CRYP=y
+CONFIG_XZ_DEC=y
+CONFIG_DMA_CMA=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y

-- 
2.56.0


