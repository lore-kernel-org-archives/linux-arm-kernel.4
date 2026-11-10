Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E9D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Km4Rxyff;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LUmreOlk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R9ybw6cxS0shDJ4UVVgiEKCnqeSU4VPhRG8DzGKzjow=; b=Km4Rxyff33RRhizuO2nzvHgl50
	h5w6JmIVXYKULAvL7iUEoe6KtL6ndkljcsfyZmw5gO0UGt18K9yDlX2t9ZsTxQTKdYjzeVfSQAl0K
	KlO+iiLH+EFshw8hIadCYCnnAHo0NE1X0Jhd1gIn86fZO+UH6XdYDgspsx6Wj4lblgqW1gFA7+hju
	znGL0/Ew94f5NdmoStah0PhUBNTEOo8rQjhCHxw62E4OGQP0Rx0UnhU7BAu9jpMdUIg4ssVTxdsYw
	EiQT3z99JQaKyOU2UYKyBGZQc5sMzvMO7RfYd2puJRePeS2Z970GgK54KnXlVMFYIaAr3tg5B3DKR
	zYNg1KJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjIJ-00000003UJk-3qry;
	Tue, 10 Nov 2026 10:41:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjIH-00000003UIP-3LCP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:41:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so27485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794307296; x=1794912096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R9ybw6cxS0shDJ4UVVgiEKCnqeSU4VPhRG8DzGKzjow=;
        b=LUmreOlkh7JwWffx/v3oKtQeoWbTn9nCv17JKPLoRMM1KUiBwwsooc0Gm8AQ4Dbxc8
         zBEDFxU9dL4ICTkYRvDqmTotcOZoeNjR3/i9GrHiSCSevxdRQsCCO+JW/+0fYYynPLUs
         zi+MIfeca5sBHkaMiiG1FgTaa5ylBB0r9Q9uOpUHbidgR/SktEO5oLWlk0r+x+p32oPA
         QBomaL6StDj+NZm1l3nKv9pKaD7HTLnGCd3QnVz3blYz9cs2PYXGweCr0nRGPSAxUnTf
         CUsUHuMB4+Q6JGozH/gA4UOiOW0Q5BNZtTikr+83yLGSyi55WDp2wVgLyCtHNarxzoDC
         KSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307296; x=1794912096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9ybw6cxS0shDJ4UVVgiEKCnqeSU4VPhRG8DzGKzjow=;
        b=VaAHIn4klcZiD1eG6NP9Kkd0bGZgurgF+GnH3otAiZRYePzzMM8T8CdkeZeVscEQ2/
         aJfDuMPJ+35HHmXedotu5heXv4oVW8TmXY0nuc8/LDlyZeMZj3bzdKkyFk+64vwW/qvq
         72pgl7kWYCJ/QQYw/QxCjHK/ckrfotwj+0Nvx7BkMnJT91WFW0VgQMTtoC20PlcSmLmb
         9k430G/Dms5rIZGsXNU3AZYeYfG+fufuLfIk5qcJUFUBacYDUZi/ikaapgZpGJHY/Ie0
         9rn+4Rsa8I0jsnUi729+JBXcppSDG2Smh0IQGVfemRlFUws8GWpvpEdzGhummb0kH1IK
         StPA==
X-Gm-Message-State: APuU4Z8JF/IcQae/8mOFSO+UyPlZvRL5jT0aLahqL06MQT40raJtNws5
	PtBlAz3fRIlIvv7uH+ghRM100Jx2vXjyxZS6krtZ8sccnCYTnX7P6CSn8bzSCdP0Zg==
