Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NG/ymt8H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Fv4lQmdL;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=h46eXreu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pQ4Lb3d9QjNGFcRXzQjd4OKzKPKVlRfQXSiBvxdkeWM=; b=NG/ymt8HnuDDHN4u0SYcXBIZJr
	4me8scCzjhBPoGpC7FQ/3Dj/YWtnDT5XgSlnCtuyLgT23Co3JyfAk2/qjbMXsLitaw+T7L0y6zFMC
	IBdPTogCmbygtFCxa+VFLVE8Wu7BFUlL8jlvDRQss45IlnJrqCXEPfIWH5chPam0YtEDD9Jt5PY+h
	lr3p9259jueb0hxqvRakFiW4X25aFlnj7S8CFprw0Zh9E0+eiH195c0d1g54e3MX8BiBUAeoTQcpo
	27Ax5lR6caOwQN9aXBBC4FD4CiwG9hR23dqCEPWHH4nfLrK3h7x44X2/mAJGKJ44no9Y6tQlGT3Tg
	r5Vrq+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVTh-00000003qQD-1nwU;
	Mon, 23 Nov 2026 14:57:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVSd-00000003pqR-3i37
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 14:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=pQ4Lb3d9QjNGFcRXzQjd4OKzKPKVlRfQXSiBvxdkeWM=; b=Fv4lQmdLplpVPoogKAuccj5bpk
	ZwkjUMy3E4BvZEx9gecvrthg+EO7WUnOMGxU9dx6STjzHJiBOyeaJUGbZZPcky0dXiBzIlguN8J+s
	v2eDDs4pMqnVGDIDvCbrl5lWPWWdUzUiEsXiPJ+D0kl7XvqO9CqAVYBuclUZVk6I6uJ6bgjE5J5EU
	FCBQPHo8cDahlJvcyGblqU4H9lYtnKXThbHgmDlEtsCZad7RubX2NWL1StbmmkKDA3wbShv5BlQD4
	jCuXgV1j5Mt8CskyZeQaxlLxK9cJMjC6wUPFK4VgGltjCZxvMQUv51hUrsj8DaZl24OtaBQrzgbM7
	nv1yoNYg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVSa-00000003GIg-2rC3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795445761; x=1826981761;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=h+26WBDHY/YtvAefAK30UfvmvaeR2qSYVRv8FmpwRAw=;
  b=h46eXreuxZ8mTbEBKskG32HK6uKgcuNhjBRrovaYrDS5Z66C6iluuUTt
   pbcaP827zbWpJS8t3Uvu6BwFuQf/vMRVDIxYdkFOLOEjCU+J8qzW6veZL
   HbEUJsiRKAZXGFB29GCwHCB74AMy5VutlpoPF0SFJH/UmxVFp0JjgN8h2
   0UkpXp6xOHdb6/47V47YiI+uVSORtfJPxeFcAplT+Pp77TnfV5aOoDAEX
   bT1W/hhUghx7J9hR+5hjHadOn7vcSgKimG9NkJSigRsFcJzAn9G5vxiM1
   enX8UMzbijWmm6Ww30zoB+DCSRITYSjy0LDmko3pj9OgYJmiWg4TcFnEZ
   Q==;
X-CSE-ConnectionGUID: Vi7ay+2XQ7yr4R7PUDt3FA==
X-CSE-MsgGUID: iSdTH3luT2+GWEyL94JjiQ==
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="298335188"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 07:55:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 23 Nov 2026 07:55:53 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 07:55:51 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 23 Nov 2026 15:55:47 +0100
Subject: [PATCH net] net: sparx5/lan969x: remove MDB entries on last bridge
 leave
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261123-sparx5-mdb-bridge-leave-v1-1-40b50d7b7a1c@microchip.com>
X-B4-Tracking: v=1; b=H4sIAPJTBGsC/x2MQQqAIBAAvxJ7biE1g/pKdNDcaqEs1ogg+nvSc
 WBmHkgkTAm64gGhixPvMYMqCxgXF2dCDplBV7pRShtMh5Pb4hY8euGQhZXcRRh83Xpl3WhsDbk
 +hCa+/3MPkU4Y3vcD0JPLIm4AAAA=
X-Change-ID: 20261123-sparx5-mdb-bridge-leave-db49b15ac354
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Casper
 Andersson" <casper.casan@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Haoxiang Li" <haoxiang_li2024@163.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_145600_945554_C78C0A0E 
