Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D9D606D544
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LWCFrEKe;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9mQkNAL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dSdvzPnABLjwFVZiWfi1//2H/6q2Iw+ZHFe/StntKFs=; b=LWCFrEKeENYObFttkcKWJxMA0A
	q95YTXa0kk+5f07QVg+jHOHqu2PRQyOXN7jWjUuABjSKWgo0DFxqZkY+QFMc04Ui3bsMKPEIKpRjC
	gTxDX1WRxFPBsw+xQXQoR+rbJ7ML8w//96N936VOtrHDidcaHITpXQ5AG5wYtD5e5FpPwXAxkiZBT
	Gs9T/V5/Q/B/0rNmwbri4r/2v2aeRE1LqDqzVrlaTsOkxMhkTBOKKPfAetSo/AF50FBkgP9+Xbu+g
	KLDIQy26/HfYw8X76QIQPTyamOCpMdL5azVSndt+H1bPUW4odXlTggiX4iJ9W/hSPD3ycufEEb9Eg
	iCdSUPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxAm-00000002ign-1uhZ;
	Mon, 16 Nov 2026 13:55:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxAe-00000002ieG-3k4S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:54:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59A4262C54;
	Mon, 16 Nov 2026 13:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104131F000C4;
	Mon, 16 Nov 2026 13:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837296;
	bh=dSdvzPnABLjwFVZiWfi1//2H/6q2Iw+ZHFe/StntKFs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f9mQkNAL+aphbZjEyCu9nHXVrTQAOOW4ZhFkmSvL36ZE/NSYAN9u0by1jSBOLUYdj
	 kHE84gmTTMG/VeY5T/+CmSJCXcytgTM+BMZHAglsJ1N6sB6oiiJvuG6Sg9qDYsOmpQ
	 wK16BCXrbWhTzcdQcVaGJZ5vOxMfKFjyYvFapND26xLqHgYAgK6HERLkqETjf2UIAf
	 AhvR7L58DGI79orxq6gpStq1m+vTOHT31Q4XnhLHVzrLWdqhhjJYsPByd6sTSZtyTa
	 l853W4INjlLZsGHc9wyBLJdEH19XuT+elR+r7p7USyHtAmLcKMbfQEzrAEWFk0mgU2
	 fLFaYqIeH/7Fw==
Subject: Re: [PATCH net v3 RESEND 3/3] net: ti: icssg-prueth: Fix bridge
 port_vlan and flooding state
From: netdev-bot+sashiko@kernel.org
To: m-malladi@ti.com
Cc: diogo.ivo@siemens.com, haokexin@gmail.com, philippe.schenker@impulsing.ch,
 devnexen@gmail.com, horms@kernel.org, jacob.e.keller@intel.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, danishanwar@ti.com
Date: Mon, 16 Nov 2026 13:54:54 +0000
Message-ID: <179483729457.3136.9455084416390981722@kernel.org>
In-Reply-To: <20261112102140.2744508-4-m-malladi@ti.com>
References: <20261112102140.2744508-4-m-malladi@ti.com>
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

Critical: 0 · High: 1 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] icssg_enable_fw_offload() (lines 247-256) skips the new flood-
  restore block whenever prueth->is_switch_mode is set.
