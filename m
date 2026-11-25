Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B31E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ztIEu9I2;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dlmaahpK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZXxCXDhXt89FGj+2wCW0FFI+CiFy5a7DZCKDEUhio5A=; b=ztIEu9I2ZvrpKcEZyFfeMAJ0qr
	nImkJKuFF1PDuPri5kP/d9EPRQo1UDybTJ03+rbk3ojUaM+jcLW8/x5DnUd4bLKlQREOlNBxB5uvG
	M9fPvelq3GUGDeOs16dqJnNudwcTcp5n/mBU6x4EKGzyjWnGm0Ke76f0ojNsKQ2hUP/WFKDByF2CI
	LFHou6bCu5z95hu9up5BQVXCxnT+85L7TICvC6cFfI8yDFB157s/DCBMilOpeBXnaFASIJQDdOh+6
	3s62c+R763ubdHLPC5ewbLSeWiPysYa+uPPUlwSuh7mFS9wKX/w0IkHF8+RP0T1DrvkmD0JUDXpdC
	+jmFfl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEAh-0000000ABzl-43UX;
	Wed, 25 Nov 2026 14:40:31 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEAc-0000000ABzB-3h4a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:40:30 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-91f0274f88cso77580326d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795617625; x=1796222425; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXxCXDhXt89FGj+2wCW0FFI+CiFy5a7DZCKDEUhio5A=;
        b=dlmaahpKQEWo7MxBIY5H1IH8W5jSBydAZOrhKLex6aLOQAosATZJJKTyP9vozDd9hc
         MpacP82x9DUzs80HdmaXEK2tFDaE7648WOn07B7L2Xi8fz3SGETSraiFrSxnRCh7YLIf
         5R1CGRfNq3k1/C7SbrVUGjUSr3KNVoOtwCtF4lZJx3oFKbMEbmk3xVVdE6Yx4BbogvKP
         wh/h93XapXM3mLvUd6+ZHqRdRTQO4N47Fz8G1Vs3rOy8nnItqhvOxUDZ8r7tVs91qmQj
         tCW4MH1642q+OB05t9EnmZ69dKcvoN9BReGoOTT2Ooj05eSr4U5BiQLyOu199RDEdVuF
         WdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617625; x=1796222425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXxCXDhXt89FGj+2wCW0FFI+CiFy5a7DZCKDEUhio5A=;
        b=Uhyj6Zszo1i8aBnP41bLPGYFZcHRxFfthbR2at7Veqj7pPa6kpQs9Of+n1YxibH+F4
         GVcUOQvpEWRGELw0KugXRf5g8nY6jqZASHEM0gDdF5Ls0YsivQgLgiiCEj4yaQVva/8F
         xdo+ebil5EuxxhwEMmezafktdscl84eLZx5hVv8IX/SWc4COMX4oWY3jTbEg2uTBVvqJ
         nreVRsQyUGX90OrObxbqCO+eo2y0NcdshzheA7aNr3O6e2b3EIRzceFIXHK7ESXmmMKG
         VmLBhoKOWjcRubclKnDwJQ7zZYzWoYGvq/VDGEseqlY88P5w/D2x/SQ/ockOthRFot5w
         1siA==
X-Gm-Message-State: APuU4Z/1GAuJC8ID513iQiZGm1KHcUJDYso40xOUFLEp+VTh4oxMv27D
	lX2MICk3D7f5G+Cu98FjuHMhWSaXv+5OQrDPFavfX6icEyNU9V7tDCO3pm4jXHIHJsw=
