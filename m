Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A93606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KGB8/eL0;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=id9u9kOY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lLJ+RytG/Z6fAA7i4XLswM02XTXV1PXuYSsk4iRByVs=; b=KGB8/eL0TO/zBnJBAgbXivXfhW
	KRZiIS/oA7UcrMoMkhBRMMj8gsI0pt3mshHiX5pFwNEPmhV+3QvPY8ciCDthwPC6VzpMtcC3tvA+O
	Eiz2maYbFOU/vAcT549WP/tR3rE9aHQMb7inER+ZSoKFfCfhQKl14yRsQKTykglXpkcieXPYEiFFH
	1aLHkxdNYTlV/xhE+I8/H6RIEWurfVbo8JYW26giJaLf3zdrlahfSFaGkteZNG3LU6KaxfFd2KTf4
	PxrMms1y4jK8hNMrkjnTCNHEKMoR6Yy48k9RWdmj+DxOQmSqzf1htSYL/ZcPlk1RZOqpn/Lk11AFR
	tWZCav7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6RJ-00000006Thq-2TsA;
	Wed, 11 Nov 2026 11:24:29 +0000
Received: from out-201.mta1.migadu.com ([95.215.58.201] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6RF-00000006Tgt-45fY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:24:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LTkmc0WCsHinhYMS/2OI3bvHrpQrAYvGB39j0bNDVNM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794396261; v=1; x=1795001061;
 b=id9u9kOYpC9lFuAM6/pI9Q1grdvEKspToGw6upajl2wr80LRXcYfrx4TmvXDEBya0Qw/AiEm
 attNCinHGH0jP5NguQ5U+iioJCxY6kFT3rDwxThzidMO5b5bbDyPFa8uXVTijKEj2a8195M1JjM
 DV5ojOJe47HuhvOARFpABTKw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 668b743353c1e6e7;
	Wed, 11 Nov 2026 11:24:21 +0000
X-Mizu-Trace-ID: 668b743353c1e6e7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so2681e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:24:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF6N/H/PRDkxhX1roqC77aH3+pqjB/s59Y2xfloJ1hs6TdmHXTPh/New/K2BB95VciCqUtAP1dJz92axxbtYwoL@lists.infradead.org
X-Gm-Message-State: APuU4Z+TiuVFu98klqARm1pqEbkrpqDm4T5AXRuX67zwMWIDEUL2W0+N
	NbwLhoB6QGDUrBdw0qLNPJruhx+gUA5BP97jgfuIpO4ImCcGFBaSjbMFqIOTyKvZPN5pQ8sszpy
	9eL8roLMr5tftV+5zw43ttk4tVxgJBYfq488Ltb2b
X-Received: by 2002:a05:6512:3e0d:b0:5bf:d226:862e with SMTP id
 2adb3069b0e04-5c15d37f11cmr144047e87.2.1794396260539; Wed, 11 Nov 2026
 03:24:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111082746.1064567-1-fuad.tabba@linux.dev> <86mrrf1ux8.wl-maz@kernel.org>
In-Reply-To: <86mrrf1ux8.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 11 Nov 2026 11:23:44 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxXf+os+68gTeHb9H0UaCT994+w6aCrnUXaFYkm0Eo3Cw@mail.gmail.com>
X-Gm-Features: AclHuK_tB5ygP1htfYcTK39qsoECE8_zGN_xazx4QuE8eQkwLTDZ6N_3PXY9CxQ
Message-ID: <CA+EHjTxXf+os+68gTeHb9H0UaCT994+w6aCrnUXaFYkm0Eo3Cw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Sync SCTLR_EL1 before a pVM's CPU_ON reads
 its endianness
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_032426_177873_2EFE9DB8 
X-CRM114-Status: GOOD (  22.08  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 at 11:15, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 11 Nov 2026 08:27:46 +0000,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > pKVM handles a protected guest's PSCI CPU_ON at EL2 before the guest's
> > EL1 sysregs are saved, so kvm_vcpu_is_be() reads a stale SCTLR_EL1. A
> > guest that changes SCTLR_EL1.EE and calls CPU_ON before its next exit
> > to the host starts the target vCPU with the old endianness.
> >
> > Sync SCTLR_EL1 before the read, as inject_sync64() does.
> >
> > Fixes: 9d4ec80be2eb4 ("KVM: arm64: Handle PSCI calls for protected VMs at EL2")
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >
> > Notes:
> >     inject_sync64() is the only other reader on a protected guest's exit
> >     path of a guest-writable EL1 sysreg's copy, and it syncs that register
> >     first. Saving SCTLR_EL1 before the in-loop exit handlers instead would
> >     put the save on every protected exit for two readers. A non-protected
> >     guest's CPU_ON is handled by the host, after the sysregs are saved.
> >
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index fc0475f0877d1..e421f45383e0d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -1321,6 +1321,9 @@ static bool pvm_psci_vcpu_on(struct pkvm_hyp_vcpu *hyp_vcpu)
> >               goto error;
> >       }
> >
> > +     /* Sync SCTLR_EL1 for kvm_vcpu_is_be(), as HVCs are handled before sysregs are resync'ed. */
> > +     __vcpu_assign_sys_reg(&hyp_vcpu->vcpu, SCTLR_EL1, read_sysreg_el1(SYS_SCTLR));
> > +
> >       reset_state = &target->vcpu.arch.reset_state;
> >       WRITE_ONCE(reset_state->pc, smccc_get_arg2(&hyp_vcpu->vcpu));
> >       WRITE_ONCE(reset_state->r0, smccc_get_arg3(&hyp_vcpu->vcpu));
> >
>
> I think it'd make more sense to have a global primitive that pKVM
> calls to synchronise whatever affects the control flow of a vcpu (yes,
> control flow for PSCI_ON is a bit abusive, but hey...). It's a bit
> more invasive, but at least we have a single spot to deal with this
> stuff, and it doesn't affect the hot path.
>
> Something like the hack below.

Yes, better to have it in a single spot. Will respin with that.

Cheers,
/fuad

