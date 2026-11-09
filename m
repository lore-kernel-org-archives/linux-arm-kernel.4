Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23973606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wn+FjhLN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJqw7Kdj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n80U4YDXqK/o+oYAQLvAWwG1xx85IlIvZcYTxm52F4c=; b=wn+FjhLNj/JVAb
	gQpbK864b41dw3n+TbcCuYTuIF/NXDjRMZZ4NJffFNN7TrD/bk/su3n4DR/Zp9b2XN1ofVUyEOoFv
	uKY/5eiDplNkz9dZsXcuPZ8t4yCHk/c+wChHxzjXHIAIDBg4bfRvzu3sZoE7R+tk4CXGNhAhDohVX
	AVpQjYXoslciJ3BTcV19TcNYbLkC1Qu983sm0uZC2fRYqf2u8m46WkHaJSJHymTSzHnwfikzBjKis
	E3JtXvZWcTKCtRbgSxEUi/cKaEXkd6cCeH1AeW8IYqIBJJlbTV9J2BvWjgvfMg2pQxkJlCPW5dMjf
	wo1XBHpGECmKSFiaIgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPWR-00000000pCx-36bM;
	Mon, 09 Nov 2026 13:34:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPWJ-00000000p7w-2TD4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:34:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso552336f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231285; x=1794836085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n80U4YDXqK/o+oYAQLvAWwG1xx85IlIvZcYTxm52F4c=;
        b=OJqw7KdjdqvPKLmwA7NjGrkvnoKVAfbSk5ofCmlrI+uoVhAKvkFQqhK0g8dbSPjBcO
         n1NGpJyWIpw9qslZLvOY6/0SBR6jt05fwvn/sTSfdA1dvIjQZErbsrLIKED7crTnIU6N
         +V88tYf6TGT9WqtnthOFyvC8rVNOOSKKJupI7zy4qHM1G1wwvqYIvxDt2exJcdxxjncr
         2tn2zpKF2nf1+eDnZEk1bCsmWhiI8lO4XoIuk+0qhoqfYUFQWuWoPFULawlifXTaBRUV
         QiNVAv1kYJcLoaKYqM3uNA1cmg+/LCFUkaWE/XavQiK8Z3OXqALr631aGMUKQ+GXL5WE
         h/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231285; x=1794836085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n80U4YDXqK/o+oYAQLvAWwG1xx85IlIvZcYTxm52F4c=;
        b=e7E35lVr72TKDDMMqj8n/7rpSi4pITEsMZVfEPciR6pIW1m1+1ZHHs91xBv6hELSeQ
         +ylZtcy7+i3c1d4CzrDhENlIFqfKyDOXx1SwMxFPn2jmJLlnUXZQShKNTaqHNzEqJkWE
         v9uvCXlvcRoQ4zKfwdnzPDbQAVSThO8P7uvamGg03/6loKMRERMqjTf87Xkq8+KMPE4G
         EcA7ILmzH52viIEktAbrbtAGcbKqUDxU8dxs/01f2SOKQQ5ViHruk3m1cW6cY7/XnHaV
         7bHWGQxQN+Da1rJBsmKFhw0b8U1javEJhjdh7/KSjF4j+Sz+3DL2+I6rW/XfZmeJ2DcD
         Zx6w==
X-Forwarded-Encrypted: i=1; AL+hErEs1o69ZinymNsrK/E5e4bibX+TUkcQlTHTrG8NlRi4ZGtdebQfkz6IuPNRwCBiXr5FTYBOkD+44+Cl+hHPk5aC@lists.infradead.org
X-Gm-Message-State: APuU4Z+a3rgFweOJglEfN2YHeLEXQvCNk8KWha/Inkvm26mkS5VYKvZY
	8JESHVLZl9gKz39favF3EVN+FgvJVeThqbEhxM+hkFWfVeFQWR6WHks/
