Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E2606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IJa6+UPz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BjkJxNIOZYjYtRtEqr5Rr8/9mY4LqFUYFiIwbhcKsds=; b=IJa6+UPzCBgIF8ovTUSNXMnGEE
	N39kkjD+EWL7/LVt8GdJ5QUyZvn8IlblOwtcFHxu/4NNh3pDuCKdZmnbUFpCniYiuI8glVJbVDq3a
	n/lpQu7AcZc0z1jfn8Uk88vShTgwO1TIYr+tM175aNHzHMU3dRsmjpFczg/srYsQFNk/0PUMjbQP4
	3x9KQYgoLCvmQ8hl8N8rYAFbq9NS0sHvuS9M4uHafgVE3NT3bCswkom5cr79Bb/ZxVdgyBMEqMLrY
	Ouxop1MUPGtJwu9tqeFYJRQSV+705pDTBQl4u89kVtnOrRlHmJphveQF6YPyG4q/bahvXfc19Abuh
	WaXHnQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf7l-00000002cNV-1MT2;
	Tue, 10 Nov 2026 06:14:29 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQf7j-00000002cN0-06NM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 06:14:28 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b467581b98so14736795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 22:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291265; x=1794896065;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjkJxNIOZYjYtRtEqr5Rr8/9mY4LqFUYFiIwbhcKsds=;
        b=svJD4L7C7Yuxrj6x6sA/vufMXmOORPp9wCEZ7qS0fx/ihj0s331fcWBQ2Z6wsdE4Ya
         7ZKbijzkU3b7HUevXj26XpAxR3nfNqC/s+mEohJllV/04eSGH7Rrv1ez+2Ql6YV090tz
         dM+YrvMKxU0RBKn56iA1x3ee/vnE76aCeMKJhQ8FdKEFSO6RQtEzM5hErGT7wSVYNv/4
         khCuzwfNDerRsJqEGgjeqen2XUrwvt44zrj54chIlhlhhWUYpbr/Q1tpuNMNiMN3fc4g
         XQQwRwR6OfPs+/v8tgfZtDgNlyYAiPESMwpxJrAYT9k1FpYAOV2u6Qll3HJq9pugxYpL
         h34A==
X-Forwarded-Encrypted: i=1; AL+hErE3Y2I3BtJrBetaAlWuYkziL58KjBaweudRSRj1KibKdLoNxpbNyeskh7AZJLPbVG7odLQ5O265nUzha5RBhteu@lists.infradead.org
X-Gm-Message-State: APuU4Z++f08a81WfI2dHM+ntstjN8PyiS/hs+5mvR+zvsolAP78e7xdR
	nf2qDyj5XVO4nHI2JOAYFc+I3hGfgb3vLzoCPXWzjDsQ7VUz6UD5tEyj
X-Gm-Gg: AYBFou3oV5Un3Ml7Vx2VcNLJHUrQxUduOS4xRA423ZFH0x3dsbgHvI3pUp1MtO/cqto
	bJRmRyxXlRhXxFT1cdgNIvAmMaWeXMSVLHeuVzCamztnR1EF0ywCDjjv0p6rInEP7XxQm/iSTjv
	kMYtAQ2s510Ob66YEETbbAK16slYhl86+afAoA8jsE0LCSDfInKUAku4nGhVwfjnrnHiB9jWvy/
	dzUoLXE6L4fcLXH9XzLeiNR2gyKGlrjw/GJwx1c4sADT8APwMpMxLGOXmBQkZtHXB6M6WDV6sth
	+BH72TaR8wHz/TJaDtQkn15Fy9bHyEo1or63SvzaoO8+dKKTROBnWK70shRt3D3Wck1HDo5+1yK
	cNyjWYQryaaYT3ZESPQBuhni8ab4rNy3rXxgshhuFZlirOMrWqGtVhNfP3btX63B10m3K3PFrVz
	4MGu5w4K50nHrX7IUoX2CsSLlP+C/OzTFIbGYlVUZ6Jtb27Uw7dKwnW1ncX9C/eEOqbd4nSFkJ7
	GHEMsONZSYndj8/uE30N/CQaGCnfk6xxPkAI9610nsovwYofEj1xkDqBnKZUWtCfu2NRvQqT3KN
	u8Y2D5Gtx3qRXYOvTE5LOrBirGA5a1zF29WabF1XCWJ+QyqcTtgtUbN3ELN9Vi2HknyusvbISOp
	vuE7aa9PVdXR43Rcs3ByUES9KlnkjawVJrMqSJPb30BR/zlxUnWh3F+Eyp1w8vq7d
