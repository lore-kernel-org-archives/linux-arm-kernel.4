Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ED1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rNmc8YcC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MWUWtuMy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5pEKKxPgvvWFV1IPNyUVMRHtk9eF+9OPq36ATx+UqCg=; b=rNmc8YcCJJsh+DDViVUP5IeMRt
	oIIYtUONUVvNZrZXcYtd5aYqdi4PtuuXFApBhzdNYe/vzAwmwy4muyJCSZ+gsvSU8cQHShh34lDyF
	/pm4nPed7G2RHacV6oceQKU5qOuPbT/mUkmWm6ADe/yiZljB6pfpcaITl4MpcFf5Z3qoO/hd0AAG+
	mQnjyt2fhQWeLIMQywXXRDKFMDFZDytGUDYSKXqh1yFfHB/d4sg3zDsctTCwxb6SfWnzpKzkmezRb
	4Ij38iFuQirvJFNDhOhQ6BYzfQpu9HzNZW30fB9Zqq3kWTim1mkCCsAekW5TOEFpenVXdWqs1Ds6t
	QCO1jUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsLC-00000006sH1-2dNP;
	Tue, 24 Nov 2026 15:21:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsLA-00000006sGh-40Du
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:21:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E35161F0C;
	Tue, 24 Nov 2026 15:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B621F000CA;
	Tue, 24 Nov 2026 15:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533711;
	bh=5pEKKxPgvvWFV1IPNyUVMRHtk9eF+9OPq36ATx+UqCg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MWUWtuMyhnJg22FXzD3B6//ODAJnVIEfpO3rWcjRhXb8dckAtD9mCXmkBQl2ioedK
	 PIutNJCuA9DsnbJpzYzO2U+VEShXLK2V2hGyYgQZdrDECMtgRx4yA1bNt0LEAiuXFW
	 9aJ613k2i+gimI+qCB7GRQDILI7xBQSP/+q0SXp6/+GakXDT0mTgZZ62ZHL8ZOj59C
	 41ZBBwJdhDAckYNKJK75uir42f3W8xHXR7TdB2Eaxw0Bf/IUTbQ5wDDZ9bsq3CmzD7
	 OudW2f/D1qskmIOPjktM8wiw+H51JDkEjUjAwG/Q0j3weT0q9h7pTfsKXwb7cedTUY
	 mQNvvUw1fxupQ==
Subject: Re: [RESEND PATCH net] net: stmmac: dwmac4: schedule RX NAPI on
 Receive Buffer Unavailable
From: netdev-bot+sashiko@kernel.org
To: david.wu@rock-chips.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, joabreu@synopsys.com, peppe.cavallaro@st.com,
 luis.la@mail.de, lorenzo.bianconi@oss.qualcomm.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 Anandu.Padinhare@electrifex.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 15:21:50 +0000
Message-ID: <179553371014.3135.698233709015906306@kernel.org>
In-Reply-To: <20261120150805.763415-1-david.wu@rock-chips.com>
References: <20261120150805.763415-1-david.wu@rock-chips.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix only works when RBU is handled through
  stmmac_napi_check().
- [Medium] In dwmac4_dma_interrupt(), the new `ret |= handle_rx` for RBU
  (line 160) is followed by the TPS and FBE branches, which still use…
- [Low] The commit fixes a user-visible permanent RX hang and names
  commit 1b9707e6f1a9 ('net: stmmac: enable RPS and RBU interrupts') as…

--

net: stmmac: dwmac4: schedule RX NAPI on Receive Buffer Unavailable

When dwmac4_dma_interrupt() sees the Receive Buffer Unavailable (RBU)
abnormal interrupt, this patch makes it return handle_rx so that the RX
NAPI is scheduled. That NAPI poll refills the ring and lets the suspended
RX DMA resume. The goal is to match the existing XGMAC RBU handling.

> Commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
> enabled the RBU interrupt for dwmac4, but the interrupt handler only
> updates the statistics counter without scheduling the RX NAPI. The RX
> NAPI is therefore never invoked, stmmac_rx_refill() never runs, and
> the RX path hangs forever once the ring has been exhausted.

[Severity: Low]
Should this have a Fixes: 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU
interrupts") tag, and perhaps a Cc: stable? The trailers only include
Signed-off-by and Reviewed-by. Commit 686b5f47f8cc ("net: stmmac: Clear DMA
errors for multi-channel interrupts") does carry a Fixes: tag for the same
commit.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index 02aa1a3dd1e25..de6bd6f8a7d58 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -155,8 +155,10 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
>  
>  	/* ABNORMAL interrupts */
>  	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
> -		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
> +		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU)) {
>  			x->rx_buf_unav_irq++;
> +			ret |= handle_rx;
> +		}