X-Gm-Gg: AZFdTZd6tClr8CoZhbtzBr+NEUP1fi8i/kedBlk9ILyFXEVHAm/In+Lcusvwe+wCmJa
	8qvUoG/ODHdnTsNoblC+fX5KPH280jGB7oqnO03AXvrO69372YCnDJT1vO+stNJYLvHbPJxpfqa
	92kSGTPiIg7e7pGD/DCXlMz17e1xRqWGymeXv3u3uLj9H/A1p6X2rdRJrxzunCTPNzBiijeH5QS
	uIlf6CMkqGKsOeXSZzOZsxKDQBhykQaNBTdR2rW0ZXclcw0SnQ6gAgMK2t/PldFrlRu+2IPIfDr
	EEXM1f/+mzcDHWHOl100g1mj+Xc0wZ3/sMGwyVagpFKCGJt8DsNN9KFvLbVpbRmuHCU902l4ZXJ
	UGKPw3tReHaAZw9YRPxID7lNDhQ4DOOuJNVQMvKrreDApnJR8XLwhNTXFQ2CgcPxcA0i/MjnCR3
	kXm6u4L0OSDHNXnHLdu6jaPycUxemCKTctxNV7OQ+NFqBAAuZQ5yawImmYMLCUqMEanxU+DrzyV
	qYLW/+2mrcQcli4K7jIqKAp9rgyL3A60raaOLto1d8bJkO9P953iJikKenbfpFx5Vje2L8cBQC0
	BDgphQ==
X-Received: by 2002:a05:6214:e88:b0:921:23fa:2c05 with SMTP id 6a1803df08f44-92134b7aa62mr315798476d6.46.1795617625546;
        Wed, 25 Nov 2026 06:40:25 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921645f50f3sm61254106d6.24.2026.11.25.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:40:25 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEAa-00000001lzg-24TM;
	Wed, 25 Nov 2026 10:40:24 -0400
Date: Wed, 25 Nov 2026 10:40:24 -0400
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
Message-ID: <20261125144024.GH246011@ziepe.ca>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
 <20261120190525.GC1133597@ziepe.ca>
 <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>
 <20261124135424.GL9566@ziepe.ca>
 <a54bdqfzj4eyoaaiekxxeqi27rc6pu6z2uufv3lblbyujclz36@egotqjcxv653>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a54bdqfzj4eyoaaiekxxeqi27rc6pu6z2uufv3lblbyujclz36@egotqjcxv653>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064026_931659_16ED01C9 
X-CRM114-Status: GOOD (  29.34  )
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

On Wed, Nov 25, 2026 at 10:05:52AM +0530, Anshuman Khandual wrote:
> On Tue, Nov 24, 2026 at 09:54:24AM -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 24, 2026 at 09:29:27AM +0530, Anshuman Khandual wrote:
> > > On Fri, Nov 20, 2026 at 03:05:25PM -0400, Jason Gunthorpe wrote:
> > > > On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> > > > > FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> > > > > translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> > > > > arm64 platforms with FEAT_D128 enabled will now have two different memory
> > > > > translation systems i.e VMSAv8-64 and VMSAv9-128.
> > > > 
> > > > Please don't forget to update arm_smmu_sva_supported()
> > > 
> > > Sure, thanks for the pointer.
> > > 
> > > Fow now will disable SVA with CONFIG_ARM_D128 enabled but later it can
> > > be enabled back with SMMU_IDR5.D128 feature. I will probably fold back
> > > the following change in the series.
> > > 
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > > @@ -205,6 +205,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
> > >         unsigned long asid_bits;
> > >         u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
> > > 
> > > +       if (IS_ENABLED(CONFIG_ARM64_D128))
> > > +               return false;
> > 
> > That seems wrong if the arch code is enabling this based on a CPU IDR.
> 
> D128 translation gets enabled when CONFIG_ARM64_D128 is enabled and also
> HW has FEAT_D128 as detected via ID_AA64MMFR3_EL1.D128.
> 
> Besides if CONFIG_ARM64_D128 is enabled on any HW which does not support
> FEAT_D128 the kernel would not even boot as there is no dynamic fallback
> to D64 translation in such cases.

Uh, gross, so it is like 64k pages :(

I guess that makes sense from a mm perspective.

IDK how this will ever get used in the real world like this though :(

> > I would expect distro kernels to enable this kconfig unconditionally,
> > so this will break SVA for everyone.
> 
> ARM64_D128 actually depends on EXPERT and hence it would not be enabled
> unconditionally in distros ?

Please add a comment to this effect, this not how the other things
work.

Jason

