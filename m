Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5D3606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y+4zmWAY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwjzLPrS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3u1YbP0glgrlPVSZVLO7Md+O8bEthJ8oEllh+tqqYIs=; b=y+4zmWAYHDS+41
	65BPnIFMZfzoDdg2qZ6CruGsMekQTY5kmodqFtCExnwOsabvjzefSJrmvklmelFnCuICT335No908
	M08B6DaFBjdIRPKVBM5QcPCMjgHcRYdAQUZumZQt+dHeYkmPdS9r9rZeS361zI75R+lPoTEDH2haf
	XC5I3iyExply2P8AN9TKoh6ZVJZ/7XOkTJVkcxmoaN23gyUcRS1eiVPQCTPpCuveXlBrtoIEJxNRJ
	VV21RJSMFuH7+v0s99r7foxNEyUJLc8EXCTb2TqH58z9sBhb/3CzNRMu+ZUhl3xJc1B91ZJSnpFzC
	fo1Oa2oXhiq6KNdktfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw9I-00000002TOI-0iJE;
	Mon, 16 Nov 2026 12:49:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw9F-00000002TLq-1r6s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:49:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE3D5612ED;
	Mon, 16 Nov 2026 12:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA631F000C4;
	Mon, 16 Nov 2026 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833364;
	bh=3u1YbP0glgrlPVSZVLO7Md+O8bEthJ8oEllh+tqqYIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HwjzLPrSZpfGTVk4lN0Ho9oJpr0gZLkBoAC029OaRpb2ldn3xDllvh2HnLoT94Fb/
	 TDYQNRfyLKplvKQWdKlBl5GUJFKxnE1srWWg1c5WgPjV0cA3xM96ik5Y34iJ6OfNWM
	 tbRUmyufSXh88UFfS0u89a2YfwULjV+IbEEPsLcfzSubqsmHTOJaFp8XR9Tk53cMv8
	 y3jkV6Qv3iRMqD1R5bOMquB7vTnY7u7ucMjlf7xKmSttLEz4PA7bTmoUBx4o45yMCr
	 9JeOqh6bWP2quBFFxZQDDDTkeDpCk6/CFlsdoY4DOMT0fwCQe0ZnOIVph7buF6qLKK
	 E1ytUvDgbIMqQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Malin Jonsson <malin.jonsson@est.tech>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH v3 07/10] ARM: defconfig: turn off highmem in favor of CONFIG_VMSPLIT_2G_OPT
Date: Mon, 16 Nov 2026 13:48:29 +0100
Message-ID: <20261116124832.662455-8-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116124832.662455-1-arnd@kernel.org>
References: <20261116124832.662455-1-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnd Bergmann <arnd@arndb.de>

The multi_v7_defconfig and omap2plus_defconfig attempt to support a
broad range of hardware. This is at odds with the setting for highmem
being slowly phased out on the one hand but still enabled by means of
CONFIG_ARCH_OMAP2PLUS_TYPICAL, leading to a default CONFIG_VMSPLIT_2G_OPT
split.

None of the upstream OMAP2+ DTS files actually list more than 2GiB
of RAM, so it seems fine to just turn off highmem by default and use
CONFIG_VMSPLIT_2G_OPT from the defconfig to still support the same
hardware but not require highmem.

This also changes multi_v7_defconfig, which currently supports all sorts
of ARMv7 systems except those that require LPAE.

The best comprimise I can think of again is to use VMSPLIT_2G_OPT in
place of highmem. Compared to highmem configurations, this should be
an improvement on most machines with 2GiB of installed memory for the
lower overhead and complexity, but it does degrade machines that rely
on highmem to access all memory, as well as reduce the available user
address space (1.75GiB instead of the traditional 3GiB).

For aspeed_g5_defconfig, the decision is trivial, as there are no
4GiB configurations we need to support, but g6 is known to use
up to 2GiB.

If you run into problems on production machines with the new default,
with the absence of highmem, or the smaller user area, please complain.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/aspeed_g5_defconfig | 3 +--
 arch/arm/configs/lpae.config         | 1 +
 arch/arm/configs/multi_v7_defconfig  | 1 +
 arch/arm/configs/omap2plus_defconfig | 1 +
 arch/arm/mach-omap2/Kconfig          | 1 -
 5 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 1327a09e163a..060797cc6726 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -25,9 +25,8 @@ CONFIG_MACH_ASPEED_G6=y
 # CONFIG_CACHE_L2X0 is not set
 CONFIG_SMP=y
 # CONFIG_ARM_CPU_TOPOLOGY is not set
-CONFIG_VMSPLIT_2G=y
+CONFIG_VMSPLIT_2G_OPT=y
 CONFIG_NR_CPUS=2
-CONFIG_HIGHMEM=y
 CONFIG_UACCESS_WITH_MEMCPY=y
 CONFIG_VFP=y
 CONFIG_NEON=y
diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
index 1ab94da8345d..535696d6de96 100644
--- a/arch/arm/configs/lpae.config
+++ b/arch/arm/configs/lpae.config
@@ -1,3 +1,4 @@
 # Help: Enable Large Physical Address Extension mode
 CONFIG_ARM_LPAE=y
 CONFIG_VMSPLIT_2G=y
+CONFIG_HIGHMEM=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..c3e427ce8d88 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -103,6 +103,7 @@ CONFIG_ARCH_VEXPRESS_TC2_PM=y
 CONFIG_ARCH_WM8850=y
 CONFIG_ARCH_ZYNQ=y
 CONFIG_SMP=y
+CONFIG_VMSPLIT_2G_OPT=y
 CONFIG_NR_CPUS=16
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 5791953b75ff..b00789279f25 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -36,6 +36,7 @@ CONFIG_POWER_AVS_OMAP_CLASS3=y
 CONFIG_ARM_THUMBEE=y
 CONFIG_ARM_ERRATA_411920=y
 CONFIG_SMP=y
+CONFIG_VMSPLIT_2G_OPT=y
 CONFIG_NR_CPUS=2
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 79f8afe3a6bf..d145e448a6b8 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -135,7 +135,6 @@ config ARCH_OMAP2PLUS_TYPICAL
 	bool "Typical OMAP configuration"
 	default y
 	select AEABI
-	select HIGHMEM
 	select I2C
 	select I2C_OMAP
 	select MENELAUS if ARCH_OMAP2
-- 
2.53.0