[Severity: High]
Does this also cover GMAC4 platforms in multi-MSI mode
(STMMAC_FLAG_MULTI_MSI_EN, e.g. dwmac-intel mGbE, dwmac-motorcomm YT6801,
dwmac-s32, dwmac-loongson)?

On those platforms RBU is part of the error mask:

#define DMA_CHAN_STATUS_MSK_ERR		(DMA_CHAN_STATUS_AIS | DMA_CHAN_STATUS_FBE | DMA_CHAN_STATUS_RPS | DMA_CHAN_STATUS_RBU)

The common IRQ handler gets here with DMA_DIR_ERR:

stmmac_mac_interrupt()
  stmmac_dma_err_interrupt()
    stmmac_dma_interrupt_status(..., DMA_DIR_ERR)
      dwmac4_dma_interrupt()

stmmac_dma_err_interrupt() only checks for tx_hard_error, so the
handle_rx bit returned here is dropped:

	status = stmmac_dma_interrupt_status(priv, priv->ioaddr,
					     &priv->xstats, chan,
					     DMA_DIR_ERR);
	if (unlikely(status & tx_hard_error))
		stmmac_global_err(priv);

The write-back at the end of dwmac4_dma_interrupt() still acknowledges RBU
and AIS:

	writel(intr_status & intr_en,
	       ioaddr + DMA_CHAN_STATUS(dwmac4_addrs, chan));

That consumes the RBU event, and the RX NAPI is never scheduled. Wouldn't
the RX DMA then stay suspended, with stmmac_rx_refill() never running? That
is the same RX hang the commit message describes.

RBU is in both DMA_CHAN_STATUS_MSK_RX and DMA_CHAN_STATUS_MSK_ERR, and
nothing serializes the read/ack sequence across vectors. So the common IRQ
handler could also beat the per-channel RX vector and swallow the event
even when the RX vector saw it too.

Commit 686b5f47f8cc ("net: stmmac: Clear DMA errors for multi-channel
interrupts") is what sends RBU to this error path in multi-MSI mode.

Could stmmac_dma_err_interrupt() honour handle_rx for chan <
rx_queues_to_use the same way stmmac_napi_check() does? That would mean
disabling the RX DMA irq under ch->lock and calling __napi_schedule() on
rx_napi.

[Severity: Medium]
A few lines further down, the TPS and FBE branches still use plain
assignment:

		if (unlikely(intr_status & DMA_CHAN_STATUS_TPS)) {
			x->tx_process_stopped_irq++;
			ret = tx_hard_error;
		}
		if (unlikely(intr_status & DMA_CHAN_STATUS_FBE)) {
			x->fatal_bus_error_irq++;
			ret = tx_hard_error;
		}

If RBU appears in the same status read as TPS or FBE, is the handle_rx bit
set here overwritten?

In single IRQ mode (DMA_DIR_RXTX), stmmac_napi_check() would then skip
rx_napi, and stmmac_dma_interrupt() would only run TX recovery:

		} else if (unlikely(status[chan] == tx_hard_error)) {
			stmmac_tx_err(priv, chan);
		}

By then the write-back has already acknowledged RBU, so the RX ring would
stay exhausted. In multi-MSI RX mode, FBE is also in the RX mask, so RBU
together with FBE loses handle_rx in the same way.

TPS isn't in DMA_CHAN_INTR_ABNORMAL, so the writel(intr_status & intr_en,
...) write-back never acknowledges it. If the hardware keeps TPS latched
after a runtime TX DMA stop (stmmac_tx_err() and stmmac_disable_tx_queue()
both call stmmac_stop_tx_dma()), every later RBU in RXTX mode could hit
this overwrite. That part depends on how the IP latches TPS, and I couldn't
confirm it from the code.

The XGMAC handler named in the commit message, dwxgmac2_dma_interrupt(),
uses ret |= tx_hard_error, so handle_rx is kept there. Just changing dwmac4
to |= wouldn't be enough, though, because stmmac_dma_interrupt() tests
status[chan] == tx_hard_error.

Could handle_rx be ORed in after the TPS/FBE assignments? The other option
would be to change both the assignments and the callers' equality tests.

>  		if (unlikely(intr_status & DMA_CHAN_STATUS_RPS))
>  			x->rx_process_stopped_irq++;
>  		if (unlikely(intr_status & DMA_CHAN_STATUS_ETI))

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120150805.763415-1-david.wu%40rock-chips.com

