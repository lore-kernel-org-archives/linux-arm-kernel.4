Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GsCL96Y5;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KsInIEYl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jEatzr2wcCwXaEmVaXwZZOqjiW5YqebF/1TV72BGKDU=; b=GsCL96Y5hCpX469asvWBkv6dHd
	gd2tqT96qq6Af9x4O+Tf6/3acFsbAJG88Gr1swRGTm+44HoOwj+0oIcuVb+3XkWHZ9cUNjc7mY9Nk
	MYB48wUKb9DmF/PnTc5BgMI9rt2E/C+apIkkXwrLjrqUBRU01wrQcaMgJa9hd472Bb0rljqK1DWon
	F8PCCWLj8s5gqnw36udikV8wPmkuc2p0GpJGy8A2l5Ez65BLFW312B9L0x/IiD/bD3BTR2PbD+rfh
	4C84Wi/2CPJvhbA7eXqRLtzyE1MWlHXlP647FAXycGTyINW/SFaXAO9J8xnH8+nmfqdZntBSGnsCP
	fpqbCYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqyb-00000006gwv-2RcP;
	Tue, 24 Nov 2026 13:54:29 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqyY-00000006gwL-24Nq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:54:27 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-53639b8903bso55636841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 05:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795528465; x=1796133265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jEatzr2wcCwXaEmVaXwZZOqjiW5YqebF/1TV72BGKDU=;
        b=KsInIEYleigJ7Wwc2mtKSaauh/dTjNSR/rq3zXCc3waBFyZzyLIiKGEc+3SPCF3R+B
         C3/L4Fj3HVuxPbc40sOuchhPntij17DsuPl8rSH7WtweTtexgMhLsT2Y+0i2qaNoAzbt
         y2i/1pyi8L5bgf5U4ZtXB0fqKnfh3/0ThU9k5AmMYF7mDtSmK4SwheKXLxmgdz0b6NtV
         T3CKmlqFS0YsPZCWj+C909Pz6pJAH1JETwjiQEw6QsKbXm+AVx5T2MKCgFnFYmXthPfp
         +6JGHEGtRqaFwQ2PCEYWFZVr8wtPlHRVcIaGbatI5xFyp6iLUZsoZXOdbBC82wKkkviJ
         5YjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528465; x=1796133265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEatzr2wcCwXaEmVaXwZZOqjiW5YqebF/1TV72BGKDU=;
        b=rsL2wp5fhZ9nIc5ALfdhZt9WUyP2akAYpSyugggTAFKEHlu28mOvhRWNgzOCxHT2QM
         yrzOORdDQf754y8vOPFbjcJiGzUrv6R0hYIYmUGcj4KVBWOCU/d0wa/sRMiRRsm42YHY
         Tubl7dKNLqY+m+f4dwArWpQpQ/uZyPocl4CsA6pk2wMjxMdBh/hh4OtDVHw2XWqWH2kT
         xe5U7L5HaQLu1DJpM+6GeJcjMqoU48opRtd6vudOaA+qcK1L45WnfXYE4TDiFsQZBRef
         scc4lPggQORuWYaaGFSlKTtqdgOf4qE2SmzghrAd3885Av25QszNz/JcCUqrUoIlbbPY
         M2eA==
X-Gm-Message-State: APuU4Z8Ux4EUj/OMHbuxTlGQPuRKlIxNroEK2vFYFOycWv4Y91Y3uUuZ
	tijUwjL6MrpC1qHushgU+QEBAQrgF0qHIxe4EjLEAIsOjzs5wBY5S6P3DjyxAXuoy3k=
X-Gm-Gg: AZFdTZe2VQGRTjIPZbMJAda3H2CO1cAOxvpcEkJ+r1cNioRU8wybV9gWuJAKHvjx+Dj
	EhoNsTXDV/G0+8toG8NSp1CrzhkE2ANlaFaICSt9vtjeBSX6peC3MnMf6rbo0oqHumA+6ftG5JQ
	NowLdxP1zsD2S9xg3gGNcT8CV87hvOpcZMCSwuFLxs3ryMOqgm/c8d7FiXWTZAm8a3PHyq6WQgg
	euipfP1r8m5itEhQh/T+GLPRbRby1ZlB75U6LnTh14JVlf4NePDab98MccAX+HkRwv3tBoM1YH8
	91z3Vy+aCfe5AmJ9aHQyNN+Ugm9rrejdFd3wcbIOOBODo8W4ikJB7Js/NXo6k+llW5X+vYGUCeB
	UQcUJ7TFCyftg5bJrM/ZOgOhXuy+KsX1UGhJtNKEJgPPYEux+LKT/+GgiNyDd71+/HHu6fImXcB
	8ZkLYE7CBjIT4aJw4hA/wYclWIpvVToP072xysHL8kMnaunKZdrtAwwlO/ZGxG8/BVGgMTRFzV2
	Vb12YFIqK/o7fXaPjFkWdP+H6HXW5fgDsBdHuTpSIJzXu0adCjsXgnAkHbCbyvvNv7Nd2WaNpxR
	I+4CUg==
X-Received: by 2002:ac8:5a42:0:b0:55d:3669:e04a with SMTP id d75a77b69052e-55d76a30b0dmr258015381cf.23.1795528465232;
        Tue, 24 Nov 2026 05:54:25 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm125554721cf.29.2026.11.24.05.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:54:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqyW-00000000QaE-10f3;
	Tue, 24 Nov 2026 09:54:24 -0400
Date: Tue, 24 Nov 2026 09:54:24 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Message-ID: <20261124135424.GL9566@ziepe.ca>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
 <20261120190525.GC1133597@ziepe.ca>
 <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_055426_542365_41343F6D 
X-CRM114-Status: GOOD (  20.36  )
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 09:29:27AM +0530, Anshuman Khandual wrote:
> On Fri, Nov 20, 2026 at 03:05:25PM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> > > FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> > > translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> > > arm64 platforms with FEAT_D128 enabled will now have two different memory
> > > translation systems i.e VMSAv8-64 and VMSAv9-128.
> > 
> > Please don't forget to update arm_smmu_sva_supported()
> 
> Sure, thanks for the pointer.
> 
> Fow now will disable SVA with CONFIG_ARM_D128 enabled but later it can
> be enabled back with SMMU_IDR5.D128 feature. I will probably fold back
> the following change in the series.
> 
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -205,6 +205,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
>         unsigned long asid_bits;
>         u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
> 
> +       if (IS_ENABLED(CONFIG_ARM64_D128))
> +               return false;

That seems wrong if the arch code is enabling this based on a CPU IDR.

I would expect distro kernels to enable this kconfig unconditionally,
so this will break SVA for everyone.

Jason

