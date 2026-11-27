Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED226606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b0xZt2aR;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=HuKtElqQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HrpoliOMKq3aKEsYDXSMctB2Gs1JdFSq0O+s/fh27WY=; b=b0xZt2aRB7bjPFXLGYelqnfPT6
	rEbD0COiSxtDi2vz6/VpcHsnXAaJ3E2smS9ezyHc4ehxUEsV9QTjCoLX9cNzTlKq9TGF3q2RUIPkF
	vK+SDWWzqongQpacpidTz5VdxCpkzX2zpUZnRDjSSO6Mt424MxJCMrmWy48AKiSYnRMOhOS/faoWU
	oiJvkTPKjb2wUcMSeBullqIZvj2Z6QQxfTL9/8uGh61VSpbVMXgyGUhGmKG1hVNmo6yVV2enQnGWm
	XRu5wlUMQg1rl/bhhxsempC7IYkPBiUT8hmkH9eHmTXqOjp7IsqCaeZ5fQp6cNY6lSIlMnhiymc/9
	tQjbPhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX07s-0000000HKgM-2tpk;
	Fri, 27 Nov 2026 17:52:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX07q-0000000HKfP-1HGx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:52:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso81691125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 09:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795801964; x=1796406764; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HrpoliOMKq3aKEsYDXSMctB2Gs1JdFSq0O+s/fh27WY=;
        b=HuKtElqQAJNmpFG3N0xm26hehek7qk0ChXoB4a0irpVQo05Tl4nSRG5rbr8/qofyyo
         c43LW88bw5I9xRzp6Ub2n++Y18wiBtDuAo3aMn2C8Z92raUAi2XxFjg+Psk8BwokSnn0
         eb4i7qFgBx/TL16DfD1LjNOoJ4Uw2rJTbABkcF8b0OUI0/w0q/xkrC1Yc73q3XEjlcwP
         4MTBItkETb41btUGF7kXyQ853cTxwn1shC1aWev8kZ6u33ht2O3y2NVHaAbG7+lS7M2c
         H5Vs53xv5UTl2W+LuidFGu5FkdWttk/eRN23HevoUFoCzieBgcwYFqzlhHMa0+GUxS+E
         A3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801964; x=1796406764;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HrpoliOMKq3aKEsYDXSMctB2Gs1JdFSq0O+s/fh27WY=;
        b=w6vsf8DAf+SBRyt7XBsrX4oFLmlGeYp+tUgEaQ1gw51X3ro8RPm1fn20ofWzCTtImX
         xZjFjbM5AHBtm1z+4gOrz6OYvb1ALSXIb3ORY65vZtDyn9/+k1GI8EpoViRIkg68AlzK
         E04TmQ3+t/8rxsWBMqx32Y39HeOBtWyBjlUq0cLdYd8oA7qLJbwSI1MrmURoMjS3rRP3
         TwDC+2k1HTbC1/wnIBN5iuuh67sgYTEU6Ty1EDINGyPtFVQtIWGphKUO+RPKNCI+Chl7
         vjaRhpal29XvIAROnj2kdoZnUOOJErOhRJn6GvRt6rVlMBzURQXdaF1k8m1fHQUQGKpk
         tQpw==
X-Forwarded-Encrypted: i=1; AL+hErHc4jMXI+wy5AkgSiCNNWKAPYqXJX9Js+2gTbJeT7JsyP+Y0Nox7c6pUWtu2UgvnXLJrwxKbDxYe7FdbUL2vNJR@lists.infradead.org
X-Gm-Message-State: APuU4Z/+cn6tm9UfsF690h/1QLJ28mue+CduUh3ZrlScHCYC96c2XX7w
	lAWCwWS65TLNAFSODN+HdmPllBRRE9O7lY4EX3xZ/9tUj7KLuizyQrKOg74/+fKRHjJp9ArV+NF
	8maZ8G2sBJQ==
