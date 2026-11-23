Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0C7606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PBgn4B1g;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XmySqRan
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WJVCNKr0SmGP9iVV1suMI71pk9j/vqJGLO6NxitJm1w=; b=PBgn4B1gFAWp2c7YdtIjv8/eu+
	hpTLQ4u4HXPEDRe+sZvkazs8nMv8J29xpOxIuF+F0Nq+MFsuglsEIuHQV5Rri4dYUOs2+oHEMXSy6
	Keb0+0DCR1b/PR8zBM3CKna1rCcUSPfDjur/zQkw8yvqUF+xczC2wOKgQ2TChenMsvU8PVBwzLUGz
	ignmDKfsLGILTr2I+lOQezxN6t5aW8LscBPwZn9C9uWo/2IObgmNCmUXkK4SzgVHnAB7DGzZC9dhJ
	4U+p+Ba58zY4CSVThRC0icJwTnfTXtK9g+UVpy8clcPaoRFCkbQolYzepjkK18dzJi6eu/7YQv8Ag
	VVVxqvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdRE-00000005AKv-3kRD;
	Mon, 23 Nov 2026 23:27:08 +0000
Received: from mail-ot1-x345.google.com ([2607:f8b0:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdQx-00000005AFY-0ysH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:26:53 +0000
Received: by mail-ot1-x345.google.com with SMTP id 46e09a7af769-8615cc92488so3203096a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795476410; x=1796081210; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJVCNKr0SmGP9iVV1suMI71pk9j/vqJGLO6NxitJm1w=;
        b=XmySqRanplv+76uuUmseAVPTx9oTKGReeOYfG7VwC9CvpTE3yPUX9zAjBaPIyOjBIU
         fZnWrl+AmxKOpBOTN1i7jL8fZwUqyJUQ9BMvGW+Es/RDRH+Ye3XNy95IpYzYiIVRkUpv
         /4hX6wNK4guH+MZ1NRc06f0kjeIje5zfxTmBfj4cdd27/fgBRuS8bSrSMryG1VmQNQO+
         DlArfjzFQoTDsEUrk+fPQPKtD53oYIYCQ8KVV+nwV7vwL1FVE29D8XRCWdv0tpY6A6W9
         Yz+diq+3TnDVS8YjqqzkVNlIRYtwb2xyJ7jJyqgjTgaqzYLQTqW9zFHeLJy6VpR8WN9n
         zypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476410; x=1796081210;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJVCNKr0SmGP9iVV1suMI71pk9j/vqJGLO6NxitJm1w=;
        b=FvNVxWAyVLtMfS4yJ7b4Ac8FfuCVOZXFllLwFrzfNlIAYLIgQeyzxk8r/OMuMjzwoE
         1KjwAaiHRKm3+s5sOurNe3sCLz2IxefSV2SK1/Yc1dHuwwe2uO5Smm7j7g0WqVFOFg72
         Ma+5/MKcpzhfrNqGadCP3YNEnmkgqBXF5hs0qpdaBkV2JTlmTEp8Wey+pYwhixZFp2YN
         OaAE35PQDJt0EkUIQUrUSoBRr4I4RTIOiFIO6LiHHJMt6eJY8Jm/qqYt0VIVIWlNbJeY
         CbX0MqHBRxNZ5UgybCvq+m88GU+I9bfHN03FBKKfnKzuXqUms2w3/CIx5gvmBGYT1D9N
         IQcw==
X-Forwarded-Encrypted: i=1; AL+hErF0PEdxmSpWweeOOs7Av1EDd8ZIMPMf5gKO2AmKI+9LbQsrunKwNNS8hGYZTL23FvTjC8GRocCmG/Ym6gVK6HpR@lists.infradead.org
X-Gm-Message-State: APuU4Z8AFQOpLGN46SjD4/gAdPwPnVI8/6ZbATgcG2hJRjxNb4auRyXm
	Tp4aVubUK7Ak9L8nBvNnI8dXc4S3NjZzwS+DyyScaq4/2SV/UbePPqWE9npi2D1AU9gbWweHHwY
	JiU0ziLv3BfYZuHRjfnF72Z/SqA==
X-Received: from iohk21-n1.prod.google.com ([2002:a05:6602:a615:10b0:9e8:de6c:a5a3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1645:b0:567:c9d6:b2b2 with SMTP id 5614622812f47-57a0c3aa32emr13284763b6e.47.1795476409974;
 Mon, 23 Nov 2026 15:26:49 -0800 (PST)
Date: Mon, 23 Nov 2026 23:26:47 +0000
In-Reply-To: <20261123232647.3733149-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261123232647.3733149-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261123232647.3733149-3-coltonlewis@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: nv: Avoid duplicate guest stage-2 mapping entries
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_152651_276198_EBF62589 
X-CRM114-Status: GOOD (  12.38  )
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

kvm_record_guest_s2_mapping() unconditionally inserts a new entry into
both guest_s2_mappings interval trees. Parallel stage-2 faults on the
same IPA or retries after -EAGAIN can therefore insert identical
entries for the same nested and canonical IPA range.

Check mmu->guest_s2_mappings under guest_s2_tracking_lock before
inserting, and free the new entry if an identical one is already
present.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/nested.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index d3a19b1db2144..18868e0d701c0 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -930,6 +930,30 @@ static unsigned long s2_mapping_to_nested_start(struct kvm_guest_s2_mapping *map
 	return mapping->nested.start & ~S2_MMU_IDX_MASK;
 }
 
+static bool guest_s2_mapping_exists(struct kvm_s2_mmu *mmu,
+				    struct kvm_guest_s2_mapping *mapping)
+{
+	struct interval_tree_node *node;
+
+	for (node = interval_tree_iter_first(&mmu->guest_s2_mappings,
+					     mapping->nested.start,
+					     mapping->nested.last);
+	     node;
+	     node = interval_tree_iter_next(node, mapping->nested.start,
+					    mapping->nested.last)) {
+		struct kvm_guest_s2_mapping *curr;
+
+		curr = container_of(node, struct kvm_guest_s2_mapping, nested);
+		if (curr->nested.start == mapping->nested.start &&
+		    curr->nested.last == mapping->nested.last &&
+		    curr->canonical.start == mapping->canonical.start &&
+		    curr->canonical.last == mapping->canonical.last)
+			return true;
+	}
+
+	return false;
+}
+
 void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 				 gpa_t nested_ipa, size_t map_size,
 				 struct kvm_guest_s2_mapping *mapping)
@@ -950,6 +974,11 @@ void kvm_record_guest_s2_mapping(struct kvm_s2_mmu *mmu, gpa_t canonical_ipa,
 	tag_s2_mapping_mmu(mapping, mmu);
 
 	guard(spinlock)(&kvm->arch.guest_s2_tracking_lock);
+	if (guest_s2_mapping_exists(mmu, mapping)) {
+		kfree(mapping);
+		return;
+	}
+
 	interval_tree_insert(&mapping->nested, &mmu->guest_s2_mappings);
 	interval_tree_insert(&mapping->canonical, &kvm->arch.mmu.guest_s2_mappings);
 }
-- 
2.56.1.839.g22a8290db9-goog


