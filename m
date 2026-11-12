Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA4606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mn5fpdyW;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=VQQTu8Ca;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Riyi6GBz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O2cMjR9yzPx4FjNIH8WeRrejetDLBf3cij4Y+ejCORQ=; b=mn5fpdyWy8UaPW
	aSaVEQDHn7YViVyJZGLWYj/pA+WT0jWbSyy3P1/2rNdhXXQpjsZonoOzQWmuNYwjEFtnJbyKCddt+
	2PGeyjuUVBP7k4CHSHxh3+0hrG9HGKpilHEHicvoZWQEN1UpCRrky4kVFWv1q81u2tPDrP2Rg4kfu
	lVh/Nf71SUQeY5i9YY/7lt0TE+Jr931VjqV4JL8jRVVqpopeoY4luV2xiL6kMbjhMZgI9rXJsfQ4B
	T/0SgyJEdvzFluDFBO8bCn57dX8USMp4lxry99sd1wqXcsWi0ct+KReB+6/NAVnZMGScZ8nnVQ7dL
	NWB/5pNtmDgll3L5yPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUpm-0000000A4If-1YYF;
	Thu, 12 Nov 2026 13:27:22 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUpi-0000000A4Hs-3Yqg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:27:21 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 93ABF7A00CB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:27:17 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 08:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794490027;
	 x=1794576427; bh=O2cMjR9yzPx4FjNIH8WeRrejetDLBf3cij4Y+ejCORQ=; b=
	VQQTu8Ca+GpoqtlLEEHD9zniEnLX1LcLlkvq4k7p+NOwt37jHvnhY3yyW9FgUN65
	0HqHfGXOO8D4z/VHMHpTDBBFqQrLYqwEVaa/wTMv7YPZfmKXdJ2GqAcbIv8Wro5x
	Oi/MK5Q68KcNYdVjaIRImSzvUlNNk+V451RvXqonH6WWLcWrznW2lgvYOzc6bNPX
	HVnNMBkw5yUkC/2iwxleNjrXvASI7NlDLZR/U6BtsVSpUJ5/pqOhnIjthIyVGWpc
	QLckFVdHDENAxIbDxqUJDnjI7tI1Tia6XnZlCPhLRqsk2kt2aDQvcKBYxrr/iUJ/
	nBdqCSqcQYlYomiKlOptvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794490027; x=
	1794576427; bh=O2cMjR9yzPx4FjNIH8WeRrejetDLBf3cij4Y+ejCORQ=; b=R
	iyi6GBz1HGz15e3j6yN33Phda/8+Z0nzmtJ/0qat4vHymgPwVyp3r7fNaXKLt9z6
	x0EC3NTeXb+KTXSLVlatsAHtJbZxrhsrliNVshs4ByuHGjI3p1iwSFOLXwTeNfPB
	0Pu3MfYotvbOjx8YMKVFOq7j9AcZFo0gPW1/jTxygcHtk00WukXSD8BlHxcS7JN8
	coNgLvCIok090MOzpP2maHSnTr3z6HNOlgY6aYe6i5vRu/1rk1Zhsag5QuZt2+JU
	hcC+fZr5SGdrV148aeKrJPDBfm5Uj+NIzmKVQ5xY+SoIFYa8D1vcYzTvMRPvZLSu
	WOtX/qA7goQOrtFMA8XAA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794490027; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:ifchz+eMCNY8yrIRHh50acr6xl3pXHSGopYylsVk2K2ROgd
	kpS7fBwcp1dNkTB3KSJNMINmRzFXmavTUTdNHJz++J1ok3Bjsjq+iyQLX58It3/q
	lYfKjS3dYcpBj6JOeR5PKk/lpeCDckadoo7YZh4Tl09IxeOFCsYTGXxk3i1dlylB
	9frhe/UnZ2S22uDKf5Nnl/ILQspd/mYiUk6ulAn3UW6xKe3HST+i7nfHEzai2HDj
	x2t8IRGw2Bqa/AAC9LHGXCP+zK0liixXb4iSBWHqk0aXJ6vWYg+AA+hWDZNkKMDZ
	3nCvNZYC1gm53xVDStBcLsbtIp6bdArB+rdkRAw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Kff0dgzs0zBL+zaPVEZ/FAXWzqOn0OySYPVQarW0/94=:i4c501ZyCD5sNIncROoHKwQMRTWXxYq4u1vDcRxvSsU=;
X-ME-Sender: <xms:o771apIEwU78ImdKJMIXZSKyBmiYRujvDbrz8RvwwXrsgLuEGRi70w>
    <xme:o771av_xcKDi4AJTY8aD2M04WM3Hgk0evqdkIvBIFfTGTEZXwzzCSHFmkyVHfdG1w
    IfT-fhf6AN2oVPP1Dlsyxza_lOct-jiXyPltZs1m1dzBFeGc9eaZNts>
