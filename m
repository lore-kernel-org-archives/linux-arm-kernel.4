Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D722606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n3sCZXkn;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T3K91SGr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nftPNhHACaAjmrWyLnFiFxg6dPd//Ubc6ntdo0W25Vs=; b=n3sCZXknVmKjuUM3/pW+/CcQWj
	S+mpnkRdCR4BZhpldin7h7jvmKEFUZm1+V9vA+11TvtHfXHN1jh8DabywWByHyzHGNgWdD5pt42JL
	lrsUN/IdDrcBPUMdq3vwFM/XWFddWeusJe9FtDnB7YaHlztWekA3IK7JzRpiZeEWT01+PtU3K9gDD
	9f7/a5abYGhYyNkz3slliOWZlquZVFXkhay+y2jCXvVoIjgtf/fNUqm+dqKBr7Q2pGyX454m+II/c
	U2qxL8OjZISVC4t8/eD/okB6hrkFddQS2vcnUAE7Lieu85COqykRkNzkfPEQOqcpRY8jAFJNxtmod
	auhjF1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYmJ-0000000DAyk-08UI;
	Thu, 26 Nov 2026 12:40:43 +0000
Received: from out-109.mta0.migadu.com ([2001:41d0:1004:224b::6d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYmE-0000000DAx4-3loa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:40:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3S+tkRDlt8mmbrhI28toVD30bvDmGMUv8PKIjZ3+uC8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795696836; v=1; x=1796301636;
 b=T3K91SGr9uPQ6tsLbShoCNZimVFwrcxDMb6T7D992o7GM4DnUcS04pOO/PQ7S6R00GfCEoGr
 UvW0EpRyGCuB/QiN2BaZ/v1SreU7D/st6BqQ1OMO3+pb5DT1Kl+9Ze1hl1Di682mJIHEfY0PR1p
 1L5zq2ir7jLZOYS24/LfVjhM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bb681d1ed98bc4bc;
	Thu, 26 Nov 2026 12:40:35 +0000
X-Mizu-Trace-ID: bb681d1ed98bc4bc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so36947e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:40:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGRZPUb0exFv9ng9ByGh2olwniuSYhmJD0Px42D/Ef3QPdx137anpZO1rTexROtMYEzewgxGzepxGWBKQXgwwVa@lists.infradead.org
X-Gm-Message-State: APuU4Z+f21CLiRxF2yU5LNPZUzmKJqh3qEMIySKP42xU7Jync0RwPpV8
	OMi4RfcFBri+ouwxhIsNgxq12lMUGyZIvXqiMuhGU6o4ND7vEIjNULngyQwN6MNU8xLEngtJZ9+
	BSCIUSg4MslVQrH63ELF92PGj3Fw2jOdokQ/m4LGD
X-Received: by 2002:a05:6512:3983:b0:5c1:ac33:5a4a with SMTP id
 2adb3069b0e04-5c21a27a14emr850306e87.14.1795696834316; Thu, 26 Nov 2026
 04:40:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126100023.1286902-1-fuad.tabba@linux.dev> <06effdad-0a76-4d73-9542-cb628a40d887@arm.com>
In-Reply-To: <06effdad-0a76-4d73-9542-cb628a40d887@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 26 Nov 2026 12:39:58 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwVzRPi-cxH4jbvpm2P5x9B2kvBUeuWyX__i9nHZpPmew@mail.gmail.com>
X-Gm-Features: Aa3M54rSvorHaYPxJpGhhECQu83ycbJnsMQoQINlgHkxCOdeEgWdWCtjoCL7aJ8
Message-ID: <CA+EHjTwVzRPi-cxH4jbvpm2P5x9B2kvBUeuWyX__i9nHZpPmew@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: gic-v5: Reject an ID_BITS too large for a
 linear IST
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_044040_165395_9E430FF5 
X-CRM114-Status: GOOD (  21.41  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

On Thu, 26 Nov 2026 at 12:28, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
[...]
> > Reject an ID_BITS for which a linear IST would be larger than
> > KMALLOC_MAX_SIZE. This applies even for a Linux guest, which
> > configures a much smaller IST. Userspace writes to IRS_IDR2 are new
> > in this cycle, so no release has them.
>
> Thanks for catching and fixing this issue. I agree that we shouldn't
> allow this to happen, and what you have here is a defensive check.
> However, I was surprised that this was reachable in the first place, and
> now see the mistake I'd made.
>
> In general, we limit GICv5-based VMs to 16-bits of ID space in both the
> CPUIF (see vgic_v5_reset()) and in the emulated IRS (see
> kvm_vgic_v5_irs_init()). The userspace write path fails to enforce that
> limit, however, and only checks the hardware capabilities. I see no
> reason to allow a vIRS that supports more ID bits than the CPUIF.
>
> Maybe something along the lines of the following in
> vgic_v5_mmio_uaccess_write_irs()?
>
> /* We limit the CPU interface to 16 ID bits, so match that here. */
> if (FIELD_GET(GICV5_IRS_IDR2_ID_BITS, val) > 16)
>          return -EINVAL;
>
> Are you happy to add this (or similar) to your patch, or would you
> prefer me to fix that up separately?

I think that this is the better fix. I'll respin with that.

Thanks!
/fuad

