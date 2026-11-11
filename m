Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9F60A2601
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MDDN14Ka;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=covh9Wub
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Km95marAPwW2pP8wgGsfAj1lfQ/5UdjiVvHJl74YYFY=; b=MDDN14Kau3BpVe
	8LXcxZy43RGWpZwiP7FYjX0xEJtaGxTwI6MYECCpDnAbY7ks6gERHvxs3a4lWeiQs6vqrSbHMMrAT
	Q4daM+OJEhdQ/7i0LXNf89QacPH8ngqVEoKEFK2oCzKXZcQSfHvFjJ8KViZInS1/2ZkSNHa2UaLT4
	oFeWQgi57tkLv4zhlh7KhXye0E6B7eCBXlrqZUIJgYlB6t/Qx0nGqIOGVhg53MRmI9O6X3HlNkJEw
	8SYvilOksUFSe0metQvZeI3DykmPONE10IO8SyRJrTjb4BdTSSvDRXOgGNuI8Mz7vkytD3RoXAJuD
	4s4aQWllAKmKGUAxZchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyiV-00000005V0d-356R;
	Wed, 11 Nov 2026 03:09:43 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyiJ-00000005Ux6-189X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 03:09:32 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-15ea896ddc8so4318645c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 19:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366570; x=1794971370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Km95marAPwW2pP8wgGsfAj1lfQ/5UdjiVvHJl74YYFY=;
        b=covh9Wub6+xg0SUE9Pc2tqhaSa9iunFLhP2ZtxdjyrKFpH5GWGA7yeMaz3UJ9vf9uK
         4RqO0WBFHp1KGnRIf0r4YQ3rCdHdbXLY/kdRiACOXwvNyNVI9l4RGIrOyrI2Dav8QsDy
         ToMlZpQlJqs3cDm7x+nrFivQZ5Jd7WmWdDvZpES9Y18tV1FysNBniqIsrRxFusG5dd9C
         u7bSb5H2v2bM4ZyL+Fbi9cKbYUBxlomqlFtobD5tZjudwDePczy61rqi2wpvGYq1jQ1Q
         +ZF5gZT9MdYfGtepp6ViRa9ZYbBRcPBcmuTi9UAnafz8c6D0oXieDNLIs0Sn31JdHtZ9
         zOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366570; x=1794971370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Km95marAPwW2pP8wgGsfAj1lfQ/5UdjiVvHJl74YYFY=;
        b=i8820GlSVVGESen5n4bLFZkXh45ZoUnjfFn/gYBm/9yvJu3rovR3/7ao4UFuvYsp7a
         KVta9MvbzUrs1a2wQf/ZsF1lNXHc5AtfNcvUfn5AIBC9GkizyTrcIT+h6JkVmZsY+YX3
         lFwDK678da35IBFDt7wVBLaHKa21rTngHMEeBFM1PVbZ+IrmKc/pDTLagSJzs5nNHGYx
         uwx0qVuaJt9QrdDzZ4JJg+P6N6cOrgnN5hkmqFm2e5jv+HAWzwn6lTFXdPk4TFvZT/hw
         +bSCSy8XQhsU/kkyvPPI6CPyjERxA/aNa/yJQ7nRLPKM2mHpSC9KsEUF+AvrkAw5wnbg
         oaJQ==
X-Forwarded-Encrypted: i=1; AL+hErHjJyaZzs3tDqZQnhGodngceT3sVbQrUqPYjLGU7DwDuNhRWtCYW4+nWYvjSgV7qF6TX4/u+CGrpgGJyziFHR6K@lists.infradead.org
X-Gm-Message-State: APuU4Z+HRAQjKmL0xUzzHzLgWlaqrMluVDrxGi96mmi9GWOSakYjjb+M
	2+VvLxrpDnJ/bObMc5hXRzJpZ4Mw0DCHBu6LcDH7wf00lo4g5AiRF4e7iYimtT+bw/Q=
X-Gm-Gg: AYBFou2aU8i6YDtOU0rZVZbXHH7HekHcZLXIIOTvMHzfi6cQf85hSE6uWu3fPw/Xswy
	uspSvk9omWWaA051ty9oGvjN4WZ2Nt+YAbEEK+kKpSZ8ql7iPrKl5PIy1GEi02XXz2vYgyLpc7y
	HJl2sco5VoX+c1K9URNwnNHwOwcc1+O2dJwxjZMj31/9MYS+CCW22EPK7D2s5hFszdxSi2l9HMN
	49Dx40On4ZHgebv7sxGJbJH+2jkBJgV8e3oJ47UA5jlOm0DjpZXCqTlsu+Lkb71m/xXe+qxodVS
	KnKFrJhGRwhXOry66HhxDboixQ3wD5Nlsi3YioCARqUqhbj344XzrHEyLMyBcBbY0r18hDSCxUq
	JI+bQzmAT9c52Pc0bHwKTG8wHzOStE/q4OUB4GysMHLIuiDP3OCUyCZ/ESQkdjDzNkYYNJ/NBhW
	iuxLGzGEfvJ50vL97YLczcQdGVoNQ5pA8wVfi9AyO2Ay1cmlckvPexW69UsvuZoibLm/ljWWokv
	3QRriJCK4BfiN+1gMpo+bGnnYvgSbTD7mIBatDxEuZ6irdKw3HaZvrtjQ9g9pN190HH9rvxNs/b
	f5YWGFkQFInzSbGjmo/Tj2QUCQLC36+Tng/w8n9XQEvxYxvO+QXl74XPqg==
X-Received: by 2002:a05:7022:7e8c:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b3c03387cfmr1271942c88.33.1794366570168;
        Tue, 10 Nov 2026 19:09:30 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4ecccsm9623484c88.13.2026.11.10.19.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:09:29 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org,
	baohua@kernel.org,
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
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 07/10] mm/vmalloc: extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Wed, 11 Nov 2026 11:09:20 +0800
Message-Id: <20261111030920.1297625-1-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-8-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-8-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_190931_317085_72EA0B2E 
X-CRM114-Status: GOOD (  10.31  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Could you please fold this into this patch to use an unsigned long
page index in the walker?

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6a150b11261a3..48240fb674b9d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -557,8 +557,8 @@ void vunmap_range(unsigned long addr, unsigned long end)
 }
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask, unsigned int shift)
+		unsigned long end, pgprot_t prot, struct page **pages,
+		unsigned long *nr, pgtbl_mod_mask *mask, unsigned int shift)
 {
 	const unsigned long chunk_pages = 1UL << (shift - PAGE_SHIFT);
 	unsigned long pfn, size, chunk_end;
@@ -608,8 +608,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 }
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask, unsigned int shift)
+		unsigned long end, pgprot_t prot, struct page **pages,
+		unsigned long *nr, pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -646,8 +646,8 @@ static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 }
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask, unsigned int shift)
+		unsigned long end, pgprot_t prot, struct page **pages,
+		unsigned long *nr, pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -666,8 +666,8 @@ static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 }
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
-		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask, unsigned int shift)
+		unsigned long end, pgprot_t prot, struct page **pages,
+		unsigned long *nr, pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -696,7 +696,7 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
 	pgd_t *pgd;
 	unsigned long next;
 	int err = 0;
-	int nr = 0;
+	unsigned long nr = 0;
 	pgtbl_mod_mask mask = 0;
 
 	BUG_ON(addr >= end);

Thanks,
Wen

