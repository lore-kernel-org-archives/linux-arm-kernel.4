Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E1C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BXcoBMb0;
	dkim=pass (2048-bit key) header.d=aashishsharma.net header.i=@aashishsharma.net header.a=rsa-sha256 header.s=google header.b=CIYm5TXs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sVZKaVNqfINKaLZaT1Y8yFr4I/GfwQE92cCdjha8+PA=; b=BXcoBMb0s5tSz1ervLIU827Ug1
	V7OWMAdS9pOI+nxESKe9ltet3ig8tseoI2awrVACOkJkr8SiBW0/09Gq05xI7yAARr2DQlURzDVtq
	QSTLThzAcuPQVaIeZQwFEUR/2wWEUoTg7u2doC4yKINoxVL8moHVShLKh9fc7Y9lnYkkSO4/MxvCn
	7JF8K8qJ9ar4H8hGp6d7yCCgYfKK+7vGWcyxxnMmdFV4f1F8epWL0tMhTSxbdnEgKSRqJhsx87PQC
	h6Y2f+JfYHd2Iw0HERWg/21E1ThNy9lY00HzL8NNjFC7pqr9PKsmgAgBevhBBYvBTIZZQCpOYDnXA
	fCCJLG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzL9-0000000821t-2VJt;
	Tue, 24 Nov 2026 22:50:19 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzL6-0000000820x-3P5I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:50:18 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso10879099eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aashishsharma.net; s=google; t=1795560615; x=1796165415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVZKaVNqfINKaLZaT1Y8yFr4I/GfwQE92cCdjha8+PA=;
        b=CIYm5TXswXk243LI4gejeLbg6nZJHWi88xk5txu+Z2QvJ6gaHGOGJlChVYuzjaOKNC
         0aVg+JoFOgO5mKHRli0V/0ubsi6qwEQtjtOzBn//PYa8lJhCjDb92wYPzN/NxSIHZfvX
         1BDGX+S32/nxnGcpSgWrWfK7FlFU3jC96+BESkaSLIy4U4cM1gaAlty3YjPB+htjbLLT
         fJn1CPBJS5aD/2dVWv7LRm8CTQHRRK1iXhcyLOahg3OtD56cVP0l981EVWlNVsL38VvS
         Ty6TjQymgwa8srFNE+WceF9OeUfHHLjwMtWH30BsQ3Nj5SMDgZnbQN9bnzQeR2FH4uxk
         t0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560615; x=1796165415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVZKaVNqfINKaLZaT1Y8yFr4I/GfwQE92cCdjha8+PA=;
        b=vTUiv8UxAaDv9Ef1sCPYsPmSUs/eBPQlPBIo8owboe7VvI0yRKBG0x5nptN7TRTd2T
         aa7dADG8BdK2jHQnEyyDjn+l6TygUgKzUr7YGGJTsjpkORmxgilnWuiWblZdcK8rIigz
         uSgLepvai6MY71ex6jOZoLcJ86JsbdEQWGWQQeoGCGOCvQNUBROWZzGQOYlCW3QPECLt
         FrvjVzlAHxNL5ZLcVXl62i6yaDkjSfGweJtUFzHIVXPhC1EGFr+B5Jj0R7e6xbUN4L+o
         j75fhyLj4D5c5MQiKQqYHKXLFEI68fGJGVAKjt19ONuwMjFyPBtYroRDQxMWSdLrV+tm
         TJug==
X-Forwarded-Encrypted: i=1; AL+hErFHDYTKyIOaRnNB+MYKMxiVeLfR2+nSuFRAX/6J5XDG5GzFkQm+s3f+2Jk745W9r+rBY6NV+yfIUF1J24Xd4UDs@lists.infradead.org
X-Gm-Message-State: APuU4Z+sfoMpO35oWih36M5yUySag80Y7H0pb10FNPvlks4E1XqMHsYm
	nWjqzTbqrjFDJIp2SjP+UZ9AR6NDV4xMqITU4Pi5ebiFS7W776Wetxpl7cZqBZ/SGgh82m7gsXd
	JxXI5xzg=
