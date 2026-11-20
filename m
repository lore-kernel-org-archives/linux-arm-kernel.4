Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C960A2616
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HA93Z02j;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hvU9SGoe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=; b=HA93Z02jp6q8LT3t4C6pqXrLDA
	5cB+9W1EGGd6Bk7n+flkdTFhlwY8xL8Nwqr8tpJyqFSgynQ4H9kO6h9iEr11efM17TnC1RszRR0OA
	a6bYMRNBjJbF2fhzD+WuvohQFU/QvdTSR1riZxGTxXxFr69PJeMPQcdxNbbjG06pmkmtHIUur3uJU
	VcUnF9eXC78XZlqITHJ0aQFndGNCXSbDgv5vOWDc0ijAdLAz1+Hlk+AN4ezRUpm/+Kx4qmL8ZMxc1
	QPeWq3GPIkB7hX8mEg0GeBYF5tqt5UjExMZgGjwT66mTe68+GW45GN/gq7iFHG3SJqZwCCHQ3f8GC
	L8zbgaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTRv-0000000FxIq-0tza;
	Fri, 20 Nov 2026 18:35:03 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTRs-0000000FxHn-0eIB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:35:02 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-91c1f548f87so17266816d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 10:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795199699; x=1795804499; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=;
        b=hvU9SGoeIashWVW7NbdqKyzHlBUXNz8rFVceaYhew6j46mMGsTnCGb57QJL4b5rzh1
         kboNGOLYkvyclvqkFkYKQg2JNwBVcfW0PJUtdCoh4yygNQSn918iQcvSVg0m+4slZoiF
         bFQ0bh1GTSbhBgJlbRBBBio2ePd1GxsbNN4Xz44/fTin0o5SfPU61OXSjtOcLjxdRASi
         PyWvRwoo0yEi3aNUnc+209/5GqvE28NZHTUteW1z3I19ejnDP1Q/EtMxnIAnRIwtt0XM
         WyyE9dSts3LL62uWX/RD1kyuiBC7HKm5ZDDuuKSApjaLyEoaA5qIxQSiGkCZ/GwVE9zK
         cR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199699; x=1795804499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=;
        b=obPu/ueYq7CdlTd2rrMMvPasJqyn2/tGtSIbM0Ed88UReEFnyhsyKSWm8sVdSC2r2c
         wsysAOcX+ukAlxvCTQy3i/y9fqKHwSqIw7pcc8qYgkVLRZ7elwi+lhWe6DFliCNDX9cK
         D04A56+UaLtliC13rghf7N6fvlxdkTKJpvbIm97D87jg0Kg0nwMGQw7U4IGZa6K6/B3w
         cPAlKQwlLOzNUXF+Q4G9M2WqLxcMa/dtk96dEqQiHXK8iFM51DsCky4ooEft8fcHTk7R
         e3leodAA78V9gThHz7EUpm+l3knItpkW/Y/EpeTvizqwSUH3W8az5fiOsRXoY6mJkLhO
         dzqA==
X-Forwarded-Encrypted: i=1; AL+hErGu8iJ+SfWacEdaCSYSmm1NmocRNwX9H8+jnTGxFHQGVpKBCFMHoe8dGNp0Yn9iuUNSbd2mMnhKgyNx9qO7hOfo@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZwHVzdWLUp5UGswDmn12un9mwn/w/1HcIa/eAj6n66NPrjHnr
	BvLPMDJR3p9y+3YS6uaKM2hD17doPbrAva5artaoVtrnykYc2rZqzYS5i+Ect8S1KsU=
X-Gm-Gg: AZFdTZedtD5LxiXfLlW4oH2PTVxVcRh0YjBrCEqn5I6cRiagmxJYBF56PExPOAoawJ2
	YdDl+AARanJ+1hxXAXZYCsUX2iHpik4e/OSXN7rLVR1IU29S/GVC3zXlebpTvk5imOwb0JsmtAM
	vinv6TYZQ39TNbV9yzIImy5AHhZVtuVRCbrTw9AeI/mVzByW+whTTYN1Ov1Id9yo3bel/GQMity
	fa+aRp1JkIhN2vsPjRgmFa+1yiWk8t57ItSiuvSJUMgkDkwr4rRekyxOT8CcmMWzF2U7L2TT7an
	5ydxXLIO64bW+VwiWkxOt2XMrOq2HXjnMmW6lll6uDNsxF54iOmxMR5Se9pt5u+6FfpxtRNglvS
	68Zwsb5ReDgZXhvbS4vsXc8BWxTvua1ezkvwpdJC3Kj85/Ku4Eq1Lcc9ceJQG20UtsPsJB9OwqP
	SMupGqMfyluWsGginNbESRB300w1N8H9G4EHA9iSE8FLI7y2GRFBgJiIl4XjZhAlRCBUx0joUJB
	TojqtstCclVEifOHCo3b4b5tgDvED8xuUSGMi94Gx8jzZ03fmID3sqnQqd0DMz32fnTJhEZfPSr
	qkjg5w==
X-Received: by 2002:a05:6214:4881:b0:921:152a:4e48 with SMTP id 6a1803df08f44-92134b1abb5mr65747176d6.32.1795199698766;
        Fri, 20 Nov 2026 10:34:58 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm32821016d6.39.2026.11.20.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:34:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUTRp-00000004jZ9-0OT6;
	Fri, 20 Nov 2026 14:34:57 -0400
Date: Fri, 20 Nov 2026 14:34:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
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
	Ashish Kalra <ashish.kalra@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, iommu@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v9 09/13] iommufd/viommu: Select vIOMMU operations before
 allocation
Message-ID: <20261120183457.GQ3115493@ziepe.ca>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-10-aneesh.kumar@kernel.org>
 <20261120094207.00002e89@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120094207.00002e89@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_103501_489832_D172EF6E 
X-CRM114-Status: GOOD (  11.44  )
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

On Fri, Nov 20, 2026 at 09:42:07AM -0800, Jacob Pan wrote:
> > Temporarily disable AMD vIOMMU allocation by returning NULL from
> > amd_iommufd_get_viommu_ops() while the vIOMMU interfaces are being
> > updated.
> > 
> why? if this merged, it would break AMD driver vIOMMU functionality.
> And not temporary as I didn't see enabling in this set.

It is broken already, it is missing some series to finish it. It was a
mistake to leave it on like this.

Jason

