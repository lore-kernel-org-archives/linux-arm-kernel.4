Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11DA606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qXkIttyF;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r0+ret2Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F2Xkdeo0HzaNsNuC4QUMqleMrJpmw0zTyb8wkyKNlT0=; b=qXkIttyFow9M5VIl+RjU68U4sH
	PSljn4LxEaADaAiEtkuCrY8o6B1OwNT0dbF5tJT/wDvYMZbESSTOiqxdlqptu/IvwBZyY8X3qiqCg
	O90+0Wp9fh4gn8ivckkqYSTtyzByWuHYpqaB+BWiLtzVkMIWUcxiQCZ+TdQFl7GsykpPCJ/u8KI91
	lyAvgIe/rZjJ4JkmdskKIY4HofFdD/k11CbxNN77zcP1eJ3STjsXeEjr64u4BGVl4l3S1gpxVJtni
	LE2wK9sRJwX6hE7tRlp/dp8la9twUmhxgRQc2XUhZJCh7zZibfA0vq1Ksb5NpCZJFAOV+uP3g5Blg
	XONTP1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Ao-00000009G2h-2Jk7;
	Wed, 25 Nov 2026 09:20:18 +0000
Received: from out-211.mta0.migadu.com ([2001:41d0:1004:224b::d3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Ak-00000009G0w-1q0K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:20:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=F2Xkdeo0HzaNsNuC4QUMqleMrJpmw0zTyb8wkyKNlT0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795598411; v=1; x=1796203211;
 b=r0+ret2ZK34I0gp6OmEK+8JaS1QKb6GT/T3FIh8+7qAdHXXHlkBytlcOAqXBRURD1pPzqp9k
 JKS7XQ4jaq10tz/45qhu91FhKlm+FElCd0o/oN1pqIyD53LUSoL26Or5/w3HlD3NPENiqkstE+3
 F+m0qgLzvu8OGF/+mWNIdhdo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 10ac3aeb4f81b3e6;
	Wed, 25 Nov 2026 09:20:10 +0000
X-Mizu-Trace-ID: 10ac3aeb4f81b3e6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so33481e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 01:20:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHnGadRe5euppgvXW2NzzJYTkf75h5aPrBLARNY6tXLs5UVSjYAzlpS3cm5UYYHf3Y7IYKPoYRXfuDsgrFkSXkf@lists.infradead.org
X-Gm-Message-State: APuU4Z/GznGJLhoR+iXBOXeWjcVznq0x6nj0Y/8fy2TkRgssNefCO+/8
	DN5d48euJ9t14qbL+PB1bI69M8BRs80/6WxhJG0YRdeYUrjEQCpfUgvHTgatEOnvmMKBlD8lI5p
	42k7zTWN7C19TTGCgOP0niT0vFnmI86M8Se9EY7Pp
X-Received: by 2002:a05:6512:2249:b0:5c1:ac5e:ee43 with SMTP id
 2adb3069b0e04-5c212394558mr484720e87.3.1795598408854; Wed, 25 Nov 2026
 01:20:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102095656.2948964-1-fuad.tabba@linux.dev> <2576e9e5-395e-4842-aa83-e09494e97d4d@arm.com>
In-Reply-To: <2576e9e5-395e-4842-aa83-e09494e97d4d@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 25 Nov 2026 09:19:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw1higCqZ5eY9_xsegh=C9W_=ba3VSE=8-wa-X-7_oG8w@mail.gmail.com>
X-Gm-Features: Aa3M54rNelAy3rRx_aqH9o44IgmjZOttEw2zqBrwcOUYh3b1IB0PHZ2N_7TmlyA
Message-ID: <CA+EHjTw1higCqZ5eY9_xsegh=C9W_=ba3VSE=8-wa-X-7_oG8w@mail.gmail.com>
Subject: Re: [PATCH v5] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Ben Horgan <ben.horgan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_012014_618662_E45BE30F 
X-CRM114-Status: GOOD (  16.11  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 at 12:00, Ben Horgan <ben.horgan@arm.com> wrote:
>
> Hi Fuad,
>
> On 02/11/2026 09:56, Fuad Tabba wrote:
> > finalise_el2_state() clears the EL2 MPAM traps on every CPU whose ID
> > registers advertise MPAM once the arm64.nompam override is applied.
> > KVM sets them again on guest entry only when ARM64_MPAM is set, a
> > capability that also requires MPAM1_EL1.MPAMEN. Without EL3, only
> > MPAM2_EL2.MPAMEN is writable, and the kernel never sets it, so
> > ARM64_MPAM stays clear and so do the traps. A guest can then access
> > MPAM0_EL1, MPAM1_EL1, MPAMSM_EL1 and MPAMIDR_EL1 while its
> > ID_AA64PFR0_EL1.MPAM reads 0.
> >
> > Record two per-CPU flags at KVM's CPU init: whether MPAM is
> > implemented as finalise_el2_state() tests it, and whether
> > MPAMIDR_EL1.HAS_HCR is set (MPAMHCR_EL2 is UNDEFINED without it).
> > Read ID_AA64PFR0_EL1, ID_AA64PFR1_EL1 and MPAMIDR_EL1 from cpu_data,
> > which holds them with the overrides applied since commit 342e62ded77c6
> > ("arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()"). Set
>
> Ok as long as this patch isn't expected to be backported.

Nope. I didn't tag it as stable.

> > the traps from those flags. MPAMEN isn't part of any MPAM trap
> > condition, so the traps take effect whether or not it is set.
> >
> > Fixes: 31ff96c38ea3 ("KVM: arm64: Fix missing traps of guest accesses to the MPAM registers")
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>
>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!
/fuad

