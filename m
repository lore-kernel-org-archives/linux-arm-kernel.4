Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F287606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 04:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tNPF2MaV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZX+z8A4H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nvQgGmaz+1Yaxt2xBwkGWoCj42B/5xoZDotx73Xgz9Q=; b=tNPF2MaVC8vdQb
	WHff5oWRwce/k7la67CVHEU85mrMzGpra/F0EV3eouoqImdhzLwoStKSYZta8TPjif5tLTBSgzYfl
	8wZl1rHl4s/Wn8IR+8QzpuY+mxnonzANr//7uI74T3seqKX/q17iPWEeoFtEthvT67pv1J6PlOdnF
	ZOEM+56v0inBWYpbjvgdYQtXLXTJRYjVOpp9e9BBLl24QNimxDprSLHUOsqxwKgLvYmA5Zm3vfdcy
	ooDE8gMChrMYIASNk5gSpvkYOF0G6ofExJ+kIJE+AuaxpswAPHAm9iVB7hiQyKqhAMwKrLGJrBODj
	0BDe0k4S8Es8vXAIHUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAK1-00000000NzP-0jOk;
	Sat, 28 Nov 2026 04:46:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAK0-00000000NzJ-2pDT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 04:46:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 253FE43C9F;
	Sat, 28 Nov 2026 04:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68AB1F00897;
	Sat, 28 Nov 2026 04:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795841160;
	bh=nvQgGmaz+1Yaxt2xBwkGWoCj42B/5xoZDotx73Xgz9Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZX+z8A4HWRYZWy3zyIf9EW5i57eN0XDBUjdW2jCUAA0MefstOB4JXLwhqHttM3ZnR
	 9Vz3DnBhV+zmMfBsbk/O4FgcAj/ThcVMy5DU+ysx/DCZCpKcCkEHYXNEcv1KG+cdBV
	 5ixYJy2aZgegia0JAEmDL4yNRHyhdM2bMTxIgT+cRY+HLmqb8SwmUPUeALSsxzKonC
	 A4+ob8byJdcSoWb177uTwfec0JOhbh4O7yeFlOi5Zl7T4D2h1nRmTs9i5Dpw+c/yei
	 0RmkFfw0eN533C3E2NIZtKKh7olVhgyabK2PfLaBy7XTVngjb8bBlNnTwsfEeZXdqt
	 mYE3Jg22TItBw==
Date: Sat, 28 Nov 2026 04:45:52 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v6 14/16] iio: adc: xilinx-xadc: Split driver into core
 and platform files
Message-ID: <20261128044552.6bf275be@jic23-hlaptop>
In-Reply-To: <20261125171045.1246381-15-dileepkumar.nagavarapu@amd.com>
References: <20261125171045.1246381-1-dileepkumar.nagavarapu@amd.com>
	<20261125171045.1246381-15-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 22:40:28 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

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
Sashiko calls out that the module name changes and even if that is fine
for userspace on these devices, the help text in Kconfig need an update.

https://sashiko.dev/#/patchset/20261125171045.1246381-1-dileepkumar.nagavarapu%40amd.com
A few other comments apply to this patch.

There is stuff on patch 16 as well.

There is also something strange about the patch split up.
This should be moving code but a lot more is removed than added. 
I think that's because this is treating xilinx-xadc-core.c in two
ways, both as the basis for itself (lots of code removed) and
as the base for xilinx-xadc-platform.c (lots of code removed there
as well).  This has the odd result of seeing like lots of code
is being remove whereas it is just moving around.  Probably easiest
solution to make this revieweable is to turn move detection off
for the git format-patch.



> ---
>  drivers/iio/adc/Kconfig                       |   8 +-
>  drivers/iio/adc/Makefile                      |   5 +-
>  drivers/iio/adc/xilinx-xadc-core.c            | 688 +--------------
>  drivers/iio/adc/xilinx-xadc-events.c          |   1 +
>  ...inx-xadc-core.c => xilinx-xadc-platform.c} | 805 +-----------------
>  drivers/iio/adc/xilinx-xadc.h                 |  28 +
>  6 files changed, 67 insertions(+), 1468 deletions(-)
>  copy drivers/iio/adc/{xilinx-xadc-core.c => xilinx-xadc-platform.c} (44%)


