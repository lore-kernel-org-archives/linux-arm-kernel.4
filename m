Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB49606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pvuntx9w;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXKsPirb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OLVnqCp6M5k/c3jqzvLSa4RVUfHpaO5qFBgd0x2mVsM=; b=Pvuntx9w0StHdzKlKl8w8o7wu3
	0GwR6dbaF2YCsiEk8+0s+/cjJ/rLtRCLtbf2iO3eR4o/oJgaXEf29hbniZfsa2J2CQe3Jkai6UiAU
	i+iC9TugKrdJ5fAKavpIpEvw6u0FBDzsXi0Bo9bqdMwn+ZDvZdj3BidzUaTHXYgi1lyyMyYnssxA9
	nGZJgM+LkRcOWfAkdtTs588AD7Wk4pcTIaVDvHKim0OWA4l3PLH18ivo8zA9S5xOW0d5+VQy8RHet
	Rr5W1kV0WEFjdBzknZYLKLYyA1mdjPp5n/brgxlsTq/0GI5U1jH4DRVul1sY3eqo517tkEJVwnsJg
	fBesl4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEcL-0000000AIcL-0aL2;
	Wed, 25 Nov 2026 15:09:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEcA-0000000AIbV-0bwp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:09:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A949400FF;
	Wed, 25 Nov 2026 15:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9AD1F000C0;
	Wed, 25 Nov 2026 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619332;
	bh=OLVnqCp6M5k/c3jqzvLSa4RVUfHpaO5qFBgd0x2mVsM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TXKsPirb0GlNJPk/07KbBe0c0wR5RjvIBtYr16UeF3xX69fnZ3udfv8vXpWuhKrGD
	 WWE+N+m3G1M+QhwXI/dcsj/gB3q/ipAbd/cNVKerkVa8Ws5lNiGjQ6Y3UQzCOBrVA6
	 viWcxku89Sj9SVccbB8CcO7m2LMIpvroG+BzRSDoxKvb00nkwnpfoaoWhIemXSwHes
	 eTXQbSiUNZB6/HAtdTnHLSsesp4BiyL3BrW9r/0W5AoPjhjUw6yrcCqWoKyArWiRBT
	 hqaJxF2R91gN39PtAF7AMnq7MEAgLYFa2rwTctnrhjIsLHz+yhwrzoGv8XJJ2/MMG6
	 lz4Bj0F01IbYQ==
Subject: Re: [PATCH net-next v9 1/2] net: ti: icssg-prueth: Add Frame
 Preemption MAC Merge support
From: netdev-bot+sashiko@kernel.org
To: m-malladi@ti.com
Cc: marco.crivellari@suse.com, haokexin@gmail.com, kees+treewide@kernel.org,
 laixiangwu@cmss.chinamobile.com, arnd@arndb.de, horms@kernel.org,
 basharath@couthit.com, parvathi@couthit.com, vladimir.oltean@nxp.com,
 rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org,
 edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, vigneshr@ti.com
Date: Wed, 25 Nov 2026 15:08:50 +0000
Message-ID: <179561933095.3135.5750144040401521848@kernel.org>
In-Reply-To: <20261121144618.180542-2-m-malladi@ti.com>
References: <20261121144618.180542-2-m-malladi@ti.com>
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

