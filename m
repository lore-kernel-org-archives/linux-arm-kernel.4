Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6987606C6D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XXvRzzhd;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AK1NTSo0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eSliAbjh7RZqlvKIXCr1lf7kB+SLn3Ee8ByU0n0PH90=; b=XXvRzzhd0TsZENC7yu+nDc8QNZ
	eEziYagEb4qYpas6+9SrDS2UY325cD9v9PzvixGjigWhBHTw3b8enugZhqR3/6I6vL31XeFGxgCIK
	+rGK/gQlPCCQIW+oIsnbN6tinRKQYu+Ys69ToM/tpIKco2F+fayk6EAGl17KSrK1ih5yxyMPQaNe6
	k8llT2cnbH4Iwmhr9PVMK9jRsAJFRLoUh6rxs0yjA0q3+Ve1WM8DFQuqP/9tVuFa8pTqRjSEtMFe3
	xD1abz1X0yN8ejQtFl0YHb0X8gFgtQYyAeN6PPjkJdBBJk+Zag+Xm0AiqTIkzyjvzwHcTTZ9BJtE4
	TodTt7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQojC-00000004XWR-2ZVL;
	Tue, 10 Nov 2026 16:29:46 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQojA-00000004XVx-09lx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794328184; x=1825864184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fJlR0bo8pnYc/LIMgKmawcndi2oTRuM9VysMmlsls1I=;
  b=AK1NTSo083hFeswOq486gmTF1dK70KMHsNz517tqPf5VPXgTKt+VkbFa
   8oM9L4fFAkXxDvhZiYisL1dIX+kLZ2y8xVvI23GlMWNTWjgudDDRAuhP5
   J5tELECfLXBKNKjuMxaMVU8mHCdf3WN79K0CZ24SHjjveiKtAycPc4Ui6
   0XLstDL9Dqx7r1A0B45x5QqbFh2554tcCoZkAvHQn3T+PcOD8VM7is0cY
   jAs9nXrsrHthcCLXOHC1ZsgUr/YPbP4ngbAsfYyqgncHSBIKaFimBuMlJ
   t79cMNMMAcvhmNg/8NUC4FyfURUwiJeq9vVwu/vKDs/oz+/rUrQnaHRcf
   A==;
X-CSE-ConnectionGUID: ObHZ9icpQb+1W73Ihs6sjg==
X-CSE-MsgGUID: a25q9upXS5+EON5FxSFbQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2986940"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2986940"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:29:43 -0800
X-CSE-ConnectionGUID: MiXN/1QDQnqyJU4w66cS4Q==
X-CSE-MsgGUID: P3r/DpS6R9WNXmCnTfY5LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8063104"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:29:40 -0800
Date: Tue, 10 Nov 2026 18:29:38 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v5 14/16] iio: adc: xilinx-xadc: Split driver into core
 and platform files
Message-ID: <avNGcpcemoeE3J7O@ashevche-desk.local>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-15-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110050201.1850399-15-dileepkumar.nagavarapu@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_082944_120303_C29E5A88 
X-CRM114-Status: GOOD (  14.54  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:31:59AM +0530, Dileep Kumar Nagavarapu wrote:
> Split the xilinx-xadc-core.c into separate core and platform specific
> files to prepare for I2C interface support.
> 
> xilinx-xadc-core.c is reorganized as follows:
> xilinx-xadc-core.c:
>   - Platform-independent IIO/ADC operations
>   - Channel definitions and management
>   - Buffer and trigger management
>   - Device tree parsing
> 
> xilinx-xadc-platform.c:
>   - ZYNQ platform (FIFO-based) register access and interrupt handling
>   - AXI platform (memory-mapped) register access and interrupt handling
>   - Platform-specific setup and configuration
>   - Platform device probe function
> 
> Update Kconfig to introduce XILINX_XADC_CORE as a helper module selected
> by XILINX_XADC and update Makefile to build the split modules:
>   - xilinx-xadc-common.o (core + events)
>   - xilinx-xadc-platform.o (platform-specific)
> 
> Reorganize the code with no behavioral changes.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---
>  drivers/iio/adc/Kconfig                       |   8 +-
>  drivers/iio/adc/Makefile                      |   5 +-
>  drivers/iio/adc/xilinx-xadc-core.c            | 690 +--------------
>  drivers/iio/adc/xilinx-xadc-events.c          |   1 +
>  ...inx-xadc-core.c => xilinx-xadc-platform.c} | 818 +-----------------
>  drivers/iio/adc/xilinx-xadc.h                 |  27 +
>  6 files changed, 72 insertions(+), 1477 deletions(-)

This is weird statistics... I think it's a bug in Git. What it did, it copies
-core.c twice and uses statistics on each file after that without duplicating
the *original* amount of lines.

-- 
With Best Regards,
Andy Shevchenko



