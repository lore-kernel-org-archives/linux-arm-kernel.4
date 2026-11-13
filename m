Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E6C606B2E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2dsNXMWJ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aWBWdbQJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F5dahvAOImInV6SIjD8FOKW1Yr8AhR0mLeOjsT7+EeQ=; b=2dsNXMWJqeWxQTHxZ7GFaNjaVD
	w7Hpqnn9j/F5C8kYm/SWQU5SbY58ztsZEJlVbP0OGumlPGy4eQA6twyehsSfWY2fnlk19V6LDjFHm
	sDsrBf0gICNzsz09hp9rkrD1WWt19uKgSh2NAgvMQhNuoTPxc9e66c7FbHDaOM6sTlyutcF2A4Ez9
	xi9OYedrK5jksiS/CcmJC8A/hFAXbgHetZZ0+RBYZQTWLqUXbG1PLxOE/jw4HlJlzfyO4MJpuDK/P
	7WDAiOyUvb4JAZ43wFWE7aQDDbLahW7KA5Dv74NCuvPC9tMcMp4ELBmwlDHeYR3TMfzi/jXy4HGa4
	EGhnw5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRthz-0000000DUL4-1Mcp;
	Fri, 13 Nov 2026 16:00:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRthk-0000000DUHs-3jbb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:00:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 660B0143D;
	Fri, 13 Nov 2026 08:00:40 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10DBB3F85F;
	Fri, 13 Nov 2026 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794585643; bh=F5dahvAOImInV6SIjD8FOKW1Yr8AhR0mLeOjsT7+EeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWBWdbQJBYg4MEtEMuhTMbj8Or0EiVBJ9zGCzjJSte9x+sC/BKA7tSzxX9aSPPoIQ
	 1vtTR23rbFSxPLB0Az3UZhQLt/KBmB+1yxCnVGLcKmsNuGB03sQ3qpBg30Rp5r5cmQ
	 GWhn/ELGpaZIsPZ4lSpFfWae24ZaNbmFELET0h2A=
Date: Fri, 13 Nov 2026 16:00:41 +0000
From: Leo Yan <leo.yan@arm.com>
To: "Johnny.Fan" <johnny.fan@cixtech.com>
Cc: will@kernel.org, mark.rutland@arm.com, suzuki.poulose@arm.com,
	jeremy.linton@arm.com, maz@kernel.org, mike.leach@arm.com,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, jie.fu@cixtech.com,
	bob.zhang@cixtech.com, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v3 2/2] perf: arm_pmu_acpi: Support heterogeneous ACPI
 systems
Message-ID: <20261113160041.GS9176@e132581.arm.com>
References: <20261102084153.3975282-1-johnny.fan@cixtech.com>
 <20261102084153.3975282-3-johnny.fan@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102084153.3975282-3-johnny.fan@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_080045_141390_C1AFEEC9 
X-CRM114-Status: GOOD (  13.44  )
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

Hi Johnny,

On Mon, Nov 02, 2026 at 04:41:52PM +0800, Johnny.Fan wrote:

[...]

> Group the CPUs by (hetero id, interrupt) and register one platform
> device per group. A GSI may be shared between groups with
> non-overlapping CPU masks, so only unregister the GSI mapping once no
> successfully registered device uses it, as the mapping is not reference
> counted.

This is fine for me in general. For CPU grouping, we would prefter to
use MIDR rather than hetid, as events should be able to migrate between
CPUs with the same MIDR.

My concern is that we need particular change in SPE/TRBE drivers to
retrieve IRQ affinity based on this change. It is better to improve
fwnode layer to provide a general way for retrieve IRQ affinity. I did
a bit experiment with using swnode and seems it makes sense.

I would also consolidate CPU PMU device registration. That means we need
to extend the device registration to support SPI. We also need to update
PMU platform driver for ACPI device probe.

Based on above idea, I would fold your patch into my series (but I will
drop the first patch for changing TRBE/SPE drivers). I will keep you as
the author but please bear me a bit that I may refactor it to fit into
the extensions. Hope this is fine for you.

Thanks,
Leo

