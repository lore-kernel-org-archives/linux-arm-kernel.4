Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74384606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m6aVUudM;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dFRLgPqp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XD3y0uRelfjcM8wuzE5PStYzhtdNUf4TcgUCbGZyLAw=; b=m6aVUudMt4ya87y/ZCzXeKjfGH
	+FBGXmIKd5OUfhzY5N8pf/w54dt5O34f7E1kBOe0oe76fiZfnpg7e3oDqxGPYNcM3RuL6fW7xFt6L
	Goa8T5jBZRvLb+O65z9rbtGLqActZCY92IXMp3I42ZvmvgdzpU2GDULe0PfyX208CMaMXtRK/McK1
	SfbsmLJR85rfAm8bvoiSvj3jRTX1a4wAjq7+qj63yBk2WJXGQBoOUs9N4kOfqjCPTR1vP96VQlKYn
	zZdYvMGio2K4o481PnqLpdNPJ2SGil7PFKLYdoCHupljCOYxOV+ILQBvkiAljKVkj59BQ2ooGqQqJ
	sxsnJEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmzb-000000064oN-14vi;
	Tue, 24 Nov 2026 09:39:16 +0000
Received: from out-63.mta0.migadu.com ([2001:41d0:1004:224b::3f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmzX-000000064nd-2rc9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:39:13 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ilOuyRk+MAIQHiCii2Y/pLuL3MbXC2Pov4MVI4OLeCc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795513148; v=1; x=1796117948;
 b=dFRLgPqp2gvd/lPwyD6upPTWenfEtnRhjxh6jkzy6cAxszUjCZ0t//KZ9eJVizZV2tsrA/hc
 0Y7Kd6HQ0uz+6PNXd+PG+OMKhMYWstRcgcisdQ0UhiuPyJ345MrAQzEFNKJC4B+PQssw1vt2PqZ
 42i2+vu1/l0tkOU+nTXPJJ8E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 16723c96a8da4ecf;
	Tue, 24 Nov 2026 09:39:08 +0000
X-Mizu-Trace-ID: 16723c96a8da4ecf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso16191e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:39:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIxtPssG/Dn/MmVJFKE8fhtgaCExMcYWbVC1NwUnBzgo9enJlKzZx6SZMbWRfqw+pfAMSd6GPRtrAVoAk/FUfa@lists.infradead.org
X-Gm-Message-State: APuU4Z9CpCCT6lBomOD9QVPdF00zdHEhIMwj+5HnJQzByJvvlRfvjS2S
	FSW2/ywVRhKHOCwYormCxd+I8BAHw9bjMV2BSE/p/FKEa2DuVyxEKJeXoWNKbDylK15Ndiv/MUN
	xsX+Rp1BaxGhb6BMOoQHpKls2XBDSDM/bkj48Kuee
X-Received: by 2002:a05:6512:3502:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c200ba538amr329242e87.16.1795513147393; Tue, 24 Nov 2026
 01:39:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123192457.8700-1-maz@kernel.org> <20261123192457.8700-4-maz@kernel.org>
In-Reply-To: <20261123192457.8700-4-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 24 Nov 2026 09:38:00 +0000
X-Gmail-Original-Message-ID: <CA+EHjTynhBzhjrFzd514Sycib=1rmh7JqYp0xSPVBvurk6Sm-A@mail.gmail.com>
X-Gm-Features: Aa3M54oJsiX7PUIr0O3Es9w-Trkkm26FAlvtAIKuj1DU-Bg32tEzMiolqN2nYfU
Message-ID: <CA+EHjTynhBzhjrFzd514Sycib=1rmh7JqYp0xSPVBvurk6Sm-A@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Drop open-coded GIC idreg sanitisation
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_013911_859577_B7CF4AA5 
X-CRM114-Status: GOOD (  16.91  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Mon, 23 Nov 2026 19:24:57 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
[...]
> @@ -5874,51 +5874,6 @@ static int kvm_vm_finalize_sys_regs(struct kvm *kvm)
[...]
> -                 * On GICv5 hardware that supports FEAT_GCIE_LEGACY we can run
> -                 * both GICv3- and GICv5-based guests. Therefore, we initially
> -                 * present both ID_AA64PFR0.GIC and ID_AA64PFR2.GCIE as IMP to
> -                 * reflect that userspace can create EITHER a vGICv3 or a
> -                 * vGICv5. This is an architecturally invalid combination, of
> -                 * course. Once an in-kernel GIC is created, the sysreg state is
> -                 * updated to reflect the actual, valid configuration.

nit: This comment is the only place that explains why, on a
FEAT_GCIE_LEGACY host, a VM's ID registers can show both GIC and GCIE
as IMP before the VM first runs. sanitise_id_aa64pfr0_el1() and
sanitise_id_aa64pfr2_el1() still set both at reset. Is it worth having
a short version of it next to the tables patch 2 adds?

[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
[...]
> @@ -180,7 +180,7 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>           * We've now created the GIC. Update the system register state
>           * to accurately reflect what we've created.
>           */
> -        kvm_vgic_finalize_idregs(kvm);
> +        kvm_idregs_enforce_dependencies(kvm);

This now also applies the S1P[IO]E dependencies when the vGIC is
created, at a point where userspace can still write the ID registers.
Was that intended? If this clears S1PIE or S1POE, the first KVM_RUN
doesn't restore it, so the final ID_AA64MMFR3_EL1 can change with the
order in which userspace writes the ID registers and creates the vGIC.
If that's the intent, should it say so in the commit message?

Cheers,
/fuad

