Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49865606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5ETIT3IH;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pcX00UKp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Wzi6KrhT88vehfKY7qgpQ1+JN6+5jlpjxZmv28MWhTQ=; b=5ETIT3IHQiz/cfunYWwyyTUaWm
	cS8OzjPMOfjXs/yE3fxw7I+Yeq0QXDc2pw6zqKNoYWEyHjquBFhEnettrVDMK2bQwnZs7Lp1yxli7
	OqnFxQkPE0a9GtlQlATXg5QMxIcYMtXCK+aug066SYeuuHyyRHP8XWdmZsZXYMIsOwPSL8wZ+yi9h
	a3SNn7f7ynBrPerT9YGcpH6jm22KQhTQmuCF2SSuHWnhJNasRDxggClJdJelQ/l3JkvhSFLqk8TPr
	R422l/O3G18KjUnuuZrmo3SVW6ZoyV7xPVZvOWJGY94S6dzSr2E6bmfwS6oqrMudkk/H/WimvJg51
	dXTdl40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMus-00000000SQz-1ln5;
	Mon, 09 Nov 2026 10:47:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMup-00000000SQB-48j8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:47:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so21975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794221273; x=1794826073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wzi6KrhT88vehfKY7qgpQ1+JN6+5jlpjxZmv28MWhTQ=;
        b=pcX00UKp5jBbLP1KLDIn4X495hx4VsSatIEEHt4LmLDAFf7mrIEqF1FWdl0roAMa7m
         NBa5o5gi2wVHz/HGQnokFhnWxo50WtJ2Yd7+44EjFC9RfLH2H1sPrFnWSetzHyeSX/VJ
         RtN+igi0d+qAXEJstN/dpUy7cgWRQYncFTc+zKV9CCTapXDuyhjv7sAlBhDQXgxmNKaW
         BWWkeVLIbi/dwlhQ5in0WjcpQAjZDtKnAYiY40cpVg8c573yffQXHVMm5S4Se37ylq8b
         GXYQciyIlONbq6GaaCwQBdRTmHovY4zqDuoe+mpDF8BjE+dPACxQKJ8UkFHfkd8EdXQp
         ljWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221273; x=1794826073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wzi6KrhT88vehfKY7qgpQ1+JN6+5jlpjxZmv28MWhTQ=;
        b=h3QFVdIAMbnOqK4iOlaDLWIV/ArCvkzOTEDX8rRgJ9rGc7ueMBmRc/ZG1vBOSHySRV
         X6EzdYSyxoyZWF1wWCTMEOsfqbe0hfpUuqQ5kfFI6tnkVBovfFfilS9M2ILWKsRsD7ea
         YfaqcxHfkTmADf5Fw68dnJKfAN7m0+K+Z9j4V4LasOnC9v9nXJ8tBKpi7Qiw7tnEDT0o
         w+IFOMOTwcSc4ROjR16c4YZR105T0ohznb7/DbLhPQDB7ZsSac+qwxOZke7zW0NefvmL
         5y52OCC3tu/T3qf02cav1I9/027vYgAM1LGLTjVaDLc3XPSAuQj7P/7zKpWWOjG+bAtN
         SZ8g==
X-Gm-Message-State: APuU4Z+X9qggpj0FniGvCa84cGYFS0MJqqKb0rErA3K8gaBM6KpQnKTM
	3k0aI6Fb2rC6ZFJXH5TB9ZwtPrQyiL55WvoLDXbFTrwAN8ErdTFZ6SbvCPIMGV/gCA==
X-Gm-Gg: AYBFou3NGjuQS6GxbzjvTGUF23Y8I/hSQ8kx9zrddU71zgKuDTHR/cCMZcxmpUfBtuL
	tzXaGT/4vvBYbiD5chO7Izxma0sBAIsMugt/tfNM6f/NFGVsE7/B5YEmzWNeWkwcL7L879cY3c4
	aHi69i08/fktDlP+/U2aNDDRCVOjEjbfukH2gDIGHh3yBXCPMnmMboh8ysWc1+rqqCCh5p0ea7T
	yQmPBaap5sSMhkyLw2YQqieK8dkW6ZPVxai3EHPnZLypcSaYXZN9ZUTQT5q1r9LzuaMb0nqg/y2
	tdmEctTYBkqCvhzu+LN+YswUgq7V67GgrntZLZpZaBvhWkxQDdw/Ws99LXy1nKWX+X5tbg+el5D
	pXYvQ7aE8pGJ1sSUQM4VGMfqiw8NUczl8/3KhLSdgVeLiw2iBp7OI8i3oAeJGR9tCh1reQZsqfM
	MExUj3BDlRoWmQ18rW4QSH81UC0rX4kp9i9kMBHdhvB4MHEkKVXcZ+sttTBpLfB6E0C3enmNtBz
	XKqBknSLIZKryAAVQCRCZCe1hvmXwARKSay1w5QBdvstWQAF0xQhmr7ihvi64pzkYRg24fWirnC
	sbQnazORD9k/Hhos0hTMUrSW4NDMUXcIncDf9nxbXo33toqr2XcgXxvBzeiDbpO0oc4F6g==
X-Received: by 2002:a05:600c:2d91:b0:4a1:d373:5759 with SMTP id 5b1f17b1804b1-4b8b04d3e52mr1256155e9.8.1794221272587;
        Mon, 09 Nov 2026 02:47:52 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm149512245e9.13.2026.11.09.02.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:47:51 -0800 (PST)
Date: Mon, 9 Nov 2026 10:47:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <avGk0ilyJh3obmKx@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzvygiGRTWgJXzF@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_024756_077695_B9363454 
X-CRM114-Status: GOOD (  25.38  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 01:06:18PM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:42PM +0000, Mostafa Saleh wrote:
> > +static struct platform_driver smmuv3_nesting_driver;
> > +static int __init smmuv3_nesting_probe(struct platform_device *pdev)
> 
> Could it use a different naming than "nesting"?
> 
> "Nesting" is widely used in iommufd path for nested translation.
> 
> Here, it could be smmuv3_pkvm_driver?

Sure, pkvm/hyp works.

> 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > +/*
> > + * Two devices are involved: the aux device bound to this driver, and the
> > + * physical platform device bound to the pKVM init driver, which only uses it
> > + * for discovery. This driver keeps using the platform device, as it carries
> > + * the fwnode the IOMMU core and consumers link to, the DMA configuration and
> > + * the IRQs.
> 
> It would be nicer to have a diagram or so to show the co-relationship
> among different devices and drivers.
> 
> I assume the regular arm-smmu-v3 driver is a part of the picture too,
> when the pkvm driver binding fails?
> 

I can add some ASCII diagram.
If pKVM driver fails, no aux devices are created and the main driver
probes the platform SMMUv3 devices as usual.

> > +static struct auxiliary_driver arm_smmu_driver_emu = {
> > +	.driver = {
> > +		.suppress_bind_attrs = true,
> > +	},
> > +	.name = "arm-smmu-v3-emu",
> > +	.id_table = arm_smmu_aux_table,
> > +	.probe = arm_smmu_device_probe_emu,
> > +	.remove = arm_smmu_device_remove_emu,
> > +	.shutdown = arm_smmu_device_shutdown_emu,
> > +};
> > +
> > +module_auxiliary_driver(arm_smmu_driver_emu);
> > +#endif
> 
> Nit:
> #endif /* CONFIG_ARM_SMMU_V3_PKVM */

Will fix it.

Thanks,
Mostafa

> 
> Nicolin

