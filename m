Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pfzoHkFs;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=msinmYKc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dF5MViTg8YOEEudif96/pwRP0E0s9rCachj6JTmLUVQ=; b=pfzoHkFs0T6LagwhrzEfOi0KfE
	C+ae1+PYf6D+FLMJ38n2Mdsduj1oNOAaQSGxJ9DKumYQl1xAHk1siVt5ADW8Z4vEsN+csdZcnVVDD
	a84KoEOHX5P7MrgBFwJOOBJB2eqioVpOH+TSLTP+7NZQBGug9z+tKYjBU81V5gDgLGdrr6feFaBav
	vF598xZA7QcmGUAKMToQKmKoc27k5SxB11RUo3BX8V7X36FGSMKyfwMwKAg4DR9qEtDRwTLjq5Ipq
	o+p7ROD6o3mCo1iSIxGXowVdfjs1J9mRC3rZ51R7WoHLGe9LPp5yPD4ErtFWvv35RMEqE/wLYxfFx
	sKlMnR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFV4-000000055Nw-2Cxi;
	Tue, 17 Nov 2026 09:29:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFV1-000000055NK-45BT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:29:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C4DE339;
	Tue, 17 Nov 2026 01:29:07 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2934E3F673;
	Tue, 17 Nov 2026 01:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794907750; bh=kYJCY4Q16lrxSHjHkE75I7AzcqNZxfjGXDBq1dW4/kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=msinmYKcP7h/+3CgM+h7kdrK5GrIERhYbL2MsSCCh1EfKnt2NPt+3ozymW9Fx2nYe
	 iv+ISEGOMpbrbvls5z4OD/fBZ9jT03+KQ7sDkm5g44QFKIvp3D85WWc0SnEgvw/yyd
	 2MoU69TEdUGgBjY+MbRsUB7Qo6QPuOg9X0UHLyXE=
Date: Tue, 17 Nov 2026 09:29:08 +0000
From: Leo Yan <leo.yan@arm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Al Grant <al.grant@arm.com>, "Johnny.Fan" <johnny.fan@cixtech.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/8] device property: Add firmware node IRQ affinity
 callbacks
Message-ID: <20261117092908.GU9176@e132581.arm.com>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
 <20261116-acpi_arm_pmu_registration_hmp-v1-1-0371d4eca626@arm.com>
 <avwFYMdr7g4r6Z9y@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avwFYMdr7g4r6Z9y@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_012912_091036_A3DB4BEB 
X-CRM114-Status: GOOD (  22.47  )
X-Spam-Score: -4.4 (----)
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

On Tue, Nov 17, 2026 at 09:42:24AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 16, 2026 at 06:21:28PM +0000, Leo Yan wrote:
> > Platform IRQ affinity lookup currently selects the OF or ACPI helper
> > directly. Add fwnode_irq_get_affinity() and an irq_get_affinity operation
> > implemented by both firmware types.
> > 
> > Use the new helper for platform devices, preserving the existing fallback
> > to cpu_possible_mask when affinity information is unavailable.
> 
> From this commit message it's unclear why we do that. Is it any helpful in the
> future? If yes, for what?

This refactoring lets platform devices backed by swnode provide IRQ
affinity through the common fwnode interface. Patch 02 provides swnode's
IRQ affinity callback.

I will reply your comments in patch 02 for why we need swnode to
store IRQ affinity.

> ...
> 
> > static const struct cpumask *get_irq_affinity(struct platform_device *dev,
> 
> >  {
> >  	const struct cpumask *mask = NULL;
> >  #ifndef CONFIG_SPARC
> 
> > -	struct fwnode_handle *fwnode = dev_fwnode(&dev->dev);
> > -
> 
> Might be unneeded churn — you can leave these two lines being untouched.
> 
> > -	if (is_of_node(fwnode))
> > -		mask = of_irq_get_affinity(to_of_node(fwnode), num);
> > -	else if (is_acpi_device_node(fwnode))
> > -		mask = acpi_irq_get_affinity(ACPI_HANDLE_FWNODE(fwnode), num);
> 
> > +	mask = fwnode_irq_get_affinity(dev_fwnode(&dev->dev), num);
> 
> 	mask = fwnode_irq_get_affinity(fwnode, num);
> 
> >  #endif
> 
> >  	return mask ?: cpu_possible_mask;
> 
> But I understand the point as we have only a single user left. So I am not
> objecting the proposed approach, just pointed out on an alternative.

I'll keep the local fwnode variable as you suggest.

> ...
> 
> > +++ b/include/linux/fwnode.h
> 
> >  struct fwnode_operations;
> >  struct device;
> > +struct cpumask;
> 
> Yes, it's a bit disordered, can you place the new one before the 'device'
> to follow alphabetical order?

Will do.

Thanks,
Leo

