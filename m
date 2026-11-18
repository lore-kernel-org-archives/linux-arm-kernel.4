Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C394606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=neDjip/8;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=LufmRfqs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=; b=neDjip/8NzCBJXfOcmjo1WgSbi
	Hyb03k70xFBRhh78XbN9m7TWq4ExUAxaCnjCtvNJW0Mh5bJT+025Gyvmqp2LMVdQJFSek6ONqv48G
	8nAt5FzhYBJX8aq/9T5QO3EezkETIgHtFn6Iocx6JQQGFKno5V9LlvuU7mANNzsVgw/RukqGDZCOX
	I8wZAtcYx5kIsGjvcYBIWtwt8hhmL0ce49ZbtdZ1JfFHVEFpaJV5n8siV5XNuUTfymATocMPpHZol
	GSOw+ddj4nnaODrBlTdXQsBS8B54VjqS9oLOwb81kivY05GJxgWRwzYAVUM28LgGxSGYfBfdmvzPD
	2F0omfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThhF-00000009KH9-42Go;
	Wed, 18 Nov 2026 15:35:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThhC-00000009KG5-2UxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:35:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e3b22e971so615923f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795016136; x=1795620936; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=;
        b=LufmRfqsmvJUs+6V3rNvSGy2Nf/mE1ONIIh+2eM/G0uZ/LTY0nZzakEpdtZlxOcUNH
         HxBGyafTZzZWboioH5OjlhAYU9G6ozPUovFoR8Is9w7C6Af2uRlJDUZPVT0S4X9savWF
         xEwdb0U9QkgG7A6PnzAu/+DngEKa20tqtBSWHNSVlKhFKlBZvQnCwGDbCL8G+mFSU2Rr
         vtgskV+CCiAC7N2VxpRhvSxBewjxofYepAzvPOHypa5kVeIsGgUKPHcNHMqoFNQEGYz4
         XQL9bcqzE7r4ux3nkDeUVvESoY1sHg+JFXIWepfmhR7vosfDPd42L9AtFJ7v/b/i3+vJ
         o5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016136; x=1795620936;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=;
        b=abyY3vwibZpPRRbpaczW9z1T0b29lXMnUhLZF/q6cgoiJvEAiy7cYIq1tp2NH6Jb10
         mQDSjruVvRZMVpW1dMOJ7fhLIuZ3YxeXyHScK7jikcVu+cXJCtMZMTin7WR2dyZU8M0P
         P3G1OJAmorc323Zh7rfgDo4rhTwNImD+lS6gcnjAnYdDodj8s2Qbj7380OCkBsQo8ppb
         SLS2PDMCwxds5+1dw/RAUzx1jd0xTYZlgDN+2w+HLb/dqavfmep7TUJMGs1t3tGdbAJJ
         FwyS0aaWdwTRpQo3wzXbtljVMktwjL6SOu37mGwG+8BdX1rZED1K8XpAHoYtcY1bmJxi
         PngA==
X-Forwarded-Encrypted: i=1; AL+hErEOSC5rUAYRzb3AiMtaP8gX+eOa68s25wQyU7K8MsC9Oky9V3V+eU1YZZpHvzMbV0yOv4NtH8ESYI7jrGJexgr+@lists.infradead.org
X-Gm-Message-State: APuU4Z+aqVh85QSSrJbtqdY74YsnCkBIgL9Aw4kaz0xF4yw3Qic0LEKt
	V/cRHiNfha2D4icuG5vqwbE7FkHUu1SYwFsRg9RN5DdcLImddMoYumoyX+O8Kwl490Q=
X-Gm-Gg: AZFdTZfOAG97YY327Se8dWQq7l/R2C0X1ufhPGhtc38WYNSfGazkVrEuuoAc/Tvne6b
	3bdZr3T+qw2j3VCHLblDGyYzGQNXbNPnC0YafWCQr+L2J3PV0LwRi4h/SB10hm3AaZY8OW3lAOl
	nJBD7fsty6n934KTBYQYPJqUFJc1KnehXe7FX6IlLM0MbLCNsiagO2q5CtwTxXkoVInMwNevBaS
	7g9t0xmkEQoIUqlASQniOKjzxDSdCeS9ZXVzbd0un2zzNfEzuyNZxBMts+eHTbDFmnGX70iEwOj
	5Re8bDStHZUSieSxYurBv5uXw98g97EWbsO7TgHM7aTxXGLA+kC/ceiApHiCXbVj3VACnK5umfT
	zc4v6/OZJdf4ozp8dCcTmNQkfZzNqVhK0Qz5COdnF1v6ZGaeEYFWi9uJrOEMNYT39IubE1y7MTl
	41B5oMVlAMoaJctLg/arZM9j9YBS1jAM7x/uOb9GKyi/rIK/gX3dZDfOf6bkvYdJrIPIdvWT/gs
	czMwh9k2mLKhKsDYM3KwZ5FlTertcT1xUdVqmbz3AWhBKOJgiZneERw1ZW4Qef4GOB/DvqvORZx
	N0eMzLdOmSYDGfWUlgE=
X-Received: by 2002:a05:6000:144c:b0:4a6:bc53:246d with SMTP id ffacd0b85a97d-4a6bc6269b6mr5843166f8f.45.1795016136152;
        Wed, 18 Nov 2026 07:35:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11643sm5196571f8f.49.2026.11.18.07.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:35:35 -0800 (PST)
Date: Wed, 18 Nov 2026 18:35:32 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Jintack Lim <jintack.lim@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: nv: Ignore TLBI IPAS2E1 above the IPA limit
Message-ID: <av3FxJpUvpb_8qMC@stanley.mountain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073538_666643_8CBD7FF6 
X-CRM114-Status: GOOD (  15.29  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In theory, an L1 hypervisor could issue a TLBI IPAS2E1 for an IPA
above the host's IPA limit.  The s2_mmu_unmap_ipa() function would
pass it to kvm_stage2_unmap_range(), the page table walk would fail
with -ERANGE, and that would trigger the WARN_ON() in
kvm_vm_stage2_unmap_range():

	WARN_ON(stage2_apply_range(mmu, start, start + size, fn, may_block));

The TLBI's IPA field goes up to 48 bits, so this needs a host whose IPA
limit (its PARange) is below 48 bits, and it would also need to support
nested virtualization.  There are very few CPUs which meet both these
requirements.

The fix for this is to return early.  Since there is nothing mapped above
the limit, there is nothing to do.  This matches how handle_ripas2e1is()
also ignores TLBIs that start outside the PA_bits range.

Fixes: 70109bcd701e ("KVM: arm64: nv: Handle TLBI IPAS2E1{,IS} operations")
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
This bug was identified as part of our formal analysis work at Pereq.  I
have not been able to reproduce it on real hardware.  The only CPU Claude
can think of where you might be able to trigger it is possibly the Apple
M2?  Not 100% sure about that.

 arch/arm64/kvm/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ef4554656ddf..19a914941aff 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4236,6 +4236,9 @@ static void s2_mmu_unmap_ipa(struct kvm_s2_mmu *mmu,
 	max_size = compute_tlb_inval_range(mmu, info->ipa.addr);
 	base_addr &= ~(max_size - 1);
 
+	if (base_addr >= kvm_phys_size(mmu))
+		return;
+
 	/*
 	 * See comment in s2_mmu_unmap_range() for why this is allowed to
 	 * reschedule.
-- 
2.53.0


