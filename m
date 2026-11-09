Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F7606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TbkND7X5;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fc8w57rO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ATsD9Xu4uSt2b+wnr6JUehFjGprw+gnrB702q3SrL8o=; b=TbkND7X5Brz5+y
	SUFO1Jafq5MU4Y5PIf4nhjGbK+uguufsZIXrT7/3cwT50EoN9g/Bcvf1bqiHREwDmDgohEzjbd/QB
	6S62gokeoZ/wZzLclGXSKSrqeT4Nb419hb8ROCbIRa3sV7mJz9TdVn8upZtv/JXxyGNofr4oqncft
	iqCViHmnp761u7RkXl+kkWsDvxUB3ZOecMhAp8aq/OGWd/wbwF6W5PeffEY5REqhFW1fsqZddfjrE
	OdF75FVoRrzDi4ocXU7m00iQ+JM0URPS6Pk9E4chFMHTBoVnY3FCnbG6tbx79m+U5VB+X/raquXYH
	q0+EePMcstfiKf1CK+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS7x-00000001BMz-3E1k;
	Mon, 09 Nov 2026 16:21:49 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS7r-00000001BLN-13jy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:21:46 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-8241a56cd70so659331a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794241299; x=1794846099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ATsD9Xu4uSt2b+wnr6JUehFjGprw+gnrB702q3SrL8o=;
        b=fc8w57rOyXvEsmninK6dc2VvfdBoKZKcONaACMIx+ut1wLLfDN0jBTmLWdqDafXwgP
         dfHUQtC4JSuo9JYgSK0aoYPxIPMKaf7aBpzjRtkornJe6GWpKvqOoXIrmbUOZuTn88wH
         z6knL4H3h9cvnCMTzlkfqsh74EBUUCr3G5hdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241299; x=1794846099;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATsD9Xu4uSt2b+wnr6JUehFjGprw+gnrB702q3SrL8o=;
        b=NRCdpZKo94xRKbFH0gmOZu3ylL3Azmnc6YjS36+u4sQ/XsYPirbU06z6Z4ZXvU9LxO
         dtKa1da5e9opqepEnc2H0b4QP3us9ZuOBphRsPvffGJtz/96OmtpGpj8JJMpsh4yVBg/
         Z9Qr8h/q8tr1klVit8uC4HyA/hUnjFL1g/ArUOPQcmVfDiQL12Dm6PORe7VFOiALqeBb
         GtDQFhZt95yXLcLEYmUhgP4k2UHzgzzLtfSYe+kyyOg4GNrp6RBaRqB5ShNTiYOLuUDB
         J/+gbzSVOoW7J1NNNZpUao0ko/nONcC4t9ZCxon6Xieaitdh+vHU5k8NfiSQ5Qfv2ZzJ
         u/wg==
X-Forwarded-Encrypted: i=1; AL+hErFzDJpFfjIVpQTLqjq6rDdtl983+9HYhT3j4+s16ou16+O56zeWOlcYYePGRICboz3aj0Dag2vXoYCi/6QK22mO@lists.infradead.org
X-Gm-Message-State: APuU4Z96ihghrx/6Iis+3LmLpBi/QQ5Rj+iLI5fp0XUPwrkRfosyb7ke
	ydYFWzBewIrxS0H3a0PnFDwrB/umtT0lGLqIMCstcPQ3pyWTvkI8Cd5GDf0NtBnjIwTI1dbYGQB
	oNhs=
X-Gm-Gg: AYBFou2WGFxmIJzEj71UXjaQM0UdpLqJtt9WOwZFg4wJLchwdGz+ytAwvh9aQIEK29E
	/NcTyQGyxcc5Z3a51am1Jgus6f53+gIjvRYBAseEPy+HbZVMGztSsxP8HDbpfBPXbwUdX6463jQ
	yMiiDKKjmx6WCB3FNUD+OneeMvxo5sB9DMcRgflLg546lLHAqy+Ev1q3X6O0OaaiHbfVRFNobaD
	7mbggeSJtpzh8l89Z0sattBueNXLcrwxNl57LVWD59lmMnJ1zu0dgTZ399OvIJES+OqAWOWR2C6
	cjJpO4V2YY/RYkQ2ZrIjotk72iZDG3WFFO+EtT60iJyJo2eI5/Opz96G7m5F0JulJEWX5tRVsVZ
	9CNYde6yhoSrFvG5qAQ31Kasiv7fQM1lp2TQJTxv56fUJBH+Wq+HIpsSYP+tAbw517EYJMcTn0J
	ESSUcM96v5AwUPgvzDe1v7NDHqkIoucD8idzLA/cT0CeYLy9oWhWtHKnchqRSC/NmkhMBY+tH7n
	sZl+2VlHNw9yTozQfVD3W7MOW558u/JNnC9Z+84FqMaAkBqitzb41OXp4HrCy27auplzlrqX6q8
	cbhrEtuRm9D0XOGmd3zvWfnfnIEg4blIekjl/7dt0y3yFoRTwYnc2W8oSCkvB2Je9hulYWx0TdP
	6cMa8RoxjmkXDti8=
