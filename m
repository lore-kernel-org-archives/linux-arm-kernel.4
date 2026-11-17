Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53305606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zmkRSVdU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRaPjTtH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=moI95422xiy0MC+MfACxL3N0KddjnzeVsJz6CFp/aXg=; b=zmkRSVdU7Xi7KNHOF2TAfugSVs
	gprMW+esheFY1L+qugKCHGtOoIeqroT3k9lUymnRjbzg8tk6YAnCWtCdwM8HekvKNO4Fj12C4UCAD
	HRV28/a0RgyC7qXirenTB9Q407JYxLYAVWT/WWtcJEdc0wi+LvODeQXILRGdh1IZoapdsB+CuH7Up
	vaSXIPeaHAg6JT+EVWrF3kddbgxk00/u4oQ6U6rMeoFBa31Ihb6xJhncWTFgN6Q+L6LCVEYuhEUsE
	unyHokHjqya1RPYWuZJz5qS+OGh16PLf9GIMdpo0T8PyPfXsGgL2wg96oM8ybeWPON4z37VYBYWet
	re0akl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKkH-00000006GGP-0QlX;
	Tue, 17 Nov 2026 15:05:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKkG-00000006GG7-1nAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:05:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FE556358E;
	Tue, 17 Nov 2026 15:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53A71F000C5;
	Tue, 17 Nov 2026 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794927915;
	bh=moI95422xiy0MC+MfACxL3N0KddjnzeVsJz6CFp/aXg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DRaPjTtHeCLFiBRu29uNYDU6vxF7HOU8irQR/bqLeOwQhVe0WRSmHpQfn2uUR7FOa
	 5u3srTH5N7862bnHkVsPtwxFp6TaAlOEFQydamXy2dRtQVw1jbPxklvZKzZi8EPqco
	 XEuKf20mm710KF2eyBup7EgGv4hq5ep2XhcZidflPv/QfV0vYAvBn1aD32TgAdgFMI
	 X2HqM+7XYeLHWLoja2BN9XoFnw69Apqq6TLhhHFqwv9N5g4q794PPHct5vrwMchuUb
	 soDDxbMEyjQxB9KNJe3YBqyQQ50k4PDNLWfkuAxAMR1PFyVi252/clS0evHbs6PWh/
	 fGtCGQX0L4amg==
Subject: Re: [PATCH net-next v6 1/3] net: ti: icssm-prueth: Add HSR and PRP HW
 offload mode support for AM57xx, AM437x and AM335x
From: netdev-bot+sashiko@kernel.org
To: saivarun@couthit.com
Cc: danishanwar@ti.com, parvathi@couthit.com, rogerq@kernel.org,
 pmohan@couthit.com, vadim.fedorenko@linux.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 afd@ti.com, basharath@couthit.com, arnd@arndb.de, haokexin@gmail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratheesh@ti.com, vigneshr@ti.com,
 praneeth@ti.com, srk@ti.com, j-rameshbabu@ti.com, m-malladi@ti.com,
 rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Date: Tue, 17 Nov 2026 15:05:13 +0000
Message-ID: <179492791328.3136.13687380666945826943@kernel.org>
In-Reply-To: <20261113143127.282466-2-saivarun@couthit.com>
References: <20261113143127.282466-2-saivarun@couthit.com>
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 5 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In PRP mode with ports running, the firmware MAC address for
  slave B gets out of sync with ndev->dev_addr, and…
- [Medium] icssm_prueth_hsr_port_link() counts every prueth port linked
  under an HSR master into hsr_members, whatever its HSR port type.
- [Medium] icssm_emac_ndo_set_rx_mode() picks the multicast-table lock
  from prueth->eth_type without synchronization: prueth->addr_lock if…
- [Medium] The PRU firmware supervision address is hard-coded to
  01:15:4E:00:01:00.
- [Medium] net: ti: icssm-prueth: broken rollback in
  icssm_prueth_change_mode()
