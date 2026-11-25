Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D0606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2QnsHGZW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0Z0vJP+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n5cF3s3N7pWU3PiKTalYfogLnqIPzbP6ZoweIi9h20U=; b=2QnsHGZWTMHUSAHw4gQHSzmyE3
	NYmWW18OqpftPTPgu/YYSntbWKWELJAyInfPl2J+i8tnQ7T3KJ44sx3xWlGPdPc4jSelBfleZzPNE
	UQ+0BUgVsEgo4Lb+n5B3iiqgASC7z0+srvQFh3NjVjqPjyli5vlB8gUlxpWbwbWyDSMzCmFjRxu0g
	nQ9QDgUG8poZGrod9Mtla03meAruJJkHKBEFDQiZUPOvLO3h5Ztsj2B6BAdyJlXkhAU/OGBi/Hkio
	HkVHWhaHhIdAEt/wyjqMd5/UYYWTryXMKH+r3QBMgh9VdeLzr7/0gQBwafWTQVH4mm1PGnO94y7Lx
	SLk2ZooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEcK-0000000AIc7-40hL;
	Wed, 25 Nov 2026 15:09:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEcC-0000000AIbb-0T2R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:09:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 455B962E18;
	Wed, 25 Nov 2026 15:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4061F000C0;
	Wed, 25 Nov 2026 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619335;
	bh=n5cF3s3N7pWU3PiKTalYfogLnqIPzbP6ZoweIi9h20U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k0Z0vJP+91w5m9SI1iM32YY9t2t29GdoL6p0ySqljn0L/U/lMAkExEoFCV2ScR16V
	 QGuYf4juz5uQ+INdv83ThXFBsWhx/Ddadg5brxkgxJ6M3sLUPF/UXMtm4cBLGOcqgr
	 GqBQ4AUnSicIDQWu2m68mWUcOLe50IDHMBC5pOx3cvId4ZzcBe3imEKbTa1yV3jqwk
	 iSjO5OTsVC9wXRp/LWs9B1MJgsdUIK7DVmvyZgVqupmxPyVNQlI02GCHihHwn8e2Y0
	 CkHnAOqiok+tux603ulwANecfNBFlbkzdb9RZKJvhzSrluilM+pkGc0vuxvLJ6h5xR
	 0Tsb0dSIlJSTg==
Subject: Re: [PATCH net-next v9 2/2] net: ti: icssg-prueth: Add ethtool ops
 for Frame Preemption MAC Merge
From: netdev-bot+sashiko@kernel.org
To: m-malladi@ti.com
Cc: marco.crivellari@suse.com, haokexin@gmail.com, kees+treewide@kernel.org,
 laixiangwu@cmss.chinamobile.com, arnd@arndb.de, horms@kernel.org,
 basharath@couthit.com, parvathi@couthit.com, vladimir.oltean@nxp.com,
 rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com, kuba@kernel.org,
 edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, vigneshr@ti.com
Date: Wed, 25 Nov 2026 15:08:53 +0000
Message-ID: <179561933355.3135.14778128780862239242@kernel.org>
In-Reply-To: <20261121144618.180542-3-m-malladi@ti.com>
References: <20261121144618.180542-3-m-malladi@ti.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] emac_get_mm_stats()
  (drivers/net/ethernet/ti/icssg/icssg_ethtool.c) fills the u64 fields…
- [Medium] The new .get_mm()/.set_mm() report MAC Merge state in a way
  that breaks the ethtool MM uAPI contract.
- [Medium] After a failed emac_set_mm() with verification enabled, the
  driver is left with iet->fpe_enabled=false and…
- [Medium] PRE_EMPTION_VERIFY_STATUS is firmware-owned DRAM.
- [Low] The commit message says "emac_set_mm() programs all config fields
  into hardware before invoking icssg_config_ietfpe()", and the comment…
- [Low] icssg_qos_validate_tx_min_frag_size() in
  drivers/net/ethernet/ti/icssg/icssg_qos.h re-implements the core…
- [Low] The commit message says that on failure 'the fallback path in
  icssg_config_ietfpe() already disables TX preemption in hardware', and…

--

net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

This adds .get_mm(), .set_mm() and .get_mm_stats() to the icssg ethtool
ops, along with PA stats registers for the preemption counters. It also
moves the stat table sizes to ARRAY_SIZE(), validates tx_min_frag_size,
and initializes verify_status to the disabled state in icssg_qos_init().

