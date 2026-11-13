Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEFD606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SoQdoQcZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GSj6d/+3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kIZ22OefzW2mHncUHbyDBewc8tS01xJKiXvT3NOowLQ=; b=SoQdoQcZ+6CFUp/zd2VBL8oCu/
	qK16dDU4HA86VwPnh8hF5ol3/Wly0mLD8GT1gcbU4pzxyus2v+XjzMBDqWQjIBPgv6SL2AXM8P+sb
	s9bxUWy5uxiah5Zy54YtvtMVG9eJRQFdiUkaaSR34KGZxCPmgjwehbOlQ6bgeaAHkMaTvcUg7SAhY
	XazEkPNALlXXkk9twDvhlK+FHYrXsgAsqXLeQZC4Q6m2kPbbxQtGqdsQDxhMFP7TpOlp4GL5+Y4GI
	9hQkEKeb0H5C7UOnjbF0Bnw0JlEgSGgJwJ7sHShqxzZmcAuqHbs/aVlF+VeQEY4UtqHaW/cm/xPe4
	LiIdlPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkCM-0000000Biys-46Be;
	Fri, 13 Nov 2026 05:51:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkCA-0000000Bith-2Otf;
	Fri, 13 Nov 2026 05:51:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D537F62570;
	Fri, 13 Nov 2026 05:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4D41F000C5;
	Fri, 13 Nov 2026 05:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549089;
	bh=kIZ22OefzW2mHncUHbyDBewc8tS01xJKiXvT3NOowLQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GSj6d/+3mPcDnKUnkLVCxuYBzZKAi+1n88G9VLS7aSUvWOZqtzpT2RqNRSpKEwWW7
	 cv9Ld8urLBSPObXZu9pfC3Uq1AYEs+crkPeGkjoJO8yhuwz4mjcOx3MlgvdkhR8PRX
	 efFpdLrc/A/Fjte22QdyUOa5qiJ+Pxcz433Irwgy7uJXGEtHg8BlAYzaALFkLPHK7O
	 lLMuE63CrP2yl68UnmyRXLSnv057lM2ZLbkP2kHgu+UOyNU5ScNVbzDjsQvuxcoJre
	 Fd2or5FIDJAkYaZiaG3ryrUUztbiHr8yn1GRFO1SpzwgypU0qEvLWqhwO2wMw/aAjc
	 ZLbvt8i8ibvPw==
Subject: Re: [PATCH net v5 3/4] net: phy: stop postponing PHY interrupts when
 a PHY PM callback fails
From: netdev-bot+sashiko@kernel.org
To: iav@iav.lv
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com,
 wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev,
 florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com,
 shenwei.wang@nxp.com, Haoning.CHENG@cn.bosch.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 05:51:28 +0000
Message-ID: <179454908812.2199510.10507965119613979569@kernel.org>
In-Reply-To: <20261111-b4-phylib-mac-pm-irq-v3-v5-3-bbfdb5afb7d3@iav.lv>
References: <20261111-b4-phylib-mac-pm-irq-v3-v5-3-bbfdb5afb7d3@iav.lv>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In mdio_bus_phy_resume() (drivers/net/phy/phy_device.c), the
  new err: path runs WRITE_ONCE(phydev->irq_suspended, false) after…
- [Medium] The commit message says a line that the new err path leaves
  disabled 'comes back on the next successful resume'.
- [Low] The patch moves 'phydev->suspended_by_mdio_bus = 1' in
  mdio_bus_phy_suspend() (drivers/net/phy/phy_device.c) from before…

--

net: phy: stop postponing PHY interrupts when a PHY PM callback fails

This patch changes mdio_bus_phy_suspend() so that a failed phy_suspend()
undoes the interrupt postponing and restarts the state machine. It also
moves the suspended_by_mdio_bus assignment so it happens only after
phy_suspend() succeeds. In mdio_bus_phy_resume(), a phy_init_hw() or
phy_resume() failure now clears irq_suspended, but a line that a postponed
interrupt disabled stays off.

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index d3815ee21541a..110c9dfcbd916 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -384,9 +385,20 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
>  	if (!mdio_bus_phy_may_suspend(phydev))
>  		return 0;
>  
> +	ret = phy_suspend(phydev);
> +	if (ret) {
> +		/* The PM core skips the resume callback of a device whose
> +		 * suspend callback failed.
> +		 */
> +		mdio_bus_phy_resume_irq(phydev);
> +		if (phy_uses_state_machine(phydev))
> +			phy_start_machine(phydev);
> +		return ret;
> +	}
> +
>  	phydev->suspended_by_mdio_bus = 1;

