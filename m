Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3346D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rE/MoyV4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLMVtv+u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mQFnDhlAQPSGFkMT4kocQnyd56rj4zvsNyVWUnTJIuI=; b=rE/MoyV4/Lo9AFxxgH2bLhLHpZ
	eLrLeWbIq86mJvd3K5UgPZtmd0+pEgGLWxnK6PT6ZsEOC4WYWRZ41koNB/scpH+eAFjlrbJk27wMB
	2R1TRIA/ZNG/UtJpdKFIpBnTJzcWX7YTp5cLrFTQJ8WVqLxEaXwTdRzVcdQYLyiPKYGhRGUGHZ+F4
	8os4jKfP+7A3GUh57VTaxu/vH0mczibpCvtGrm7oqVHzwUQTU0oFJilvlttQmHqsdPGGQNCWLdhkI
	kys+W37Ls9/fi+XbYEmujPgqtztmIWDQu6BnwARmNE/49/goQ3JOxIYF/sgRiTShCkxWGYDjV+knE
	HXbHcukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUATG-0000000DYrj-2dFk;
	Thu, 19 Nov 2026 22:19:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUATF-0000000DYrd-3vha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 22:19:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEF74410E3;
	Thu, 19 Nov 2026 22:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EED21F000C4;
	Thu, 19 Nov 2026 22:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126749;
	bh=mQFnDhlAQPSGFkMT4kocQnyd56rj4zvsNyVWUnTJIuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YLMVtv+ut4AQF4gnI+7xG2+/PMjopRjeBDqvngspHjiV8VzVO6KflG12UD+67gA/t
	 qglGcZqHa5NOV9ycgg10AvVLkVSOiNbLUBW8xq2d57a00pocNQQhqv1Nl80poJYl1A
	 52R8f6Ubu++nmqG/lk4mjLjPsx4hNnMiF6v2UcVKtwiVgq0r4+UP8RQy1U5boA2shf
	 Xvc7AMkgZ4mT04nZuOKvtywgZOaJiFmNM64xfQzU8B//Lp1mSSW4EpFUxK1vjVdG+5
	 m58Phbu31YdBqLSjPep5BaaRt8/hqAwe5EZiB5VrOVU8VekGVeGD1MIAoZvcQUJMvu
	 9bmhAHIGbPVtg==
Date: Thu, 19 Nov 2026 16:19:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org, michal.simek@amd.com, saravanak@kernel.org,
	conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: host: ehci-xilinx-of: remove the driver
Message-ID: <179512674674.960974.10790792487176520785.robh@kernel.org>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
 <20261106051820.3414532-2-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106051820.3414532-2-radhey.shyam.pandey@amd.com>
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


On Fri, 06 Nov 2026 10:48:18 +0530, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
> 
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
> 
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string and no defconfig enables CONFIG_XPS_USB_HCD_XILINX.
> The compatible was never documented in a schema binding.
> 
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
> 
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - Add Alan and Michal acked /reviewed tags.
> ---
>  drivers/usb/host/Kconfig          |  11 --
>  drivers/usb/host/ehci-hcd.c       |   7 -
>  drivers/usb/host/ehci-xilinx-of.c | 229 ------------------------------
>  scripts/dtc/dt_to_config          |   8 +-
>  4 files changed, 2 insertions(+), 253 deletions(-)
>  delete mode 100644 drivers/usb/host/ehci-xilinx-of.c
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


