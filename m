Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UCfDCIZC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=F2Fa3Pg4;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=kfuuIUW2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:CC:Subject:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BmnMKZZmIQB55ncMr0DcY94/GMqbQqtJc77bZJchLLU=; b=UCfDCIZCijNMb1
	fACsC4sgMXOazFpSfpsuiF4C7xNySHZrewTmOSG5pMxfjkCalo1DNEbcO2kwriGyQXiELSr4VNucm
	HmbLVwjSp6g9T/54KkYZ+dNukIzs2SndqVl8AqA5kGZ0me6hE/gEuAERMoEgAEvSrXJPyqSvPS40V
	BsBZaxxiokyhXPSdAcYz+ukN+qOMvrjKVb5v2uk2uJSgTNVyzSmEvLmd1/jhhZT8iE5jUuoUIhdgH
	QJr/JxrZYh2sbPvPVmoA/XXxnzKIEUf52oRcrqSXi6VUXFPfynAxAGV+pBpnZ04UYWSFguXHxBh/p
	6PEeto3QW4EnMrPHIWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPra-00000002cXI-2vig;
	Mon, 23 Nov 2026 08:57:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPqb-00000002cKG-24v8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 08:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:CC:
	Subject:Message-ID:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BmnMKZZmIQB55ncMr0DcY94/GMqbQqtJc77bZJchLLU=; b=F2Fa3Pg4F088f54SG7TOmlopwb
	knGQEBmKvyDR8HhpQ7rFLvsiBSmHSvbGt1yEUDlVtGPUOKjtxWqgkERQtyarT8VTc4yIgrqjBuEqp
	/THC4kBLkOeviTk4DiTvJRNMhxLogmWc5EzKeFSYRU9Z64LPIs3OwqYIjVWGMENm2QSl502Oz8xHC
	qSrkFMnMjgl2VXJBqvZwTm1FU/Pxw++kIojcJPblXN7WsNEuOr3J6BZh3zDlN4z603zjY7dSk6wYW
	cCgQceuuWv5X8o6glLG4unol3RjYp9f4Y0e6PWx8g0C+x0PKHID2cvY+kZyZ1T32cOxQxJQinLURX
	7JkZi8/A==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPqX-00000002sxP-24kj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795424179; x=1826960179;
  h=mime-version:content-transfer-encoding:date:message-id:
   subject:cc:from:to:references:in-reply-to;
  bh=nOvYNUGI3PD3pe/j1wWkp8TO50U2foUVygE/9kp6vYs=;
  b=kfuuIUW25obmUOOczwQD7YwmTsrxgbUks+OL/PeP6D0dXtXh7CINCENZ
   KEjJhHnxLVmwr3o8c90pVSdcrTN0BQWoJabNrCLphYuRUaiS4pywnXq3A
   Nk/fJOpjIY2ZhL0gENoGmZfQnoONIZQLl4qCjQLk9GMYE4xqajqqRQvjI
   FrqaD1wCahCA2QmQkM0XuZhpLgrzv/vECL8X56oaa/GYDWreHGZe6k8Tv
   hpPybRbTXLu27JfkrHdSxv3AxxrvpcmNfL7kHgyQFxNNyrKTQN9ps/TjH
   0TcQRE+VRi6Z/CIHhrNx+PVeJ35UFahP6R+gS+MI4iFICoeQjBogxCqn2
   g==;
X-CSE-ConnectionGUID: OpVKFLk0RW2QtAvrvDKj8w==
X-CSE-MsgGUID: jO3L0NokTZuWN/acjPMVtQ==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="77690234"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 01:56:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 01:56:13 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 01:56:12 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Nov 2026 09:56:11 +0100
Message-ID: <DN2GR1X3SMRL.3RJ6A1DJMG1H6@microchip.com>
Subject: Re: [PATCH net-next v3 3/3] net: sparx5: keep router legs in sync
 with the bridge
CC: <horatiu.vultur@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <daniel.machon@microchip.com>,
	<Steen.Hegelund@microchip.com>, <kees@kernel.org>, <gustavoars@kernel.org>,
	<robert.marko@sartura.hr>, <edumazet@kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-hardening@vger.kernel.org>
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
To: <netdev-bot+sashiko@kernel.org>, <jensemil.schulzostergaard@microchip.com>
X-Mailer: aerc 0.21.0
References: <20261117-sparx5_l3_routing-v3-3-e680ed79c7dc@microchip.com>
 <179515919073.3136.18115865975545072840@kernel.org>
In-Reply-To: <179515919073.3136.18115865975545072840@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_085621_910244_9FB6E107 
X-CRM114-Status: GOOD (  51.23  )
X-Spam-Score: -2.5 (--)
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

