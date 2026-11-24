Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C544B606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tkKjF3Em;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUtJxRBa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mh/yVqw5w3cdbkpA2iej9q/2ol5jZwPriRpNWVPGSqw=; b=tkKjF3EmbzjshMP7jspeBAYa5q
	LE41Nxtj/F2VZx0NFFKaqI6gSN5y+5PsG8UrJPEXIZZ/beO9WkzgfGFUVd143xDGh6OkNFX/9SbGd
	p37kYclev6M7L8Z7/avosu6kOd3zpS+QmIPuYsCpC4jBIe0NNFwyIJz9Qjz0DWMG7fJhNFrgnp6Zh
	esYEVcpHXocXigUAO9Tf2p0Msp4QMe4MHe3c+q8q6YET4qE1NMokXhP6P7BpDVLioeo3jRLFb7pqI
	NoLmnnkHVA3sd9MAHpdQRCMUoaFobejK1u+j7ucuYrWRYjDtKaFwapyfeBElM2P3UIsJzNX69d1jb
	p/LmoySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrx9-00000006pUC-0q9T;
	Tue, 24 Nov 2026 14:57:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrx5-00000006pT5-0Cfh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:56:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50695626DA;
	Tue, 24 Nov 2026 14:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693A71F01573;
	Tue, 24 Nov 2026 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532218;
	bh=mh/yVqw5w3cdbkpA2iej9q/2ol5jZwPriRpNWVPGSqw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KUtJxRBap81WBZxh0syX5xcKWiubLKw4vGS/0Cjp7Fjk+8dRAd/FrmEw5zj7sok5A
	 Npdls3qRh2JKVUyF5hdk0RQdcOJ0DDuLtDHSkNvUrhn9ApcbkteSyfSEbzWi43lvfI
	 ud8OHWevznazs6zobdmOKqaaOyK0Bb/br7TEGH0qx9BBpX7Y1JCbgYCjRRwg8DJU9X
	 YJ40L6/x1slVzjZOgz3gWeisqLh6jn0KMrNw9IVgqvcEKS8m4dgtLiZ7qf41czfuZ3
	 tyJKD6YIee70O0Cca6Nahod6UcwkoAm4yqFahya+VKiWUbJAFsQaBMlk0qCLtAfcXD
	 zL7i/C0l50RBw==
Subject: Re: [PATCH net] net: sparx5/lan969x: remove MDB entries on last bridge leave
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, casper.casan@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, haoxiang_li2024@163.com
Date: Tue, 24 Nov 2026 14:56:56 +0000
Message-ID: <179553221699.3135.13151285770716836389@kernel.org>
In-Reply-To: <20261123-sparx5-mdb-bridge-leave-v1-1-40b50d7b7a1c@microchip.com>
References: <20261123-sparx5-mdb-bridge-leave-v1-1-40b50d7b7a1c@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch makes host-joined MDB groups disappear from hardware
  when the last sparx5 port leaves a bridge that stays up, and nothing…
- [Low] sparx5_mdb_flush() ignores the return value of
  sparx5_mact_forget(), which can be -ETIMEDOUT from…

Pre-existing issues:
- [Medium] MDB entries leak when the driver is unbound while ports are
  bridged.

--

net: sparx5/lan969x: remove MDB entries on last bridge leave