Thank you for your contribution! Sashiko AI review found 11 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 5 · Low: 6

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] After a firmware restart while the link is up
  (prueth_emac_restart(), which runs when ports join or leave a bridge…
- [Medium] emac_tc_setup_mqprio() always finishes by calling
  icssg_iet_change_preemptible_tcs().
- [Medium] icssg_config_ietfpe() decides whether to program FPE by
  reading emac->link (`if (!READ_ONCE(emac->link)) return 0;`) while…
- [Medium] Several things here depend on firmware state the driver never
  resets.
- [Medium] FPE TX is turned on by the R30 command
  ICSSG_EMAC_PORT_PREMPT_TX_ENABLE; the driver's own comment says the…
- [Low] emac_tc_setup_mqprio() splits a single logical update into three
  separate fpe_lock critical sections.
- [Low] On every link-down, icssg_qos_link_state_update() writes the
  firmware config bytes PRE_EMPTION_ENABLE_TX=0 and…
- [Low] emac_tc_setup_mqprio() reports user-triggerable configuration
  errors with netdev_err() instead of NL_SET_ERR_MSG_MOD(mqprio->extack,…
- [Low] Two changes unrelated to FPE are folded into the patch without
  mention in the commit message.
- [Low] The register-map comment for EXPRESS_PRE_EMPTIVE_Q_MAP in
  icssg_switch_map.h still reads "For marking Packet as priority/express…
- [Low] icssg_qos_link_state_update() reads iet->fpe_enabled for its
  debug message after icssg_iet_change_preemptible_tcs() has dropped…

--

net: ti: icssg-prueth: Add Frame Preemption MAC Merge support

This commit adds a QoS submodule to the ICSSG driver. It configures IET
Frame Preemption in firmware, including the verify state machine and the
express/preemptible queue mask. It also hooks mqprio offload through
ndo_setup_tc and re-applies FPE state on link up/down from
emac_adjust_link(). The ethtool MAC Merge ops are wired up in the
following patch.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 9bb67e185a3ea..d8431132c34b0 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c

[ ... ]

> @@ -392,6 +392,8 @@ static void emac_adjust_link(struct net_device *ndev)
>  		} else {
>  			icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
>  		}
> +
> +		icssg_qos_link_state_update(ndev);
>  	}

[Severity: Medium]
Is FPE silently lost after a firmware restart while the link is up?

prueth_emac_restart() runs from icssg_change_mode() when ports join or
leave a bridge or HSR. It stops all cores and then calls
prueth_emac_common_start(). That runs icssg_config(), whose
memset_io(config, 0, TAS_GATE_MASK_LIST0) clears
EXPRESS_PRE_EMPTIVE_Q_MASK and Q_MAP. It then sets emac->link to 0 and
calls emac_adjust_link() before prueth_emac_start() has booted the
firmware.

With phydev->link set, the new hook then runs against halted firmware:

prueth_emac_common_start()
  emac_adjust_link()
    icssg_qos_link_state_update()
      icssg_iet_change_preemptible_tcs()
        icssg_config_ietfpe(ndev, true)
          icssg_set_port_state(emac, ICSSG_EMAC_PORT_PREMPT_TX_ENABLE)

The halted firmware can't acknowledge the R30 command, so the call times
out after 10 ms. The fallback path then clears ENABLE_TX/ENABLE_VERIFY,
sets fpe_active = false and resets the mask to all-express. The
unconsumed PREMPT command also stays in the mailbox.

Once the firmware is running, prueth_emac_restart() only re-sends
PORT_FORWARD:

	/* Enable forwarding for both PRUeth ports */
	ret = icssg_set_port_state(emac0, ICSSG_EMAC_PORT_FORWARD);
	ret |= icssg_set_port_state(emac1, ICSSG_EMAC_PORT_FORWARD);

emac->link is already 1, so phylib reports no change and
icssg_qos_link_state_update() is not called again.

Would preemption and the preemptible queue mapping then stay off until
the next link flap? Meanwhile fpe_enabled stays true, so get_mm() (added
in the next patch, "Add ethtool ops for Frame Preemption MAC Merge")
would report tx_enabled=1, tx_active=0. This doesn't appear to be fixed
later in the series either.

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> index df93d15c5b786..f73b8f5fca956 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> @@ -44,10 +44,11 @@
>  #include "icssg_config.h"
>  #include "icss_iep.h"
>  #include "icssg_switch_map.h"
> +#include "icssg_qos.h"
>  
> -#define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
> -#define PRUETH_MIN_PKT_SIZE     (VLAN_ETH_ZLEN)
> -#define PRUETH_MAX_PKT_SIZE     (PRUETH_MAX_MTU + ETH_HLEN + ETH_FCS_LEN)
> +#define PRUETH_MAX_MTU		(2000 - ETH_HLEN - ETH_FCS_LEN)
> +#define PRUETH_MIN_PKT_SIZE	(VLAN_ETH_ZLEN)
> +#define PRUETH_MAX_PKT_SIZE	(PRUETH_MAX_MTU + ETH_HLEN + ETH_FCS_LEN)

