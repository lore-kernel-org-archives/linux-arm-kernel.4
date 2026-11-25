Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ro5cAqAU;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mqmVlJ8z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B7IVwaLX709fibbh48hYcRGHLFjLr6z7tBEQ95zSkf4=; b=ro5cAqAUitpFyh
	KUDhSZkuRwExF624axd/93upAH5xjSWlnxG+ET7iNMvB3AHgCCSJK3Dc/VxINc6P+L9EItLZF/mqe
	BtHIvuCBuse5kF6l07z2yxoHYjMU0klD7iSB1Wsea41GtmgtGRbmQW7C2YkFQQMYQsXaFw66v8TZU
	ZovKUCtRSjYVyKla4Ed+xSXoRggxtMAXb5HcgplW22mwlrTkP23+SOdcvbujjUD25SrDfYitrCW/e
	8+pjqEamlCVN6pMFysUtruL7WxyMChuG2cmWWLk0CG7NEJxpBjC1X41u671uF3avUCc2+2Vl0+rDr
	qaavsJe7gaP03qKUMs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW30H-00000008Fek-3j1C;
	Wed, 25 Nov 2026 02:45:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW309-00000008Fbx-21xT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:44:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D8F3497;
	Tue, 24 Nov 2026 18:44:49 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F7BC3F86C;
	Tue, 24 Nov 2026 18:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795574692; bh=EH5jCtEKN4qmBLVKifvj2kcfoizIrrQECfZK1Ci94BU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mqmVlJ8zKYlxN4YCP7cbUFVxvmwF3D7MByf6dm8glttu3k4ePY9wlc/z/eTX0j1IK
	 ozB08w7LtbLcSyrXdYUVJjTsiYTtfWUZA17LPMaQXrOIDrJ3Amd/96Y3j8gMDcuCyV
	 rNAe9ND7Zmuu10nJqNdOmLw3AitJNa5WagvLy8fU=
From: Jia He <justin.he@arm.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jia He <justin.he@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/3] KVM: arm64: nv: Inject an SEA when the VNCR walk cannot set the AF
Date: Wed, 25 Nov 2026 02:44:24 +0000
Message-Id: <20261125024426.3464050-2-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125024426.3464050-1-justin.he@arm.com>
References: <20261125024426.3464050-1-justin.he@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_184453_574333_6F089A26 
X-CRM114-Status: GOOD (  10.89  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the guest hypervisor enables hardware Access flag management
(TCR_EL2.HA), KVM's stage-1 walker sets the AF in the descriptor that
maps VNCR_EL2 with __kvm_at_swap_desc(). If the descriptor is in a
read-only memslot, the update fails with -EPERM and walk_s1() records an
SEA on translation table walk in the walk result.

kvm_handle_vncr_abort() does not handle -EPERM. It neither injects the
fault nor maps the VNCR page, and returns to the guest. The guest takes
the same VNCR abort again and never makes progress.

Treat -EPERM like the other walk failures and inject the recorded fault
into the guest hypervisor.

Tested with the selftest added in the next patch on a Neoverse-N2 host.
Without this patch, the vCPU exits about 1.3 million times in 5 seconds
on the same VNCR abort and makes no progress. With this patch, the
guest hypervisor receives an SEA on translation table walk at level 3.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-230439@kernel.org/
Fixes: bff8aa213dee ("KVM: arm64: Implement HW access flag management in stage-1 SW PTW")
Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/kvm/nested.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..59d82a29ec01 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1737,6 +1737,7 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
 	case -EINVAL:
 	case -ENOENT:
 	case -EACCES:
+	case -EPERM:
 		/*
 		 * Translation failed, inject the corresponding
 		 * exception back to EL2.
-- 
2.34.1