This patch fixes a NULL pointer dereference in sparx5_handle_port_mdb_del()
that happens when a bridge with a permanent MDB entry on one of its ports is
deleted. When the last port leaves the bridge, all MDB entries are now
flushed before hw_bridge_dev is cleared. MDB adds and deletes are ignored
while no bridge is offloaded.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
> index dac4dd833127a..65ce225baa023 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
> @@ -172,6 +172,30 @@ static int sparx5_port_attr_set(struct net_device *dev, const void *ctx,

[ ... ]

> +static void sparx5_mdb_flush(struct sparx5 *sparx5)
> +{
> +	struct sparx5_mdb_entry *entry, *tmp;
> +
> +	mutex_lock(&sparx5->mdb_lock);
> +	list_for_each_entry_safe(entry, tmp, &sparx5->mdb_entries, list) {
> +		if (entry->cpu_copy)
> +			sparx5_cpu_copy_ena(sparx5, entry->pgid_idx, false);

[Severity: Medium]
Can flushing the host-only entries here leave the hardware out of sync
with the bridge? This would happen when the bridge stays up and a port
rejoins it later.

After the last port leaves, the bridge still holds the host group (an
entry with cpu_copy set and an empty port_mask).
br_multicast_del_port() only deletes the leaving port's groups from
port->mglist, so mp->host_joined stays true. br_multicast_host_join()
only notifies when host_joined goes from false to true.

When a port rejoins, sparx5_port_bridge_join() passes no notifier blocks:

	err = switchdev_bridge_port_offload(ndev, ndev, NULL, NULL, NULL,
					    false, extack);

so br_switchdev_mdb_replay() returns early:

	if (!nb)
		return 0;

Nothing adds the MAC/PGID entry with CPU copy back. This sequence looks
like enough to hit it:

  ip link add br0 type bridge
  ip link set p1 master br0
  ip link set br0 up
  bridge mdb add dev br0 port br0 grp 239.1.1.1 permanent
  ip link set p1 nomaster
  ip link set p1 master br0

Afterwards the bridge still lists 239.1.1.1 as host-joined, but the
switch no longer copies the group to the CPU. Dynamic host joins look
the same, because later host reports only refresh the timer.

Before this patch, sparx5_port_bridge_leave() did not touch the MDB list
or the hardware entries, so this leave/rejoin case kept working. The
commit message says:

  "Host groups added before the first port joins the bridge are not
  offloaded either, so this matches the existing behaviour."

Does that hold for the leave/rejoin case as well?

Could the flush keep the host-only entries? Another option is to pass
notifier blocks to switchdev_bridge_port_offload() so the bridge replays
its MDB. lan966x_port_bridge_join() does this with &lan966x_switchdev_nb
and &lan966x_switchdev_blocking_nb.

> +		sparx5_pgid_clear(sparx5, entry->pgid_idx);
> +		sparx5_mact_forget(sparx5, entry->addr, entry->vid);
> +		list_del(&entry->list);
> +		sparx5_pgid_free(sparx5, entry->pgid_idx);

[Severity: Low]
sparx5_mact_forget() can return -ETIMEDOUT from
sparx5_mact_wait_for_completion(). Is it safe to ignore that and still
return the PGID to the pool?

If the UNLEARN did not complete, the MAC table could still have an entry
pointing at this PGID. sparx5_pgid_alloc_mcast() hands out the lowest
free index first, so the next group would probably get this PGID.

This needs a MAC table engine timeout. sparx5_handle_port_mdb_del()
already frees the PGID unconditionally after sparx5_mact_forget() in the
same way.

> +		kfree(entry);
> +	}
> +	mutex_unlock(&sparx5->mdb_lock);
> +}

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch, but are
the MDB entries still leaked when the driver is unbound while ports are
bridged?

mchp_sparx5_remove() unregisters the notifiers before the netdevs:

	sparx5_unregister_notifier_blocks(sparx5);
	sparx5_unregister_netdevs(sparx5);

The CHANGEUPPER sent when the bridge ports are removed therefore never
reaches sparx5_port_bridge_leave(), and sparx5_mdb_flush() never runs.
The deferred switchdev MDB deletes are not delivered either.

sparx5_mact_deinit() does not walk sparx5->mdb_entries:

	cancel_delayed_work_sync(&sparx5->mact_work);
	destroy_workqueue(sparx5->mact_queue);
	mutex_destroy(&sparx5->mact_lock);

So the sparx5_mdb_entry allocations are never freed, and mdb_lock is
never destroyed.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123-sparx5-mdb-bridge-leave-v1-1-40b50d7b7a1c%40microchip.com