- [Medium] The new uc/mc_flooding_enabled bitfields are written by
  emac_ndo_set_rx_mode_work(), which runs from schedule_work() (line…
- [Low] The Fixes: tag names the wrong commit.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  emac_ndo_set_rx_mode_work() has a check-then-use race that can lead to…

--

net: ti: icssg-prueth: Fix bridge port_vlan and flooding state

This patch sets port_vlan on both emacs when a bridge is formed. It also
records the UC/MC flooding state set from IFF_PROMISC/IFF_ALLMULTI so that
icssg_enable_fw_offload() can re-apply it after firmware restarts, and adds
a NULL check for unused emac slots in icssg_enable_fw_offload().

> Fixes: 161087db66d6b ("net: ti: icssg-prueth: Add Support for Multicast filtering with VLAN in HSR mode")

[Severity: Low]
Is this the right commit for the Fixes: tag?

In prueth_netdevice_port_link(), 161087db66d6b only replaced the hardcoded
default_vlan of 1 with PRUETH_DFLT_VLAN_SW. It did not touch the port_vlan
assignment, the restart paths or the flooding logic.

This patch fixes the single-emac assignment:

    emac->port_vlan = prueth->default_vlan;

That assignment and the switch mode unlink logic appear to come from
abd5576b9c57 ("net: ti: icssg-prueth: Add support for ICSSG switch
firmware"). The restart in prueth_netdevice_port_unlink() with no re-apply
step afterwards was reworked in 9facce84f406 ("net: ti: icssg-prueth: Fix
firmware load sequence.").

With the current tag, stable tooling would not pick up trees that have
abd5576b9c57 (v6.11 and later) but not 161087db66d6b (v6.14).

The patch also combines three fixes with different origins: port_vlan on
both emacs, the flood state restore, and the NULL check in
icssg_enable_fw_offload(). Could they be split, each with its own Fixes:
tag?

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index ef5dce595f68a..48539460ee499 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c

[ ... ]

> @@ -241,6 +243,17 @@ static void icssg_enable_fw_offload(struct prueth *prueth)
>  					icssg_set_port_state(emac, ICSSG_EMAC_PORT_VLAN_AWARE_ENABLE);
>  			}
>  		}
> +
> +		/* Re-apply flooding state cleared by firmware restart.
> +		 * In switch mode, flooding is managed by the bridge via
> +		 * switchdev callbacks, not tracked by these flags.
> +		 */
> +		if (!prueth->is_switch_mode && netif_running(emac->ndev)) {

[Severity: High]
Is the comment above accurate? In icssg_switchdev.c, UC flooding is never
handled through switchdev, because BR_FLOOD is rejected:

prueth_switchdev_attr_br_flags_pre_set() {
	if (brport_flags.mask & ~(BR_LEARNING | BR_MCAST_FLOOD))
		return -EINVAL;
}

prueth_switchdev_attr_br_flags_set() handles only BR_MCAST_FLOOD, and only
when a brport flag changes. Nothing replays it after the driver restarts
the firmware.

Also, emac_ndo_set_rx_mode_work() has no is_switch_mode check. It drives
UC/MC flooding from IFF_PROMISC/IFF_ALLMULTI and updates these flags in
switch mode too.

Does the EMAC to switch restart then still lose the flooding state? Take
this sequence:

    ip link set ethA master br0
    ip link set ethB master br0

When ethA joins, br_add_if()->br_manage_promisc() puts it in promisc.
rx_mode_work then sets uc/mc_flooding_enabled and enables flooding.

When ethB joins:

prueth_netdevice_port_link()
    prueth->is_switch_mode = true;
    icssg_change_mode()
        prueth_emac_restart()        <- firmware flooding state lost
        icssg_enable_fw_offload()    <- restore skipped, is_switch_mode

br_port_set_promisc() returns early for ethA because it is already
BR_PROMISC, so no new rx_mode_work runs for ethA.

ethB is put into promisc only after the upper link, in
nbp_update_port_count(). Its rx_mode_work runs after the restart and
re-enables flooding on ethB only.

ethA would then be in switch mode with UC/MC flooding off in firmware,
while its flags still say true. The commit message says flooding is
restored "after every firmware restart", but this restart path does not
seem to be covered.

> +			if (emac->uc_flooding_enabled)
> +				icssg_set_port_state(emac, ICSSG_EMAC_PORT_UC_FLOODING_ENABLE);
> +			if (emac->mc_flooding_enabled)
> +				icssg_set_port_state(emac, ICSSG_EMAC_PORT_MC_FLOODING_ENABLE);
> +		}
>  	}
>  }
>  
> @@ -1286,16 +1299,23 @@ static void emac_ndo_set_rx_mode_work(struct work_struct *work)
>  	icssg_set_port_state(emac, ICSSG_EMAC_PORT_MC_FLOODING_DISABLE);
>  
>  	if (promisc) {
> +		emac->uc_flooding_enabled = true;
> +		emac->mc_flooding_enabled = true;
>  		icssg_set_port_state(emac, ICSSG_EMAC_PORT_UC_FLOODING_ENABLE);
>  		icssg_set_port_state(emac, ICSSG_EMAC_PORT_MC_FLOODING_ENABLE);
>  		return;
>  	}
>  
>  	if (allmulti) {
> +		emac->mc_flooding_enabled = true;
> +		emac->uc_flooding_enabled = false;
>  		icssg_set_port_state(emac, ICSSG_EMAC_PORT_MC_FLOODING_ENABLE);
>  		return;
>  	}
>  
> +	emac->uc_flooding_enabled = false;
> +	emac->mc_flooding_enabled = false;
> +