X-Gm-Gg: AYBFou2jkwoVZU6SmpZeEvy6HdeyrF/qDIK6HqvaSlxb4so5ArQJeCfhtAzdkdH5D0d
	r8wVGse9jacfod7plKEFQgU+KkDkgFR9QgH767ZXfYafCIZnkKqQjLMzrTwVjJktBNy2PDdBaE8
	ziydtlm6khSoXjhvr2QWVfxFZfx7p1ygGoLEY180xfMzoxZADWBUpeH+WRSTtDhgFoW86v2wN/r
	0hHtCxLflCj30yrGUxGIpCWs1JsWN8eh7m3GBcNHArIN2ZD/ovQh/MFQsNWqWIYCjK6I2W78kDF
	PACnE8TddY1ryEH/hPI19HyTzRnRr27vU2lTxZ/XeFngRDVq1r2SXjh6zFOu17jL4N6EO1YuDxo
	u50ObbPiZb6ezipY9IPs6YwhjdcGIXXdeAW0pOwheL/Z0xIK8zgCJYxCNSqvQwSgD+/vC13L9B2
	Mn0kH7zfCbHX0nAvE7vkVjAI0rIb2f04C3g1Jyh6etrEM/RQ8gBkZe4HK1w6c31/0pp2kOBiiJq
	xKS+KYOJjlAaieYliaQaPaR21XvEd9AUk55wuXN3Pc1VkPoA9KDrAx0kS/GHFbRqW4XFpqNTxYY
	x8JF3qOLEcGFD9wPe6JcpBS3AfNrhQ+Po/UbcjQpto1/spTZ6hO5sZYXhtbM0/5tmSRDyok=
X-Received: by 2002:a05:600d:640f:20b0:4a1:e368:cbf7 with SMTP id 5b1f17b1804b1-4ba022dacbemr640635e9.0.1794307295364;
        Tue, 10 Nov 2026 02:41:35 -0800 (PST)
Received: from google.com (160.193.189.35.bc.googleusercontent.com. [35.189.193.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe63e6sm87694655e9.7.2026.11.10.02.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:41:34 -0800 (PST)
Date: Tue, 10 Nov 2026 10:41:27 +0000
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
Message-ID: <avL016l_xASN5paR@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
 <avGk0ilyJh3obmKx@google.com>
 <avJidXM9yQOX4VBJ@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avJidXM9yQOX4VBJ@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_024137_887558_BA252609 
X-CRM114-Status: GOOD (  29.86  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 04:16:53PM -0800, Nicolin Chen wrote:
> On Mon, Nov 09, 2026 at 10:47:46AM +0000, Mostafa Saleh wrote:
> > On Thu, Nov 05, 2026 at 01:06:18PM -0800, Nicolin Chen wrote:
> > > On Thu, Oct 15, 2026 at 08:08:42PM +0000, Mostafa Saleh wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > > > +/*
> > > > + * Two devices are involved: the aux device bound to this driver, and the
> > > > + * physical platform device bound to the pKVM init driver, which only uses it
> > > > + * for discovery. This driver keeps using the platform device, as it carries
> > > > + * the fwnode the IOMMU core and consumers link to, the DMA configuration and
> > > > + * the IRQs.
> > > 
> > > It would be nicer to have a diagram or so to show the co-relationship
> > > among different devices and drivers.
> > > 
> > > I assume the regular arm-smmu-v3 driver is a part of the picture too,
> > > when the pkvm driver binding fails?
> > > 
> > 
> > I can add some ASCII diagram.
> > If pKVM driver fails, no aux devices are created and the main driver
> > probes the platform SMMUv3 devices as usual.
> 
> I didn't check closely, but would it be safe to do so?
> 
> Is pkvm aware of the missing SMMU device and handling it properly?
> 
> When pkvm is enabled and the SMMU device is supposed to be a pkvm
> device, should it not fall back to the main driver?

If pKVM fails to init for any reason (unsupported layout or non-coherent
HW) the SMMU will be bound to the main driver so the system remains
functional.

However, pKVM will not be safe in that case regarding DMA isolation
as the status quo.
In Android, in that case, pKVM clears the FW (called pvmfw) that loads
the protected VM and authenticate it so any protected VM knows the
system is not trusted. This part is not upstream yet. [1]

However, there is not much that pKVM can do and I think it is better to
keep the system functional in that case than causing a panic or failing
KVM init for example.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/virt/kvm/arm/pkvm.rst#n106
Thanks,
Mostafa

> 
> Nicolin

