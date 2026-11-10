Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9CC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z374SUEK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bPXZOukN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S7tuOWTLMvg0fuI8kMson2JTK4rE+3WKtIaTYmHtZno=; b=Z374SUEK3VaMjaouej1Tvy4Umk
	7qxRcYCngr3XPAokgJlq28GbX2cde38pmTFycrgCcCcEplzd2uri3wtUkBCYhGLIKqph8dbaBGlt0
	fK8OWYnMfR+bSxlFNgD1r4nNgeot6EflvCLQfJa8pl55b3aL6t/hHqKxBNPabRWliaoNzsKY3171s
	lK+9z+To2Nmfq1i72GhbdP/paEtd0APPH6spYrB6OrLLKISIURJzArIsNSZrmfJDuc9RkZBeHPGha
	pJ0B6g4zNHowIwE3DRVQL2BHP4QIlQ9mu80+edf4gGOwBPHQcg+vCVnre7G0JMJxYHzuZd73XLyOm
	rOkDPKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9t-00000002t8E-3pzg;
	Tue, 10 Nov 2026 07:20:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9K-00000002sZs-2kmv;
	Tue, 10 Nov 2026 07:20:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BC204095C;
	Tue, 10 Nov 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295210;
	b=sTci4xfv0nkeJJo08Wo6jJ3Q1izzrYTXbfZ/UHIVKAD2Y31f+q9Qm+74g+a1vHZIew/X
	 kO/Py2z4Q3ymKc4yG8HYo06m8Xt2JJw95cTmcUH+lCRSZVRtrBatsL9qyAxfVTLivozyk
	 Yx+nYmeSkvbamRFvnpRDYM+YsBxO98Kk1Zmkh+eIDlUUeHDQNr/akbKyMqYpmOtdDq5dk
	 VJ96BcpdIQfps4ZJtpIzn7QNAlcb5RELiS39fKe34ibCaPPuTsK6J+Y9O9iDKSVnmGMZY
	 GWHAzL4gTYYWPxVgoxeqJlrXQtBEPHNz/6YtpRHWTV4XIIvOCuQmrIq/aynFX8Zy8Lw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295210;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=S7tuOWTLMvg0fuI8kMson2JTK4rE+3WKtIaTYmHtZno=;
	b=rOpU5t8GBEQkRjE8KBM9j38B4kmDE8nstmWz0FwLSo+BHZ8cYc9qYZe1UPS26h72bRHz
	 b7lcA2tp3ffM1R9FV004h40VI8mO/aynGWX8SD/gunhpKhihxPUy52oA+rpDXVYJV5zph
	 Ulk4eReyDpcFSVeqGPH6YvXKJbJZr6Nq5cXx3zLLGaAVolCo7vISC0EDDQSAmWOk3YKI1
	 BQg91EL5oNC/P+ZLkO3ygYUlVbil7Por2mtJT6g1sdkGGXYN3UJoVekvxz8mQLb1cNhaN
	 LJQW/qLx0Gv7ci3W34d7VUp7/o01k0ijXZXL93oKW6qrE7+cGJwsOj44mXtxxJ3DGUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BF7E1F008A4;
	Tue, 10 Nov 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295210;
	bh=S7tuOWTLMvg0fuI8kMson2JTK4rE+3WKtIaTYmHtZno=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bPXZOukNuN1yhM3NBlrhS6I9OUCNIxOQR8YhiUxJI8epgzwuHTkW0c0w9SM1jeCBl
	 ILzadqDxePpTsddzxRzFS4UeWQX0kSB8vFSKkUDfdk8pCO8+ayYUOowmxIM6InS6mc
	 QaX3DOPj+S2AnTPPA4svOndNW/riugMFhHmynaQ6LvXaYtgcAlITl4neIY92yoCLES
	 /tk/CtVHGH5+sqLkxkoL5ztnuuV+Hvh1Pi8vjCe7kFDD0dCRVQIkdAnI4Y4mygRkh/
	 Do+pHx0f62T7bi6MvESxVqvZuoMfJvPR4uXuXWsWtd74kNT2iJ0MU0vkEsGXD4L1CC
	 ZiGiziCY8Vbfw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C1399489E8;
	Tue, 10 Nov 2026 07:20:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:20:08 +0000
Subject: [PATCH 3/4] usb: hub: Retry SuperSpeed for a device stuck on its
 USB 2.0 peer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-usb-port-pairing-v1-3-9307e29d2ed2@gmail.com>
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
In-Reply-To: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295206; l=5559;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=o0TEY94Lcp0G4zfSWLAFe2ufVpMSLEacQDZB/y37oPQ=;
 b=SAwJ8WxdcJNxSs9HdlxNCXBiK4s2DP/RyvnvOBbIpfqRaFLyzlkN8IT7ZlCQk7i8hPeESE7i1
 BUaWybOwT0sCpzeP+b7aNer3ul+HumRiCZRBm8ruzOuYei28D9CzYag
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

A SuperSpeed device looks for a SuperSpeed link first when it sees
VBUS, and connects at high speed when the link doesn't come up. It
looks again only when VBUS is cycled or after a USB 2.0 bus reset.

When a connector's two halves belong to different host controllers,
the USB 2.0 host can start first. On the Orange Pi 5 (RK3588S), whose
USB 3 Type-A port has VBUS on from power-up, a USB 3 flash drive
plugged in at boot was reset by the EHCI about 10 ms before the
SuperSpeed-only xHCI registered, so it came up at 480 Mb/s on the EHCI
in every one of 6 boots, while plugging it in after boot gave
5 Gb/s. It stays at high speed until it is unplugged.

