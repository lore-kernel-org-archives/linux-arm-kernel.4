Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1F9606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YSY/Owuz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZiUqPLZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3gOi0SI6UE3i3Ok6KJpgZYZu7b8c3dBRXUCOezx+hkA=; b=YSY/OwuzvTWC6t
	fB5DLb0dKpLy3CjDc/Xt1D0QFAoCnyuXVYtGm9UJ7M+8PaifKmAVOB6/E1BZlTOMwKYwAXhBjieio
	NpkiaUHHQ/VpciqgFGDCPyMsG+jWRwdyi42CQLCg2thneVYvXmTQjM0geQc1YJ/++OMiCXw4OKqCd
	yiGKQwkNpNOlaEsfQrb2RlLidHjqqdac/EJlJGw8+ZkLuOkYb19SJgAEsQDrOss/OXWsKXYJiDSb0
	QEnTGIMBqlGOoRdy3jfRfjyLrDJ7hb7DoF0/PJRIOj+tD/PTlR2bnkvcpDPkf60rB7po8UCyvsS5n
	3QJTGiZm4D9egIVFI5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgou-0000000ElWO-3bMi;
	Sat, 07 Nov 2026 13:51:00 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoo-0000000ElRX-1yxo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:50:59 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2595973eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059454; x=1794664254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gOi0SI6UE3i3Ok6KJpgZYZu7b8c3dBRXUCOezx+hkA=;
        b=WZiUqPLZJkZmnZNjKdjxdE4w1gA1ifAWdaGkr/rI78qXKW7LGlZRRtWvjVhUhpDt2n
         jgHQ0aaW3rG9QTofNuHlL6nwugeFcSZK8pf0uE/CQ709pN8A7lm/OOZOJzxvOjuEyZ29
         8fEasO4mnWeFl8UyaSpOdzqRtUVtj4M74vuYTpg/lkLGGdRX0V8NHqa4dK9QrU2CurMH
         t9j5DEL8mRljvXowyJ/d7qBxbTeW/eLCZZeRtPiJAGM0Uv+TfLdq1rCHfS04OxPhyq4R
         R2y8+E9uet8mo5eOGPLfcnbf/86R1XhIC8n0Up+PBRZxPhfEKRit1MnXf8ByzfX46ICV
         5CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059454; x=1794664254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gOi0SI6UE3i3Ok6KJpgZYZu7b8c3dBRXUCOezx+hkA=;
        b=FkCTinnyQKzv7OJSjRcgaCxSN48FZ8Mq9KlqG0t1NhdekQmQ9Fk07RpeNm4UD5/NKa
         ERiDfilqUprrdcyMe8U5UrudRLuLCetF+wS0LLgzlrtr/VB7O5LJTerxAhP0szZpi4m7
         ps65P4xplPChG3uNzkevrVepSjuUeiEVEeflYxRz4bqmPBW+STyG45jZJaUv00FkcJC6
         Dxz3TPncyUtwTzFu5daoClw+jh3HOrAcE6PXsnzUhGapXjksRTM6wvxZZlrvNYfEc0VD
         N4rSSbuBDU4GOBTxzA5WjQpmTyPCPW0yoR5uDeWF0i68ccYehq7Llv4IgpAF+1TOqbAU
         NQPA==
X-Forwarded-Encrypted: i=1; AKwUvBxaDjCPWr3e1iLFRIFO0tQoZOWAsl0k0YD+PB9KcKsbhNu1uIcNIZUEXzgTsK2MpReZe07LbTUzmml+iEfRRBA8@lists.infradead.org
X-Gm-Message-State: APuU4Z/nhIoOOxMZGkIsgWsJ5nO/bYjhMMJFA7erHwCJUFADwkcl1y9F
	tqQEY/mgG6+kAbrZnnffZEvRnm7tI1gkeo6ZlFYDaR4lrGoqmPWTLfYa2Qb+qcHQrS8=
X-Gm-Gg: AYBFou3y5IE805Yn4LR01iK4CoJmDn6Lf+NaUsyMpOF0kHh5HlPzFLKXXHz4TcclP9C
	MFbQjuhAX3HhReXwmqGVlqhEg/FEc6EiJv+IyrZx4OxurjgsD/RpQzZiSjIC5Qk+9Wx6BouxEcu
	LMuglKOcjI3ka9uz21UhzK3PBeG6ma32vCYsRSBc7xicIlg9N7f7Zx5DhoJeQ1RpufLPcaiOJ3C
	H4XdAnUz4lnxR48kKl57sCyT0EvMqJgBwmgPHnNDjF+rKyFqKzyKjxB6IhYB5IMeBXIflwd1OmE
	INt9S7RYILZ1gw2lMxIanlxbH4UCS7/gojyNhrlwfJHJHIctFHq/OKNE6wTkUvvlDm98wu/2rbg
	Y3G4Eynd5G+HfvNY5yyvdEWnc5Ww3fUTbNLR0g8mWOKlrUpErw4ij5sFilEnKWaOTgHnX6yjsnH
	+Xfmh/WBcWAfZgspO1PWMGtcbtskmJAU62ys7l0Xcu7xYiiQnDKovs262CAUfa8PxL4nTPxr9Fz
	Fat+j0KbcYdw8NLE1a63j1XG6486dKkPg4JElhhsJRXpyRmQYCMBubYFjjSY2xeniWnHAJNA9j9
	ZuX1YBCYlgWmYaNTXVDDfSFusL5PNd6m7WxUASrH0haTrY9etVmJrkXIMw==
X-Received: by 2002:a05:693c:8843:b0:351:207d:bff4 with SMTP id 5a478bee46e88-36f72cc18dcmr8373352eec.4.1794059453503;
        Sat, 07 Nov 2026 05:50:53 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:53 -0800 (PST)
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
Subject: [PATCH v12 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Sat,  7 Nov 2026 21:49:51 +0800
Message-Id: <20261107134953.748622-9-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055054_516630_3F200F6B 
X-CRM114-Status: GOOD (  10.03  )
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

Extract the vmalloc mapping shift selection from
__vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
vmap batching path.

No functional change.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f2dd9bef4de0f..884e178405171 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3609,6 +3609,14 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -4128,11 +4136,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */
 
-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
-
+		shift = vm_shift(prot, size);
 		align = max(original_align, 1UL << shift);
 	}
 
-- 
2.34.1