[Severity: Low]

This isn't a bug, but moving the suspended_by_mdio_bus assignment after
phy_suspend() also changes resume behaviour. The commit message doesn't
mention this.

Before, the flag stayed set when phy_suspend() failed. The resume callback
is skipped in that case, so nothing cleared it.

On a later cycle where mdio_bus_phy_may_suspend() returns false (WoL now
enabled, or the PHY already suspended by phy_detach()), the stale flag was
still set. mdio_bus_phy_resume() would then run phy_init_hw() and
phy_resume() on a PHY the MDIO bus did not suspend.

Could the commit message describe this change as well, so reviewers and
stable backporters can see it?

>  
> -	return phy_suspend(phydev);
> +	return 0;
>  }

[ ... ]

> @@ -424,6 +436,13 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
>  		phy_start_machine(phydev);
>  
>  	return 0;
> +
> +err:
> +	/* Stop postponing, but leave a line that a postponed interrupt
> +	 * disabled off: its handler may not reach a PHY that did not resume.
> +	 */
> +	WRITE_ONCE(phydev->irq_suspended, false);

[Severity: Medium]

What happens here if no interrupt was postponed during the transition?
In that case irq_rerun is false and the line is still enabled at the
irqchip.

Before this patch, irq_suspended stayed set after a failed resume. The
first assertion would then take the postpone branch in phy_interrupt(),
disable the line once and return IRQ_HANDLED without any MDIO access.

Now that irq_suspended is cleared here, the next assertion skips that
branch and goes straight to:

drivers/net/phy/phy.c:phy_interrupt() {
    ...
	mutex_lock(&phydev->lock);
	ret = phydev->drv->handle_interrupt(phydev);
	mutex_unlock(&phydev->lock);
    ...
}

That handler runs on a PHY whose phy_init_hw() or phy_resume() failed.
The comment above keeps a disabled line off because "its handler may not
reach a PHY that did not resume". Doesn't the same reasoning apply to a
line that is still enabled?

phy_init_hw() calls config_intr() before disable_autonomous_eee() and
before phy_resume(), and both of those can still fail. The PHY can
therefore have its interrupt sources armed even though resume returned an
error.

If the PHY is unreachable, a handler such as rtl8211f_handle_interrupt()
fails the status read, calls phy_error() (which does WARN_ON(1)) and
returns IRQ_NONE. The source is never cleared, so the
IRQF_ONESHOT | IRQF_SHARED threaded line can re-assert after each unmask.

Could this cause a stream of WARN splats until the spurious IRQ detector
disables the line for all of its users? On a shared line where another
device acks its own interrupt, the detector may never trip, and the WARN
would repeat on every interrupt.

If the PHY is reachable, the handler calls phy_trigger_machine() or
phy_process_error(). Either one restarts the state machine that this
error path deliberately left stopped.

Would phylib then be driving a PHY whose config_init, config_intr,
disable_autonomous_eee or drv->resume never finished?

[Severity: Medium]

The commit message says:

  The line comes back on the next successful resume; ...

Does that next resume actually re-initialise the PHY?
mdio_bus_phy_resume() clears suspended_by_mdio_bus before phy_init_hw()
and phy_resume() run:

drivers/net/phy/phy_device.c:mdio_bus_phy_resume() {
    ...
	if (!phydev->suspended_by_mdio_bus)
		goto no_resume;

	phydev->suspended_by_mdio_bus = 0;
    ...
}

phydev->suspended is cleared in only two places: in phy_init_hw() after a
successful soft_reset, and in __phy_resume() on success. So it stays true
in these cases:

  - soft_reset fails
  - the driver has no soft_reset, and config_init, config_intr,
    disable_autonomous_eee or drv->resume fails

On the next sleep cycle, mdio_bus_phy_may_suspend() ends with:

	return !phydev->suspended;

so mdio_bus_phy_suspend() returns 0 without calling phy_suspend() or
setting suspended_by_mdio_bus. The next mdio_bus_phy_resume() then jumps
to no_resume. There, mdio_bus_phy_resume_irq() does this because
irq_rerun is still set:

	if (phydev->irq_rerun) {
		phydev->irq_rerun = false;
		enable_irq(phydev->irq);
		irq_wake_thread(phydev->irq, phydev);
	}

and phy_start_machine() runs after it.

Doesn't this rerun handle_interrupt() on the same PHY that never resumed?
That is the case this error path is meant to prevent.

Clearing suspended_by_mdio_bus early is older than this patch. However,
the safety argument in the commit message relies on this recovery path.

> +	return ret;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3%40iav.lv