X-CRM114-Status: GOOD (  19.89  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sparx5_port_bridge_leave() clears hw_bridge_dev when the last port
leaves the bridge. The bridge deletes the permanent MDB entries of a
port only after the port has left it, in br_multicast_del_port(), and
the deletes reach the driver from the switchdev deferred work.

Before this patch, sparx5_handle_port_mdb_del() then calls
br_vlan_enabled() on the NULL hw_bridge_dev, so deleting a bridge with a
permanent MDB entry on one of its ports crashes the kernel:

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000c10
 Workqueue: events switchdev_deferred_process_work
 pc : br_vlan_enabled+0x0/0xc

Remove all MDB entries when the last port leaves the bridge, before
hw_bridge_dev is cleared, and ignore MDB adds and deletes while no
bridge is offloaded. Disable the CPU copy of a host group before its
PGID is freed, as sparx5_pgid_alloc_mcast() does not reset it for the
next group.

The flush also removes host groups, the MDB entries that copy a group to
the CPU. The bridge keeps them, and does not offload them again when a
port rejoins, as sparx5 does not ask it to replay its MDB. Host groups
added before the first port joins the bridge are not offloaded either,
so this matches the existing behaviour.

Found by an internal test. Reproduced on a lan9698 EV board, without
kernel modifications, by deleting a bridge with a permanent group on a
single port:

  ip link add br0 type bridge
  ip link set <port> master br0
  ip link set br0 up
  ip link set <port> up
  bridge mdb add dev br0 port <port> grp 239.1.1.1 permanent
  ip link del br0

The fix was tested against that reproducer on the same board.

Fixes: 3bacfccdcb2d ("net: sparx5: Add mdb handlers")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_switchdev.c   | 41 +++++++++++++++++-----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
index dac4dd833127a..65ce225baa023 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
@@ -172,6 +172,30 @@ static int sparx5_port_attr_set(struct net_device *dev, const void *ctx,
 	return 0;
 }
 
+static void sparx5_cpu_copy_ena(struct sparx5 *spx5, u16 pgid, bool enable)
+{
+	spx5_rmw(ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA_SET(enable),
+		 ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA, spx5,
+		 ANA_AC_PGID_MISC_CFG(pgid));
+}
+
+static void sparx5_mdb_flush(struct sparx5 *sparx5)
+{
+	struct sparx5_mdb_entry *entry, *tmp;
+
+	mutex_lock(&sparx5->mdb_lock);
+	list_for_each_entry_safe(entry, tmp, &sparx5->mdb_entries, list) {
+		if (entry->cpu_copy)
+			sparx5_cpu_copy_ena(sparx5, entry->pgid_idx, false);
+		sparx5_pgid_clear(sparx5, entry->pgid_idx);
+		sparx5_mact_forget(sparx5, entry->addr, entry->vid);
+		list_del(&entry->list);
+		sparx5_pgid_free(sparx5, entry->pgid_idx);
+		kfree(entry);
+	}
+	mutex_unlock(&sparx5->mdb_lock);
+}
+
 static int sparx5_port_bridge_join(struct sparx5_port *port,
 				   struct net_device *bridge,
 				   struct netlink_ext_ack *extack)
@@ -227,8 +251,10 @@ static void sparx5_port_bridge_leave(struct sparx5_port *port,
 	switchdev_bridge_port_unoffload(port->ndev, NULL, NULL, NULL);
 
 	clear_bit(port->portno, sparx5->bridge_mask);
-	if (bitmap_empty(sparx5->bridge_mask, SPX5_PORTS))
+	if (bitmap_empty(sparx5->bridge_mask, SPX5_PORTS)) {
+		sparx5_mdb_flush(sparx5);
 		sparx5->hw_bridge_dev = NULL;
+	}
 
 	/* Clear bridge vlan settings before updating the port settings */
 	port->vlan_aware = 0;
@@ -528,13 +554,6 @@ static struct sparx5_mdb_entry *sparx5_mdb_get_entry(struct sparx5 *sparx5,
 	return found;
 }
 
-static void sparx5_cpu_copy_ena(struct sparx5 *spx5, u16 pgid, bool enable)
-{
-	spx5_rmw(ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA_SET(enable),
-		 ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA, spx5,
-		 ANA_AC_PGID_MISC_CFG(pgid));
-}
-
 static int sparx5_handle_port_mdb_add(struct net_device *dev,
 				      struct notifier_block *nb,
 				      const struct switchdev_obj_port_mdb *v)
@@ -549,6 +568,9 @@ static int sparx5_handle_port_mdb_add(struct net_device *dev,
 	if (!sparx5_netdevice_check(dev))
 		return -EOPNOTSUPP;
 
+	if (!spx5->hw_bridge_dev)
+		return 0;
+
 	is_host = netif_is_bridge_master(v->obj.orig_dev);
 
 	/* When VLAN unaware the vlan value is not parsed and we receive vid 0.
@@ -605,6 +627,9 @@ static int sparx5_handle_port_mdb_del(struct net_device *dev,
 	if (!sparx5_netdevice_check(dev))
 		return -EOPNOTSUPP;
 
+	if (!spx5->hw_bridge_dev)
+		return 0;
+
 	is_host = netif_is_bridge_master(v->obj.orig_dev);
 
 	if (!br_vlan_enabled(spx5->hw_bridge_dev))

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261123-sparx5-mdb-bridge-leave-db49b15ac354

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


