Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127EB606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qZZuD9NP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YN6vXP2/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SkKlFLJh0bHRqw2u6qo7FKqMD2VqM3GiEa/4Vt9PFN8=; b=qZZuD9NPnF1Mg/
	Kt5fO0SgKw4SEr6pqHCLiX2QroXkMnFVtsohSrTublUK7JHmz2kZ4Pn/+wVxl5aGfy6o1ol+MNy9g
	UUa31i49PHPG/lDGySBzsfsoxPelutvI71yyy7t7ODf5BdrB9I+QY8lF7jLZmbGpfk2JwoPTCxNOc
	Uc1UX+cJlp5Pytb2Umr1TDmNLYCFvDALtZI0Smy1uFcnct5CSZydvTkkuAbZGQQ/nenExxYGe3WJ4
	l9XHcz0dU5blMUk6VS4+Tq4T/k9oXHxfgSGjI8ud/MSs+585rnGjbB4oJ3UR6PjaD2e0ShjHmsLFZ
	48jbEn6NadChrYK2C2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw9a-00000002TgT-0xZF;
	Mon, 16 Nov 2026 12:49:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw9X-00000002Tdp-0Wcc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:49:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D84A84472D;
	Mon, 16 Nov 2026 12:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7A81F000C4;
	Mon, 16 Nov 2026 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833382;
	bh=SkKlFLJh0bHRqw2u6qo7FKqMD2VqM3GiEa/4Vt9PFN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YN6vXP2/30cO412t3zjUajzb81yQ99gS8AJH9uEGiLmyUcS+qgSf/HMMiYqZRaboR
	 ZUFcOr5HG9bo2sXqK49utjfTBexB9GVMo4s30Q88My/RcnmlqYraEayTKRWAaUPYBv
	 gJD87jCCGbOS1fLcEpdk6WBb9etOKPgjDOEYZ83r/ZxRTQUrtiQYy4ZjKVlbAQ0+AG
	 gOt7Oq3YkH4zTVirFjUmewxyf0ab6ZbbxAwI2IJ2lwpk9XMrXjGusor5THb7GEcBg7
	 cbyEw+CgHbue8NDj72vH/de54rhuF8daoE/kSNW/EKSHRf3CGYKQi/RoPfiBxBVMN6
	 r2cGCwk/VJD7A==
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
Subject: [PATCH v3 10/10] mm: print pte in __print_bad_page_map_pgtable()
Date: Mon, 16 Nov 2026 13:48:32 +0100
Message-ID: <20261116124832.662455-11-arnd@kernel.org>
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

HIGHPTE support is gone now, so it's easy enough to print the
PTE here along with the upper level entries.

Acked-by: "David Hildenbrand (Arm)" <david@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 mm/memory.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index ec3d9d99ccee..6404bb447d9c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -528,9 +528,11 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	char p4d_str[PTVAL_STR_MAX];
 	char pud_str[PTVAL_STR_MAX];
 	char pmd_str[PTVAL_STR_MAX];
+	char pte_str[PTVAL_STR_MAX];
 	p4d_t p4d, *p4dp;
 	pud_t pud, *pudp;
 	pmd_t pmd, *pmdp;
+	pte_t pte, *ptep;
 	pgd_t *pgdp;
 
 	/*
@@ -567,13 +569,18 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
 	pmd = pmdp_get(pmdp);
 	ptval_to_str(pmd_str, pmd_val(pmd));
 
-	/*
-	 * Dumping the PTE would be nice, but it's tricky with CONFIG_HIGHPTE,
-	 * because the table should already be mapped by the caller and
-	 * doing another map would be bad. print_bad_page_map() should
-	 * already take care of printing the PTE.
-	 */
-	pr_alert("pgd:%s p4d:%s pud:%s pmd:%s\n", pgd_str, p4d_str, pud_str, pmd_str);
+	if (!pmd_present(pmd) || pmd_leaf(pmd)) {
+		pr_alert("pgd:%s p4d:%s pud:%s pmd: %s\n",
+			 pgd_str, p4d_str, pud_str, pmd_str);
+		return;
+	}
+
+	ptep = pte_offset_kernel(pmdp, addr);
+	pte = ptep_get(ptep);
+	ptval_to_str(pte_str, pte_val(pte));
+
+	pr_alert("pgd:%s p4d:%s pud:%s pmd:%s pte:%s\n",
+		 pgd_str, p4d_str, pud_str, pmd_str, pte_str);
 }
 
 /*
-- 
2.53.0


