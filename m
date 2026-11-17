Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225EF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XAkV9do5;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X3Eb4X/G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qgmMhmn1xDiM5SvUXkFRuSY7uuW23V8W83iIcntUoUQ=; b=XAkV9do5tzsyk1mfayJpLZZlDb
	dtapQf/Hjzox18bLayRndIMQLPARVxZS/Wm+/4GhTJt8E/TMddWxlcQ5cFDr+FP6QlaCgVKeKdmpZ
	S0RFCIVCON01lvmvFbGQ/x9Fi46TUcnlFdvq9NvfDW5Cwqyy4VDD+qIWyaJEsgVBz4ddZqGyJFR7A
	ucLgqRYDSYEedwvVuofLVrxKg33oOC1lL0VdWDMFoDiyhWXS3Tit65UM9n+xhXDdLnad1WQdrtmYe
	gF+DaX9leF6msggDSfbai4YSYfljwTnbyF5VwqNgIUvpDe82ujhi6vjCvUI7FcD6bwwSgT8zHf+s/
	9rhAr8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEK-00000006dtM-2C0N;
	Tue, 17 Nov 2026 17:44:28 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEI-00000006doh-0eTd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:27 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b3f840cb9cso102759a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937463; x=1795542263; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgmMhmn1xDiM5SvUXkFRuSY7uuW23V8W83iIcntUoUQ=;
        b=X3Eb4X/GokW7iQLHUIqCr1Fkt5xfNy2KY6PqtaCMhXOB6l9QGjDrIB0sL+9zxMSUBH
         XvWB+KM5kpG7pTWytlEM7/kDUYV+Njx6YMksOBSbEw9DKLfnM2+h+76BrJ7GhtbMbr4v
         Sd8t46rMUdezzqAHJg/JWp2aLBpWdjiiNlh//n9QcSCVN8+MaUA9+sV8jTRgtod6M1ks
         IQmfMR3zSkPEjIiDZ8ZoJnYf7XZOQllM/ByIVGH4MHhjMwEOmhbckptHjtPxacQUkRjm
         qlOitQ0GtaS5a3jNe9NQc7ygHP5QysjxeNqt4CNoSAWB6Gsd4Jpk07E4kE+mG9Nv5aK/
         Ji5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937463; x=1795542263;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgmMhmn1xDiM5SvUXkFRuSY7uuW23V8W83iIcntUoUQ=;
        b=17TOaL45b0HlHAGDfqeDtDMZhuHWF8+aWElBeiEZI+dWTUUqZ2Zpxspr1mwrPFk++e
         Xt8pFjY8d7a7FXyNV+yYSptPThkam93rql7/NFM9G/FGs7TtsxxRx3uH7RkY9mQfjF8K
         O5n3WhdLZ13iXzkuI0mCl6ZopZVVgbA8zi83HilGc0UWS5ACcXCXNDRJA7BOUtiMjRbQ
         /XDF9KXxpH9z3aiNNe1dSwV6UsLmVvnqnNaGU0zITY7Qa7Je9oad73frul+3m8PiYlKq
         te01IfJzhdPj9Kj7OHiqcMQABYQkhIQYsqHyXo494ErpJ/zRNcK+E2NYxrcytIukHN0j
         zsaA==
X-Forwarded-Encrypted: i=1; AL+hErFVgSHO4i++Qwo/asj7pddpptg0A3j2Iol4F+q4HMl8/ylNGsCOouq1+z1LiLAmmbidoWvPxW8GPn/rTeb9zLp7@lists.infradead.org
X-Gm-Message-State: APuU4Z8HgykNX2cDOPdwHAjkckB+q8uAZQD+3P7J/IF0zs0//NIDHLOy
	H4+LohPAHvLnkSck74RShzOhdbQHIPX576z/qFqlbM1MrG+/AFX/eKMBmzfNW671AVdkp7gVQxy
	FmB+oigu3GOkaeEjNwU8MEA==
X-Received: from edyg9.prod.google.com ([2002:a05:6402:1809:b0:6b5:70a4:c77d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:84e:b0:6b5:8200:3e97 with SMTP id 4fb4d7f45d1cf-6b7c0c8819cmr11481471a12.33.1794937463185;
 Tue, 17 Nov 2026 09:44:23 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:45 +0000
In-Reply-To: <20261117174403.58762-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-7-vdonnefort@google.com>
Subject: [PATCH v4 06/23] KVM: arm64: Reject zero-sized ranges in pfn_range_is_valid()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094426_203094_B2FA3C9B 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pfn_range_is_valid() validates that a [pfn, pfn + nr_pages) range fits
within the physical address space, but does nothing when nr_pages is 0.

Luckily, there's currently no existing check that could be evaded.
However the pfn_range_is_valid() should make size trustworthy and 0
could be problematic. Explicitly reject 0 range size.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 8d5bfae67396..385a7ed12b3c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -400,6 +400,9 @@ static bool pfn_range_is_valid(u64 pfn, u64 nr_pages)
 {
 	u64 limit = BIT(kvm_phys_shift(&host_mmu.arch.mmu) - PAGE_SHIFT);
 
+	if (!nr_pages)
+		return false;
+
 	return pfn < limit && ((limit - pfn) >= nr_pages);
 }
 
-- 
2.56.1.708.g77570a6a1d-goog


