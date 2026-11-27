Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1qYrlDj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTmdAnrv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ck511kPGuCN62RAGxAOqUpqHEHpgf3t/JnukiZZYPXo=; b=v1qYrlDjOe/jQHYmg7vs6HFy6y
	XZuQsNj2EMPlw/FvffJ0QNGdbm4UGq3WkhLyesNWFHh9A+8dCgoJWaoUiEwJsmJJsJaONiNUXg3eQ
	bGA7b5feQwIsm7bPVFQ680JDu9frJQ8r+GTu3OiSnuXbsUpQrOkqbJiA4nflIGYrVD+8EQH7aeylf
	xJW7MQezPmZgSV2q5ta/I9QvFsVYMPihtN74AcEnAR5MQq78fizbidru17ILpiCVpw5OxEAGIvwEo
	DMIq9z2PhvqRidkvYUX8xV/D1ohSnOV99NjLZGuvMij4AHmf6//L6KcmDsoHliT/WwobiYt4b8evU
	17hJq0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw1G-0000000GGhQ-3CWR;
	Fri, 27 Nov 2026 13:29:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw1G-0000000GGhJ-1dXN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:29:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D226F424C9;
	Fri, 27 Nov 2026 13:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F771F00893;
	Fri, 27 Nov 2026 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786181;
	bh=ck511kPGuCN62RAGxAOqUpqHEHpgf3t/JnukiZZYPXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UTmdAnrvkcqZhhQSlkZefNubbNcDOW2d97b4Mu5o45a6thUKJZZUUaSn3NwMlFZDm
	 cgRXG43KVWU+M/oultDInN3nc+9pkCtnk5eaZ4h9APxPtV2kNGoQccYx9pRwaw2YbG
	 McXz0HvM/yGG2kVd3sI7QW0hCo2ZXcn4Zg17jh38yeP9Bi+77NFh1ysMLk8sxqq3Ep
	 GGe1GVKMOxaGVa9y9/sQOEaGekUnDq0S0kcaeJRbVwyuaAxRUiW2AcxSxqoOHfIWs3
	 l1IOp80Jvp3In+thI3vHGu3j35yffbUyZQC7FSfaD7FL9a477xf0R6FYfFt/Cp0tt5
	 2weIS/DJ5/j6w==
Date: Fri, 27 Nov 2026 13:29:33 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Wei-Lin Chang <weilin.chang@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com, 
	rkeilty@meta.com, atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Message-ID: <awmDZoqzL_t6A7go@gremlin>
References: <20261124152842.2634495-1-usama.arif@linux.dev>
 <awcXhk885lqDRAHy@LeoBrasDK>
 <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev>
 <awcoCklLOKeuXPhh@LeoBrasDK>
 <e7bdcfa9-bbd8-4649-8318-2f6dc236db15@linux.dev>
 <4jxdf2pkuu2f7dftvf6ltpv27jctfuvvrfcrbfxudsgnp3hdfk@taur55wftexq>
 <awhH1Dpu0uIwP6ea@gremlin>
 <awh5pmXCbNoFP5Ez@LeoBrasDK>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awh5pmXCbNoFP5Ez@LeoBrasDK>
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

On Thu, Nov 26, 2026 at 06:25:43PM +0000, Leonardo Bras wrote:
> > > > diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
> > > > index 9a126b9e2d7c99..5b61285d317e28 100644
> > > > --- a/arch/arm64/include/asm/kvm_types.h
> > > > +++ b/arch/arm64/include/asm/kvm_types.h
> > > > @@ -2,7 +2,12 @@
> > > >  #ifndef _ASM_ARM64_KVM_TYPES_H
> > > >  #define _ASM_ARM64_KVM_TYPES_H
> > > >
> > > > -#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
> > > > +#define KVM_PGTABLE_FIRST_LEVEL		-1
> > > > +#define KVM_PGTABLE_LAST_LEVEL		3
> > > > +
> >
> > The -1 isn't needed here at all right? So why not just import
> > KVM_PGTABLE_LAST_LEVEL and do:
> >
> > #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE       KVM_PGTABLE_LAST_LEVEL
> >
> > ?
>
> Well, it kind of is :)
> The lowest level we have in a PGTABLE is level -1. (See RKSBQV)
>
> It could now be mathematically correct, but it could break in the future if
> we got a level-2, for instance. We could have (LAST - FIRST - 1), if that
> one page makes any diference.

Yup it's level -1 but isn't that only something meaningful for stage-1 I believe
due to concatenation? As per stage2_pgtable_levels() [where ipa is the number of
bits not the ipa... :)].

But you make a good point re: future changes!

Anyway, Marc has made it clear he wants something based on
kvm_mmu_cache_min_pages() at runtime, so it's all moot anyway, this needs to be
reworked for that.

Usama - I assume you are looking at that now?

--
Cheers, Lorenzo

