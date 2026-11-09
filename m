Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6251C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 22:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AaaEizve;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2o3myNT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=APuVGr9Syfi20cMf1JwWjHvFw/aqU07E3GrFheF9DSw=; b=AaaEizvewinndWnsuusGxIjnC2
	9iqQvX7ESt9Ehu9O9O4zxXBj1vnHIsRWTx9b/x8mUCRddkscT36Cym+WZKw/Vn8rYz24vhEMMqpbv
	fzk2nCH+zyuVPs1F2MBdXSssVgrStfj4QkvgJCM7eh+H+iLoCzu9RRJ86AWUX8NsAO5+kPdUKDNHP
	IvJsGxJUvWO4fbBhMeZmhB5QIjXB+BQoN/BRJ4r+MBBJ4qHMMzyjfEmMZoCqS/yizYyx8pEg3FbDZ
	JV4LuzOkjnIUsAioTrsDHCY7fnBl17iNb1SzUsaVkwmtsUx/9AXOutLkORxwUuZRm0j8k6uv933lA
	5n7VSS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYJR-00000001v9p-2kRO;
	Mon, 09 Nov 2026 22:58:05 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYJO-00000001v9U-3nvH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 22:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794265083; x=1825801083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gLk2yVe76ajtu1KrWCk+zmfgNuAUqzVJtyq7tY5vbag=;
  b=P2o3myNTBMmgQCZWcFtsSLgSIu6plTgz4TwXfcWlrOzcv8TQwJ46cMgQ
   qjrCqW9gh804hq+oqdxlEm276NGvCYukickQw83yR9S1lnbnZeMMFjtOD
   z7cc2MJ2gLcAS0V5Zuz/bBAJcfsZZwKawd+9mva+C3CdpbEk+YdVn4QTF
   B4Oyh0zNOuNOeu+fVBm4eQJAv4fw03EIvIzXl20QS5ZIH4JXenbr7S4yk
   0mE0dOLZ4whIk6kPOwBWpHTfR7RTSxUlEVMEWLrZUGP6502r+VcANu+54
   rZyAFgNedEN0fLy5YVzoosE1MYWpVSjysa/OXw5qeANcRGQEE1DV5JU+C
   g==;
X-CSE-ConnectionGUID: BHwsZ7TRS1ufsS8lLuzj3g==
X-CSE-MsgGUID: m6dlmEwWSUWwICc7gRs6ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2899351"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2899351"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:58:02 -0800
X-CSE-ConnectionGUID: T3RHJ0ZVRUiHpNbWBPbDdg==
X-CSE-MsgGUID: /OnDlxXBTTKRLkahbt7bZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7998415"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:57:55 -0800
Date: Tue, 10 Nov 2026 00:57:53 +0200
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
Subject: Re: [PATCH v10 2/8] serial: serialize asynchronous write wakeups
 with the port lock
Message-ID: <avJP8Sym_LQX9UVc@ashevche-desk.local>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
 <20261108-submit-serial-8250-dma-cancel-v1-v10-2-e6227ddb95b1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-2-e6227ddb95b1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_145802_965609_81C8BFE3 
