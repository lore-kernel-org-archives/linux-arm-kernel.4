Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B9606A842
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g68Jw/rR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqZcLjUi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DkaffjxzggLlMXpgZQepyL18nNM0osfja6I6IUMmRsY=; b=g68Jw/rRiUrKm5N9EfbFSM0MeG
	HDDuTMW79F8MBrb/E60c7l5/f1fmSeWtq3gc+mrGaBtWpuaVeQLs2EGdvvQfRjUvpyvqmpM90x11k
	oHkz4dEIeedgMhWOx8wvkPnZVRUKSUmrJm43mk1OE0JmIyruTNXMA+YRjogwAFt0tqW/1sCdagsXz
	RkLoRpd+9cmSmbQinc2I2UHbtg8JML+U3paxPbzfJSGkCq8F8exm8kZM1LHH98uyZOUxsBAAk05c1
	zEjUMHHlfVa+cAKmfcOw1Qv/byT4d/PPEHRTPrerUUlptl4BNFDwDUdMvOnZFoqHcasK6jWWopnkd
	C6ZMlsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9g-00000002swB-3PEn;
	Tue, 10 Nov 2026 07:20:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg9I-00000002sWQ-0zJx;
	Tue, 10 Nov 2026 07:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C80D1432D8;
	Tue, 10 Nov 2026 07:20:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295207;
	b=MMS0NZO+6shkKxT0/Z4AzrcufdCvVwLjvPpLlzauf++4tkr5E9MIyfxxT3GLzP6YQDWP
	 FHM30yPIIX/VscYXOmCDxM8jzvD6y5VQmOc2gAGjBH2qfTRNLyV99TNx46cL7DfM3sE16
	 I+Js8aLeVaUbtZEgSO6BtT4MJfA2gkGhmJa2M+UWwW+Skf6N37XBFqgfgl6qz8/c1iePS
	 6EAtZdz+ig1AJT40qKblFPUM3X5Owlanwka9+LPT3A6lx21x/W8rl/D93zgj54WpLIgjr
	 IO83mDORLglnvKmpz9mLyQPuJBz6rzClJu5ycmzb2LJCZFWw9r2VKK8ot6Ndnm+2Riw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295207;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DkaffjxzggLlMXpgZQepyL18nNM0osfja6I6IUMmRsY=;
	b=YsoFqwNCiUPbI+YIRdGEKn7d4Odo1zjQT+qLvzMiuNmhT0wANWKVi28MOrKgdMsH7ZYX
	 PzAGqsOSU/yXPryiwKbnWpbBq3QMfW4q32z9JWCWJ7seOAVj21MIMfuRAIfukDYLe+A/L
	 FrpItq6uD7FCPyKG/l9/PNmNl+vQti6SMZo343ulMVp+lJ8hVqXLDr0nw+QZB16rZnltp
	 RYRY7JmvEfy6DU3BpoOZi9W1U7BOl35kXOa6Gk3QUkLREKWY5Vng+VLSjVmn0TjkZ5mms
	 ZN1zXpRBwWo0dOJqDVwVdAxueT4TWYj6W8Lcz8Rpqr9GK1ft62nREPgq5xk/6humdIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15EA11F008A2;
	Tue, 10 Nov 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295207;
	bh=DkaffjxzggLlMXpgZQepyL18nNM0osfja6I6IUMmRsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UqZcLjUiTc3ARHGFm43xcIoSePOF302bX7Jc0I8jrs/9F/YWlP1qAFvNRC4viosbH
	 Ak3uLH9/NoB/Sbwa7swYfsOzboWbxFCmJKCGTmiZZN27N7Pt9l7yMDk+9iA7+ZQjfv
	 M4Gtx3o+9VepifF/DSBCqjxtGWGHmokaloK2GpNM/ZggNA1VNRfV4O8+biQ6kvkZdd
	 wPC2s9UpxQXCHKEgpmyIv6stwfxWxau1ViU3u3SeU6a41vrZ37OxTIOL6vzPNImaAy
	 Be5Rkkc3Ly3qwAdCXcpyFepoUKoIrqWtX5lbTeD5VouPRwwGPqCvWb8AgJtUP1j2Rz
	 ORtMKz5BuWd/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9ED2C489E3;
	Tue, 10 Nov 2026 07:20:06 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:20:06 +0000
Subject: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295206; l=1701;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=XJm2p3cBaQH7CQW9BFwWeXyIaL1TnsEG5XYxo2DdPHY=;
 b=Z49FAgk/mtw577IjyyCSPTGHpreFuxeB4B4vjpWfaQWB5Atdm9uqD8p9EESPkon+PAAAw5EcB
 3em7S98g/2ED+rXTPW9X7btWvyF4foVvaC0EaT/g/Za/sHFcj8Ps3Rj
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

The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
always reach the same host controller. On the Rockchip RK3588, the
SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
which EHCI root hub port shares a connector with which SuperSpeed port.

The USB core already reads a hub's OF graph, with one graph port per
downstream port, and uses it for the port connect type. Allow the same
"ports" node on EHCI controllers, so that a root hub port can be linked
to its usb-connector node.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 908b02d9175e..9dcba539d60d 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -160,6 +160,19 @@ properties:
       - host
       - otg
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      The root hub's downstream facing ports, linked to the connectors they
+      are wired to. Needed when a connector's SuperSpeed lanes go to a
+      different host controller, which then pairs with the root hub port
+      through the connector.
+
+    patternProperties:
+      "^port@[1-9a-f][0-9a-f]*$":
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Root hub port, numbered from 1.
+
 required:
   - compatible
   - reg

-- 
2.55.0



