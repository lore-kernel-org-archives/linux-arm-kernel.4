Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D6606A205
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kEl8DCsE;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lg36jqBc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=; b=kEl8DCsEVC+/6Z39DQWLBc8Jty
	sVvoNb9gaOVqXuLjm87089RjerGOmltxsCLVT3NXOiFUvDG9/pbNmrJTuY8n+lmgxYx2GrTihyxq3
	zfR/3Ou99osWh3W7Xii5FBNwnM3m311l2LoWb1FFN/YFp4wleNrWZ74qVXi1WwOIY5n/QDKC3IHjI
	1hkEXRw/zNiJAj/4CNbif1cZEwj4Thh0FStmYY2m7/pGy+4wOgUsjgUJXN7e7+1pNH3kTolPXcudQ
	7/1LYrMOeNERblzL97voDfPS+E1ZZXUksITPYXTjm+vWGLD9r6hCuToFA4OP8yednPrjEE6PLApsm
	A6laH/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYn1-0000000AmeS-1yyv;
	Thu, 12 Nov 2026 17:40:47 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYmT-0000000AmYh-2b1Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:40:16 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-53669f7b518so45697621cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794505211; x=1795110011; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
        b=lg36jqBcnYhhJbEuUesXDYkaheUpfg6MmXKqge2gTn4XnJfGDoFmHRY7m7Y6r3L6VC
         YRMlNly1mxJuuOn9pqgtdxNpoOJWH7Js0pa7EXeeMeVJS56Ku/JB7o5KS/OzN2e9czeQ
         /6iJyJxZI4aRjoNGWoFIND2oJuhO3I+VwyxgrYDBQpcKzq0wk6Iyvn6MILSjuriaq9gM
         ITnKHWbENx8QSZy/Qr5KUDyqZfmDr4wpzWpqBKs8d3v5Sz8X6FGZ264ym3t2FCFmZ5+7
         N3v1TKt/clxj4yonNXgzqd+Fu+EjulkuySRLHzhsbHdcK++MUfsaYUw9XTJIpxjFTHyY
         OEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505211; x=1795110011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
        b=JjVGd0iDFDbaZ2V5sf393SkiELWJW7AWBW/CTflCms/nfLLXLi5wIQT1WJQkpFvSeu
         Y1am5ifyghZGO0ZuXsoLOLsT1/S0Lgleqk04J2c2DnVT76umEwXJncPEg12qZjC/bYIL
         JLOaheIC6H1iK2XG6STWzRx+EpyQfANJ3aiAYaJGWznuy5uBGnBiIjK+9ltfZ5pILxjJ
         CZ0o3JF3+H+FXztNiKhxATGdrVK+Gv346YqGoCAPcATZqVfzonsWurqI4gRoKVHSZxu0
         JGZ6mBcBINU9ltAfoKS4mWKEOBiIWdaPC2UywNnA/sXv1Rj0Xw4X2icM2USRjel0TwLc
         qBYg==
X-Forwarded-Encrypted: i=1; AL+hErHmmxdAzKtWRKRNjP0GB/Ds+lbrt9VoOL6lynKC9LZ70IXSG5/7mitJ3F+Wo/HK4Blv8eFpYS0Rr4MOAhJG4NI5@lists.infradead.org
X-Gm-Message-State: APuU4Z89M3hwvivqAKpi2XNATmKQID5O7dS1nL6/ZiAeg+oZja737V+f
	AMcHLhAku0I4FGVEXSOv+0DTT63EUcXLUOcIOG+TrBo786PVbt/YSR2UfOm07lTcpnE=
X-Gm-Gg: AYBFou2+4elQW6DJm9zZzlMpod9m6bwwARuSaGUmxMMK3VhqfHxEQIe2leezBU/CpGb
	ZgkIJGh7EsqQppeKFbwEbvR24sZLsB4v8Enw4rivEH/SAd+cwFkxvGdqtbu1eiRufL6JJV0Yze/
	BLB4rcnJYziddooiI4x9IMn6zP7hNvJCMJ3hpxCcuruBzYBjQs2YaSn7+EuwTfCvG3XkTY0oQbj
	8yG6qjUY668qq2FB5OaV4pU4JhA4fa1I6NC4w2VpaPWitHoU5xuatrLmWZ/7GrEQUYWhgjG/8J7
	E6Jpj3qBXn8PT0OpaDf0Kcq1QLo1dE6+6C35KNZ8cKbW/10EvavqLKvBkQvZcMWOXKwRDNGhXvs
	b9YkWV8Py0lY1I2GY5Raxli38jsFMr12McRoTt5xy3hZ8QFW1eqqpBIqfjuYF46nxhYGJfUpq8c
	CD2z6Hb/D6P88hQOApICngUZWdi0VcllCgN68MKdhesqYOE3sHTheYxv/QwQGqlX/VTJCVH34BJ
	nadj0PTlZ2bGwMRnM74l/nd2E9hvi+e2wzaHPd0pUiuzQze95oy0flzO6kEC4nkCExPA3sQRun0
	hxUCtw==
X-Received: by 2002:ac8:5fcb:0:b0:533:8e6b:260e with SMTP id d75a77b69052e-55ac78597d2mr1668441cf.31.1794505210728;
        Thu, 12 Nov 2026 09:40:10 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm890336d6.21.2026.11.12.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:40:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xRYmP-0000000FjX1-1XQV;
	Thu, 12 Nov 2026 13:40:09 -0400
Date: Thu, 12 Nov 2026 13:40:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v8 06/15] iommufd/device: Hold a KVM file reference for
 the device lifetime
Message-ID: <20261112174009.GB2532299@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-7-aneesh.kumar@kernel.org>
 <CO1PR11MB4835982DE81AFE060EEE01B88C762@CO1PR11MB4835.namprd11.prod.outlook.com>
 <97053bb6-c221-4ae0-972c-603b194ec25a@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97053bb6-c221-4ae0-972c-603b194ec25a@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_094013_839653_458534AF 
X-CRM114-Status: GOOD (  19.70  )
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

On Thu, Nov 12, 2026 at 11:25:46PM +1100, Alexey Kardashevskiy wrote:
> > > Once the remaining KVM file references are released, a later ioctl on
> > > the still-open iommufd can access the stale pointer:
> > > 
> > >    iommufd_fops_ioctl()
> > >      iommufd_viommu_alloc_ioctl()
> > >        iommufd_get_device()         /* finds the surviving device ID */
> > >        get_file(idev->kvm_file)     /* accesses the freed KVM file */
> > > 
> > > Take a KVM file reference when binding the device and release it when
> > > the iommufd_device is actually destroyed. Release it before the igroup
> > > check in the destructor so that bind failure cleanup is covered too.
> > > Document the ownership in the bind API and device structure.
> > 
> > I don't think this needs to be fixed. There is already a WARN_ON()
> > in iommufd_object_destroy_user() and many bad things could
> > happen afterwards...

Yeah, it shouldn't be fixed like this.

Either we need to rethink that warn_on path for some way to actually
wait forever or we leave it.

AFAIK nothing here is going to make that warn on trigger.

> > If we really think an ioctl could take more than 60s in sane scenarios,
> 
> It is quite possible when some TSM operation involves (in)validation
> of hundreds GBs of MMIO.

That won't be under these locks though.

Jason