X-CRM114-Status: GOOD (  27.46  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 08:50:11PM -0700, James Hilliard wrote:
> uart_write_wakeup() expects the UART port lock to be held. Several worker,
> DMA completion and interrupt paths call it without that lock, including
> indirect calls from uart_handle_cts_change() and the transmit helpers.
> 
> Take the port lock around these notifications or their transmit helper.
> Keep sleeping SPI and regmap accesses outside the locked region, and keep
> the FSL LPUART completion lock held through its wakeup. Acquire the port
> lock after releasing private channel locks to preserve the ordering used
> by UART callbacks. In the MUX timer, publish available FIFO space under
> the port lock and keep the hardware FIFO-drain wait outside it.
> 
> Use plain port locking in hard-IRQ handlers and in helpers whose callers
> already mask interrupts. Atmel status handling is also called during
> resume, where lock_suspended is acquired with interrupts disabled; JSM
> interrupt processing holds its IRQ-saving board lock. Keep IRQ-saving
> locking in workers, tasklets and other mixed-context paths.
> 
> Take the port lock after requesting the ST ASC interrupt and hold it
> through startup's transmit servicing and RX interrupt enable. The transmit
> helper can notify writers even when the FIFO is empty, and serial core
> calls startup without holding the port spinlock.
> 
> Use IRQ-safe locking in the Atmel RX and TX tasklets and SB1250 termios
> path, since their interrupt handlers now acquire the same port lock.
> Preserve the caller's interrupt state when releasing those locks.
> 
> On SB1250, lock modem-state updates after reading and filtering the change
> status, and wake modem-status waiters after unlocking. Take the TX lock
> inside its service routine so RX-only interrupts need no acquisition.
> Keep that lock across x_char handling, FIFO consumption and the decision
> to mask TX interrupts: a writer must not enqueue data and enable TX between
> the empty-FIFO check and the interrupt-mask write. Each TX invocation sends
> at most one character.
> 
> Serialize CLPS711x TX servicing and its interrupt-enable state with the
> port lock. Disable TX interrupts without waiting in stop_tx(), since a
> threaded handler may need that same lock. Have an already queued handler
> leave stopped output untouched, and drain it outside the lock during
> shutdown before the transmit FIFO can be released.
> 
> SCCNXP handles interrupts under a controller lock which its UART callbacks
> acquire with the port lock already held. Collect the ports needing wakeups
> in an unsigned long bitmap while servicing the controller, then release
> that lock before visiting the set bits, taking each port lock and
> rechecking the wakeup threshold. Removal drains the IRQ or timer before
> unregistering the ports.
> 
> This serializes write notifications with port-locked serial-core state
> changes, allowing readiness and transmit-storage reservations to gate the
> notification without a check-versus-shutdown race.
> 
> Cover DZ TX servicing and JSM Classic modem notifications as well. On
> DECstation ZS, acquire the port lock before the SCC lock and notify writers
> after releasing the SCC lock. Defer normal TX restart after console output
> to a worker, since console output can already run under the port lock.
> Check transmitter readiness before consuming another character and drain
> the restart worker during shutdown and removal. Release Lantiq's hardware
> lock through the transmit helper's completion hook before notifying the
> line discipline.

...

> --- a/drivers/tty/serial/sb1250-duart.c
> +++ b/drivers/tty/serial/sb1250-duart.c

> -	if (delta & (M_DUART_IN_PIN0_VAL << S_DUART_IN_PIN_CHNG))
> -		uart_handle_cts_change(uport, !(delta & M_DUART_IN_PIN0_VAL));
> +	if (!(delta & ((M_DUART_IN_PIN2_VAL | M_DUART_IN_PIN0_VAL) <<
> +		       S_DUART_IN_PIN_CHNG)))

Just keep it a single line.

> +		return;
>  
> -	if (delta & (M_DUART_IN_PIN2_VAL << S_DUART_IN_PIN_CHNG))
> -		uport->icount.dsr++;
> +	scoped_guard(uart_port_lock, uport) {
> +		if (delta & (M_DUART_IN_PIN0_VAL << S_DUART_IN_PIN_CHNG))
> +			uart_handle_cts_change(uport, !(delta & M_DUART_IN_PIN0_VAL));
>  
> -	if (delta & ((M_DUART_IN_PIN2_VAL | M_DUART_IN_PIN0_VAL) <<
> -		     S_DUART_IN_PIN_CHNG))
> -		wake_up_interruptible(&uport->state->port.delta_msr_wait);
> +		if (delta & (M_DUART_IN_PIN2_VAL << S_DUART_IN_PIN_CHNG))
> +			uport->icount.dsr++;
> +	}

...

> --- a/drivers/tty/serial/sccnxp.c
> +++ b/drivers/tty/serial/sccnxp.c

> -static void sccnxp_handle_events(struct sccnxp_port *s)
> +static unsigned long sccnxp_handle_events(struct sccnxp_port *s)
>  {
> +	unsigned long wakeup = 0;
>  	int i;
>  	u8 isr;
>  
> @@ -491,20 +492,40 @@ static void sccnxp_handle_events(struct sccnxp_port *s)
>  		for (i = 0; i < s->uart.nr; i++) {
>  			if (s->opened[i] && (isr & ISR_RXRDY(i)))
>  				sccnxp_handle_rx(&s->port[i]);
> -			if (s->opened[i] && (isr & ISR_TXRDY(i)))
> -				sccnxp_handle_tx(&s->port[i]);
> +			if (s->opened[i] && (isr & ISR_TXRDY(i)) &&
> +			    sccnxp_handle_tx(&s->port[i]))
> +				wakeup |= BIT(i);

__set_bit()

>  		}
>  	} while (1);
> +
> +	return wakeup;
> +}

-- 
With Best Regards,
Andy Shevchenko