X-Gm-Gg: AZFdTZfi5+XenjdBtgtWMHozRUjBJLCIUh03xhWrtx0gM+gmoQlijeZNsjZU/0FxNa6
	7MXEDPh9QIE0C9wGNoxQ6f/8rKGeFb8te0qM45XOA7jxnx0+YNb17K3axTpr/DdvTvNN29aoNFw
	5t5lR988N8qtXVIuuwE3Iv8cii88pNmTNVfObUkqQQdaCS1qnDZD9EkzLU9kCgd90BSofDylarK
	fGIGyOABjkfJssJojGgjD8BDs3qUB2pEbclOdj0zLrMR+JGCSc70cIq4dIwxmqShibAJQmLX8bx
	Wg3AsuqTAin454UjtZjrzrsixALnKTyhWb79VYjiL9N9lCnRYyTs45t13joyWJG0lRWlZ3sH7br
	PvztFaOhu8BBtgMuRyi+DoqNGMirTGr1BV2gCzV+x8tHxjgy3FBuvGNW9f8rQhrQi5RkOYTprL9
	GtYQdRLMwV9t8p6w8mb1gKqxvWO+dtL/oe+UmfsqInRcIdwk7zcLrxQQ8HyeZb5Xi6nYzpjGesA
	aILbFrBjYCedPHSmuNIv8TZfcbUFbHwfxBz0RQxn+BK5xxK2lGdHbk3wpeO7g99g+eMvUdF7CXt
	SSD26qG1I0nZgtH4rwR7Ug8KH5gcnsh3kFuQe9qnKO/5FIJ2ORqkkY9CXXXK54GXmejftj5+Hcp
	XVfABuF6xuyf0SM5W3Y8AiJu/dNR0sGbnq6YP3NE=
X-Received: by 2002:a05:7301:4284:b0:382:1aea:c21d with SMTP id 5a478bee46e88-3857191bcf7mr17176831eec.41.1795560615370;
        Tue, 24 Nov 2026 14:50:15 -0800 (PST)
Received: from shraash.sjc.corp.google.com ([2a00:79e0:2ebe:8:be5d:9202:acae:6527])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm58294406eec.11.2026.11.24.14.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:50:14 -0800 (PST)
From: Aashish Sharma <aashish@aashishsharma.net>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ricardo Koller <ricarkol@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aashish Sharma <aashish@aashishsharma.net>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Do not free split_page_cache in kvm_arch_flush_shadow_all()
Date: Tue, 24 Nov 2026 14:49:59 -0800
Message-ID: <20261124224959.685002-1-aashish@aashishsharma.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_145016_920222_23B2ED98 
X-CRM114-Status: GOOD (  11.23  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kvm_arch_flush_shadow_all() is called from the MMU notifier ->release()
callback, which can run concurrently from __mmu_notifier_release() and
mmu_notifier_unregister(), as well as concurrently with VM ioctls
accessing split_page_cache under kvm->slots_lock. Calling
kvm_uninit_stage2_mmu() there invokes kvm_mmu_free_memory_cache()
without locking, which is not thread-safe and can double-free
split_page_cache.

Call kvm_free_stage2_pgd(&kvm->arch.mmu) directly instead.
kvm_arch_destroy_vm() already calls kvm_uninit_stage2_mmu() once after
mmu_notifier_unregister() completes and all VM references are gone
(see commit a3ca3bfd01b7 ("KVM: arm64: Destroy stage-2 page-table in
kvm_arch_destroy_vm()")).

Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty logging is enabled")
Cc: <stable@vger.kernel.org> # 6.6.x: a3ca3bfd01b7: KVM: arm64: Destroy stage-2 page-table in kvm_arch_destroy_vm()
Cc: <stable@vger.kernel.org> # 6.6.x
Signed-off-by: Aashish Sharma <aashish@aashishsharma.net>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..2440ad9fed87 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1472,7 +1472,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
 			kvm_free_stage2_pgd(mmu);
 	}
-	kvm_uninit_stage2_mmu(kvm);
+	kvm_free_stage2_pgd(&kvm->arch.mmu);
 }
 
 /*

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.831.g720f3f5937-goog


