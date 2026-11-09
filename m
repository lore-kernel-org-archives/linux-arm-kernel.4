Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gY/eBGaP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fctk7shm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=djs195KZY/BJdEFCgcDSpeR4fu1pIHlWnSTsGITALWI=; b=gY/eBGaP2sAseR6W6qYCNbVHQH
	U1ifnmSJ/5OMx34p1g5/gji4NKRcLe02cGt0DyLSdbCnDnIgQmWXNLY3PtTlXL1uQgoaw1+jhs8QT
	kxofHgEZwKgVJ3VAFKkzCCjNmITjUMB647qv3nXTvOtCAHLODhSIXH7FcgmB7pZUQ+NmLjodp9fY+
	u4zPuUdA+9Jdq2FIUdzKQnnsvKC5p6Jxe0SOnr2tAgD0rV379ZqpZXmRMOqOX/tMCHZJtok1Co2MV
	CUAoP0es/oQ5AAdtBN03vwBSs+CtNvQM0z2Yi9GXB3KMTyv3l0YKysb3T7O5xd0n3QpwkEOy+Xhoc
	EiAk/DtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJ9X-0000000HWNn-1pxt;
	Mon, 09 Nov 2026 06:46:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJ9W-0000000HWNc-3XaF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:46:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3875B43B38;
	Mon,  9 Nov 2026 06:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AE51F008A1;
	Mon,  9 Nov 2026 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794206810;
	bh=djs195KZY/BJdEFCgcDSpeR4fu1pIHlWnSTsGITALWI=;
	h=From:Date:Subject:To:Cc;
	b=fctk7shmf9TRh1KwyKD0HX4xz2w8GL0ddf7yz2exNNrNwmmMGGMPC8JtzSwncsOWL
	 65PqMPlxf5Abs+k4Udx5fTzm5Kp3PtlmMPOAQZM4sUTN7KO6j9DtJRxlZNYh3hD8r0
	 AW0iGgkeAmFQN+aI9WfZyUioxx7ePizma7edDn15lmohKsv7LDMjCSJPUxJu14yFua
	 hnIIhJoX12qRdWgPqmhOky02D/hTNWo3F7x/IsxHU7m3sGzB5Av2/AfKcc+fwAa2Qd
	 ba+16walC9JU9xxmDYgkQUXO+16NG769FhnpJX9oXfZNb4JDQHbuDbXhwGVpKu7K6f
	 /pd2y/ruiSwcw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 09 Nov 2026 01:46:42 -0500
Subject: [PATCH] ARM: kprobes: Rename test-kprobes.ko to
 test-kprobes-arm.ko
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBBG4auUWTuQCTVQryIu0vZXozQtM1EKp
 Xc36vJbvLeRQROMTs1GineyNOcKOTQ03GO+gdNYTd75IOI6jjpxgRV+Ljr3MFbkOIFdcKMc0bX
 BC9V6UVzT+jufL3/bq39gKN8d7fsHMRbZyHsAAAA=
X-Change-ID: 20261109-arm-test-kprobes-rename-060d15e94621
To: Russell King <linux@armlinux.org.uk>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513; i=nathan@kernel.org;
 h=from:subject:message-id; bh=d5ZqSkJGrlvMOK0yRJD5xyXF8O7G7+KdgShpcEY9QEE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkfc0KbbaJ37974TGDPg9ZPEllvr9XN+252cMH2B1ty8
 kT4JIy1OkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBELPYw/BV70HuT21/DOPWA
 jG3OvM+Xre6alN5O3dDAwiS0Ujnm2VVGhjeP1vEoBflvcJ39gHPH101b75Sfetip3D1V3FJ036E
 93HwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When scripts/modules-check.sh is fixed to normalize the module's name
like name-fix-token does in scripts/Makefile.lib before checking that it
is unique [1], there is an error due to lib/tests/test_kprobes.ko and
arch/arm/probes/kprobes/test-kprobes.ko having the same module name.

  error: the following would cause module name conflict:
    arch/arm/probes/kprobes/test-kprobes.ko
    lib/tests/test_kprobes.ko

  $ modinfo arch/arm/probes/kprobes/test-kprobes.ko lib/tests/test_kprobes.ko | grep name:
  filename:       arch/arm/probes/kprobes/test-kprobes.ko
  name:           test_kprobes
  filename:       lib/tests/test_kprobes.ko
  name:           test_kprobes

Rename arch/arm/probes/kprobes/test-kprobes.ko to test-kprobes-arm.ko to
make its module name unique and clear up the error.

Reported-by: Sasha Levin <sashal@kernel.org>
Closes: https://lore.kernel.org/20261108225808.1809266-1-sashal@kernel.org/
Link: https://lore.kernel.org/20261103110411.11698-1-info@daylightlinux.ch/ [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
We would like to take [1] for 7.5 in kbuild-next, so we would appreciate
an ack to take this directly or a stable branch that we can pull in.
---
 arch/arm/probes/kprobes/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/probes/kprobes/Makefile b/arch/arm/probes/kprobes/Makefile
index 6159010dac4a..f909a47a01aa 100644
--- a/arch/arm/probes/kprobes/Makefile
+++ b/arch/arm/probes/kprobes/Makefile
@@ -3,14 +3,14 @@ KASAN_SANITIZE_actions-common.o := n
 KASAN_SANITIZE_actions-arm.o := n
 KASAN_SANITIZE_actions-thumb.o := n
 obj-$(CONFIG_KPROBES)		+= core.o actions-common.o checkers-common.o
-obj-$(CONFIG_ARM_KPROBES_TEST)	+= test-kprobes.o
-test-kprobes-objs		:= test-core.o
+obj-$(CONFIG_ARM_KPROBES_TEST)	+= test-kprobes-arm.o
+test-kprobes-arm-objs		:= test-core.o
 
 ifdef CONFIG_THUMB2_KERNEL
 obj-$(CONFIG_KPROBES)		+= actions-thumb.o checkers-thumb.o
-test-kprobes-objs		+= test-thumb.o
+test-kprobes-arm-objs		+= test-thumb.o
 else
 obj-$(CONFIG_KPROBES)		+= actions-arm.o checkers-arm.o
 obj-$(CONFIG_OPTPROBES)		+= opt-arm.o
-test-kprobes-objs		+= test-arm.o
+test-kprobes-arm-objs		+= test-arm.o
 endif

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261109-arm-test-kprobes-rename-060d15e94621

Best regards,
--  
Cheers,
Nathan


