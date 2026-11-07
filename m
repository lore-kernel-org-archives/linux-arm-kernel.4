Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E26606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4PgPDW7q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gq7c3PX9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Af7cKlFoogk/50NAo6rFkgmdxcBnIE+i0cwBb3cAFcE=; b=4PgPDW7qmWnQmK
	Txq8nOIRL7X5eCGpRg5We50urQKkbvY/il1Z/f5gJknsuz8tQVUhC6QBHWcWekwnvmHqOFQZac8mV
	7n2pwMswXwpyIlbRC/aTTMDKjHKTfzyYdILFJenltI4z53br49SbFOFv6gggAA5SxNfe6gL86lfxC
	2WLhTuaohx8+pJK/57Hjk4Sqvd3AvSPJ98SjpT4TcK9DROvNcIZiyr4xnMd0ea50gUCOORX9jrwsD
	DiGL2EsofIGe+5I+HnXZ882MHfxJ2XoTs+f8/IVJGsHGwu+vWUQIe2cmRgpKZ4GkSykf+/IZ7YMje
	Wjg6fW7JikQSvXbMbvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoR-0000000ElAp-0e1B;
	Sat, 07 Nov 2026 13:50:31 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoO-0000000El8n-39pD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:50:29 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-37198ed3727so263385eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059428; x=1794664228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Af7cKlFoogk/50NAo6rFkgmdxcBnIE+i0cwBb3cAFcE=;
        b=gq7c3PX94rSTOt8wlLvafqR2hukv0odYJddHcycUTmirGR85BT0tPDjB/o2IcYSj+h
         KssYgkTjF3CihPDHUFyeFLMEJp/dsChwCNqy8IISXMk3ORBLkCbIjZGQ8MzzGYJAU0lb
         HppO7LgQVAn44A9nVz3ovjXGUkWZdPPDU4RN/iStBoHnQNCtULwcbWUu17vLkoYwOyUt
         lN2xfDcP5OdZl44GpBpDkR1YfnZStTXn+rhR1bAAz/mns+nWlrFsrYs6MXWZzmhG6jtV
         yJQxi1YG32xgPACstra0FAk588SxDca4oW0wyg5kwMxWLa3BLW3perP3oVeCbA3/CtGb
         Yadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059428; x=1794664228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Af7cKlFoogk/50NAo6rFkgmdxcBnIE+i0cwBb3cAFcE=;
        b=kCcvYJCouITYDw9eUJepLO9T63FdSrWeVp2ze07sAPATKZbWZbOK9Ss7bXTXMsQd6U
         iW2LFgExwj7q8sLX6a1ihJiwt5pHnoBYm//NevlRpVLbJiovZNXVpalpvjwOuU0lvcyT
         xgkg7f3z8LLf4k7Ycmt23LxuXJOvCSQj6UAbuc2qKPXaNvOeA+BvsiFV2vDiuHxOeG9I
         o2dGdKXjuwmiTG9lHMpcycqJ1+fV8DP/CxyXvr4hWfdlD0FMz1v1exZj9KaztjKPo7N9
         54pi/M0EKga/MlZY9eNLik/eREgFEBquloAAZwsqtuWHGCcS2aZKHZPYs1QSSuwDnpRQ
         zVtw==
X-Forwarded-Encrypted: i=1; AKwUvBw77V2dBW23jxLEe1SHzGy8TgZXFJXiqoGDeKcniaq5ga4NKdDWpg3fZDc+Sl1e20zf5cMjYuoy05ayHhqz4xS1@lists.infradead.org
X-Gm-Message-State: APuU4Z8al4eGrSGrcsOJNdGPYgHscHqB+wM42tz6aEwo30rymL2PRdwd
	ZbkL+36kzYO2W4R1TTeHRZoIsI9f4I24ClXOJr1WVUpYFWY3FJOsg/dx
X-Gm-Gg: AYBFou0vanPBLMGcn82FYxxFqCF/fpfCXpaSE0awWik0LM5hh0Dzxr0kz5i9pmiDjZB
	xvk8I4g59EjDn7ckQHvzEhHMwpf9fCGYRlGHuuGzGFENRIcrnsyX0npIGcfNmRac5bUV8GMFHLN
	iIbOj1x7jd38CyQGZ03AsCE5AAH3QugE70vGcIEAKuXxtnnlt5jS2+baRe1KOlpz/PBdFQxBAJY
	FFDIl8feMm4nUcq0IumgP7KrtrUVXonabZMsS9um4czGwrpwOnQhOdBkbhyKA93hOcqGOI8PcWm
	N2xfr/JRW9v5JgwcLDkwQSr33/x/+EBsXpGIkpG4/73XKv3MPTGeSgViMxmAuo5p5dmdfTTQy5Z
	8q3SqZJOparV4iQ5k/tLC7Hp1l5R3IJnGzfFPjW8lV56nP1hS59sAY8NvTV7cV8b5wVFOLU41Ql
	kV8TArF7o9zoBgISvubbo+Q+Sh0yE8p+Ol4vulsErz+2F/edyog5OxKEKdo/4MX/EKoOOH3PKgb
	XkrM8e0/pr6dNjrQyv3RMC+q2SP4ddU0N0Z/N0MtPCp/j+yz12nam2WihOkMHldwhurDzBaDKaN
	uj4dyBlV+3eoMfcCPWT84RWd1Ik6p4NYBFPTH5SmheaCasveiYe4XefhcA==
X-Received: by 2002:a05:7300:c00c:10b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-370f7c856a4mr3702462eec.21.1794059427852;
        Sat, 07 Nov 2026 05:50:27 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:27 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Sat,  7 Nov 2026 21:49:47 +0800
Message-Id: <20261107134953.748622-5-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055028_793275_7FDD1AF6 
X-CRM114-Status: GOOD (  10.67  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wen Jiang <jiangwen6@xiaomi.com>

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses vmap_pte_set_huge()/vmap_pte_clear_huge(),
mm/vmalloc.c is no longer a caller of set_huge_pte_at() on arm64. The
only remaining callers passing &init_mm are in arch/powerpc, which uses
its own implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa6..ce247b06fe03d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
-	if (mm == &init_mm)
-		flush_tlb_kernel_range(saddr, addr);
-	else
-		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.34.1


