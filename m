Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6235D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r71tb4Fp;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=J4/9tCQO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ocgERdCX40/QdZP3bdVNa/cddm/zWvOFkBxBwp4HIFM=; b=r71tb4FpqmARY4/DLlgeBp790t
	wY8gjWyeonA3pVL6fyPahNOMuXZBw9UNgZpuT45Z+wc89u77OxuFosIWIZSksenJgRpFi4lbMzQxL
	3p/4ib8P9hlvJbjRMQVy+RnZ3E2fpjyS97b1mrOkwzyq7/IttdH6ok59sXiaf24+zxlWm3fK2oSLk
	BCHmLEpWBuCJ7u1W1y9ePE+eQLsP/wbGdvE4iZb8aW8y4wq53wTpXZ37cnA5vJQ4ji1eG70AAKhAU
	xxvLAViePAfzFusfAj2+xVc3o5GGRljnFKvuaEerlXKsXIvVi/5uMvxaZ6q0snM6fja+902/rD7nX
	tGtpG10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThbk-00000009IYn-2HHU;
	Wed, 18 Nov 2026 15:30:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThbh-00000009IXl-3H16
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:29:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8973095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795015795; x=1795620595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ocgERdCX40/QdZP3bdVNa/cddm/zWvOFkBxBwp4HIFM=;
        b=J4/9tCQOm3E6BqnhoivAF4DyEujHyVjEPsHRKzQQutKSEKO5waWFJEXbhf1y7CpJws
         qnqDauadoJj94QYIm8d82n1Pu3reMB1q8zpoj6dJLBR6XBgTw+zswbgmb5t49AQEuvo9
         7edlJ2uk0/EkKeklGALOWL8OEx9308x1p7aQ07OjCcvH5Hj3US9EGfcL6ODuldh2i4A+
         UskTwHZrjv3bk6IXMJgo611w2w9Qykd2tDdd4DqTKdtUOiu4CpG81KV8229pYe+Vdnm8
         EgB/iCeSsupTm+nOIKsdQeQ0QoJ35/bclaluXuZvOuks0LmAh7eBce6Ar4Oos6/fvx/x
         83CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015795; x=1795620595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocgERdCX40/QdZP3bdVNa/cddm/zWvOFkBxBwp4HIFM=;
        b=scvD3vOMN5OUjCebYEvazGxY4Nbesr0hqplmqavSOY6/n1F3W1T7VjFcU4RwKoTfSg
         aAk2veuqjIye5xjoGRqzGfh+w+CUdVVc710FanrlvFL+zHjQSxPYksSW9SjYD17gZjzc
         hBXlrD0P9qJcBr1hiIa1ZHU+PsFF+8/MdWa8psX/bKbA+Y8OU8xsZJdSQYKc25iXJTas
         NtYjINVCsrx3IAWtXftEd6g0aWUxFcHBiuTjKLunqPWY+wRk2LfJizf2R05M0+ILoi7W
         pGFBopfW1PIwv3Xu5sRX9bajuIYuDDzlk+cpAb9UIdUMI45OytKGAsNrBBJRqt9sG32G
         1QMg==
X-Forwarded-Encrypted: i=1; AL+hErGgL7V+O5xB1XIwjbRnO2bxBx6ds2KxO7ysqkHO00AO9hYMqvIGK0tFd8D52I9C4hblHVIwEeuhs8KNtSFfnTsE@lists.infradead.org
X-Gm-Message-State: APuU4Z9kJJ4wQ1Z2IjCRd/ksZRB8i7lEmKh2VRhOBgcT1h+YZEJrAtm2
	XnKEb5nuV0yX6wvz7322k6fscLaf+fZL++CZI3qm5ommN2RUELPwgWDWeXNrQikAeh4=