X-Gm-Gg: AYBFou3Dsgidk/IIfmCPpIdvZj3FNRdEHBM+26ZINHCQhnihptnJ0ZGp8HreiPu8cpq
	FilsoOmnK58eMqfpxFTDT9Oy2nkdV7b9xA/59lgCr3yIcCIItoLo//nFZSlCXxCwII4Saj0LpV/
	4HC0qDCIHvuVmSe8yKuXDqkQUVsY0BK0RVcyecl/xVHbOHh0uuwtMxH5Rey9C1FKcWG0/b/PZw2
	CXoXtLhuVLx6Y5/gHaHlfZdfL1lkr4z2gkE0Ngsr7RVOh2JI1DrCZBrZVShRAyHv7DEjnhkicJD
	DvT3pWqCwe48icx/bzS/R1JlcQY5XhIY40u/8TtCvkMSDYfkFFyvAcS5u7TeBGeVDGe02f401YK
	1T6Qjk357J8UrYmUrye8pRtyxvSN5CD+4B2CuthDmCTIw2bc/RrI2oAx5fXBm5PYJ9RS/a5jSa7
	2KH1QmEyX00oi4d+dterBhKccfC0yJe6UjvhqyQD6MQ2THiNXtYqaLzuF0kO+OYXlEI7aNRrtCM
	6YhDoibSrXXQI99YWLUXFJrzj+EIlhcNhd27t5JFR5dGcQ5lwWLXnEBDLkYzOUtxijZQT1dhLVQ
	WS2yPgdjJPSMwhwtT5HE5c7fYHX2QJQxluComRJcbEnBntarBilaRcMwbpAismQKtGVszkJzktP
	jAIqrewXd3E0UEYYlgkf0ih+2BA==
X-Received: by 2002:a5d:5d87:0:b0:48e:5444:a1d3 with SMTP id ffacd0b85a97d-49583ee2114mr8567019f8f.11.1794231285303;
        Mon, 09 Nov 2026 05:34:45 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.57.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39899sm9140435f8f.3.2026.11.09.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:34:44 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] KVM: arm64: nv: Use kvm_stage2_unmap_all() for shadow S2 teardown
Date: Mon,  9 Nov 2026 18:34:31 +0500
Message-ID: <c7e75684a027b1bdf232e7fe7435bd92742b21e6.1794229714.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cfa77cdbf14d9fd24c22ab1ef9b940a0d7411699.1794229714.git.haseeb.ashraf@siemens.com>
References: <cfa77cdbf14d9fd24c22ab1ef9b940a0d7411699.1794229714.git.haseeb.ashraf@siemens.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053447_716821_8BAD9737 
X-CRM114-Status: GOOD (  13.61  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

kvm_nested_s2_unmap() and the pending unmap that is completed at vcpu
entry both drop a complete shadow stage-2 by unmapping its whole IPA
range chunk by chunk, with the same cost for an empty table as the
TLBI VMALLS12E1IS handler: 262144 unmap calls per MMU with 4kB pages
and a 48-bit PARange.

kvm_nested_s2_unmap() is used when emulating TLBI ALLE1IS and when the
whole VM is unmapped. The pending unmap runs on the first entry after
a shadow MMU has been recycled for a different context, which a guest
hypervisor running more contexts than there are shadow MMUs can
trigger repeatedly.

Switch both to kvm_stage2_unmap_all(). The may_block rules are
unchanged: kvm_nested_s2_unmap() forwards its argument, and the
pending unmap, which only holds mmu_lock, still allows blocking. The
VNCR invalidation and the synchronous completion of the pending unmap
are left as they are.

Unmaps of a canonical IPA range, such as MMU notifier invalidations
and memslot removal, no longer go through kvm_nested_s2_unmap() since
the guest stage-2 tracking was introduced, and are not affected.

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 arch/arm64/kvm/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..875eb9c312f9 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1441,7 +1441,7 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
-			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
+			kvm_stage2_unmap_all(mmu, may_block);
 	}
 
 	kvm_invalidate_vncr_ipa_all(kvm);
@@ -2160,7 +2160,7 @@ void check_nested_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		write_lock(&vcpu->kvm->mmu_lock);
 		if (mmu->pending_unmap) {
-			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), true);
+			kvm_stage2_unmap_all(mmu, true);
 			mmu->pending_unmap = false;
 		}
 		write_unlock(&vcpu->kvm->mmu_lock);
-- 
2.43.0