[Severity: Low]
This isn't a bug, but two changes here aren't related to FPE and aren't
mentioned in the commit message: the whitespace-only change to these
three defines, and the move of enum icssg_ietfpe_verify_states from
icssg_config.h to icssg_qos.h. Could they be split out, or at least
noted in the commit message?

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_qos.c b/drivers/net/ethernet/ti/icssg/icssg_qos.c
> new file mode 100644
> index 0000000000000..55ddf7669530c
> --- /dev/null
> +++ b/drivers/net/ethernet/ti/icssg/icssg_qos.c
> @@ -0,0 +1,327 @@

[ ... ]

> +static void icssg_iet_set_preempt_mask(struct prueth_emac *emac)
> +{

[ ... ]

> +		for (tc = 0; tc < num_tc; tc++) {
> +			if (iet->preemptible_tcs & BIT(tc)) {
> +				for (i = qopt->offset[tc]; i < qopt->offset[tc] + qopt->count[tc]; i++) {
> +					writeb(BIT(4),
> +					       config + EXPRESS_PRE_EMPTIVE_Q_MAP + i);

[Severity: Low]
This isn't a bug, but the register map comment for this offset in
icssg_switch_map.h still says:

/* For marking Packet as priority/express (this feature is disabled) or
 * cut-through/S&F.
 */
#define EXPRESS_PRE_EMPTIVE_Q_MAP                          0x0034

This function now programs the region as a preemption map. It writes the
undocumented value BIT(4) for preemptible queues and writes 0 to all
ICSSG_MAX_TC_QUEUES entries on every reset. That reset would also clear
any cut-through/S&F encoding the comment says these bytes carry.

Could the comment be updated, and BIT(4) given a named constant?

> +					prempt_mask &= ~BIT(i);
> +				}
> +			}
> +		}
> +		writeb(prempt_mask, config + EXPRESS_PRE_EMPTIVE_Q_MASK);
> +		return;
> +	}
> +
> +reset_hw:
> +	/* Reset to default: all queues as express */
> +	for (i = 0; i < ICSSG_MAX_TC_QUEUES; i++)
> +		writeb(0, config + EXPRESS_PRE_EMPTIVE_Q_MAP + i);
> +	writeb(ICSSG_EXPRESS_Q_MASK_ALL, config + EXPRESS_PRE_EMPTIVE_Q_MASK);
> +}

[Severity: Low]
Is this reset meant to run on every link-down, whatever the FPE state?

The link-down branch of icssg_qos_link_state_update() always ends up
here. It doesn't check fpe_enabled, fpe_active or preemptible_tcs, and it
runs in every firmware mode (EMAC, switch, HSR/PRP).

icssg_config() leaves EXPRESS_PRE_EMPTIVE_Q_MASK at 0 after each firmware
start, and no init path programs it. So the byte reads 0 until the first
link-down and ICSSG_EXPRESS_Q_MASK_ALL afterwards, even when FPE is never
configured.

The commit message says link events are handled "based on fpe_enabled
and fpe_active flags". Would programming the default mask in
icssg_config(), or gating these writes on FPE state, keep it consistent?

