Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pU93XjCt;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=X9dW6HlN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=roV1y4HiOD8riMt7NYik460JFDeSI4MlS3WQXSzighw=; b=pU93XjCtRtsS0P
	0DJF1gWwMF/Im2Ata2wToDpOjjOXC5wsXVKt46OErGNxOOjJ6Zxa9jPtXlmQimtdpLn9qmY9LrwXa
	zxQ92mXMPwJufQFm0yeypUpFd646Ji8hQiolef3PKMVRvLxCAlmS0dkjps5nRYefvWr4vJENSlAwU
	y0Or6Phs0hmV9KBu+BiOsaTgf38QfUQSqhsL81mLqoNh7LJtUc5skrg1dZF2IH3ClaPTaahrelqc+
	vGQGPE3lUILXUDI6W2TW9WgNm8FfeboX5UP40+ETA84DkZsGiBVzE4N1e37Dbu/qJhw9jxjbIEVIS
	WhthS6sJfih0zivi4z2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBkX-00000001TB7-1V1j;
	Sun, 22 Nov 2026 17:53:13 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBkU-00000001TAf-23sn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:53:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 214D2A035D;
	Sun, 22 Nov 2026 18:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795369987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=roV1y4HiOD8riMt7NYik460JFDeSI4MlS3WQXSzighw=;
	b=X9dW6HlNjtTfX9kqmk/kpg/uFUJi1KufSMS35RCqxAYXBRngTtLx9ixLJdQVpsP8D6m+xa
	vvkVnG3xP5l1z+hZRkje0bRAGYWzMNQt57ZtC2+QfSBrVFCh4kTZvuHWvzA+zDPOuWz1Pm
	AuMUtd7zP2O66DIvLM8AE2nqsnMmQYd7k2N6m+ekxLRzZItd329n9A2FAyizovOEnBolNf
	uLJocbtMwS9bH5sSoRWwCp4R8ckLopuktYjLogMN5qrry+XR/XnpCKoUhMaOdm0ufUBYas
	b9DVeSKk4AlzV8ydg0CFOWMkViQBl7v+2pMsOnpswu0I6MSS8EX5RaTxelIgjQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 18:53:03 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, jakob.unterwurzacher@cherry.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: reset the DMA on a fatal bus error
In-Reply-To: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
References: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
Message-ID: <b3f78ebb57866c32046ccc60c92928cb@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_095310_986590_E1488B9B 
X-CRM114-Status: GOOD (  12.91  )
X-Spam-Score: -2.1 (--)
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

Hi Jakob

On 20.11.2026 15:16, Jakob Unterwurzacher wrote:
> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> 
> A fatal bus error (FBE) stops both the TX and the RX DMA engine of the
> channel. The DMA interrupt handlers report it as tx_hard_error, so
> stmmac_tx_err() reinitializes and restarts the TX side only.

Does it? AFAIU stmmac_tx_err() only runs when status is exactly 
tx_hard_error.

> [...]

Since you hit this on real hardware, please add a Fixes tag. Also your 
subject
lacks the target tree (would be net for a fix). See [1]

[1] 
https://docs.kernel.org/process/maintainer-netdev.html#indicating-target-tree

> [...]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index a0249715fafaf..2147403629892 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -165,7 +165,7 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, 
> void __iomem *ioaddr,
>  		}
>  		if (unlikely(intr_status & DMA_CHAN_STATUS_FBE)) {
>  			x->fatal_bus_error_irq++;
> -			ret = tx_hard_error;
> +			ret |= dma_fatal_error;

stmmac_dma_err_interrupt() still checks for tx_hard_error (see 
686b5f47f8cc),
so this breaks the FBE reset. The flag needs to be handled there too.

> [...]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 0a6e82a155c0e..bc06076410dc7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -335,7 +335,7 @@ static int dwxgmac2_dma_interrupt(struct 
> stmmac_priv *priv,
>  		}
>  		if (unlikely(intr_status & XGMAC_FBE)) {
>  			x->fatal_bus_error_irq++;
> -			ret |= tx_hard_error;
> +			ret |= dma_fatal_error;

AFAIU xgmac doesn't enable FBE, so this never fires?

> [...]

Regards,
Nicolai

