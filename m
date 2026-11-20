Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA30606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FDIDKRjj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJ+pA1vH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R8cEUfchtfL1CMYDQSUQAyd5j+dKyqqQvy8JCKkeHTQ=; b=FDIDKRjjjg3c11m/LOylZTCiaf
	WOzY+V72NWPuhKf5YCli+VXkeVKuYLYeJjKUOLk9uVs0YLRuSfGBVslD+GzbL+KwwshSo1FoTg63m
	lbYQKyLFPMG1mj3IBDUiGY9cCqDVSnFJsiUKMRIPbZ9y+kVsOtJwcV06YVvQntVKKgc/Cxm+TlbRJ
	mfAgwyZPKt056bUYsq/61QD3TXX4Q4lcNWqIGAQctttfcuYDtiprm1Oqwuy6SAB/AD+nLdEVFEfff
	3Dm3WfoyjNTtADEXwb45eQwaveIZNsSRB99Y7bBSZrsw3wy+nsrjRI3/lPl/3fP9r0pDMuys9E1Ud
	nIubZXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL73-0000000EUFQ-0qmz;
	Fri, 20 Nov 2026 09:40:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL6z-0000000EUEY-0WVt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:40:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47B4B62246;
	Fri, 20 Nov 2026 09:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4A51F000C4;
	Fri, 20 Nov 2026 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167652;
	bh=R8cEUfchtfL1CMYDQSUQAyd5j+dKyqqQvy8JCKkeHTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iJ+pA1vHpaNYllnqQbqUJ7mgvSduDG3aAkO2Mj7oUyPqQEon+BW+dm59hcqXed7VL
	 2xtu6/DPBtppJc/p36pz4lTHf73j60dqs4Y2iJl2+JUNEVzrwf+FUUjlExFJBgEsM9
	 ommrbKid81+gyu2CItU+cACBgqGl/bCcydWGsQIDBLEK3IOBb4Vzm8VbFOayIw+eeA
	 Mn3q7Er6t/56wzjh/vyVRsbCdtdCx8dB8knuV7KCI8zp0v+RyrBWk7Pbc1vfCKG/3v
	 SOZeEMbStmNbMGude3EWA+Nd70n/JdRSXZJ82oSZmKz8JurO6jnMHZwf8IJ9rdVHEB
	 rSXwSijGS2C3A==
Date: Fri, 20 Nov 2026 15:10:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v6 0/9] dmaengine: Support bus widths of 32 bytes and
 above
Message-ID: <awAVoMe1VphXwQIw@parshuram>
References: <20261014-dmaengine-support-wider-dma-masks-v6-0-5b3ffdef8191@analog.com>
 <auiDhzNcif3LhPlq@nsa>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auiDhzNcif3LhPlq@nsa>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02-11-26, 12:36, Nuno Sá wrote:
> On Wed, Oct 14, 2026 at 03:19:10PM +0100, Nuno Sá wrote:
> > The DMA engine slave capabilities advertise the supported source and
> > destination bus widths through src_addr_widths / dst_addr_widths. These
> > are plain u32 bitmasks where a set bit's position equals the
> > corresponding enum dma_slave_buswidth value, e.g.
> > DMA_SLAVE_BUSWIDTH_4_BYTES sets bit 4.
> > 
> > The consequence is that widths of 32 bytes and above cannot be
> > represented at all: DMA_SLAVE_BUSWIDTH_32/64/128_BYTES would need bits
> > 32, 64 and 128, which do not fit in a u32. Hardware with wider data
> > paths is becoming common, so add a representation that can express these
> > widths while still using enum dma_slave_buswidth.
> > 
> > This series switches consumers and a small set of producers to the new
> > bus width capabilities, represented by a dma_buswidth_mask_t modeled
> > after dma_cap_mask_t. The legacy dma_device u32 fields are kept for now
> > so the remaining DMA controller drivers can be converted incrementally:
> > dma_async_device_register() folds a legacy-only producer's u32 into the
> > mask, so consumers only ever have to look at the mask.
> > 
> > Once the remaining producers are converted, the legacy dma_device
> > src/dst_addr_widths fields can be removed as a final cleanup.
> > 
> > This issue was discussed before here:
> > 
> > https://lore.kernel.org/dmaengine/abkoXXbaxaiqbBuX@vaman/
> > 
> > Changes in v6:
> > - Patch 1:
> >   - Prefix the bus width helpers with dmaengine_ (Frank).
> >   - Drop the wrapper macros taking the address of their mask arguments.
> >     The helpers are now static inline functions taking a
> >     dma_buswidth_mask_t pointer (Frank).
> >   - Drop a stray blank line in dma_get_slave_caps() (Frank).
> > - Patch 2-8:
> >   - Use the renamed helpers, passing the masks by pointer.
> > - Link to v5: https://patch.msgid.link/20261009-dmaengine-support-wider-dma-masks-v5-0-4c4e63a7a1af@analog.com
> > 
> > ---
> > Nuno Sá (9):
> >       dmaengine: Support bus widths of 32 bytes and above
> >       dmaengine: dma-axi-dmac: Use bus width capability helpers
> >       dmaengine: dw-axi-dmac: Use bus width capability helpers
> >       dmaengine: qcom: gpi: Use bus width capability helpers
> >       dmaengine: stm32-dma3: Use bus width capability helpers
> >       iio: buffer-dmaengine: Use dma_slave_caps bus width accessors
> >       ALSA: pcm_dmaengine: Use dma_slave_caps bus width helpers
> >       spi: dw: Use dma_slave_caps bus width helpers
> >       dmaengine: Drop legacy bus width fields from dma_slave_caps
> > 
> >  drivers/dma/dma-axi-dmac.c                         |  13 +-
> >  drivers/dma/dmaengine.c                            |  23 ++-
> >  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c     |  39 +++--
> >  drivers/dma/qcom/gpi.c                             |  11 +-
> >  drivers/dma/stm32/stm32-dma3.c                     |  37 ++--
> >  drivers/iio/buffer/industrialio-buffer-dmaengine.c |  15 +-
> >  drivers/spi/spi-dw-dma.c                           |   7 +-
> >  drivers/spi/spi-dw.h                               |   3 +-
> >  include/linux/dmaengine.h                          | 188 +++++++++++++++++++--
> >  sound/core/pcm_dmaengine.c                         |  20 ++-
> >  10 files changed, 289 insertions(+), 67 deletions(-)
> > ---
> > base-commit: 42c31fec1ca76b8b5f7759def122d418dff2cd4b
> > change-id: 20260615-dmaengine-support-wider-dma-masks-5aac12497e27
> > --
> > 
> > Thanks!
> > - Nuno Sá
> > 
> 
> Hi Vinod, pinging this one before resend. Already got the rb  tag from Frank on the
> first patch. If anything left to do, let me know please.

This fails to apply for me, can you rebase on next and send

-- 
~Vinod