> emac_set_mm() programs all config fields into hardware before invoking
> icssg_config_ietfpe(). On failure the fallback path in
> icssg_config_ietfpe() already disables TX preemption in hardware, so
> only fpe_enabled is forced off; the other fields (tx_min_frag_size,
> verify_time_ms, mac_verify_configure) are kept as programmed to keep
> driver and hardware state consistent.

[Severity: Low]
Is this description accurate? emac_set_mm() does not touch any registers
itself. It only assigns iet->verify_time_ms, tx_min_frag_size,
fpe_enabled and mac_verify_configure.

All register writes happen inside icssg_config_ietfpe(), and only when
the link is up:

	if (!READ_ONCE(emac->link)) {
		netdev_dbg(ndev, "cannot change IET/FPE state when interface is down\n");
		return 0;
	}

PRE_EMPTION_VERIFY_TIME is written only when enable &&
iet->mac_verify_configure. The fallback path then clears verify enable
again:

fallback:
	writeb(0, config + PRE_EMPTION_ENABLE_TX);
	writeb(0, config + PRE_EMPTION_ENABLE_VERIFY);

So after a failure, the retained mac_verify_configure no longer matches
hardware. The comment in the emac_set_mm() error branch ("New config
values are already programmed in HW registers") has the same problem.

Could the commit message and the comment describe what the error path
actually does? A failed set_mm returns an error but leaves the new values
visible via get_mm.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> index b715af21d23ac..26892b603e1db 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c

[ ... ]

> @@ -294,6 +297,121 @@ static int emac_set_per_queue_coalesce(struct net_device *ndev, u32 queue,
>  	return 0;
>  }
>  
> +static int emac_get_mm(struct net_device *ndev, struct ethtool_mm_state *state)
> +{

[ ... ]

> +	mutex_lock(&iet->fpe_lock);
> +	state->tx_enabled = iet->fpe_enabled;
> +	state->tx_min_frag_size = iet->tx_min_frag_size;
> +	state->verify_enabled = iet->mac_verify_configure;
> +	state->verify_time = iet->verify_time_ms;
> +	state->tx_active = iet->fpe_active;
> +	verify_status = iet->verify_status;
> +	mutex_unlock(&iet->fpe_lock);

[ ... ]

> +	case ICSSG_IETFPE_STATE_FAILED:
> +		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
> +		break;

[Severity: Medium]
Can emac_get_mm() ever reach this case, or the VERIFYING and INITIAL
cases?

When verification fails, icssg_iet_verify_wait() stores
ICSSG_IETFPE_STATE_FAILED in iet->verify_status. icssg_config_ietfpe()
then goes through disable_tx to fallback and overwrites it while
fpe_lock is still held:

disable_tx:
	icssg_set_port_state(emac, ICSSG_EMAC_PORT_PREMPT_TX_DISABLE);
fallback:
	...
	iet->verify_status = ICSSG_IETFPE_STATE_DISABLED;

emac_get_mm() reads verify_status under the same fpe_lock, so it looks
like it can only see the disabled or succeeded states.

emac_set_mm() also forces fpe_enabled to false and keeps
mac_verify_configure set. After "ethtool --set-mm ethX verify-enabled on
tx-enabled on" against a partner that does not support preemption,
MM_GET would report verify-enabled on, verify status disabled,
tx-enabled off and tx-active off.

Documentation/networking/ethtool-netlink.rst says that when
ETHTOOL_A_MM_VERIFY_ENABLED is true, the verify status should report
something other than initial or disabled. It also describes tx-enabled
as the administrative state, which may be inactive if verification
failed, with tx-active carrying the operational state.

The link-up and mqprio paths (icssg_qos_link_state_update() and
emac_tc_setup_mqprio() calling icssg_iet_change_preemptible_tcs(), which
calls icssg_config_ietfpe()) hit the same failure but leave fpe_enabled
true. So the same hardware outcome is reported differently depending on
the path.

Should the failed status be kept for get_mm, and tx_enabled be left as
the admin state?

> +
> +	/* 802.3-2018 clause 30.14.1.6, says that the aMACMergeVerifyTime
> +	 * variable has a range between 1 and 128 ms inclusive. Limit to that.
> +	 */
> +	state->max_verify_time = ETHTOOL_MM_MAX_VERIFY_TIME_MS;
> +
> +	return 0;
> +}
> +
> +static int emac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
> +		       struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	mutex_lock(&iet->fpe_lock);
> +	iet->verify_time_ms = cfg->verify_time;
> +	iet->tx_min_frag_size = cfg->tx_min_frag_size;
> +	iet->fpe_enabled = cfg->tx_enabled;
> +	iet->mac_verify_configure = cfg->verify_enabled;
> +	err = icssg_config_ietfpe(ndev, cfg->tx_enabled);

[Severity: Medium]
Is PRE_EMPTION_VERIFY_STATUS ever reset before a new verification
starts? icssg_iet_verify_wait() only polls it:

	ret = readb_poll_timeout(config + PRE_EMPTION_VERIFY_STATUS,
				 status,
				 status == ICSSG_IETFPE_STATE_SUCCEEDED ||
				 status == ICSSG_IETFPE_STATE_FAILED,
				 delay_us,
				 timeout_us);

readb_poll_timeout() reads before it sleeps, so the first read happens
right after icssg_set_port_state() returns. If the firmware updates this
byte some time after acking the R30 command, a value left over from an
earlier attempt would decide the result.

A stale failed value would make the next emac_set_mm() fail at once with
-EIO, even after the partner is fixed. A stale succeeded value (disable,
then re-enable towards a partner that no longer supports preemption)
would turn on preemption without a fresh verification.

The non-verify branch waits usleep_range(100, 200) for the firmware to
update PRE_EMPTION_ACTIVE_TX. The verify branch reads
PRE_EMPTION_ACTIVE_TX right after seeing the succeeded state, with no
settle delay.

This depends on firmware behaviour that the driver can't see. Before
this series nothing set fpe_enabled to true, so emac_set_mm() is the
first path that lets userspace re-run this sequence repeatedly.

Would writing a non-terminal value such as ICSSG_IETFPE_STATE_INITIAL to
the status byte before sending the command avoid this?

> +	if (err) {
> +		/* icssg_config_ietfpe fallback disabled TX preemption in HW.
> +		 * New config values are already programmed in HW registers,
> +		 * so keep them. Only force fpe_enabled off to match HW state
> +		 * and prevent silent re-enable on the next link event.
> +		 */
> +		iet->fpe_enabled = false;

[Severity: Medium]
Does leaving mac_verify_configure set here make later partial MM_SET
requests fail?

After a failed verification, emac_get_mm() reports tx_enabled=false and
verify_enabled=true. ethnl_set_mm() builds cfg from get_mm() through
mm_state_to_cfg() and overrides only the attributes the user supplied.
It then checks:

net/ethtool/mm.c:ethnl_set_mm() {
	...
	if (cfg.verify_enabled && !cfg.tx_enabled) {
		NL_SET_ERR_MSG(extack, "Verification requires TX enabled");
		return -EINVAL;
	}
	...
}

So a request like "ethtool --set-mm ethX verify-time 10" or
"tx-min-frag-size 124" gets -EINVAL until the user also passes
tx-enabled or verify-enabled.

Should this branch also clear mac_verify_configure, or restore both
fields together?

[Severity: Low]
Does the fallback really disable TX preemption in firmware when the
enable command itself fails? In icssg_config_ietfpe():

	ret = icssg_set_port_state(emac,
				   enable ? ICSSG_EMAC_PORT_PREMPT_TX_ENABLE :
					    ICSSG_EMAC_PORT_PREMPT_TX_DISABLE);
	if (ret) {
		netdev_err(ndev, "TX preempt %s command failed\n",
			   str_enable_disable(enable));
		goto fallback;
	}

This skips disable_tx, so no ICSSG_EMAC_PORT_PREMPT_TX_DISABLE command
is sent. The fallback only rewrites the PRE_EMPTION_ENABLE_TX and
PRE_EMPTION_ENABLE_VERIFY config bytes. icssg_set_port_state() returns
-ETIMEDOUT after polling and leaves the posted command words in place.

If the firmware was only slow and finishes the enable command later,
could firmware preemption become active while the driver records
fpe_enabled=false and fpe_active=false, and get_mm() reports
tx_active=false?

Whether the firmware acts on a timed-out command is not visible from the
driver. The impact looks small, because icssg_iet_set_preempt_mask()
with fpe_active=false keeps all queues express.

Would going through disable_tx on this failure be a safer rollback?

> +	}
> +	mutex_unlock(&iet->fpe_lock);
> +
> +	return err;
> +}
> +
> +static void emac_get_mm_stats(struct net_device *ndev,
> +			      struct ethtool_mm_stats *s)
> +{

[ ... ]

> +	spin_lock(&emac->prueth->stats_lock);
> +	/* MACMergeHoldCount stats is not tracked by the firmware */
> +	s->MACMergeFrameAssOkCount = emac_get_stat_by_name(emac, "FW_PREEMPT_ASSEMBLY_OK");
> +	s->MACMergeFrameAssErrorCount = emac_get_stat_by_name(emac, "FW_PREEMPT_ASSEMBLY_ERR");
> +	s->MACMergeFragCountRx = emac_get_stat_by_name(emac, "FW_PREEMPT_FRAG_CNT_RX");
> +	s->MACMergeFragCountTx = emac_get_stat_by_name(emac, "FW_PREEMPT_FRAG_CNT_TX");
> +	s->MACMergeFrameSmdErrorCount = emac_get_stat_by_name(emac, "FW_PREEMPT_BAD_FRAG");

[Severity: Medium]
Does this truncate the MAC Merge counters? emac_get_stat_by_name()
returns int:

int emac_get_stat_by_name(struct prueth_emac *emac, char *stat_name)
{
	...
			if (!strcmp(icssg_all_pa_stats[i].name, stat_name))
				return emac->pa_stats[i];
	...
}

emac->pa_stats[] are u64 accumulators, updated with emac->pa_stats[i] +=
val in emac_update_hardware_stats(). Each value is cut to a signed
32-bit int and then sign-extended into the u64 fields of struct
ethtool_mm_stats.

Once a counter passes INT_MAX, "ethtool --show-mm --include-statistics"
would show values near 2^64. Past 2^32 the counter wraps. Holding
stats_lock prevents torn reads, but the truncation happens after the
read.

The int return type predates this patch (the changelog says it will be
fixed separately). However, these five call sites are the first to
expose it through the standard MM stats uAPI.

Since stats_lock is already held, could this read emac->pa_stats[]
directly, or could the helper return u64?

> +	spin_unlock(&emac->prueth->stats_lock);
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_qos.h b/drivers/net/ethernet/ti/icssg/icssg_qos.h
> index 0a375c125f4b8..bb0d6e2950dfc 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_qos.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_qos.h

[ ... ]

> +static inline int icssg_qos_validate_tx_min_frag_size(u32 min_frag_size,
> +						      struct netlink_ext_ack *extack)
> +{
> +	/* Firmware takes min_frag_size including FCS length.
> +	 * The firmware requires the fragment size (including FCS) to be
> +	 * a multiple of 64 bytes. Since 64 bytes = ETH_ZLEN + ETH_FCS_LEN,
> +	 * valid user-facing values are: 60, 124, 188, 252.
> +	 */
> +	if (min_frag_size < ETH_ZLEN) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "tx_min_frag_size must be at least 60 bytes");
> +		return -EINVAL;
> +	}
> +
> +	if (min_frag_size > ICSSG_IET_MAX_TX_MIN_FRAG_SIZE) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "tx_min_frag_size must not exceed 252 bytes");
> +		return -EINVAL;
> +	}
> +
> +	if ((min_frag_size + ETH_FCS_LEN) % (ETH_ZLEN + ETH_FCS_LEN)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "tx_min_frag_size must be a multiple of 64 bytes minus 4");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

[Severity: Low]
This isn't a bug, but could this use ethtool_mm_frag_size_min_to_add()
from include/linux/ethtool.h instead? It accepts the same
60/124/188/252 values. am65-cpsw, enetc, ocelot and stmmac all use it.

The two range checks here can never fire, because net/ethtool/mm.c
already enforces:

	[ETHTOOL_A_MM_TX_MIN_FRAG_SIZE]	= NLA_POLICY_RANGE(NLA_U32, 60, 252),

ethnl_set_mm() is the only caller of ->set_mm(). With the core helper,
ICSSG_IET_MAX_TX_MIN_FRAG_SIZE would no longer be needed, and the extack
messages would match the other MM drivers.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121144618.180542-1-m-malladi%40ti.com