On Fri Nov 20, 2026 at 8:19 AM CET, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] sparx5_rr_legs_reconcile() now walks
>   netdev_for_each_upper_dev_rcu(sparx5->hw_bridge_dev, ...) from the=E2=
=80=A6
> - [Medium] Contrary to the commit message, a router leg can be lost while
>   its upper is down.
> - [Low] In sparx5_rr_router_init() the new comment says "The exported
>   helpers use leg_list once sparx5->router is set".
> - [Low] The function comment above sparx5_rr_bridge_legs_flush() still
>   reads "Tear down the router legs of a bridge that is no longer=E2=80=A6
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but this patch
>   extends the affected code.
>
> --
>
> net: sparx5: keep router legs in sync with the bridge
>
> This commit makes the sparx5 L3 router legs follow later changes to the
> bridge and the vlan upper. A leg is destroyed when vlan filtering is
> disabled, when the bridge moves to a non-802.1Q protocol, when the upper
> is linked to a master, or when the upper's MAC changes. Ingress routing
> on a leg is limited to when the upper is up and the bridge carries the
> vid tagged, and the reconcile now also creates legs for eligible uppers
> of the offloaded bridge.
>
>> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c b/dri=
vers/net/ethernet/microchip/sparx5/sparx5_router.c
>> index 26aeee17733cd..7412db7a6e7b4 100644
>> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
>> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_router.c
>
> [ ... ]
>
>> @@ -568,19 +650,66 @@ static void sparx5_rr_router_legs_flush(struct spa=
rx5 *sparx5)
>
> [ ... ]
>
>> +void sparx5_rr_legs_reconcile(struct sparx5 *sparx5)
>>  {
>>  	struct sparx5_rr_router_leg *leg, *tmp;
>> +	struct net_device *bridge, *dev;
>>  	struct sparx5_router *router;
>> +	struct list_head *iter;
>> =20
>>  	ASSERT_RTNL();
>> =20
>>  	router =3D sparx5->router;
>> +	if (!router)
>> +		return;
>> =20
>>  	mutex_lock(&router->lock);
>>  	list_for_each_entry_safe(leg, tmp, &router->leg_list, leg_list_node) {
>> -		if (sparx5_rr_dev_addr_list_empty(leg->dev))
>> +		if (sparx5_rr_dev_addr_list_empty(leg->dev) ||
>> +		    !sparx5_rr_dev_real_is_vlan_aware(sparx5, leg->dev)) {
>>  			sparx5_rr_router_leg_destroy(leg);
>> +			continue;
>> +		}
>
> [Severity: Medium]
> The commit message says:
>
>   "A leg with an IPv4 address is kept while the upper is down, so it is
>   available again when the interface comes back up."
>
> Does this still hold if the bridge MAC changes while a NET_ADDR_STOLEN vl=
an
> upper is down?
>
> When the bridge sends NETDEV_CHANGEADDR, vlan_device_event() in
> net/8021q/vlan.c skips uppers that are not IFF_UP. A down upper therefore
> keeps the old MAC, and sparx5_rr_dev_real_is_vlan_aware() then fails here=
:
>
> 	if (dev->addr_assign_type !=3D NET_ADDR_STOLEN ||
> 	    !ether_addr_equal(dev->dev_addr, vlan_rdev->dev_addr))
> 		return false;
>
> On the next reconcile, the new check above destroys the down upper's IPv4
> leg and frees its VMID.
>
> Unrelated events can queue that reconcile: an inet6addr UP/DOWN on any vl=
an
> device, a bridge vlan add or del, or the VLAN_FILTERING attr that is sent
> when a sparx5 port joins. For example, a port with a lower MAC joins the
> bridge. That queues the reconcile, and br_stp_recalculate_bridge_id()
> changes the bridge MAC before the reconcile runs.
>
> Suppose the bridge MAC then changes back before the upper comes up, for
> example because the port leaves again or after ip link set br0 address
> <old>. What recreates the leg then? The bridge NETDEV_CHANGEADDR in
> sparx5_rr_netdevice_event() does not queue a reconcile, because
> is_vlan_dev(bridge) is false:
>
> 	case NETDEV_CHANGEADDR:
> 		mutex_lock(&router->lock);
> 		if (sparx5_rr_bridge_has_legs(sparx5, dev))
> 			sparx5_rr_leg_base_mac_set(sparx5, dev->dev_addr);
> 		mutex_unlock(&router->lock);
> 		if (is_vlan_dev(dev))
> 			sparx5_rr_legs_reconcile_schedule(sparx5);
>
> When the upper is later brought up, the MACs already match, so no
> CHANGEADDR is sent. The NETDEV_UP case only refreshes an existing leg. Th=
e
> IPv4 address already exists, so the validator does not run either. With
> IPv6 disabled on the upper (disable_ipv6, or addr_gen_mode none), no
> link-local NETDEV_UP arrives.
>
> Wouldn't the upper then stay without a leg until something unrelated
> triggers a reconcile?
>
> Now take the case where the upper comes up while the bridge still has the
> new MAC. vlan_dev_open()->vlan_dev_inherit_address() does queue a reconci=
le.
> But if another upper has taken the freed VMID in the meantime, creating t=
he
> leg fails, and only a ratelimited warning is printed.
>

This is right. A NET_ADDR_STOLEN upper which is down keeps the old MAC
when the bridge MAC changes, so a reconcile in that window destroys its
leg. If the MAC is back to the old value when the upper comes up it
is not requeued. v4 queues the reconcile on NETDEV_UP of a vlan upper of
the offloaded bridge that has no leg.

>> +
>> +		bridge =3D vlan_dev_real_dev(leg->dev);
>> +		leg->vlan_present =3D sparx5_rr_bridge_vlan_present(bridge,
>> +								  leg->vid);
>> +		sparx5_rr_leg_hw_uc_update(sparx5, leg);
>> +	}
>> +
>> +	bridge =3D sparx5->hw_bridge_dev;
>> +	if (!bitmap_empty(sparx5->bridge_mask, SPX5_PORTS) && bridge) {
>> +		netdev_for_each_upper_dev_rcu(bridge, dev, iter) {
>
> [Severity: High]
> Can this walk a bridge that has already been freed during driver removal?
>
> The driver holds no reference on hw_bridge_dev. Only
> sparx5_port_bridge_leave() clears hw_bridge_dev and bridge_mask, and it r=
uns
> from the main sparx5 netdevice notifier on NETDEV_CHANGEUPPER. Before thi=
s
> patch, the reconcile walked only leg_list, whose entries hold netdev
> references.
>
> mchp_sparx5_remove() unregisters that notifier before the router notifier=
s:
>
> 	sparx5_unregister_notifier_blocks(sparx5);
> 	sparx5_rr_router_deinit(sparx5);
>
> Suppose ip link del br0 runs in that window. del_nbp() unlinks the ports,
> but hw_bridge_dev and bridge_mask stay set. The router notifiers are stil=
l
> registered, so addrconf_ifdown() on the bridge's vlan uppers can, for
> example, send inet6addr NETDEV_DOWN, and sparx5_rr_inet6addr_event() queu=
es
> legs_work. After rtnl_unlock(), netdev_run_todo() frees the bridge.
>
> legs_work can then run, including during the drain in
> sparx5_rr_router_deinit(), while sparx5->router is still set:
>
> 	destroy_workqueue(router->sparx5_router_owq);
> 	sparx5_rr_router_legs_flush(sparx5);
> 	sparx5_rr_router_hw_deinit(sparx5);
> 	sparx5->router =3D NULL;
>
> The bridge_mask/hw_bridge_dev check passes on this stale state, and
> netdev_for_each_upper_dev_rcu() reads the adj_list of the freed bridge.
> Could a garbage dev then reach __sparx5_rr_inetaddr_event(), which may ca=
ll
> netdev_hold() on it and program hardware?
>

I think this is correct, but it needs a bridge del racing with driver
removal. mchp_sparx5_remove() unregisters the notifiers that maintain
hw_bridge_dev and bridge_mask before the router stops, so router work
can run on stale bridge state. The next version tears the router down
before the notifier blocks: its notifiers are unregistered and the work
disabled first, and sparx5->router is cleared under RTNL.

>> @@ -683,6 +705,7 @@ static int sparx5_handle_port_vlan_del(struct net_de=
vice *dev,
>>  				     switchdev_blocking_nb);
>> =20
>>  		sparx5_mact_forget(sparx5, dev->broadcast, vid);
>> +		sparx5_rr_bridge_vlan_clear(sparx5, dev, vid);
>>  		return 0;
>>  	}
>
> [Severity: High]
> This is a pre-existing issue that this patch did not introduce, but the
> patch extends the affected branches. The bridge-master paths of
> sparx5_handle_port_vlan_add() and sparx5_handle_port_vlan_del() never che=
ck
> dev =3D=3D sparx5->hw_bridge_dev, or the netns. The switchdev blocking no=
tifier
> chain is global.
>
> Can a software-only bridge in another namespace remove the broadcast entr=
y
> here? The bridge sends master VLAN add/del notifications for every bridge=
.
> A user with CAP_NET_ADMIN only in its own user namespace can run:
>
>   ip link add br0 type bridge
>   bridge vlan add vid X dev br0 self
>   bridge vlan del vid X dev br0 self
>
> sparx5_mact_forget() then deletes the chip-wide (ff:ff:ff:ff:ff:ff, X)
> entry that points at PGID_BCAST. PGID_BCAST is the only flood group that
> sparx5_start() sets up with CPU copy enabled. After that, broadcasts on v=
id
> X of the offloaded bridge no longer reach the CPU, so ARP fails for host
> interfaces and for the router legs on that vid.
>
> The new sparx5_rr_bridge_vlan_clear() and
> sparx5_rr_legs_reconcile_schedule() calls are added to the same unfiltere=
d
> branches. Would an early check like this be appropriate?
>
> 	if (dev !=3D sparx5->hw_bridge_dev)
> 		return 0;

Preexisting, but correct, the bridge master vlan add and del paths act
on any bridge. The calls this patch adds there only touch legs of the
bridge passed in, and the reconcile is idempotent, so it does not add to
this. I do not think this should be fixed in this series.

pw-bot: cr