X-Gm-Gg: AYBFou3TqeD1wHE9UBDMQ7F0OEGSj0hYpDB2blgIOCElzogmXKo+wNzG1JBFkhAV/II
	kmPO65zibfvbXksGOKzOPlLKZe1Runz3GMl89UJCmsg2K7C6zSrCf3C66nhCCAEi210y2G6he8T
	miKD6OQ0Y1Lj0lHTQYV271TFIrbPCNN/R6dDobStfPLdU0k70NbcKZLwL6Lg3MMrPl2Lx4dDntS
	H+ZBfvj53aokjIl1U8oDZguKDTc3Xcsn/pLMOqolFAaflbuAmQ7Xpo46HowuzAjpRSJLyuMO5Wu
	OBHbagqfMgehbtoiwNO9VfTER4XNg6eRMojBMKwupUUKPRlZMnkskv4s24B1iTJFlZM8IDSmSsl
	giXCnrMAGVbn3ZDXM8x+ZsEw4HX56mREaNd+Y4bmaFD7NacbnQjQXQAKRzfottG3G7lzFN1MuDY
	5d7qazyvYC2PoqxefpP8wsE0M7rAxuUtM4+AONVKZIXvEjHSX122q7ZfxoCsqBQr7vmZj76+0H+
	OIzL7ECuzyUlLRFXbKFDdq5Zzp/YAbDi/kzVttIR+b0oowRLYFtC0PyIQWR9kvsek2ouWa+C7WW
	LHDS4IJni+M+AAxN1ueyx+5EnYV469xKkolGY5df
X-Received: by 2002:a05:600c:4e04:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb7d5d4113mr52050185e9.2.1795015795013;
        Wed, 18 Nov 2026 07:29:55 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm106797465e9.13.2026.11.18.07.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:29:54 -0800 (PST)
Date: Wed, 18 Nov 2026 18:29:51 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 1/3] KVM: arm64: nv: Forward PIR_EL2, PIRE0_EL2 and POR_EL2
 traps
Message-ID: <79097fe98499631673fd536ef2f1b8cfc92b979d.1795014776.git.dan@pereq.eu>
References: <cover.1795014776.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795014776.git.dan@pereq.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_072957_846992_2D6CDA9F 
X-CRM114-Status: GOOD (  14.00  )
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

These registers were added to KVM, but not to the encoding_to_cgt[]
table which decides when a trap is forwarded to a nested hypervisor.

The result is that if an L1 hypervisor runs its L2 with HCR_EL2.NV set
(meaning the L2 is itself a hypervisor), and the L2 accesses these
registers, KVM handles the access itself and it goes to the L1's own
registers instead of being emulated on L1.  This is quite a serious bug
because it lets the L2 change the permissions of the L1's own stage 1
translations.  It could mark everything as no-access and cause a crash
in L1 or mark everything as read-write-execute which weakens the
protections in L1.

Add the three registers with CGT_HCR_NV, MAIR_EL2 and AMAIR_EL2.

Fixes: 874ae1d48e60 ("KVM: arm64: Handle PIR{,E0}_EL2 traps")
Fixes: 5970e9903f03 ("KVM: arm64: Add basic support for POR_EL2")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/emulate-nested.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 2bec81668361..bf4b8a44b9c4 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -889,6 +889,9 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSCR_EL2,		CGT_HCR_NV),
 	SR_TRAP(SYS_MAIR_EL2,		CGT_HCR_NV),
 	SR_TRAP(SYS_AMAIR_EL2,		CGT_HCR_NV),
+	SR_TRAP(SYS_PIR_EL2,		CGT_HCR_NV),
+	SR_TRAP(SYS_PIRE0_EL2,		CGT_HCR_NV),
+	SR_TRAP(SYS_POR_EL2,		CGT_HCR_NV),
 	SR_TRAP(SYS_MPAMHCR_EL2,	CGT_HCR_NV),
 	SR_TRAP(SYS_MPAMVPMV_EL2,	CGT_HCR_NV),
 	SR_TRAP(SYS_MPAM2_EL2,		CGT_HCR_NV),
-- 
2.53.0


