Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41687606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nS8Sg/Rh;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S8mCPSey
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fK+KayHuMk1WLqGXM0FWu4AqIcNDWECGkJlS8riGoXQ=; b=nS8Sg/Rh8FVvuJ9aG9i0gOr31p
	o2rjBd7SrzMKeZU+Aw9N5+ta3BWetgY+VvROji/wvzFXkan7uPSSOz6kLfYFcDvz+eltj7hdNRm9u
	hJYfP44fLTx/cbmCiTMSS3J/dtD28NNnv6E3UeZ9NfPJ1YwJmsJFPgbv2UA33Mo1UhfHPxY5l8zeF
	dFSVlaliOQDHxkngL+JzH4Tsi8RYj5XHkWqrpoTd3F0UFBMkEbQzXMdxmn5E8D3fFquYxTGl5Zrpl
	zWezaf4IwwCr4k3Ep8yurWRH+0suVDg5T919c0TcTv9bpdf4BWYcqq1f/HOXCqOqLH6LJerl/0cnh
	FP1qzqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXc1-0000000Aa98-0dsH;
	Thu, 12 Nov 2026 16:25:21 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXbx-0000000Aa8B-3ZWa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794500718; x=1826036718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N5TD4x09GpjorduT+9U5ri+f2Wg+jHuK49uPpuooduc=;
  b=S8mCPSeyu35z5+dXyti2r3WaJxOLmJeFa32NaUFBikYqRzb8mTRDp6wR
   eOXOkzbk8uu2jpD5ZfM9FG5c79Fsj0y1BWTvRatt469OdXPsmIqa6ahfG
   Xt+AhBJeQFomnYKvMOK7Itln8IwqMp9jSlx11/wS1YyhIuBNzZ1WmBHuE
   +mUtU9y3tjk12GM/NgwKTCzZdaGnBrF1WxleazCYTKRGs0fUO8bHVailL
   MOVPFpPNZeuwhScvoQkgqFdnLHlAsG24FFjP+TEQniYQJ8yGIItTRnhGr
   W85vi4ul+2cyovHJrP3LCQ9rN0ZrVmBTzvt8YNBO+jLq9IZmrV4cca1bv
   A==;
X-CSE-ConnectionGUID: OYwTRo/HSQGmF56zC9aO1w==
X-CSE-MsgGUID: M7W1+nALR72Jr/ttXAKV9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3327918"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3327918"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:25:17 -0800
X-CSE-ConnectionGUID: TnkoF7cSQhGSY4qBUZnvsQ==
X-CSE-MsgGUID: fs1JvJIRS5GJfJVCmUIcXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8612454"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:25:10 -0800
Date: Thu, 12 Nov 2026 18:25:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raul E Rangel <rrangel@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v12 7/8] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
Message-ID: <avXoY3vG0JgNdWYJ@ashevche-desk.local>
References: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
 <20261111-submit-serial-8250-dma-cancel-v1-v12-7-9e3456bc2555@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-submit-serial-8250-dma-cancel-v1-v12-7-9e3456bc2555@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_082517_934129_A5E3A2AC 
