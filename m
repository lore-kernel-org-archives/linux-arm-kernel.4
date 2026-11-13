Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2517606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fSp9auFv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REIrOkJz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Q0Kw6VKjPJ4bBmVqAq5ZaWu4zc0H8m2mSoY9o/wgk0=; b=fSp9auFvr0V5MVLMQxTfTXQCya
	tCfcXKQ0Yoekb5PMmPbspcp8qKzoQYDYl8ZEC5/CON8PTCTBorA/0Vos9yg3P+wZR9w5JME3NhGFF
	B/O2oAyv1jSWkuuXQL6rx1GXU5aFWPfGcd/Ey6G9Y8PXOtaz1HMyYuAzT/o2liq071Np0R7ElGIYz
	StYEzCiuuPUrn5D7fCse0lM60+Q6tt2ubsTsoO1nXaIW6SPbcBt2+r7GQcpumFeyCiwj6W7A/8Jtw
	uOwcHUuS86DltZjHJoSt+/u+gPnVxpO6Zf7MCel/iZT+hvz3Q4YZVvuyZjXj7TY57ozLqVu4HtDuE
	UsXzcWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkPG-0000000BkJv-1PlB;
	Fri, 13 Nov 2026 06:05:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkPF-0000000BkJh-1L4P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:05:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD5ED41807;
	Fri, 13 Nov 2026 06:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26F61F000C4;
	Fri, 13 Nov 2026 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549900;
	bh=2Q0Kw6VKjPJ4bBmVqAq5ZaWu4zc0H8m2mSoY9o/wgk0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=REIrOkJz2AHn01Jmb34bj98BYasFg8BqbFiumMW4g2v27buVo7lZVCCUbaiZW3RuM
	 +wxBJ3/gX4+BELRdWdNU/J6PCzSOCrnZ2IYYh1A2ba4YSznn84fKf9sjN+D9wF4QHM
	 SvSMtf7+mrJ13TBMzOObc8QfHQSTE5vcrsg2P1RmXkJF0g5vPmFE7R+/836jM3RdJi
	 TzgoEtGCv25Lk+l6gF0k+8wxuzvl7lHKBraB7e32jqTKlGJ4O5Q7j1CSPzLdUvrLN9
	 TNkSDm8aEPPw+MSqEDh6WgmRs0zAuMxpqzrInD6NnrBYPRGuHiYCIIX3C/vf+TCuxV
	 RFWMNY2pAu6Nw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Alexey Kardashevskiy <aik@amd.com>, iommu@lists.linux.dev
Cc: Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v8 03/15] virt: coco: tsm: Complete PCI registration
 before publishing the device
In-Reply-To: <9773f2fa-f80a-449c-9e9e-722d1c71f989@amd.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-4-aneesh.kumar@kernel.org>
 <9773f2fa-f80a-449c-9e9e-722d1c71f989@amd.com>
Date: Fri, 13 Nov 2026 11:34:48 +0530
Message-ID: <yq5ah5hlmflr.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Alexey Kardashevskiy <aik@amd.com> writes:

> On 5/11/26 03:16, Aneesh Kumar K.V (Arm) wrote:

 [ ... 97 lines skipped ... ] 

>
> Why do we do this only when pci_ops!=NULL? Also, why do we even allow
> pci_ops==NULL? [a minute later] ah 04/15 does just that. Make it first
> in the series so following patches get simpler?
>

Sure, I'll move it to the beginning of the series.

-aneesh

