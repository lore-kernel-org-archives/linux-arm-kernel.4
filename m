Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40EB606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dkjAv0bg;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AhuDOnY3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d8vRIIYl392fLQltvVGdYCiU5psYi3L4CF/tseUFWuI=; b=dkjAv0bgrEZ5/VdlWXM03wNZQb
	NXn6JHa3RKwpervzg+iIEfF8eKV/gQ2v38AskGWXmnaxQQoBLNJ8+uiuBo27+GoZHHa4OPy1zC1p/
	e4zCBEEqf7EUJrj3qoyFLfwyktOIsLwCklUo7uWvH2LboZ1rbPKf52G2QcTIOs2c2TBQ2orQ0/6PS
	eVumMrxk5Ss421AMo/3hwm9yxpCbowjKI0/X1fUo6MH7wcnMXy9Mdemp04Aw0X3XJvvE00y8LJ8th
	/o9TFyl35T4mbm7wovG9jXm4zd1YqD4q9RjpgR5kCUVga2FIpSvaJGPhrimTA6aV5SjP5JoK4CXJW
	kehn2r/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNCc-00000000UKl-2HdR;
	Mon, 09 Nov 2026 11:06:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNCa-00000000UJv-2yaq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:06:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so22885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794222375; x=1794827175; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d8vRIIYl392fLQltvVGdYCiU5psYi3L4CF/tseUFWuI=;
        b=AhuDOnY3IQXiUEgLViD4XuE0H9VvVZQvbBhMcr7yq4rfkU7FmUfJ2Z4ETGvH9pwAHA
         AbtDz6CmhPyW3LwD/woOa5jwFM8zhCq76a4DVdVeN01WmaJJpqJjKxaELsuJ5sCg4gzR
         emeqKRgaq9/bi8cZlYgkQUlBnx1Cy5L2aJPuNEGrDcVB/Lk11h1TR1QARN0Ajr3b7seQ
         dme5UjxR3PjDZ20K6zu/GsbtVPSHR56jxPmfsGK94QAgdDQyLoV/P7jtgN6vPxXYhEXO
         /EYBfzks2XPNHeDBSXoSXzxolY3AXpUgFzx/uxkCWowGdGBsRkooWeyqp2fOFuEdgFg9
         b+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222375; x=1794827175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8vRIIYl392fLQltvVGdYCiU5psYi3L4CF/tseUFWuI=;
        b=Sz+Eyp2hYroR8GzrGRen4LDaxXLgOb1xtufKtJI5PUqPFepto8FJuBcTAjPuJ/EZaf
         m0Kb/p3Kw0PnppD941aO2PehsmPH8572s7LOq/d7j7JNegLgEUIDrBBQ+pzuuKrnOpxE
         LC1PahJ+f1vaf3e/DQj3PzgzlokRat8vv7df6aLCbev+WRBKlpG8ylO1CrZUUc273wNi
         ViPLFHBwjGpKACmhJnTg4pMUW9DvazHMXg6deChRjAJ6XxFDjvcfD2TQdoCCBgYE1Clm
         YGtXuJseQijhKaSb8mAG51jXhmbsi4vxvBFvn8m+Yj2Mkw3VXzr9KuHhsGClpj2EqzSb
         jsIA==
X-Gm-Message-State: APuU4Z94JScEQgoamIaieghjSrkfSX84sDuqgPrfk3tLFotDVtElX6hY
	j8sRsynEOQzkRbpaB8qx5nNizgTSOSfoITclwMnYopd96q1TowwmZ6vq3sXWtfmcsg==
X-Gm-Gg: AYBFou2Oh5R8XhFAXZhUijNQwKjlsqhQZgAG47TOl/m7rb89wwEKLtv+EpNVELHX+xa
	Ic5Y2sG7p2zRNBJVwvkaNWFziL33ME0xoCXKjWG/qqnuJn08nrdneE/asWPts2xdX4uP8FOsWOW
	dv8lLcQbK+77oO06TlhX5zK5L735iEcz5l7yXnZJqNTH7Sx3g+QSaQ7dvLkymSxxcIe+g+TALFu
	LjgbdZ09YxUbBZkQbP0nMRlKOnl6tyX6iqO/UYeLstyo9BKqzNOXjuuDMZQrSFreLG24aqSDbvW
	12jaHyxkNrBu+qvYstzSi0LxCLScMh0relUEElHVRe45x2RRDHYFvGgQ30sWseYb6NWDhTLhB8L
	kf39yM0Kit7t5aaS7QrQwM7DqRIn4kNMcg5x0KHbTtcCVqu7D+1Gzz/q8SlxRj16sgJnIiteEPl
	J2TjFq9fMO3GKyBfY034h+pb1HsTW4NPGsKJECRzbWwMBCZbEjmeTCqu351pVpUNME3LQufcBzb
	V2IrSobkUd3Ty4Vh5G92cFhXcnF6gnC0HoxZ7GnejByOxV7Qk/2xlDR5Aq39tyOdG7lA3SddZcz
	lgsuXfVAH+81yMQ2YyquDI4VWkwfD42LMOks9SzycUbXE2//C4m76ocnxEbXOnSWi8xjyA==
X-Received: by 2002:a05:600d:640f:10b0:4a2:1912:6687 with SMTP id 5b1f17b1804b1-4b8aec1d290mr1382195e9.2.1794222374432;
        Mon, 09 Nov 2026 03:06:14 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496c89d8630sm4422045f8f.15.2026.11.09.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:06:13 -0800 (PST)
Date: Mon, 9 Nov 2026 11:06:09 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 13/25] iommu/arm-smmu-v3-kvm: Add MMIO emulation
Message-ID: <avGpIXoiLzncL29t@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-14-smostafa@google.com>
 <au4w8nvPQ3xv7igC@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au4w8nvPQ3xv7igC@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_030616_762217_E9A50824 
X-CRM114-Status: GOOD (  15.37  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:56:34AM -0800, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 08:08:44PM +0000, Mostafa Saleh wrote:
> > +static bool smmu_dabt_handler(struct user_pt_regs *regs, u64 esr, u64 addr)
> > +{
> > +	struct hyp_arm_smmu_v3_device *smmu;
> > +	bool ret;
> > +
> > +	for_each_smmu(smmu) {
> > +		if (addr < smmu->mmio_addr || addr >= smmu->mmio_addr + smmu->mmio_size)
> > +			continue;
> > +		hyp_spin_lock(&smmu->lock);
> > +		ret = smmu_dabt_device(smmu, regs, esr, addr - smmu->mmio_addr);
> 
> Going through the followup patches, I found this smmu_dabt_device
> gets really too big. Perhaps it can be bisect to read and write at
> least? Something like:
> 
> static bool smmu_mmio_handler(smmu, regs, esr, off)
> {
>         /* decode ESR: len, rd, xzr; width check */
>         if (is_write)
>                 return smmu_mmio_write_handler(smmu, off, len, val);
>         val = smmu_mmio_read_handler(smmu, off, len);
>         if (!is_xzr)
>                 regs->regs[rd] = val;
>         return true;
> }

Yes, I was wondering about the size of the dabt handler also.
I will try this, but that will propably won't cut the size in half.

Thanks,
Mostafa

> 
> Nicolin

