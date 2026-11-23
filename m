Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3E9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kALd5TIo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAFMNOID
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UxLUxK2Bj2Hah+1W4IvnMCJg9pItMlb0NA+amZkkOkc=; b=kALd5TIoCE+iGN
	Fw9DKx8itewuWbZhE3cOZzdUxONHByUu6xHUojRC3xzslbj+ZaR5O0FaiGWUMQsZkj6toU4tfMLZ8
	SvLD4tZL6RjNCq6LzVBGojF7PQBfKXcg4jGtrWUIMdzVenGH3dsY4bSa17OQIRVOrhbBRSdxtkfSq
	PRv2zFdrwWsLYJ8Q0xWbQvQ/3nqHOCKTlWa38GPjWIF7BYk+28MWNvUN0I9Lz1/8kA0o1rOBS0NaK
	gw9Pm19jEJmuBACNw3mtdP91mblAHJc7zl/S5e/2ynRCEL+hB2KcIZ3vSmeH9HW+dxitxJHkrX+qZ
	7H9Lmj679i3Ns6d3a8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZL3-00000004bof-0RCy;
	Mon, 23 Nov 2026 19:04:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZKz-00000004bo0-18tj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:04:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC5544045E;
	Mon, 23 Nov 2026 19:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABFB1F000D8;
	Mon, 23 Nov 2026 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460664;
	bh=UxLUxK2Bj2Hah+1W4IvnMCJg9pItMlb0NA+amZkkOkc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=DAFMNOID9vMzU0vYOFuL1Xz3Xke0tVRzaORGHNG/frKMoY98uFaRd4XHIDQmXT0d8
	 yGDRUnUIichRGxU05Z76vXJsJKQ0G290Wf3cb2GHQFmb/Q+/OJfZrDguJQmqQBBrpZ
	 G/T0mszHbO+eNhcNPT4avUeabnWfXdhprnPy/HAT892FklPz6NwL7e+GDDVQjejtuq
	 a9nzMxghzPhLXr1zG23bsRPf4PDVlGVFonUWcxKmVTxBNTdHWAJFk2NdadLTjJ2d9h
	 wfBd3WddBFP1tVNl4LME6V7Mwv9ra2aaN56MggmjknlJa6m3Lvl3IsgUJ8SLTNI63J
	 HPn1/bCra/u9Q==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/5] spi: spi-zynqmp-gqspi: Use IO mode if RX buffer is
 not cache-line aligned
From: Mark Brown <broonie@kernel.org>
To: Srikanth Boyapally <srikanth.boyapally@amd.com>
Cc: michal.simek@amd.com, ranjit.waghmode@xilinx.com, broonie@kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, git@amd.com
In-Reply-To: <20261115-qspi_14_11-v1-5-23425ed177bf@amd.com>
References: <20261115-qspi_14_11-v1-0-23425ed177bf@amd.com>
 <20261115-qspi_14_11-v1-5-23425ed177bf@amd.com>
Date: Mon, 23 Nov 2026 19:04:19 +0000
Message-Id: <179546065952.25092.7376341777366576138.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6J5LbQXDLSxrlIn/vwqRS5ku7TEEOJ8FFvjaAbWH1Mo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZ+kxtr4R1T/W5bxasHxy6sU36Ic/cj0dORqtmPlysY
 rvRfN3sjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEzkViQjw7xXb5bLHa34N/Ol
 6hHnwC/ndzUnyGWw8XEw+Uc7ycq9/s3wv2BltqH1tQ/xi1rz1/dNlroj7eYydU3lMh6lwD7zd/9
 n8wAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The QSPI DMA maps the receive buffer with dma_map_single(). That API
> requires the mapped region to start on a CPU cache-line boundary,
> otherwise the cache line can be shared with unrelated data and the
> received data can be corrupted. The 4-byte alignment check does not
> guarantee this.
> 
> The ZynqMP QSPI node is not marked dma-coherent. Fall back to IO mode
> for the whole transfer when the receive buffer start address is not
> aligned to dma_get_cache_alignment(), in the same way as the existing
> short-transfer and 4-byte alignment checks.

> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> @@ -871,7 +871,8 @@ static int zynqmp_qspi_setuprxdma(struct zynqmp_qspi *xqspi)
>  	u64 dma_align =  (u64)(uintptr_t)xqspi->rxbuf;
>  
>  	if (xqspi->bytes_to_receive < 8 ||
> -	    ((dma_align & GQSPI_DMA_UNALIGN) != 0x0)) {
> +	    ((dma_align & GQSPI_DMA_UNALIGN) != 0x0) ||
> +	    !IS_ALIGNED(dma_align, dma_get_cache_alignment())) {

Note that we have the same requirement for the end of the buffer.

-- 
Mark Brown <broonie@kernel.org>