X-Gm-Gg: AZFdTZfWvXJ5ad800vKUAG9Yo4PJDRG70b1P3Blj0dGufdk2UXbUFHFzvDsZT8N4MYv
	nk87xdZKgX+J8bwmarzaZiJj1rEsDTAtZDJtMfEUXapDW/477W6xpBZP/NXTgLiSPGSwLMHDyAU
	wgEHUtE4adoqH37bIJrfNefbtCict+SRDrp+6j0D30rBaIBf/qaJd/GlwHzD3Xit9SMQlCYxC8N
	2DgvXvqkMzv8/fIaHVlv+QkeW/7AkXBToQH00bdOS61FAn412mnHRty6tbBdJzGI8vKtTryw0C+
	0PEAOMMApkEPTqtfdGGSsqE00AbweVQ9qM2I2MQIoQ26mYefpkkFj1397oAEoMvBfv9GQmSJrMi
	dAOKRjhxkCkr+Bn4NlEOYaIBv5yvy9XTrMYK+MB+Ab7gqCXq5moEgWIyCJyUy2MjriLTOE1QgII
	6ZfmahSQ6M5Lzku9AbhyCpR3x119P8sHb+zIhsDR4Kl9oks//E58Ye75G3l83CijvfSxjFP2vcg
	DGsWxcNk8UchOjBjhAmjZ0pIipogq6ASUmyjZJ+uVwnFHOECxVvGIiTfqZb9NgcgGF2Uroxy4Uu
	bGJCqix+PEU6VXfDgoOt+t/CYtbXP/A5rnrGCX4+
X-Received: by 2002:a05:600c:17d1:b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4bb861398d2mr396602295e9.6.1795801964219;
        Fri, 27 Nov 2026 09:52:44 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm46675405f8f.56.2026.11.27.09.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:52:43 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Fri, 27 Nov 2026 20:52:37 +0300
Subject: [PATCH] KVM: arm64: Drop a pending MMIO access when injecting an
 unmasked SError
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-serror-drop-mmio-v2-v1-1-96bd01bef6d8@pereq.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ7CMAwEv1L5jCWSQwt8BXFIYpcaqUllQ4VU9
 e8kcOU4q9nZwFiFDS7dBsqrmJRcwR06SFPId0ahyuCPvnfOD1h9LYqkZcF5loKrR6KBKJ7OyfU
 j1OeiPMr7W73efmyv+OD0bKlmxGCMUUNOU5v+RZsC+/4BM0yFlKIAAAA=
X-Change-ID: 20261127-serror-drop-mmio-v2-dd7ddb89c16f
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_095246_382035_701C5541 
X-CRM114-Status: GOOD (  14.74  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Oliver's commit bfb7a30b1986 ("KVM: arm64: Don't retire MMIO instruction
w/ pending (emulated) SError") established the rule that when userspace
injects an SError that we drop the MMIO.  An MMIO access dropped this way
runs again when the guest returns from the SError.

However, since commit 3bd107ed6b23 ("KVM: arm64: Only emulate an SError's
entry for vCPUs with NV"), a vcpu without EL2 pends the SError through
HCR_EL2.VSE instead.  The next KVM_RUN completes the access, and then
the guest takes the SError.  So the behavior is not consistent depending
on whether the vcpu has EL2 (MMIO dropped) or not (MMIO completes).

To make things consistent, drop the pending MMIO access in the non-EL2
case as well.

This change only affects unmasked SErrors, if they are masked the MMIO
always completes.  The host's copy of a protected vcpu's PSTATE always
has SErrors masked, so for protected vcpus the MMIO always completes.

I discovered this inconsistency while writing a selftest and I don't
believe real life users have noticed it.

Fixes: 3bd107ed6b23 ("KVM: arm64: Only emulate an SError's entry for vCPUs with NV")
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: Fuad pointed out a bug in v1.  I was checking serror_is_masked()
    but I should have been checking PSR_A_BIT instead.  The
    serror_is_masked() function returns false if effective_sctlr2_nmea()
    is set so we would have dropped the access but left the SError
    pending.

    Checking PSTATE.A also means we can drop the !vcpu_is_protected()
    condition.
---
 arch/arm64/kvm/inject_fault.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 1d5dfd4b9e00..cdb4fcc71d94 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -396,6 +396,13 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 		return 1;
 	}
 
+	/*
+	 * Like the emulated entry above, an unmasked SError cancels the MMIO
+	 * access the vcpu exited on.
+	 */
+	if (!(*vcpu_cpsr(vcpu) & PSR_A_BIT))
+		vcpu->mmio_needed = false;
+
 	vcpu_set_vsesr(vcpu, esr & ESR_ELx_ISS_MASK);
 	*vcpu_hcr(vcpu) |= HCR_EL2_VSE;
 	return 1;

---
base-commit: 4a1b7259e337e8a2ea999436b47151a75c7572dc
change-id: 20261127-serror-drop-mmio-v2-dd7ddb89c16f

Best regards,
--  
Dan Carpenter <dan@pereq.eu>


