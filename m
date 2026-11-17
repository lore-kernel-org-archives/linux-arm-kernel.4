Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFB9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VcfckWdZ;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lGhj0LAW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8vgPP6Tx8J3tAl7vzRS2f9bzf7D4zQHjlRLap4jWt7g=; b=VcfckWdZHmjzcaDvmXLx49aYmf
	Ch5uUs4MV4NkiMutWZ0eeqIlHPIoqiFbyMajHm8IdjtbavKQy73Vutjxkn5pNtF/2iplzuEPNVQU/
	mU26WyRHAG2Qh+FbaDIEM0zLiA3n/ggkrd2EdeOZyoAy/wTGNjuwqhePAfy9hXOfUIfKXwQXQiynN
	yYqWHKmx8qCIE7shCxX3bQ5IrszrxYEVymqczMbjaID+pV8gQt/6e2z0qYS848TWavlBx5odtaUnI
	y3Y4ZheGuiB2ascmdy2k/4nVu/HDdhpt4iCKK8vvdLTfmom/MTqvYZ789jtDzQoZ7fR7w9upBaydZ
	5nz1kjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDxg-00000004pO4-4C0m;
	Tue, 17 Nov 2026 07:50:41 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDxb-00000004pMv-35Us
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794901836; x=1826437836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7tsumGXRfcakGcSfEArUg8RNIoKnnuupodfU8GGdp+M=;
  b=lGhj0LAWYQN5pXw3lN1+iBIe1kR9L+pkMO+qaLUpLP2NC2mxE19Tgc9Z
   0keSFOJucvPBLruP5NaXqNnyjikm0cDVi/894pzWqIZrt/6j13f5GD0lm
   yhYtvPPLkYOTdv7LMLa3PSt750IiwqtEFBUnKKZLUf7PH4mjOCfgchcEI
   4ZEB7xkYTe532ROa81fvFwYvXfYNLzXFllWLhiNAkynd62oxJIoZFw1ni
   BOE2vMCexRfgR3aa9lzCXE5vBhCm7WKmzgr2X/ZyiGX26mAxAs8lHU+lX
   lmCZ6b+YEK73d0TPJwkpH8IgWwmLWY85AVVTsFPCaVCf9ovH7meMTkchp
   g==;
X-CSE-ConnectionGUID: r37qaAVKQaODUFSUIvLSxA==
X-CSE-MsgGUID: 0n9oQEyeRmOkL0G7tmqlSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3542647"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3542647"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:50:35 -0800
X-CSE-ConnectionGUID: SPVU5nc+QZS67WCpD35Wow==
X-CSE-MsgGUID: Jd/piBRPQmaHbo+f4M+jFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9774997"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:50:27 -0800
Date: Tue, 17 Nov 2026 09:50:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Leo Yan <leo.yan@arm.com>
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
Subject: Re: [PATCH 2/8] device property: Add software-node IRQ affinity masks
Message-ID: <avwHQXJxOir8XXxX@ashevche-desk.local>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
 <20261116-acpi_arm_pmu_registration_hmp-v1-2-0371d4eca626@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-acpi_arm_pmu_registration_hmp-v1-2-0371d4eca626@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_235037_893694_ABDE9109 
X-CRM114-Status: GOOD (  12.64  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 06:21:29PM +0000, Leo Yan wrote:
> Devices created from firmware tables may need CPU affinity information
> without a corresponding firmware node. Allow software nodes to supply
> this information through the common firmware node IRQ affinity API.
> 
> Add software_node_add_irq_affinity() to copy a CPU mask for an IRQ index,
> and implement the software node irq_get_affinity callback. Keep each mask
> until the node is released and reject replacement so borrowed masks remain
> valid for the node's lifetime.


This is definitely not a place where to put that. Are you stating that any
software node might find the IRQ affinity information useful? I don't think
so. With that in mind this approach looks like a layering violation.

...

And overall, the domain specific (IRQ, DMA, et cetera) topics feels a bit
misplaced when one can find that in the generic properties. We also have
that PHY thingy, which is complete alien to word 'generic'.

-- 
With Best Regards,
Andy Shevchenko