X-CRM114-Status: GOOD (  31.47  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 03:16:32PM -0700, James Hilliard wrote:
> The generic RX timeout path pauses a transfer, copies its data and
> terminates it asynchronously. Clearing rx_running at that point lets a
> new receive reuse the buffer and cookie while the old callback has not
> yet run. Inspecting the new cookie cannot distinguish that callback from
> the completion of a new transfer.
> 
> Reserve the receive buffer until a worker has drained the canceled
> callbacks. Keep FIFO access separate from callback retirement: after a
> successful pause and termination, clear rx_running while rx_terminating
> prevents another descriptor from reusing the buffer. Deliver the paused
> data before allowing the interrupt handler to drain the FIFO through PIO.
> Normal retirement only releases ownership and leaves subsequent receive
> handling to the UART interrupt.
> 
> Preserve the normal completion-path LSR read and gate DMA resubmission on
> the receive interrupt enable, so stop_rx() prevents another transfer while
> the status read retains its existing side effects.
> 
> Reject new flush work and PIO receive handling during shutdown, including
> late Intel MID DMA timeouts. Stop and drain retirement work before freeing
> the channels and buffer. Once RX has stopped, allow the idle flush used by
> DesignWare LCR recovery during shutdown. Clear the shutdown guard before
> startup configures the UART and tests its interrupts.
> 
> Check pause failures before accessing the buffer. A successful pause is
> the quiescence guarantee, even when a provider still reports IN_PROGRESS.
> Also accept DMA_COMPLETE after a failed pause: completion can stop the
> channel before its callback acquires the port lock, leaving nothing for
> the provider to pause. Retire that completed transfer normally.
> 
> A failed pause with an incomplete cookie is ambiguous: hardware may have
> finished while its completion interrupt is still pending. Initially retain
> the transfer and retry pause and status in the worker. Mask receive
> interrupts to prevent a timeout storm and keep callbacks from copying or
> resubmitting this worker-owned transfer. Back off retries from 1 ms,
> allowing completion and shutdown to wake the worker immediately.
> 
> After one second of unsuccessful pause retries, stop the transfer with
> dmaengine_terminate_sync() outside the port lock. An indefinite wait could
> otherwise leave a request/response peer waiting for data that is stuck in
> a partial DMA buffer. Report that recovery discards the pending payload:
> without a stable residue it cannot safely be copied. Keep rx_running,
> rx_pause_pending and rx_terminating set until termination has stopped DMA
> and drained its callbacks. Then restore receive handling and allow another
> DMA descriptor, without latching a permanent PIO fallback for a pause
> timeout. This trades the stalled transfer's data for continued reception.
> 
> If synchronous termination fails, retain ownership and retry with a delay
> that doubles from 1 ms to one second. Report the first failure and ongoing
> failures every five seconds for this recovery. Completion and shutdown
> wake the retry wait; shutdown takes over final channel retirement. A
> permanent termination failure still leaves RX masked and its storage
> reserved: the pause retry budget does not guarantee recovery from a
> provider that cannot stop. Each flush starts with a fresh retry budget.
> 
> RX DMA admission already requires cmd_pause. A provider whose hardware
> cannot pause must advertise that correctly. If pause nevertheless returns
> -ENOSYS or -EOPNOTSUPP for an incomplete transfer, enter synchronous
> recovery immediately. Unsupported pause, DMA_ERROR and asynchronous
> termination failure retain the error fallback to PIO until reopen.
> 
> Keep the requested enables in the existing IER shadow and filter hardware
> writes during pause retries and recovery, including termios, RS485 and
> overrun-backoff changes. Apply the current enables after retirement so
> stop_rx() and shutdown remain effective. Hold a runtime PM reference
> around worker register accesses.
> 
> Abort the DesignWare idle sequence when RX cannot be stopped. Allow the
> empty-FIFO timeout workaround once DMA has released the FIFO, including
> while callbacks retire. Exclude FIFO resets during RX DMA recovery.

...

> +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> +{
> +	struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma, rx_flush_work);
> +	struct uart_8250_port *p = dma->port;
> +	unsigned int delay_us = 1 * USEC_PER_MSEC;
> +	ktime_t start = ktime_get();
> +	bool recover, retry, restore_rx, fallback;
> +	bool timed_out = false;
> +	int ret = 0;

Once set, it gets never cleared.

> +	guard(serial8250_rpm)(p);
> +
> +	for (;;) {
> +		scoped_guard(uart_port_lock_irqsave, &p->port) {
> +			/* Shutdown cancels this work and drains both DMA channels. */
> +			if (dma->shutting_down)
> +				return;
> +			/* Serialize reset with completion and shutdown notifications. */
> +			WRITE_ONCE(dma->rx_pause_wakeup, false);
> +			retry = dma->rx_pause_pending && !dma->rx_terminating;
> +			if (retry) {
> +				ret = serial8250_rx_dma_try_flush(p);
> +				retry = dma->rx_pause_pending && !dma->rx_terminating;
> +				if (retry &&
> +				    ktime_ms_delta(ktime_get(), start) >= 1 * MSEC_PER_SEC) {
> +					dma->rx_terminating = true;
> +					timed_out = true;
> +					retry = false;
> +				}
> +			}
> +			recover = dma->rx_err || (dma->rx_running && dma->rx_terminating);
> +			fallback = dma->rx_err;
> +		}
> +		if (!retry)
> +			break;
> +		/* Notifications also cover completion or shutdown before sleeping. */
> +		wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dma->rx_pause_wakeup),
> +				     ns_to_ktime(delay_us * NSEC_PER_USEC));
> +		delay_us = min(delay_us * 2, 1 * USEC_PER_SEC);
> +	}
> +
> +	if (timed_out)
> +		dev_warn(p->port.dev, "RX DMA pause timed out: %d; discarding pending data\n", ret);

So here is the potential to get timed_out == true and stale ret. Yes, I see
that code couples them, but the logic of the above is quite complicated.

The scoped_guard() piece better to be in a separate helper (and replaced with
guard()() to make it on indentation level down).

> +	if (recover) {
> +		if (serial8250_rx_dma_terminate(p))
> +			return;
> +	} else {
> +		dmaengine_synchronize(dma->rxchan);
> +	}
> +
> +	scoped_guard(uart_port_lock_irqsave, &p->port) {
> +		restore_rx = recover || dma->rx_pause_pending;
> +		dma->rx_pause_pending = false;
> +		dma->rx_terminating = false;
> +		dma->rx_running = 0;
> +		if (dma->shutting_down)
> +			return;
> +
> +		if (!restore_rx)
> +			return;
> +
> +		/* Apply the current enables, including any intervening stop_rx(). */
> +		serial8250_out_IER(p, p->ier);
> +	}
> +	if (fallback)
> +		dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
>  }

...

Overall it makes me think if this is a common DMA issue when we try to stop
ongoing transfers, shouldn't it be solved once for all somewhere in DMAengine?

-- 
With Best Regards,
Andy Shevchenko