X-Received: by 2002:a05:6808:159f:b0:4d6:90f3:74a1 with SMTP id 5614622812f47-5683ccd209amr89819b6e.44.1794241299242;
        Mon, 09 Nov 2026 08:21:39 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade694062csm5510676fac.8.2026.11.09.08.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:21:38 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Raul E Rangel <rrangel@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v10 7/8] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Mon,  9 Nov 2026 09:21:34 -0700
Message-ID: <20261109162135.906262-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-7-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com> <20261108-submit-serial-8250-dma-cancel-v1-v10-7-e6227ddb95b1@gmail.com> <CADvTj4qXcOqS-wDrrN-x3sXUQr5BtFBeGzz_wqpW8WJ1DMPg+g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_082144_696131_826045A5 
X-CRM114-Status: GOOD (  15.80  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

Thanks for dropping the unused rx_pause_wakeup lines in omap_8250_shutdown()
in v10. Following up here on your question from the v9 7/8 thread:

On Tue, Nov 03, 2026 at 11:05:42AM -0700, James Hilliard wrote:
> For pause-capable hardware, a recovery timeout does not have to prove
> that the failure is permanent. The concern is what happens after that
> timeout: the current recovery path discards the pending transfer and
> leaves RX on PIO until reopen.
>
> Is there a recovery approach that avoids an indefinite RX stall
> without turning a potentially temporary pause failure into loss of DMA
> for the rest of the open session?

Yes — the only reason the current recovery path disables RX DMA for the
rest of the open session is that serial8250_rx_dma_recover() sets
dma->rx_err = true and serial8250_rx_dma_flush_work() leaves it set
after dmaengine_terminate_sync(dma->rxchan) succeeds, which causes
serial8250_rx_dma() to return -EIO until reopen.

Notice that struct uart_8250_dma already distinguishes a normal
post-pause async termination from an unpaused transfer that needs
synchronous termination:
- When serial8250_rx_dma_try_flush() succeeds, it calls
  dmaengine_terminate_async(dma->rxchan), sets dma->rx_terminating =
  true, and clears dma->rx_running = 0.
- When serial8250_rx_dma_try_flush() fails, dma->rx_running remains 1.

So we can decouple bounded pause-timeout recovery from sticky PIO
fallback without adding any new struct fields:

1. In serial8250_rx_dma_flush_work(), if retry is still true when the
   1-second retry budget expires (or immediately if ret == -ENOSYS ||
   ret == -EOPNOTSUPP):
   - If ret == -ENOSYS || ret == -EOPNOTSUPP (e.g. Tegra186 where
     hw_support_pause is false), call serial8250_rx_dma_recover(p) so
     dma->rx_err = true permanently falls back to PIO for the session.
   - Otherwise (a pause timeout such as -EAGAIN, -EBUSY, or
     -ETIMEDOUT), set dma->rx_terminating = true while keeping
     dma->rx_running = 1, dma->rx_pause_pending = true, and
     dma->rx_err = false, and set retry = false.

2. Derive recover from persistent state under port->lock:

     recover = dma->rx_err || (dma->rx_running && dma->rx_terminating);
     fall_back_pio = dma->rx_err;

   And in serial8250_rx_dma_recovering() (8250.h):

     return up->dma &&
            (up->dma->rx_pause_pending ||
             ((up->dma->rx_err || up->dma->rx_running) &&
              up->dma->rx_terminating));

3. In if (recover), run ret = dmaengine_terminate_sync(dma->rxchan):
   - While dmaengine_terminate_sync() runs outside port->lock,
     serial8250_rx_dma_recovering() is true (keeping RX interrupts
     masked in UART_IER and skip_rx = true) and dma->rx_terminating is
     true (blocking dma_rx_complete() and serial8250_rx_dma()).
   - If dmaengine_terminate_sync(dma->rxchan) fails (ret != 0), latch
     dma->rx_err = true under port->lock and return early so RX stays
     masked and the buffer stays owned by DMA.
   - If dmaengine_terminate_sync(dma->rxchan) succeeds (ret == 0), the
     existing post-sync cleanup block clears rx_pause_pending,
     rx_terminating, and rx_running and restores UART_IER with
     dma->rx_err == false.

Because 8250 RX DMA is armed on-demand when rx_running == 0 and
!rx_err, any trigger-tail bytes remaining in the UART RX FIFO below the
RDI trigger level are drained via PIO on UART_IIR_RX_TIMEOUT, and the
next UART_IIR_RDI interrupt submits a fresh RX DMA descriptor — so RX
DMA remains active for the rest of the open session.

(Regarding the dw-axi-dmac driver mentioned on v10 7/8:
drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c has separate provider
bugs where dw_axi_dma_interrupt() clears CH_INTSTATUS across all
channels including DWAXIDMAC_IRQ_SUSPENDED, dma_chan_pause() leaves
DMAC_CHSUSPREG and chan->is_paused = true set when returning -EAGAIN,
and dma_chan_terminate_all() only clears DMAC_CHEN without clearing
DMAC_CHSUSPREG or chan->is_paused. Those belong in a dw-axi-dmac
driver fix, whereas the non-sticky pause-timeout recovery above ensures
8250_dma.c never stalls RX indefinitely on a pause timeout while
keeping RX DMA enabled for subsequent transfers.)

Thanks,
Raul