[Severity: Medium]
Setting the flags before the ENABLE commands handles the stale false case.
Is the matching stale true case on the disable side still open?

The work writes these flags without rtnl or any driver lock.
icssg_enable_fw_offload() reads them without a lock, under rtnl, from the
netdevice notifier. prueth_emac_restart() does not flush or cancel
rx_mode_work.

The DISABLE commands go out at the top of emac_ndo_set_rx_mode_work(), but
the flags are only cleared here. Suppose promisc was on and IFF_PROMISC has
just been cleared:

rx_mode_work                          prueth_netdevice_port_unlink()
                                          prueth_emac_restart()
UC_FLOODING_DISABLE
MC_FLOODING_DISABLE
                                          icssg_enable_fw_offload()
                                              reads uc/mc_flooding_enabled
                                              == true (stale)
                                              UC_FLOODING_ENABLE
                                              MC_FLOODING_ENABLE
uc_flooding_enabled = false
mc_flooding_enabled = false

Would the firmware then keep flooding, with IFF_PROMISC off and the flags
false, until the next rx mode change? The allmulti branch above has the
same ordering for uc_flooding_enabled.

This window opens on every bridge unlink.
del_nbp()->nbp_delete_promisc() calls dev_set_promiscuity(-1), which queues
rx_mode_work right before netdev_upper_dev_unlink() triggers the unlink
restart.

prueth_hsr_port_unlink() and icssg_change_mode() can race in the same way.
Each R30 command the work sends while the firmware is stopped can also wait
for its 10 ms timeout, which widens the window.

>  	if (emac->prueth->is_hsr_offload_mode) {

[Severity: High]
This isn't a bug introduced by this patch, but can this check-then-use
cause a NULL pointer dereference of prueth->hsr_dev? It appears to date
from 161087db66d6b.

The work reads is_hsr_offload_mode here without rtnl. It then issues
sleeping FDB commands through __dev_mc_sync() and
icssg_hsr_handle_multicast_sync(); icssg_send_fdb_msg() polls for up to 20
seconds per command. Only after that does it run:

		if (rtnl_trylock()) {
			vlan_for_each(emac->prueth->hsr_dev,
				      icssg_update_vlan_mcast, emac);
			rtnl_unlock();
		}

Meanwhile, prueth_hsr_port_unlink() can run under rtnl:

	prueth->is_hsr_offload_mode = false;
	...
	prueth->hsr_dev = NULL;
	ret = prueth_emac_restart(prueth);

The work's FDB commands can stall while the firmware is stopped, so it can
stay between the check and the trylock for the whole unlink. The trylock
then succeeds, and vlan_for_each(NULL, ...) dereferences dev->vlan_info on
a NULL dev.

Separately, if rtnl is held when rtnl_trylock() runs (for example by the
notifier doing the restart), the VLAN multicast sync is silently skipped
and never retried.

Should is_hsr_offload_mode and hsr_dev be re-checked under rtnl, and the
sync be deferred rather than skipped?

>  		/* Track basic add/delete via callbacks */
>  		__dev_mc_sync(ndev, icssg_prueth_hsr_add_mcast,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112102140.2744508-1-m-malladi%40ti.com

