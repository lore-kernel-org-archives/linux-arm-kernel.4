Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A8A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ebu0Hy4X;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NdMBVvss
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n0Epwbp8Lzi+kI0RuXeSMG9mic2jpFCzQkf5ONSBZoI=; b=Ebu0Hy4XrHD/MqHZGQeqPyPx6n
	I6YWDZ3l8c3rOP1xcTbs/rnZrycE2OhkKjkfhHBgQSrcevSqiY8yHm0pG6Mic+mVUq23fiw1Om+tT
	MmNz4C+qEW+cEyzLP/ZXaiyBh1uxQAlTe1dMtj/BOzqEZhO4Msb546aII24N/CLtBmZ/P8DKmmX7K
	AzHCiIW4hZi/bmbFqN+pNI68NGS/nSIjcF/mybWQpuFN+3jsAVz+ieafcd55D0m29EQEinxPytN4n
	bQvp8LujekN91rwVOIcOzA6/PUBdarH/5T6ogUWtQWHiBvce2mxXAlb3QnHp8DLBAUuyxY3Q4yutE
	87pzItlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvn2-00000002LC2-2WL8;
	Mon, 16 Nov 2026 12:26:28 +0000
Received: from out-196.mta0.migadu.com ([2001:41d0:1004:224b::c4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvmz-00000002LBQ-0hrm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:26:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rMg7ePytN4P08Ni21SDstdH+iA+/lX/CBMDE9CVdeAk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794831982; v=1; x=1795436782;
 b=NdMBVvssAs5ggLpLWga6x2lIyipstJX3pqsDRlqC6ERnMEax9zrRWz1U7Ws/d4YU2NiP8vlo
 AIz31mPeCZiRfySxpUGN0MsCv3xMXhA3/182oEfEZXyASwMdHhDqFZ0DK4DjU2LmauOqzPOzJ5X
 EILykCGtv4w2CGTzRR6pfjH4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0fcf8ab443dda212;
	Mon, 16 Nov 2026 12:26:22 +0000
X-Mizu-Trace-ID: 0fcf8ab443dda212
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9078e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 04:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG5mRMfaURWIZB9WgZyToUZVeLVfg3nYeH8BPepM5C0R3oNF77V05gpphf2WQqSDJ+uMF9u+tuycT7Aut8+UOir@lists.infradead.org
X-Gm-Message-State: APuU4Z9TcchI3J0BnbWlRJMpfJGnpiwhNDQWfQCsSrIdfRe6Cofja9hE
	7rztgMHIps00txIM+s/M+FCA0uTwPR6aFunpYXNQ+uG74HYOoSBFgUUw9yv0DmeEny+cQnj3zGU
	+DW8ugxMMPsNRP4t59ziNXSyum3APPJISmaeW4aKP
X-Received: by 2002:a05:6512:3e22:b0:5c1:56f6:2f50 with SMTP id
 2adb3069b0e04-5c17d6151bemr251895e87.1.1794831979748; Mon, 16 Nov 2026
 04:26:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116110549.1863653-1-fuad.tabba@linux.dev> <avro44jUWOARFzul@google.com>
In-Reply-To: <avro44jUWOARFzul@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 12:25:43 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
X-Gm-Features: Aa3M54okcmr9MdJAy7XSmuEmAJr7gqz5micdc5fGZdFcC1JtmeOKxVLrP8oEceQ
Message-ID: <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Mostafa Saleh <smostafa@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_042625_861389_510DAC89 
X-CRM114-Status: GOOD (  16.19  )
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

Hi Vincent,

On Mon, 16 Nov 2026 at 11:28, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> > +     /*
> > +      * The host can read the pages as soon as they are shared, possibly
> > +      * through a Non-cacheable mapping. No caller relies on their contents.
> > +      */
> > +     memset((void *)addr, 0, size);
>
> Are we sure we want that? The guest may want to setup memory and then share it.
> I am not sure about modifying this API.

Right! I wanted to fix the bug for the ITS property table, which is
shared before it's initialized, and totally forgot that this is the
path all sharing goes through... I'll drop this, and put that fix back
in the ITS series.

> > +     dcache_clean_poc(addr, addr + size);
>
> I believe the hypervisor is already doing the cache maintainance when the page
> is mapped back into the host. (see stage2_map_walker_try_leaf())

I don't think it does on this path. host_mmu.mm_ops doesn't have a
dcache_clean_inval_poc() callback, so stage2_map_walker_try_leaf()
doesn't do the CMO for a host mapping. On the guest's side,
__pkvm_guest_share_host() only changes the software bits of the
existing mapping, and the walker returns before the CMO in that case.

Cheers,
/fuad