> +
> +static int icssg_iet_verify_wait(struct prueth_emac *emac)
> +{

[ ... ]

> +	ret = readb_poll_timeout(config + PRE_EMPTION_VERIFY_STATUS,
> +				 status,
> +				 status == ICSSG_IETFPE_STATE_SUCCEEDED ||
> +				 status == ICSSG_IETFPE_STATE_FAILED,
> +				 delay_us,
> +				 timeout_us);

[Severity: Medium]
Can the first sample here be a stale SUCCEEDED left over from an earlier
session?

The firmware writes PRE_EMPTION_VERIFY_STATUS and PRE_EMPTION_ACTIVE_TX,
and the driver never resets them. They sit above TAS_GATE_MASK_LIST0, so
the memset_io(config, 0, TAS_GATE_MASK_LIST0) in icssg_config() doesn't
clear them. The link-down path in icssg_qos_link_state_update() only
clears ENABLE_TX/ENABLE_VERIFY and the software verify_status.

readb_poll_timeout() checks the condition on its first read, before any
sleep. A leftover SUCCEEDED would satisfy the poll at once, unless the
firmware has already overwritten VERIFY_STATUS by the time it
acknowledges PREMPT_TX_ENABLE.

icssg_config_ietfpe() would then read a possibly stale ACTIVE_TX, set
fpe_active = true and program the preemptible queues. That would happen
before verify has finished on the new link, possibly with a different
partner.

The same applies when FPE is re-enabled while already active. It also
applies to the no-verify path, which reads ACTIVE_TX once after
usleep_range(100, 200).

Does the firmware guarantee these bytes are cleared before the R30
acknowledgement, or should the driver reset them before re-arming?

[ ... ]

> +int icssg_config_ietfpe(struct net_device *ndev, bool enable)
> +{

[ ... ]

> +	lockdep_assert_held(&iet->fpe_lock);
> +
> +	if (!READ_ONCE(emac->link)) {
> +		netdev_dbg(ndev, "cannot change IET/FPE state when interface is down\n");
> +		return 0;
> +	}

[Severity: Medium]
Is this check actually serialized against link changes?

emac_adjust_link() writes emac->link under phydev->lock from the phylib
state machine, not under fpe_lock. It also publishes the new value and
sends PORT_DISABLE/PORT_FORWARD before it takes fpe_lock inside
icssg_qos_link_state_update().

On link-down, something like this looks possible:

tc / set_mm path                     phylib (phydev->lock held)
mutex_lock(&iet->fpe_lock)
READ_ONCE(emac->link) == 1
                                     WRITE_ONCE(emac->link, 0)
                                     icssg_set_port_state(PORT_DISABLE)
                                     icssg_qos_link_state_update()
                                       mutex_lock(&iet->fpe_lock) blocks
icssg_set_port_state(PREMPT_TX_ENABLE)
icssg_iet_verify_wait()

The tc/set_mm request would fail and roll back. The PHY state machine
would also stall for up to 3 * verify_time_ms (about 384 ms). Without
verify, ACTIVE_TX could read 1 and set fpe_active = true, and the
link-down branch never sends PREMPT_TX_DISABLE to undo it.

On link-up, a caller that sees link == 1 could send PREMPT_TX_ENABLE and
start verify before emac_adjust_link() has configured speed/IPG and sent
PORT_FORWARD. That could make the request fail spuriously.

The commit message says fpe_lock prevents "races between ethtool config,
qdisc setup, and link events". Does that hold, given that the link state
being tested is protected by a different lock?

[ ... ]

> +static int emac_tc_setup_mqprio(struct net_device *ndev, void *type_data)
> +{

[ ... ]

> +	/* Validate parameters */
> +	if (qopt->num_tc > ICSSG_MAX_TC_QUEUES) {
> +		netdev_err(ndev, "Number of traffic classes (%u) exceeds hardware limit\n",
> +			   qopt->num_tc);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (mqprio->flags & TC_MQPRIO_F_SHAPER) {
> +		netdev_err(ndev, "traffic shaping is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (mqprio->flags & (TC_MQPRIO_F_MIN_RATE | TC_MQPRIO_F_MAX_RATE)) {
> +		netdev_err(ndev, "per-queue rate limiting is not supported\n");
> +		return -EOPNOTSUPP;
> +	}

[Severity: Low]
Could these use NL_SET_ERR_MSG_MOD(mqprio->extack, ...) instead of
netdev_err()? Users can trigger these errors, so tc only sees a bare
-EOPNOTSUPP while the kernel log gets an error on every attempt.

[ ... ]

> +	ret = icssg_iet_change_preemptible_tcs(emac);
> +	if (ret) {
> +		mutex_lock(&iet->fpe_lock);
> +		iet->preemptible_tcs = 0;
> +		memset(&p_mqprio->qopt, 0, sizeof(p_mqprio->qopt));
> +		mutex_unlock(&iet->fpe_lock);
> +		netdev_reset_tc(ndev);
> +	}
> +	return ret;
> +}

[Severity: Medium]
Should every mqprio offload change re-run the full FPE handshake?

When fpe_enabled is true, icssg_iet_change_preemptible_tcs() calls
icssg_config_ietfpe(ndev, true). That re-sends PREMPT_TX_ENABLE and, with
mac_verify_configure set, polls verify for up to 3 * verify_time_ms (up
to 384 ms).

This happens even when preemptible_tcs == 0 and on qdisc teardown
(num_tc == 0). In those cases only the all-express mask needs
programming.

If the handshake fails (verify rejected, timeout, or ACTIVE_TX != 1), the
qdisc install fails here and the TC mapping is reset. A failure on the
link-up path leaves fpe_enabled true. So after a link flap to a partner
that doesn't support verify, would every later "tc qdisc add ... mqprio
hw 1" fail, even with no preemptible TCs?

Each successful mqprio change also re-runs the enable sequence, which
cycles TX preemption as a side effect.

[Severity: Low]
A related question about locking here. The publish, apply and rollback
steps each take fpe_lock separately, and the rollback only restores
software state.

Suppose a link-up runs icssg_qos_link_state_update() between the failed
icssg_iet_change_preemptible_tcs() and this rollback, and succeeds. Then
icssg_iet_set_preempt_mask() would program Q_MAP/Q_MASK from the qopt and
preemptible_tcs that are about to be rejected.

After the rollback the kernel has no mqprio offload and preemptible_tcs
is 0. Would the firmware still treat those queues as preemptible until
the next reconfiguration or link-down?

[ ... ]

> +void icssg_qos_link_state_update(struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_qos_iet *iet = &emac->qos.iet;
> +	int ret;
> +
> +	if (!READ_ONCE(emac->link)) {
> +		void __iomem *config = emac->dram.va + ICSSG_CONFIG_OFFSET;
> +
> +		/* Clear FPE active state on link-down so get_mm() reports
> +		 * accurate tx_active and verify_status while link is down.
> +		 * Also zero the FW preemption registers to prevent divergence
> +		 * if a concurrent enable was interrupted by link-down.
> +		 */
> +		mutex_lock(&iet->fpe_lock);
> +		writeb(0, config + PRE_EMPTION_ENABLE_TX);
> +		writeb(0, config + PRE_EMPTION_ENABLE_VERIFY);
> +		iet->fpe_active = false;
> +		iet->verify_status = ICSSG_IETFPE_STATE_DISABLED;
> +		icssg_iet_set_preempt_mask(emac);
> +		mutex_unlock(&iet->fpe_lock);
> +		return;
> +	}

[Severity: Medium]
Should this link-down teardown also send
ICSSG_EMAC_PORT_PREMPT_TX_DISABLE?

The R30 PREMPT_TX_ENABLE command turns FPE TX on, and the firmware is
still running at this point. This teardown only zeroes the DRAM bytes.

Two later paths also skip the disable command. First, if FPE is turned
off while the link is down (set_mm with tx_enabled=0 in the next patch,
or clearing preemptible_tcs via mqprio), icssg_config_ietfpe() returns 0
from its !emac->link check without touching the hardware. Second, on the
next link-up, icssg_iet_change_preemptible_tcs() returns early:

	if (!iet->fpe_enabled && !iet->preemptible_tcs) {
		mutex_unlock(&iet->fpe_lock);
		return 0;
	}

Would the last preemption command the firmware saw then stay
PREMPT_TX_ENABLE indefinitely, while the driver and get_mm() report FPE
as disabled? The answer depends on whether the firmware acts on the last
R30 command or on the PRE_EMPTION_ENABLE_TX byte, which can't be seen
from the driver.

The v9 changelog says the link-down clearing prevents HW/driver
divergence, but the command-level state still seems to diverge.

> +
> +	ret = icssg_iet_change_preemptible_tcs(emac);
> +	if (ret)
> +		netdev_dbg(ndev, "IET FPE %s failed\n",
> +			   str_enable_disable(iet->fpe_enabled));
> +}

[Severity: Low]
This is minor, but fpe_enabled is read here after
icssg_iet_change_preemptible_tcs() has dropped fpe_lock. Later in the
series, emac_set_mm() writes it under fpe_lock from the ethtool path.
Could KCSAN report this plain read? The message could also describe a
different operation than the one that failed.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121144618.180542-1-m-malladi%40ti.com

