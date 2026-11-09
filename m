Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70238606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cniVg7as;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lLmYcA0H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=udQqDn88X0b3LP4L0/q7EU+GGttEjcPesqMGbO00iBE=; b=cniVg7asMq+M79oe8zOqmh1kes
	ga2vdwWHXZ5SHUHqA4JW1S8RA0pD27ddE3bMj0XBT6WeuMZWBU/U7BI6d4rB15m7OzGr/yqRSx6GM
	k1lMi4Tf9il7qwxITVx0rYIC/paHUITn8on7kiyzKCPRa2LsxTIxlRiJf1jD6DND7Xvzp46skwa5o
	ehaYORnvhqX8QtrPEqb9Zk4oFYsLO8/UHu4CATx1QV1WaoPztyZOmdFwts5nEWxZOjoZLNODWl7dU
	rhR6lEXHcQOAXpmkSr0BKwEFTGZwfrke1XxhHxjX2utFWYBimwz1HtfaEmMrDvK1Ax1E9uVN18G9D
	CBXk0aUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNgU-00000000XcJ-1L0q;
	Mon, 09 Nov 2026 11:37:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNgR-00000000Xba-3k1S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:37:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so24745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794224226; x=1794829026; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udQqDn88X0b3LP4L0/q7EU+GGttEjcPesqMGbO00iBE=;
        b=lLmYcA0Hc4xYmIJR4LCVRZjDQUjhhdk/a6VfCt4dFaOKjvr31AyyK1unNS4Qjv1fKd
         nUfFQtaiW5zIOsh0pk5jAl3xo7v2de08wV+rVglfuT1ZeasHBCXA0GwZLVcPeC8Vz0m2
         e9Bp8A1189n264A8zCBuYG/zExc+rbKmGkngC6sSV9bpDZBU+Ad6GI7hZYY8HmiPl7kZ
         z4dMYrxfdtWhcA3w2O4TlyEHaXLhdy5U6ty6sJfWDbzJBQ9mEV2hqPwSmtDuySUy//YF
         gTsLKO+k+P8sBf66VqeiWX9SOQFH4HVNJPSU5INWefg9jf1dShMnNPQnrQsW09yjNeR1
         u72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224226; x=1794829026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udQqDn88X0b3LP4L0/q7EU+GGttEjcPesqMGbO00iBE=;
        b=sg2nW91zuybeHYR+Ht6UE8FjnXQN26jfdxhaWHhN1MD+W+fR+udJG+jvzp84JYneeN
         IN0bYHSIkcCsvGJVVh3Xo6i49aLlHrOqsD/92DUznt2c146dOPQfi0ONwelMPJztdDt+
         cRaWGir3zruVgPRn9I90iDSviF9h3hBSS2xZnpTXUQFgbP8maoNjCbh9gJO+D3tE+qH5
         ONOqvg6VtQeMXAFXDrwM+cM2u33wWZj8+eONx+gaJHYDhPuwZQ5cpkFB2IzAwO5YXlbd
         dqYHo5P86UnsHdCkoKG3nkBkQLx32fgKT11rUgYgAtbspeAD6I7V7bhaIrc/15Oz7V+S
         aCZg==
X-Gm-Message-State: APuU4Z+1MmbhJUDYzbyGPsJPLVqe5QM/EkE3JUREWxlevGR8FaBCFKzH
	IZP2MJCITh7jkU8U7kMJFAgWJDTFuyfd/HnyNF0kaInn/mNZ7myhUVmqUsJlQkFpNg==
X-Gm-Gg: AYBFou0+5ZupCjcMO+hxP7Qc6B7KdPwSbhvIP05ZDO7PtHtfu/Cf5oc+WFqWQIe3lpw
	TsXK2jmNpSOtUHV5gedvb6sjOSZ1zt9JtbEeVjlKempJ2Z91lAa9wkUeQ4aI89qEiMrCm/u+wEN
	QPfqCKzVnBfRfsEA+4mElJJN3XiTS3yrZwerbq3qeWgnV7jfUzfVIWzn0jsZUg3fvkaHfurhoXG
	wgWJDUddGl5nrtxh0+9I8tOeLqmpJxdrzZNcy5HNUpkh6tMRwD58ztuCS6zUVXauGFszqYVXvM9
	6W4d/joJe6X/w4goAd6+ZqIoNlRPGU66SWWP2qGvFkz+P8ucgqtdpzkPucPCoNpT1PJvPEeifzJ
	JK11Dx74X2att1MbnT8PBLCsmXYEuLkkLCnGPcjzz1nHqGj7d1LEW02OINkuMC0VZRxo1hqnUjL
	SH7e8etw+nFWOvGoy/T+/DEpLs1ilBypJTLFsoYdzhoKtvaweYmQ0PPwqVhimxByRmnVdXMJE7Y
	Ry0v76bU+3EGT24ORpgmgZojiOXPo8yg5bcJtP4RwWPsf0ZNXAE+GPXtIqhkLZJwQPjwF2sJ/du
	7uy1GvjAC8W16lXMVEKhtqpMxBg7VZ4Dh8/ei5P0hlHBntNryZy4G8DzVtEWPS2b2fvUZV6JLYV
	5aVbRbXnj90scbxM=
X-Received: by 2002:a05:600c:4c06:b0:4a1:eb02:37c with SMTP id 5b1f17b1804b1-4b82056727fmr1353855e9.6.1794224225622;
        Mon, 09 Nov 2026 03:37:05 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bbd2sm134824845e9.1.2026.11.09.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:37:04 -0800 (PST)
Date: Mon, 9 Nov 2026 11:37:00 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 14/25] iommu/arm-smmu-v3-kvm: Shadow the command queue
Message-ID: <avGwXHSlo3Zj6Fpz@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-15-smostafa@google.com>
 <au00hT6fsY10WJ9J@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au00hT6fsY10WJ9J@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_033707_942936_CFB6A959 
X-CRM114-Status: GOOD (  16.91  )
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

On Thu, Nov 05, 2026 at 05:59:33PM -0800, Nicolin Chen wrote:
> One more thing:
> 
> On Thu, Oct 15, 2026 at 08:08:45PM +0000, Mostafa Saleh wrote:
> > +/*
> > + * The kernel part of the driver allocates and zeroes the shadow cmdq. Take
> > + * ownership of it and program it into the hardware.
> > + */
> > +static int smmu_init_cmdq(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	size_t cmdq_nr_pages;
> > +	int ret;
> > +
> > +	smmu->cmdq.llq.max_n_shift = min(smmu->cmdq.llq.max_n_shift, smmu->cmdq_max_shift);
> 
> Given this is the cmdq used to run commands eventually..
> 
> > +static void smmu_emulate_cmdq_enable(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u32 shift = smmu->cmdq_host.q_base & Q_BASE_LOG2SIZE;
> > +
> > +	smmu->cmdq_host.llq.max_n_shift = min(shift, smmu->cmdq_max_shift);
> 
> .. should this be min(shift, smmu->cmdq.llq.max_n_shift)?
> 
> Otherwise, a buggy guest SW might setup a larger queue and number
> of commands?

Makes sense, as in patch#16, it caps the host view in the emulated IDR1:
			val = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
			val &= ~IDR1_CMDQS;
			val |= FIELD_PREP(IDR1_CMDQS, smmu->cmdq.llq.max_n_shift);
Thanks,
Mostafa

> 
> Nicolin

