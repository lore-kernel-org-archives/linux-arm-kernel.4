Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EQc66PZW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTDmNLIg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZA63luVCcUm/rcUMYSE6kbch+b4UxpuSVxYdwx6UVuY=; b=EQc66PZWTO/mSR5mu6Kz09t3yL
	oTRaG29xmIDLhXZTwp0llFR5ItnJBJs1qofTItZI3470KezApN76q56a2m/eOxZZJZz4IpvoA4mS2
	FI7+SmVDq21AEQoZcZWkNPF4k1+WYg+Oopybqq4tek+w7AlzylYTQl6tkWbL6xYykaoZh1Ioc1lpq
	N0rNclIo53r9+jPRrx0CdnDE47Cd7XlCVnuHE7G4QUSQvtmRgEhl8cFu1+jSOqTBafSUw8N4PFlm8
	ZPKJ/t8wFWgjKBJTsW1m8ddBC8PbRsAa194Y7ZDF8SNMvqJyCSSlQWzM/xHFydzmto162o2syhbkc
	39z1oP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQImD-0000000HUFv-1FXg;
	Mon, 09 Nov 2026 06:22:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQImC-0000000HUFW-1h5b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:22:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 786F4618DC;
	Mon,  9 Nov 2026 06:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0B81F008A1;
	Mon,  9 Nov 2026 06:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794205363;
	bh=ZA63luVCcUm/rcUMYSE6kbch+b4UxpuSVxYdwx6UVuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mTDmNLIgFiFwQeKbp4CMfjVX+h4GlITRDvYMD8FO9glhG/g4prrJIRnsH/XA6mrqk
	 KZHT3JCdSldwDf+HAmkYhqyzNX7RIICj9z7FYzjFYp8Fuk/T7pkF0QeXLcG7AWIo9i
	 KgU8apAwsf8d7sKCxaPFkaNvCarJsW0jzSix1Pd0iao0MPfHPCmjyssAS/MB3ULpJQ
	 598v4SkCigLCevg13d7vrUze2LeVfCu9q4JUe230MOAe2131CzkMqCquO+EC35jHJw
	 bvKH9HXR2oRh463I4q+2R4nTIkUhSiLPzN98NzjIPb4tcVpYrgp+nUXVYIHhtubC95
	 40b+tagd1SqIg==
Date: Mon, 9 Nov 2026 11:52:33 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Will Deacon <will@kernel.org>,
	brendan.jackman@linux.dev, catalin.marinas@arm.com, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <avFmqak7gxqCW3UB@sumit-xelite>
References: <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
 <auILvMVSXk9pZh6M@google.com>
 <auQ5hCdPFz0BmvDG@sumit-xelite>
 <au2vtZFyfUVWeils@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <au2vtZFyfUVWeils@google.com>
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

On Fri, 06 Nov 2026 at 10:45:09 +0000, Vincent Donnefort wrote:
>[...]
>
>> > > Yeah I saw that constraint too, let's leave it for future extension
>> > > then although having this reordering dependency fixed will be ideal.
>> > >
>> > > >
>> > > > So the only case it would work would be when a reserved memory has set
>> > > > "linux,cma-default".
>> > > >
>> > >
>> > > Let's rather just turn DT based default CMA pool to support PTE-level
>> > > mapping and keep it configurable via Kconfig or cmdline or DT.
>> >
>> > If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
>> > necessary.
>>
>> Agree, it rather makes sense for DT independent generic CMA pool.
>>
>> >
>> > Also, Rob wasn't very keen on having a DT option for the reserved memory and
>> > suggested to have a compatible string instead [1]. So perhaps we could have a
>> > a separate driver that handles the unmapping.
>> >
>> > 	linux,cma {
>> > 		compatible = "shared-dma-pool", "unmap-on-alloc";
>> > 		reusable;
>> > 		linux,cma-default;
>> > 		...
>> > 	}
>> >
>> > That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
>> > (to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
>> > map.
>> >
>> > The nice property is optee won't need to be modified anymore. The downside is
>> > the entire pool is now mapped at PTE-level.
>>
>> Sounds reasonable to me. If folks are really worried about performance
>> with generic CMA PTE-level map then OP-TEE already supports no-map based
>> reserved carveouts for protected DMABufs too.
>>
>> -Sumit
>>
>> >
>> > [1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/
>> >
>> > --
>> > Vincent
>
>I have just looked deeper into and cma_alloc can't unmap automatically the
>default pool. Callers expect a valid linear mapping right after the alocation.
>dma_direct_alloc() and dma_direct_alloc_pages() zero the allocated page,
>dma_direct_alloc_no_mapping() runs cache maintenance on it, and the userspace
>available heap /dev/dma_heap/linux,cma zeroes it.
>
>Also, it isn't possible to use two compatible strings for the reserved memory.
>The registration stops at the first matching compatible string. Layering drivers
>won't work either.
>
>So while the pool can still be generic and serve as linux,cma-default:
>
>  linux,cma {
>      compatible = "unmappable-dma-pool";
>      reusable;
>      linux,cma-default;
>  }
>
>We can't escape providing an additional API to unmap/remap in the linear map.
>

Yeah it's fine to invoke these additional APIs post the CMA allocation
for protected DMA buffers.

-Sumit

