Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E9E60A6F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nx3fSg+f;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=d4mirWSg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ySuENrGpUqjNOnPLgMFrEVBetZNZ5PFApDQ/o4nKV7Q=; b=nx3fSg+fCQ6GU6
	8GoOEudCx+IjvkQ7reTxfOr/WRp0pvP6BUTo/1OWhwEpLr/k6sq+rlNxxJFsgGVgguxHqh28gHyGI
	XGxHouAwi7oRqShpiR4PBm0qANPx6J5vhpGblyj6Uvm0kfv4vNVnDfGNyymrqGyvrbENU4CFR3dNu
	RRHqVvuqaworFJ4Lc3h2ijijbKgUQXx5Arh7d9djLdJJZZVmZOhw0xiID0xJKqytfYayWVaoU00oJ
	ruz38+90hJ6rEZu6/vdgqNNWOGbbSeSkTxCHnYx+wj0EyaO01TN0dEvI3CnN9LEIwxU3dVj6QNdZf
	EqA76/74Flaz9k7BeJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRoI-000000017nt-2FLv;
	Mon, 09 Nov 2026 16:01:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRnv-000000017Ry-2BQd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:01:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D08314BF;
	Mon,  9 Nov 2026 08:01:03 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E7A73F632;
	Mon,  9 Nov 2026 08:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794240066; bh=ME8w8wWVjC6kFFTloB33po9XzJ2RJqfmLmS2WG/lKf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d4mirWSgxEi/JKu2hm3pp69pzDfwTMhGF+FxTJjtWYJGttTFyyMTaLtQF/oOiyJn9
	 h57+SBa9UM84EVZ5zS3Ap4mgf+iwD0lxSqxx1XC/tvqYGFdzzGa5mf+CX3SaCBrFAs
	 nuOU8SkMYKk5YSjml0jU4OLWE+u4Rf23ebx0aWdw=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 09 Nov 2026 15:58:31 +0000
Subject: [PATCH RFC v10 06/22] arm64: Disable EL2 trapping of POR_EL1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-kpkeys-v10-6-aa6c4d9603bc@arm.com>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
In-Reply-To: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb+git@google.com>, Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794240029; l=759;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=ME8w8wWVjC6kFFTloB33po9XzJ2RJqfmLmS2WG/lKf8=;
 b=rL512vL81TftsgVlNw/YWtwNuWTlsI6Cej/ghKNCNj73xPNjGm4Cg71LdhCcqnj1mhqyTW3HF
 I/KR6KaqUYRBomiLeE6iHzlv6Nr+WcGKvkmbY0SilOz0QDq5L3+GWlM
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_080108_414846_07D7646B 
X-CRM114-Status: GOOD (  10.87  )
X-Spam-Score: -4.4 (----)
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

Make sure EL2 doesn't trap kernel accesses to POR_EL1 by setting the
nPOR_EL1 bit in HFGRT{R,W}_EL2.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/el2_setup.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 12a500181291..a55e8d5f1eb8 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -380,7 +380,8 @@
 	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1POE_SHIFT, #4
 	cbz	x1, .Lskip_poe_fgt_\@
 
-	/* Disable trapping of POR_EL0 */
+	/* Disable trapping of POR_ELx */
+	orr	x0, x0, #HFGRTR_EL2_nPOR_EL1
 	orr	x0, x0, #HFGRTR_EL2_nPOR_EL0
 
 .Lskip_poe_fgt_\@:

-- 
2.56.0