When a SuperSpeed hub with ports paired through a connector starts, or
comes back from a reset or reset-resume, check those ports' USB 2.0
peers. If a SuperSpeed-capable device is connected at high speed there,
reset it once, so that it can connect at SuperSpeed now that the link
can train. Lock the peer hub first, so an enumeration that is under way
completes before the check. A device that still can't train its
SuperSpeed link stays connected at high speed after that one reset.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/core/hub.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/hub.h |  1 +
 2 files changed, 89 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535a89..df88de5bbf54 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1076,6 +1076,89 @@ int usb_remove_device(struct usb_device *udev)
 	return 0;
 }
 
+/*
+ * A SuperSpeed port paired through a connector with a port of another host
+ * controller can start after a SuperSpeed-capable device has connected at
+ * high speed on that peer: with VBUS always on, the device looks for a
+ * SuperSpeed link while the SuperSpeed host is still down, gives up, and
+ * connects at high speed. It only tries SuperSpeed again after VBUS is cycled
+ * or after a USB 2.0 bus reset, so reset it now that the link can train.
+ */
+static void hub_reset_peer_child(struct usb_device *peer_hdev, int peer_port1)
+{
+	struct usb_hub *peer_hub;
+	struct usb_device *udev;
+
+	/* Wait for an enumeration in progress on the peer port to finish */
+	usb_lock_device(peer_hdev);
+	peer_hub = usb_hub_to_struct_hub(peer_hdev);
+	if (!peer_hub || peer_port1 > peer_hdev->maxchild)
+		goto out;
+
+	udev = peer_hub->ports[peer_port1 - 1]->child;
+	if (!udev || udev->speed != USB_SPEED_HIGH)
+		goto out;
+
+	usb_lock_device(udev);
+	if (udev->state != USB_STATE_NOTATTACHED &&
+	    udev->bos && udev->bos->ss_cap) {
+		dev_info(&udev->dev,
+			 "SuperSpeed peer port available, resetting\n");
+		usb_reset_device(udev);
+	}
+	usb_unlock_device(udev);
+out:
+	usb_unlock_device(peer_hdev);
+}
+
+static void hub_peer_reset_work(struct work_struct *ws)
+{
+	struct usb_hub *hub = container_of(ws, struct usb_hub, peer_reset_work);
+	struct usb_device *hdev = hub->hdev;
+	int port1;
+
+	for (port1 = 1; ; port1++) {
+		struct usb_device *peer_hdev = NULL;
+		struct usb_port *port_dev;
+		int peer_port1 = 0;
+
+		mutex_lock(&usb_port_peer_mutex);
+		if (port1 > hdev->maxchild) {
+			mutex_unlock(&usb_port_peer_mutex);
+			break;
+		}
+		port_dev = hub->ports[port1 - 1];
+		if (port_dev->connector_peer && port_dev->peer) {
+			peer_hdev = to_usb_device(port_dev->peer->dev.parent->parent);
+			peer_port1 = port_dev->peer->portnum;
+			usb_get_dev(peer_hdev);
+		}
+		mutex_unlock(&usb_port_peer_mutex);
+
+		if (peer_hdev) {
+			hub_reset_peer_child(peer_hdev, peer_port1);
+			usb_put_dev(peer_hdev);
+		}
+	}
+
+	hub_put(hub);
+}
+
+static void hub_queue_peer_reset(struct usb_hub *hub)
+{
+	int port1;
+
+	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++) {
+		if (hub->ports[port1 - 1]->connector_peer) {
+			hub_get(hub);
+			if (!queue_work(system_power_efficient_wq,
+					&hub->peer_reset_work))
+				hub_put(hub);
+			return;
+		}
+	}
+}
+
 enum hub_activation_type {
 	HUB_INIT, HUB_INIT2, HUB_INIT3,		/* INITs must come first */
 	HUB_POST_RESET, HUB_RESUME, HUB_RESET_RESUME,
@@ -1346,6 +1429,10 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 
 	/* Scan all ports that need attention */
 	kick_hub_wq(hub);
+
+	/* Let devices stuck at high speed on a connector peer move over */
+	if (hub_is_superspeed(hdev) && type != HUB_RESUME)
+		hub_queue_peer_reset(hub);
  abort:
 	if (type == HUB_INIT2 || type == HUB_INIT3) {
 		/* Allow autosuspend if it was suppressed */
@@ -1978,6 +2065,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	INIT_DELAYED_WORK(&hub->leds, led_work);
 	INIT_DELAYED_WORK(&hub->init_work, NULL);
 	INIT_DELAYED_WORK(&hub->post_resume_work, hub_post_resume);
+	INIT_WORK(&hub->peer_reset_work, hub_peer_reset_work);
 	INIT_WORK(&hub->events, hub_event);
 	INIT_LIST_HEAD(&hub->onboard_devs);
 	spin_lock_init(&hub->irq_urb_lock);
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 78382839be48..edce19d7bf13 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -71,6 +71,7 @@ struct usb_hub {
 	struct delayed_work	leds;
 	struct delayed_work	init_work;
 	struct delayed_work	post_resume_work;
+	struct work_struct	peer_reset_work;
 	struct work_struct      events;
 	spinlock_t		irq_urb_lock;
 	struct timer_list	irq_urb_retry;

-- 
2.55.0