- [Low] icssm_emac_ndo_fix_features() writes ndev->wanted_features
  (`ndev->wanted_features |= NETIF_PRUETH_LRE_OFFLOAD_FEATURES` and `&=…
- [Low] The patch adds `.ndo_set_mac_address = eth_mac_addr` and
  `.ndo_validate_addr = eth_validate_addr` to emac_netdev_ops, which…
- [Low] The commit message does not match the feature semantics in a few
  places.

Pre-existing issues:
- [High] icssm_prueth_change_mode() calls ndo_stop() and then ndo_open()
  directly on ports that are netif_running().

--

net: ti: icssm-prueth: Add HSR and PRP HW offload mode support for AM57xx, AM437x and AM335x

This commit adds HSR and PRP firmware offload modes to the ICSSM PRUETH
driver on AM335x, AM437x and AM57xx. When both PRU ports join an hsr
master with the LRE offload features enabled, the driver switches the PRU
firmware to HSR or PRP mode. It also adds LRE table and timer setup, RX
tag handling and feature negotiation callbacks.

> To switch from dual-EMAC to PRP (example: eth2 and eth3 as slave raw
> ports):
>
> $ ip link set eth2 down && ip link set eth3 down
> $ ip link set eth2 address <mac-addr>
> $ ip link set eth3 address <mac-addr>
> $ ethtool -K eth2 hsr-tag-rm-offload on
> $ ethtool -K eth3 hsr-tag-rm-offload on

[Severity: Low]
This isn't a bug, but does the PRP recipe match what the driver does?

icssm_emac_ndo_fix_features() couples the LRE bits. Requesting only
hsr-tag-rm-offload also forces NETIF_F_HW_HSR_FWD on and writes it into
wanted_features. Later in the series NETIF_F_HW_HSR_DUP is forced on too.
So PRP ports will always report hsr-fwd-offload as enabled.

The changelog also doesn't mention two cases where, with offload enabled,
icssm_prueth_hsr_port_link() returns -EOPNOTSUPP from NETDEV_CHANGEUPPER:
an hsr version other than HSR_V1/PRP_V1, or a peer port without the
features. In both cases creating the hsr device fails outright instead of
falling back to software HSR.

Could the commit message describe this behaviour?

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index 1aadef061e923..4f631dcc4d509 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

[ ... ]

> @@ -1371,8 +1454,18 @@ static void icssm_emac_ndo_set_rx_mode(struct net_device *ndev)
>  	sram = prueth->mem[PRUETH_MEM_SHARED_RAM].va;
>  	reg = readl(sram + EMAC_PROMISCUOUS_MODE_OFFSET);
>
> +	/* In LRE mode, the HSR core syncs the master's multicast list and
> +	 * IFF_ALLMULTI to both slaves. Settings applied to a single slave are
> +	 * not merged into the shared filter, so configure them on the HSR
> +	 * master instead.
> +	 */
> +	if (prueth_is_lre(prueth))
> +		mc_filter_tbl_lock = &prueth->addr_lock;
> +	else
> +		mc_filter_tbl_lock = &emac->addr_lock;
> +
>  	/* It is a shared table. So lock the access */
> -	spin_lock_irqsave(&emac->addr_lock, flags);
> +	spin_lock_irqsave(mc_filter_tbl_lock, flags);

[Severity: Medium]
Is prueth->eth_type stable at this point? icssm_prueth_change_mode()
writes eth_type, and ndo_open rewrites prueth->fw_offsets through
icssm_prueth_set_fw_offsets(). Both run under RTNL only and take neither
addr_lock.

This driver uses the synchronous __dev_set_rx_mode() path. That means
ndo_set_rx_mode can run from dev_mc_add() callers that don't hold RTNL,
for example igmp6_group_added() reached through IPV6_ADD_MEMBERSHIP on a
slave.

During an EMAC to HSR/PRP transition, could one slave hold
emac->addr_lock while it writes the shared DRAM1 table, while the other
slave holds prueth->addr_lock?

The helpers icssm_emac_mc_filter_ctrl(), icssm_emac_mc_filter_reset(),
icssm_emac_mc_filter_hashmask() and icssm_emac_mc_filter_bin_update()
also each re-read prueth_is_lre() and prueth->fw_offsets. Consider the
window between the eth_type update in change_mode and
icssm_prueth_set_fw_offsets() in ndo_open. Could a call in that window
write the EMAC filter layout into DRAM1 while the LRE firmware, whose
filter is at different offsets, is loaded?

[ ... ]

> @@ -1429,15 +1522,126 @@ static void icssm_emac_ndo_set_rx_mode(struct net_device *ndev)
>  	}
>
>  unlock:
> -	spin_unlock_irqrestore(&emac->addr_lock, flags);
> +	spin_unlock_irqrestore(mc_filter_tbl_lock, flags);
> +}
> +
> +static netdev_features_t icssm_emac_ndo_fix_features(struct net_device *ndev,
> +						     netdev_features_t features)
> +{
> +	/* hsr tag removal offload and hsr fwd offload are tightly coupled in
> +	 * firmware implementation. Both these features need to be enabled /
> +	 * disabled together.
> +	 */
> +	if (!(ndev->features & NETIF_PRUETH_LRE_OFFLOAD_FEATURES)) {
> +		if ((features & NETIF_F_HW_HSR_FWD) ||
> +		    (features & NETIF_F_HW_HSR_TAG_RM)) {
> +			features |= NETIF_PRUETH_LRE_OFFLOAD_FEATURES;
> +			ndev->wanted_features |=
> +				NETIF_PRUETH_LRE_OFFLOAD_FEATURES;
> +		}
> +	}

[Severity: Low]
Documentation/networking/netdev-features.rst says ndo_fix_features
should not modify hardware or driver state (it should be stateless). It
also says it is safer to disable a feature whose dependencies are not
met than to force the dependency on.

This callback writes ndev->wanted_features, forces the other LRE bit on,
and its result depends on the current ndev->features.
icssm_emac_ndo_set_features() then has to undo the wanted_features
change on its error path.

Could the coupling be done by clearing the unmet bit, without touching
wanted_features?

[ ... ]

>  static const struct net_device_ops emac_netdev_ops = {
>  	.ndo_open = icssm_emac_ndo_open,
>  	.ndo_stop = icssm_emac_ndo_stop,
>  	.ndo_start_xmit = icssm_emac_ndo_start_xmit,
> +	.ndo_set_mac_address = eth_mac_addr,
> +	.ndo_validate_addr = eth_validate_addr,

[Severity: Low]
This isn't a bug, but every operating mode shares these ops. Changing
the MAC on a stopped port now also succeeds in plain dual-EMAC and
switch modes, where it used to return -EOPNOTSUPP.

Should the commit message mention this new capability? Should it also
say whether the two slaves need the same address for HSR/PRP?

[ ... ]

> @@ -1742,6 +1949,111 @@ static int icssm_prueth_ndev_port_unlink(struct net_device *ndev)
>  	return ret;
>  }
>
> +static int icssm_prueth_hsr_port_link(struct net_device *ndev,
> +				      struct net_device *hsr_ndev)
> +{

[ ... ]

> +	/* Reject HSR/PRP offload if the peer port does not have the offload
> +	 * features enabled.
> +	 */
> +	if (other_emac &&
> +	    !(other_emac->ndev->features & NETIF_PRUETH_LRE_OFFLOAD_FEATURES))
> +		return -EOPNOTSUPP;
> +
> +	spin_lock_irqsave(&prueth->addr_lock, flags);
> +
> +	if (!prueth->hsr_members) {
> +		prueth->hsr_dev = hsr_ndev;
> +	} else {
> +		/* Adding the port to a second master is not supported */
> +		if (prueth->hsr_dev != hsr_ndev) {
> +			spin_unlock_irqrestore(&prueth->addr_lock, flags);
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	prueth->hsr_members |= BIT(emac->port_id);
> +
> +	spin_unlock_irqrestore(&prueth->addr_lock, flags);
> +
> +	if (!prueth_is_lre(prueth) && prueth->hsr_members == all_slaves) {
> +		ret = icssm_prueth_change_mode(prueth, mode);

[Severity: Medium]
What state is prueth left in when icssm_prueth_change_mode() fails here?

By the time change_mode() starts calling ndo_open(), it has already
called ndo_stop() on every running port and set prueth->eth_type to HSR
or PRP. A missing pruhsr or pruprp firmware, for example, makes
icssm_prueth_sw_boot_prus() fail, and change_mode() then returns
straight away. At that point:

- eth_type is not restored.
- A port that was already re-opened keeps running the LRE firmware.
- The failed port has its NAPI disabled and its rx_irq freed, but
  netif_running() is still true.

The free_hsr path only clears this port's bit in hsr_members. It does
not touch eth_type or hsr_dev, so prueth_is_lre() stays true.

The hsr core then unwinds hsr_dev_finalize() by unlinking the first
slave. icssm_prueth_hsr_port_unlink() sees prueth_is_lre() with
hsr_members == 0 and calls icssm_prueth_change_mode(EMAC). That runs
icssm_emac_ndo_stop() a second time on the port that was never
re-opened.

Wouldn't that block forever in napi_disable(&emac->napi) with RTNL
held? It would also call free_irq(emac->rx_irq, ndev) on an IRQ that
was already freed. Even without the unwind, a later dev_close() of
that port would hit the same double stop.

Should change_mode() restore the previous eth_type and re-open the
ports in the old mode when ndo_open() fails? Or should the free_hsr
path here revert to dual-EMAC itself, so that hsr_port_unlink() does
not attempt a second mode change on half-opened ports?

[Severity: Medium]
Does this also count a port that is linked as the RedBox interlink?
hsr_portdev_setup() links interlink ports with
netdev_master_upper_dev_link() too. So this notifier sees
is_hsr_master() for HSR_PT_INTERLINK ports as well.

Take a configuration like this one, where eth2 and eth3 are both prueth
ports with offload enabled:

  ip link add name hsr0 type hsr slave1 eth2 slave2 Y interlink eth3

hsr_members would reach all_slaves when hsr_dev_finalize() adds the
interlink, and change_mode(HSR) would run. The firmware would then run
an HSR ring between eth2 and the interlink port. It would forward and
duplicate HSR-tagged frames onto the SAN side. At the same time the hsr
core keeps doing software forwarding, because fwd_offloaded is false
for Y.

The peer-feature check above pushes users to enable offload on both
ports. Should the hsr port type be checked before updating hsr_members?

[ ... ]

> +static int icssm_prueth_hsr_port_unlink(struct net_device *ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth *prueth = emac->prueth;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&prueth->addr_lock, flags);
> +
> +	prueth->hsr_members &= ~BIT(emac->port_id);
> +
> +	spin_unlock_irqrestore(&prueth->addr_lock, flags);
> +
> +	if (prueth_is_lre(prueth) && !prueth->hsr_members) {
> +		ret = icssm_prueth_change_mode(prueth, PRUSS_ETHTYPE_EMAC);
> +		if (ret < 0)
> +			dev_err(prueth->dev, "Failed to enable dual EMAC mode\n");
> +	}

[Severity: High]
This is a pre-existing issue in icssm_prueth_change_mode(), but this
patch adds a new way to reach it, inside the hsr device creation
rollback.

change_mode() calls ndo_stop() and ndo_open() directly on running ports
and returns on the first ndo_open() failure. The failed port, and any
port not yet re-opened, keeps IFF_UP but has no resources: no IRQ, NAPI
disabled, PHY stopped and PRUs not booted.

Consider eth2 and eth3 up with LRE offload enabled and the pruhsr
firmware missing:

hsr_dev_finalize()
  hsr_add_port(slave[1])
    icssm_prueth_hsr_port_link()
      icssm_prueth_change_mode(HSR)
        ndo_stop(eth2), ndo_stop(eth3)
        eth_type = HSR
        ndo_open(eth2) fails in icssm_prueth_sw_boot_prus()
  err_unregister:
    hsr_del_ports()
      hsr_del_port(slave A)
        netdev_upper_dev_unlink()
          icssm_prueth_hsr_port_unlink()
            icssm_prueth_change_mode(EMAC)
              ndo_stop(eth2)    <-- nothing left to tear down

Can this second icssm_emac_ndo_stop() spin forever with RTNL held? Its
napi_disable(&emac->napi) runs on a NAPI that is already disabled.
phy_stop() would also warn on this path.

Could change_mode() track which ports it actually re-opened, or could
ndo_stop() cope with a port whose open failed?

[ ... ]

> @@ -1749,13 +2061,27 @@ static int icssm_prueth_ndev_event(struct notifier_block *unused,
>  	struct netdev_notifier_changeupper_info *info;
>  	int ret = NOTIFY_DONE;
>
> -	if (!icssm_prueth_sw_port_dev_check(ndev))
> +	if (ndev->netdev_ops != &emac_netdev_ops)
>  		return NOTIFY_DONE;
>
>  	switch (event) {
>  	case NETDEV_CHANGEUPPER:
>  		info = ptr;
> +		if (is_hsr_master(info->upper_dev)) {
> +			if (info->linking) {
> +				if (ndev->features &
> +				    NETIF_PRUETH_LRE_OFFLOAD_FEATURES)
> +					ret = icssm_prueth_hsr_port_link
> +						(ndev, info->upper_dev);
> +			} else {
> +				ret = icssm_prueth_hsr_port_unlink(ndev);
> +			}
> +		}

[Severity: Medium]
In PRP mode with the ports running, can the firmware MAC for slave B
drift from ndev->dev_addr? The default case of this switch ignores
NETDEV_CHANGEADDR.

At creation, hsr_dev_finalize() adds slave B first. That runs
icssm_prueth_hsr_port_link()->icssm_prueth_change_mode(PRP), and
ndo_open copies the old dev_addr into emac->mac_addr and PORT_MAC_ADDR.
Only after that does hsr_dev_finalize() run:

	eth_hw_addr_set(slave[1], slave[0]->dev_addr);
	call_netdevice_notifiers(NETDEV_CHANGEADDR, slave[1]);

At deletion, hsr_del_port() unlinks slave B first. So
icssm_prueth_hsr_port_unlink()->icssm_prueth_change_mode(EMAC) re-opens
the ports while slave B still has slave A's MAC. Only then does it
restore port->original_macaddress and send NETDEV_CHANGEADDR.

After a PRP device is deleted, wouldn't the port B dual-EMAC firmware
keep filtering unicast on slave A's MAC? Frames to eth3's real address
would then be dropped until the interface is bounced. The recipe in the
commit message brings the ports down first, but nothing enforces that.

[ ... ]

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth_lre.c b/drivers/net/ethernet/ti/icssm/icssm_prueth_lre.c
> new file mode 100644
> index 0000000000000..9e84244e0649d
> --- /dev/null
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth_lre.c

[ ... ]

> +static void icssm_prueth_lre_protocol_init(struct prueth *prueth)
> +{

[ ... ]

> +	/* PRU firmware matches supervision frames on 01:15:4E:00:01 only
> +	 * and forwards them to the host, bypassing the multicast filter.
> +	 */
> +	writel(ICSS_LRE_SUP_ADDRESS_INIT_OCTETS_HIGH,
> +	       dram1 + ICSS_LRE_SUP_ADDR);
> +	writel(ICSS_LRE_SUP_ADDRESS_INIT_OCTETS_LOW,
> +	       dram1 + ICSS_LRE_SUP_ADDR_LOW);

[Severity: Medium]
This writes a fixed 01:15:4E:00:01:00 whatever the hsr device's
supervision address is. The last byte of that address comes from the
supervision option. The commit message example uses supervision 45,
which gives 01:15:4E:00:01:2D.

In offload mode the hsr core doesn't make the slaves promiscuous and
doesn't add the supervision address to the slave mc lists. The driver
also ignores IFF_PROMISC in LRE mode.

The comment says the firmware matches 5 bytes. If it actually compares
the full 6-byte value written here, would supervision frames for any
non-zero supervision value be dropped by the LRE multicast filter?

Should the configured supervision address be programmed here, or could
the comment confirm how many bytes the firmware compares?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113143127.282466-1-saivarun%40couthit.com

