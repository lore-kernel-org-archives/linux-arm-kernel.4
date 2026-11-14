Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD36077E16
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+7N+vpq;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cVGwYf1e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ZTzQECzP8zCA4zZIUOYcMmNhdFsxwT6/XtJiNtrnio=; b=N+7N+vpqJ3t5yOdL/f9L/NEvFL
	3DFk1jxHmavHVfLRZoq1A4GyYJEoZS3AefGOT3BPuYToGiTbHqra8a2LKteXKGhP0aCnbgADg20Qo
	/ZgbN6B0q+Sep6aL1UyfsoavdW8IvS/+JLnNYKPa6C9kxCUyw03hU4CjrTLGVorZJJQFzeDyu2leX
	/D1LF/y2UA1Sue00WbhfJqIij+1VVAHLwh6JQGwvNoXH1k8KolGbolbR3RBPCuTLsXmePfbar9gP8
	Thcq1VYiDROUHWfwS9DEWKRWCisiCH07qQFiCnlC+Nulp7QOY9ki9vX1dMvJkCl/73jHxISBTmewf
	IWniqUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDVZ-0000000G4fw-14h2;
	Sat, 14 Nov 2026 13:09:29 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDVV-0000000G4d2-0nP0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794661765; x=1826197765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3LrEAWD2vso0+yzov29pKHt2uGcBzvsMBwzmMMJMss8=;
  b=cVGwYf1eQ3SbkOsXKnm9vZwk30XqMO82lJ5uLZjPbwLzgZ0dheOBGsyT
   u9rQoN0HU7pJHuLtvdn8k5eekJ8IuiXyJlaI6l+rKyfM8k648/Z5Y4eYQ
   RY5ofKVcxTN9B58Z8fwnDX5e4V8s9EQRk4cBGmCxVzkctSLytiBt0aJIL
   AfvKUeIRC9NTXnxfh60sQWAiETdSbxWwKYdRpwc/7zqVZoTQM8idbKKHy
   U9kLhXJxgpRVOlUS2fFUM7TZ1ZqylCds3SFbQ8RX95Y3BBbDMpzfrkQnv
   AuJO1/89hz9EX45ykFkoMcUcm13GR//FGnd/wF+EXaANDnepo1tAuYZGy
   Q==;
X-CSE-ConnectionGUID: 4ruVhv03Tu+gue3q1AQ8DQ==
X-CSE-MsgGUID: NTm8PgfBQPyJBS4K3wYnnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3488614"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3488614"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 05:09:24 -0800
X-CSE-ConnectionGUID: vx3GMDnIRuiBOgprM3V5lA==
X-CSE-MsgGUID: vf8gb478SwiF8fB8umKoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9685598"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.47.46])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2026 05:09:23 -0800
Date: Sat, 14 Nov 2026 21:00:58 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Aravind Thokala <aravind.thokala@amd.com>
Cc: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, Michal Simek <michal.simek@amd.com>,
	linux-fpga@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH] fpga: xilinx-pr-decoupler: add shutdown() handler
Message-ID: <avhbivs3HDdvzrtB@yilunxu-OptiPlex-7050>
References: <20261110-pr_decoupler_shutdown_handler-v1-1-b833dfe9d380@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-pr_decoupler_shutdown_handler-v1-1-b833dfe9d380@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_050925_285077_91835CDA 
X-CRM114-Status: GOOD (  22.38  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 12:46:35PM +0530, Aravind Thokala wrote:
> Add a .shutdown() handler to decouple the Reconfigurable Partition
> from the static logic on reboot, shutdown, and kexec.

I'm not sure what problem are you going to solve by gating the PR region
from static region regardless. Please specify.

Before I get enough information, I generally think that's not the right
way to solve problems. You need to gracefully handle the specific logic
inside the PR region which actually impact kexec, so that they work in
expected ways, rather than abruptly cutting down the HW connection
regardless.

> 
> The handler writes CTRL_CMD_DECOUPLE to the control register. On the
> PR Decoupler, this turns decoupling on, which stops signal changes
> passing through the bridge. On the DFX AXI Shutdown Manager, it
> requests that the IP stop passing AXI transactions through.
> 
> Signed-off-by: Aravind Thokala <aravind.thokala@amd.com>
> ---
>  drivers/fpga/xilinx-pr-decoupler.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
> index 1405ddbe88f1..75b59edbf440 100644
> --- a/drivers/fpga/xilinx-pr-decoupler.c
> +++ b/drivers/fpga/xilinx-pr-decoupler.c
> @@ -137,6 +137,13 @@ static int xlnx_pr_decoupler_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void xlnx_pr_decoupler_shutdown(struct platform_device *pdev)
> +{
> +	struct fpga_bridge *bridge = platform_get_drvdata(pdev);
> +
> +	xlnx_pr_decoupler_enable_set(bridge, false);
> +}
> +
>  static void xlnx_pr_decoupler_remove(struct platform_device *pdev)
>  {
>  	struct fpga_bridge *bridge = platform_get_drvdata(pdev);
> @@ -147,6 +154,7 @@ static void xlnx_pr_decoupler_remove(struct platform_device *pdev)
>  static struct platform_driver xlnx_pr_decoupler_driver = {
>  	.probe = xlnx_pr_decoupler_probe,
>  	.remove = xlnx_pr_decoupler_remove,
> +	.shutdown = xlnx_pr_decoupler_shutdown,
>  	.driver = {
>  		.name = "xlnx_pr_decoupler",
>  		.of_match_table = xlnx_pr_decoupler_of_match,
> 
> ---
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> change-id: 20261110-pr_decoupler_shutdown_handler-bf2596f6d1de
> 
> Best regards,
> --  
> Aravind Thokala <aravind.thokala@amd.com>
> 
> 