X-Received: by 2002:a05:600c:3d05:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ba0234d4a0mr21225695e9.24.1794291264969;
        Mon, 09 Nov 2026 22:14:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20f91sm3405814f8f.27.2026.11.09.22.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:14:23 -0800 (PST)
Date: Tue, 10 Nov 2026 09:14:20 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: nv: Invalidate whole L1 blocks on TLBI RIPAS2E1
Message-ID: <6817d113e5f0a9cafe0ce5bc0847276b7f14aacc.1794210561.git.dan@cryspen.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_221427_082619_A5E60407 
X-CRM114-Status: GOOD (  21.88  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The shadow stage-2 can map one of the L1's stage-2 blocks with several
smaller leaves.  This happens when the host backs the memory with
smaller pages, when the memslot is dirty logging, or when the L1 block
size falls between two host block sizes.

When the L1 invalidates part of such a block, handle_ripas2e1is() only
unmaps the requested range, so the shadow leaves for the rest of the
block stay valid.  A TLBI must remove every TLB entry for a block it
touches, including the parts outside the range.  The L1 does not need
to issue another TLBI before reusing the rest of the block, so the L2
can still reach those pages through the stale shadow entries.

Use compute_tlb_inval_range() in s2_mmu_unmap_range() to find the L1
block size, the same as the IPAS2E1 path does, and widen the range to
whole L1 blocks.  The other caller, handle_vmalls12e1is(), unmaps the
whole IPA space, so the widening does not change anything there.

This only affects nested virtualization: the host must be booted with
kvm-arm.mode=nested and the VM must be given a virtual EL2.  In such a
VM it breaks the isolation that the L1 hypervisor provides.  An L2 can
keep reading and writing pages that the L1 has taken back and reused,
either for itself or for another L2.  The host, other VMs and VMs
without nested virtualization are not affected, because the shadow
stage-2 only maps the L1 VM's own memory.

Fixes: 5d476ca57d7d ("KVM: arm64: nv: Add handling of range-based TLBI operations")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
This is part of our formal analysis work at Pereq.  I'm not super
familiar with this code.  Claude wrote a self test that I used to
test, but it's crap and not worth preserving.

I also considered widening the range in handle_ripas2e1is().  We would
need to use the largest block size in that scenario and it seemed like
it might hurt performance.

 arch/arm64/kvm/sys_regs.c | 13 ++++++++++++++--
 1 file changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3d3f4eb82fbd..e1a687dfeea7 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4116,6 +4116,17 @@ union tlbi_info {
 static void s2_mmu_unmap_range(struct kvm_s2_mmu *mmu,
 			       const union tlbi_info *info)
 {
+	u64 start = info->range.start;
+	u64 end = start + info->range.size;
+
+	/*
+	 * An L1 stage-2 block may be held in the shadow S2 as several smaller
+	 * leaves, and R_TVTYQ requires the TLBI to invalidate all of them, so
+	 * widen each end of the range to the L1 block containing it.
+	 */
+	start = ALIGN_DOWN(start, compute_tlb_inval_range(mmu, start >> 12));
+	end = ALIGN(end, compute_tlb_inval_range(mmu, (end - 1) >> 12));
+
 	/*
 	 * The unmap operation is allowed to drop the MMU lock and block, which
 	 * means that @mmu could be used for a different context than the one
@@ -4139,7 +4150,7 @@ static void s2_mmu_unmap_range(struct kvm_s2_mmu *mmu,
 	 * the L1 needs to put its stage-2 in a consistent state before doing
 	 * the TLBI.
 	 */
-	kvm_stage2_unmap_range(mmu, info->range.start, info->range.size, true);
+	kvm_stage2_unmap_range(mmu, start, end - start, true);
 }
 
 static bool handle_vmalls12e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
-- 
2.53.0