X-ME-Proxy-Cause: dmFkZTGAGn9YXYitrhore6IN0xSvjsAnm1g8uO8G/rBlyoZEPZcGKHflQ4cd1CGyc7u3FY
    lyI4GGDINEaQvUJ60pNMagWhIrAAmeu9PCIX7BpFjMEOhFxQlDI7P9nKCEetRYakx9k4yH
    zOdFMwgpltLtiRGIJAuajTvoZLN9zd//XoA8i6mpYenbg4h1qkOvWDMJWOrgPOhfQm+jjO
    AIiaHcTGn0QmBIfDQ8RW/8HSjasttxmT/eOjUexIPxRf5pM6pH7O9LjCKTOofftixH5TVS
    XwR9P0w80zcjkjtafAhUy+Qs29wJ7VmYwj4OLeB/vOO8N4xQuyEhJ27y32P4N3c9EtiTc6
    i4rjJ2f2Jg9nwgzaQgBsV1Gzsr1y1OTTunwXZDGq+LUDFgF4/qVxEgQSBPbwAKCUmIpfGe
    Q5KfNKy7hG4qBzSjXGCIAdrS4eoB5d7AfFspixFKVSlYRSImzXCPFAGAMTKPswc8Al7RTe
    6mFof4PXlhRqj4PCnrfnAF7Iwcv5/RkbsY8Pp4ND2t99jcjcv8BFRw5m+ji31CCIrm4h+F
    3fCKRBVXM8bCIQk5/UQ2B1SIZdHp/6FuPb8qtYnb7UO5zVMLWRcvfim5icH7eSXCPeNWNT
    0ng4Psnest6tcFpeWklID9IBOLXSI3Pf/8nwvdenN7iYiKVjC/5WW/8w4ajQ
X-ME-Proxy: <xmx:p771aqg1qe7lGBvhbLQgU0oOgVcivaDpZz9ezcs3gCs9C0N__LigEw>
    <xmx:p771av6f8kcPjvAaCtvKmbHAAsVpmPPxVEX07zWmxLCdB1HtwsXTiQ>
    <xmx:p771aqqbgJM7jJcBW4dJ-W8j3SylX-rG7XCxXoBM8gXFWW38YtQ6sw>
    <xmx:p771akhSWCJ9LN8M76dbJIYsHOSgnLyVgZ9WJTYZxCEn4QPdPvhtyA>
    <xmx:q771att1eGrcIwChuJ4viY_p7BF8HjIQDVNJ9_qJY6MtXunpkOKb0HDM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B149132A0099; Thu, 12 Nov 2026 08:26:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: APvT47k4hUj-
Date: Thu, 12 Nov 2026 14:26:39 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-mm@kvack.org, "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Matthew Wilcox" <willy@infradead.org>,
 "Malin Jonsson" <malin.jonsson@est.tech>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Message-Id: <ba23a789-9820-4223-a6db-d9e99ebcf356@app.fastmail.com>
In-Reply-To: <avWo4NrAPX8BisCY@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-5-arnd@kernel.org> <avWo4NrAPX8BisCY@kernel.org>
Subject: Re: [PATCH v2 4/6] mm: drop HIGHPTE support altogether
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052719_348471_75AF8D70 
X-CRM114-Status: GOOD (  22.20  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026, at 12:54, Mike Rapoport wrote:
> On Thu, Nov 12, 2026 at 12:25:26PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> With both x86 and arm having dropped CONFIG_HIGHPTE support, no
>> architecture is left using it, so remove the remnants in common code.
>> 
>> It is likely that further cleanups are possible in the page table
>> code but those are not obvious from the config options.
>> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  include/linux/hugetlb.h | 5 +----
>>  include/linux/mm.h      | 1 -
>>  include/linux/pgtable.h | 9 ---------
>>  3 files changed, 1 insertion(+), 14 deletions(-)
>
> With this and arm HIGHPTE patches applied there are still a few leftovers:
>
> $ git grep  HIGHPTE
> arch/arm/configs/vt8500_v6_v7_defconfig:CONFIG_HIGHPTE=y

This got dropped in patch 5/6 in v2, but I've moved that here now.

> mm/memory.c:     * Dumping the PTE would be nice, but it's tricky with 
> CONFIG_HIGHPTE,

Added the patch below for this. Untested so far.

> mm/pgtable-generic.c: * kmapped if necessary (when CONFIG_HIGHPTE), and 
> locked against concurrent

Updated the comment and also dropped __pte_map() after I noticed that
open-coding the only caller in pte_offset_map_rw_nolock() is consistent
with that comment change:

--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -314,7 +314,7 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
                pmd_clear_bad(pmd);
                goto nomap;
        }
-       return __pte_map(&pmdval, addr);
+       return pte_offset_kernel(&pmdval, addr);
 nomap:
        rcu_read_unlock();
        return NULL;


> mm/userfaultfd.c:        * index ordering when CONFIG_HIGHPTE is 
> enabled. We mapped dst_pte

Dropped that comment block as it no longer applies.

> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks,

      Arnd
---
Subject: [PATCH] mm: print pte in __print_bad_page_map_pgtable()

HIGHPTE support is gone now, so it's easy enough to print the
PTE here along with the upper level entries.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/mm/memory.c b/mm/memory.c
index ec3d9d99ccee..dabeb5568c94 100644
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

