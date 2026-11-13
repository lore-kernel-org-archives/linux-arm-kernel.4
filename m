Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCD2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 03:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RUmPeSuN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BVbwp4y3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B70zwmDKLeE1Oi2tj/3T4sXH/19QNsW7+URe2IHZSus=; b=RUmPeSuNOQQZX/
	x5mfJB6m9hpmcWGCPgXZ2zIjlarHpgNw41MPNT7Drs0ErdX7LbJ3/Xaap9kCzSU2VjScRxjSNMOsr
	tzAUe+J6azC4iXoiVuNTOgTpHfm1krDu+VM7mcjWCutN92vmRlX0O0TyCUUZDcq5xWyv7uIPOL4e3
	cLo1rt260/REq09G2O6SVG74UBzs4iTiNAmBrao2u8nEG7c8S/A8hAcSjHEq28RQRpTKIYg8iYlGB
	/62+zW/jo0gUqtV288uAoQYNyQAIg5Rhttw/LGFhuoua4lyr28lJddwEA9rqNxDKKOpPwaFzrN9SK
	CPteuEPB602UYYKx5/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhlp-0000000BZ5M-3udK;
	Fri, 13 Nov 2026 03:16:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhlp-0000000BZ4w-1y3P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 03:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B943040905;
	Fri, 13 Nov 2026 03:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3132F1F000C4;
	Fri, 13 Nov 2026 03:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794539768;
	bh=B70zwmDKLeE1Oi2tj/3T4sXH/19QNsW7+URe2IHZSus=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BVbwp4y3F7JHAGwjXLCF86ohG4ulFjLfDO0sKDqRr1jksIcSyTAQ8FIQKEuna/Soh
	 G/PpG8dB4iIBCh6xWosQh+SeXHXThFT3zoXEiQ2s3+9HDuR2NusmgoyIYJdhCPaW/9
	 jx2K15wXp4h5LJnj3+V4c228Cy5QE9UMLlQoYdKqN6evpkt0j3+5wVV2LvI8LuSI/D
	 B0athtkTM1fJFTD8V0fRGW4LscfBG9CVc79Cd9iN+FPnqs5UCfo5ornHLUPO8gNHNu
	 w8zx+3zebZ2b5l5+gb9zFK3x9L77NLH5+hwSlnsSAkjm0w502C5rWsN62bkYfdIhkT
	 +ugTRRM1V/FIg==
Date: Fri, 13 Nov 2026 03:16:00 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v5 14/16] iio: adc: xilinx-xadc: Split driver into core
 and platform files
Message-ID: <20261113031600.787000b1@jic23-hlaptop>
In-Reply-To: <20261110050201.1850399-15-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
	<20261110050201.1850399-15-dileepkumar.nagavarapu@amd.com>
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 10:31:59 +0530
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

Except for the reorg of delayed work cancelling that sashiko
is unhappy with. If that's intentional it should not be in
a patch that is otherwise shuffling code around.
https://sashiko.dev/#/patchset/20261110050201.1850399-1-dileepkumar.nagavarapu%40amd.com

> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>

