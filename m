Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7F3606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gF253Wwr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpjC7PZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yqMiao7IUsYqKs54ICvEuqwO8zDV+6ATbJVBuhC4jzs=; b=gF253WwrMn/U9z
	6a5J7248hnOervbrPnp+sHSo2qYM6lWgSkt8Mf1CevvtSDeC0e+Us5XEYSFVeEpCIjlLI5LW3rvQS
	icTLk+z+8kyDi09hAdDjkvURK/0XNPJAXWkIDlYFgWMQGz2H1HbDLZB9ZAJJoc6KN1Spb0MBmrapn
	82n2m2fafXoyjCNZLANxreY+OwIFpQrG6OO0w1cyIHpqnRclCAcnfDdXSeCJga0XDgS5NTrBKXZcF
	WSbSuxmThZQL96J0cYZ1gCKASzBQKH5W8V8OEJXKyhB8Sez7EfB7wzvxiTkRPQNAWqcX62JAAwWHm
	Psiz94ixOEMwZYwb9eyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw96-00000002TF6-43uP;
	Mon, 16 Nov 2026 12:49:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw92-00000002TCD-1sL3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:49:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB4E6612ED;
	Mon, 16 Nov 2026 12:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292C31F000C5;
	Mon, 16 Nov 2026 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833351;
	bh=yqMiao7IUsYqKs54ICvEuqwO8zDV+6ATbJVBuhC4jzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gpjC7PZJmXae3Ug6YBRcR+8bfcqu4PinQAZYVOw+KwcZk6WxhZD4lN24ddrIomqNG
	 Tjc7iRfpoEVYgnl2OjTRIDVmKZYCzKQYV4Xkj263XiW4qgji+556X1K0E+4G//fyn/
	 i1HzLH6xsPRXu/fCpishNMA/oZUalIKcIOocxcogWC/je5O4ts9z97s/t6sw2F+N9R
	 4Euy1GQaelLkbtRVa05un7cyZynZsXxkTqTSnvzvbZE0hIUN5oy/ekJ6RyfbXl+zPx
	 z8Vx7uVvTxw3/gInPP+Kn5cYLwYfOUuXpks2xvFUidQy15WoNQKtH2MtWImunv6Cw9
	 zU6NBp8N1IOtw==
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
Subject: [PATCH v3 05/10] ARM: add CONFIG_VMSPLIT_2G_OPT option
Date: Mon, 16 Nov 2026 13:48:27 +0100
Message-ID: <20261116124832.662455-6-arnd@kernel.org>
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

Unlike x86 and powerpc, there is currently no option to use exactly 2GiB
of lowmem on Arm. Since 2GiB is still a relatively common configuration
on embedded systems, it makes sense to allow this to be used in
non-highmem builds.

Add the Kconfig option and make this the default for non-LPAE builds
with highmem enabled instead of CONFIG_VMSPLIT_2G.  LPAE still requires
the vmsplit to be on a gigabyte boundary, so this is only available for
classic pagetables at the moment, same as CONFIG_VMSPLIT_3G_OPT.
Keep ARCH_MMAP_RND_BITS_MAX at 15 for this.

Tested in qemu -M virt, both with and without HIGHMEM enabled.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: Change ARCH_MMAP_RND_BITS_MAX for PAGE_OFFSET=0x70000000 (Sashiko bot)
---
 arch/arm/Kconfig | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fc66d52d847e..270ae2b89407 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -333,8 +333,8 @@ config ARCH_MMAP_RND_BITS_MIN
 	default 8
 
 config ARCH_MMAP_RND_BITS_MAX
-	default 14 if PAGE_OFFSET=0x40000000
-	default 15 if PAGE_OFFSET=0x80000000
+	default 14 if PAGE_OFFSET<=0x40000000
+	default 15 if PAGE_OFFSET<=0x80000000
 	default 16
 
 config ARCH_MULTIPLATFORM
@@ -1039,6 +1039,9 @@ choice
 		bool "3G/1G user/kernel split (for full 1G low memory)"
 	config VMSPLIT_2G
 		bool "2G/2G user/kernel split"
+	config VMSPLIT_2G_OPT
+		depends on !ARM_LPAE
+		bool "2G/2G user/kernel split (for full 2G low memory)"
 	config VMSPLIT_1G
 		bool "1G/3G user/kernel split"
 endchoice
@@ -1047,6 +1050,7 @@ config PAGE_OFFSET
 	hex
 	default PHYS_OFFSET if !MMU
 	default 0x40000000 if VMSPLIT_1G
+	default 0x70000000 if VMSPLIT_2G_OPT
 	default 0x80000000 if VMSPLIT_2G
 	default 0xB0000000 if VMSPLIT_3G_OPT
 	default 0xC0000000
@@ -1055,6 +1059,7 @@ config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
 	default 0x1f000000 if PAGE_OFFSET=0x40000000
+	default 0x4f000000 if PAGE_OFFSET=0x70000000
 	default 0x5f000000 if PAGE_OFFSET=0x80000000
 	default 0x9f000000 if PAGE_OFFSET=0xC0000000
 	default 0x8f000000 if PAGE_OFFSET=0xB0000000
-- 
2.53.0


