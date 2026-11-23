Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8B606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSsva6cP;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dZYS3D1T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HseEX6n05FD1veyeX/WRfonp9sQvS52+uztmoZnoKtw=; b=CSsva6cPEaG9dJn81bbliqkYUl
	ZuNFrKatvw2L6XUqzz6o8GPuxmtqesF98me057OWh9N+z9fJ8cC/ui11HE1emSLWhgWQtabTaQh9x
	rzEW+GVFEwHkp8h94kL2E0kXFkGs4t2pLHiWioWnE1JUmDMViX9pNDcnzVyEsURnFk49js5fGAQtI
	6PPc13/upTrl2wdcRg/FMnGwRMJLtvtgTxdVNzjjpeQZoWq0qr42Bf8xsHZfDZZsE5/C81x+/Jzg2
	LOXNgnd6foGDppIfCc6c3/M6Pk5x3P5iPphHl2HLE/BRzgI+PHLkicFhRJhcr2t1pFumcNwLMJO4g
	SRa1rciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdQz-00000005AGM-3Jt1;
	Mon, 23 Nov 2026 23:26:53 +0000
Received: from mail-oa1-x47.google.com ([2001:4860:4864:20::47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdQw-00000005AFC-0rAw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:26:52 +0000
Received: by mail-oa1-x47.google.com with SMTP id 586e51a60fabf-4c6caa89d8dso713278fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795476408; x=1796081208; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HseEX6n05FD1veyeX/WRfonp9sQvS52+uztmoZnoKtw=;
        b=dZYS3D1Tzo/bz1S0F2BoDU2dez8tBGPK1L8BCb/x4CQu5VeKxDJS4LcPKw+hGOIn3+
         6nSqi4Za1x/qs3ZEIT2m5TvGLkuPkr9BSDy+blr1wakqsxMzuaWL7dPM1taZmgt11Uqv
         J1U1cVPUORUASwnqop078EeKZ8LiomjaOxLDoVk+bRwJDG4jPnn3r9dYQQFFYf4OVoN+
         JpuL9f+Ex2Vf/Suqf7cfA35QiVTih2WlyJlUnAnj1CLg5Vn1cPReP/V5d404h+XjesJH
         VrU/vpthDNw5YBYe9Wopki8P263+F79AjInIyhhWbcX22bqjICR3Uq6lk44/XOc10wKM
         A4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476408; x=1796081208;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HseEX6n05FD1veyeX/WRfonp9sQvS52+uztmoZnoKtw=;
        b=SMSnGqGfCNqUczNqxtPFFafUUbxp2cm6CymX6JuU0oScR7e7MsHfgUTyBtRlgvFiUY
         AjQKQfb3hhWu1qP9ElJu/ViQ3L5USMvRB9GvvArsqEmji2+B3vNFohrQLL9moQ2h4Noo
         NHtLN9udfjPCeVxi6yPciPZe3pdUYKjoqq8AtlOz/55YrYl0y9kvl9z4BM1YJWIvdN4c
         tPrO0ftdE/O61RTagyxdf2YIgXflmfFN4VMp6J0HzFTNEK6HaoWmWOqpv/9H+M95MqS1
         KjEk+TV+a+D11wjEyjn2QfmTCmTN2Zift2L/Np8cEpNGwIKYWCdZ8UmuDAZtGv0oioT5
         WpPw==
X-Forwarded-Encrypted: i=1; AL+hErGu4wv3Xs+BLKtIXf3RNmLaviM0Sg2hCtcPi2kXV3/fpMhpX+eYFi+5fgavserE9/ylv8Q4lE3eGts5dZUk1UeI@lists.infradead.org
X-Gm-Message-State: APuU4Z8VV1Hzo60LUj8b/rxclYKeww46GX4y7LNmcq4H6qzHBITQDmVZ
	hxRnHXpc9JbFDc68SwqDvFc4j8EJZiP9gxEQoiVW0RRusc98W0r+lTAe1Wz18Sv3RYuTJoZw84q
	Nnkit5aG2EBo+LHdWfXvEnj2bXg==
X-Received: from ilbej20-n1.prod.google.com ([2002:a05:6e02:4e14:10b0:53c:d564:3a52])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c123:b0:4f5:e12:b47c with SMTP id 5614622812f47-57a0be9dc7amr11961032b6e.48.1795476408097;
 Mon, 23 Nov 2026 15:26:48 -0800 (PST)
Date: Mon, 23 Nov 2026 23:26:45 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261123232647.3733149-1-coltonlewis@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: nv: Fix stale and duplicate guest S2
 tracking entries
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
X-CRM114-CacheID: sfid-20261123_152650_245783_B7E3825B 
X-CRM114-Status: UNSURE (   8.97  )
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When an L1 guest issues TLBI IPAS2E1 with a TTL hint smaller than the
actual mapping, KVM clears the entire block from the shadow stage-2
page table while leaving the stale tracking entry in guest_s2_mappings.
Patch 1 drops undersized TTL hints in compute_tlb_inval_range() and
falls through to the unhinted path so the unmap and tracking removal
cover the same range. This follows Marc's suggestion [2] on Dan
Carpenter's sub-page TTL patch [1] (which Patch 1 overlaps with and
subsumes), fixing WARN_ON(size & ~PAGE_MASK) on 16kB/64kB hosts as well.

Patch 2 avoids inserting identical duplicate entries in
kvm_record_guest_s2_mapping().

Tool-generated content:
- Initial bug discovery: automated LLM-assisted audit of the arm64
  nested stage-2 tracking code.
- Patch and text drafting: interactive Gemini session (patches, commit
  messages, and cover letter).

Changes since v1:
- Drop the kvm_remove_guest_s2_mappings() change; discard undersized TTL
  hints in compute_tlb_inval_range() and fall through to the unhinted
  path (Marc Zyngier).
- Split duplicate suppression in kvm_record_guest_s2_mapping() into a
  separate patch, call kfree() under guard(spinlock), and drop the Fixes
  tag (Wei-Lin Chang).
- Rewrite the commit messages and cover letter.

Link to v1: https://lore.kernel.org/r/20261119185105.626343-1-coltonlewis@google.com
[1] https://lore.kernel.org/r/20261123-inval_range-v1-1-815e15797089@pereq.eu
[2] https://lore.kernel.org/r/86h5h7zn5a.wl-maz@kernel.org

Colton Lewis (2):
  KVM: arm64: nv: Discard undersized TTL hints in
    compute_tlb_inval_range()
  KVM: arm64: nv: Avoid duplicate guest stage-2 mapping entries

 arch/arm64/kvm/nested.c | 105 ++++++++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 21 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.839.g22a8290db9-goog


