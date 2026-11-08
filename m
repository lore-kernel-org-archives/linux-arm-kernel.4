Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E93C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cTmr37Lv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XlY0HOBz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YQwAZIQCIzqI6AW2s7hIgTJM7Q1k0CCAwWdPKYZscao=; b=cTmr37Lv6C1Wk1
	OLpQii5tQz3LNNvnYVJILYRuncyByrfMrEQqUIDi5ieQ+EsuOef5tiqbtqoK1pP+LWm5KyF77rm9t
	2LO4HtAJ9IYjlvv6C1k38QSuVvX41PHPABpEZ+iqBkO6hxwdbSWDrzrgxbiG5+GKK8mPKPcOoMe3C
	zltW2Mg/PLV6wmH7bHr+5xm5tUJ5CCaruq1RRvS0FrqToADVqg0dZU5uzZ5qV3qJuEzduQK31WN/O
	na4wmoUxaOaHfkoZtanrfRL06jkDRdHnnJbOnGRqbQHsdeQUS1dleUljNEZSynchUVPYJ/5+l58O/
	vF2DAP2uIWW+aE+gp7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ar-0000000GLSl-3Clw;
	Sun, 08 Nov 2026 15:51:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ao-0000000GLNb-1RL1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E17D436D9;
	Sun,  8 Nov 2026 15:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A9D1F008A1;
	Sun,  8 Nov 2026 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153074;
	bh=YQwAZIQCIzqI6AW2s7hIgTJM7Q1k0CCAwWdPKYZscao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XlY0HOBz3S/bhTg9UpObs3NuJBOfJ54EgoHXqGMP5l7uHwnny3C/tAuf9bUYEa30P
	 s/VBWWj6JFryx5QQ0QhJxrnFcpAL62vD+eFphJXadzrRAvd8auIeTkbuqSWTpr9qQK
	 y7Z0HrvBadopNDWjsXUF3Qektyd0tsQ7W5vifqLcGqe2sAld8/v4sM8NvnBPcKZNe/
	 Io3zNUd0CRYL4//a+l22b5Iqoy/zRGQyOVdU2ZV+I2/p1IZoPwBvsMKFUvFmteHMJG
	 RjSi0ButjtLAgnrFrxcQSWSAk1UWeJacoujkILgc0C596IElk6tVV4OkCyX5F1YS18
	 1TpHmfI2Oxb+Q==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:08 +0100
Subject: [PATCH v2 12/15] ARM: configs: u8500: Enable security features
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-12-13b701e66cbd@kernel.org>
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

Enable ext4 access controls and security labels, encrypted keys,
security hooks and the userspace crypto interfaces.

Enable XTS mode for encrypted volumes and kernel-mode NEON support.

An LLM coding assistant was used to add and validate the XTS and
kernel-mode NEON options.

Enable the BPF JIT compiler alongside the existing BPF syscall support.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index ec9a8e3c107b..704bc2290411 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -3,6 +3,7 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
+CONFIG_BPF_JIT=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -40,6 +41,7 @@ CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_U8500_CPUIDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
@@ -241,6 +243,8 @@ CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_EXT4_FS_SECURITY=y
 CONFIG_FUSE_FS=m
 CONFIG_OVERLAY_FS=m
 CONFIG_VFAT_FS=y
@@ -254,6 +258,15 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
+CONFIG_ENCRYPTED_KEYS=y
+CONFIG_SECURITY=y
+CONFIG_SECURITYFS=y
+CONFIG_SECURITY_NETWORK=y
+CONFIG_SECURITY_PATH=y
+CONFIG_CRYPTO_XTS=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_USER_API_SKCIPHER=y
+CONFIG_CRYPTO_USER_API_AEAD=y
 CONFIG_CRYPTO_DEV_STM32_HASH=y
 CONFIG_CRYPTO_DEV_STM32_CRYP=y
 CONFIG_XZ_DEC=y

-- 
2.56.0


