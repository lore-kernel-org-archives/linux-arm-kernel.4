Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF29606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S1Ccm5dz;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c4B4rgiR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=; b=S1Ccm5dzBmy0xa8iNNIcWqF4H6
	Bu0YqMIuBREe5qNfDuIVfpIYdmvc756nMUb3PdmRHoII3TJxzWEWRXE30ru+9tOgGhvTJ2hQ3IMAE
	Pr+YbPq799/dE6FSElsD4mjUZQrJvrdEVo6Tdh6MBC4mOft3AQ6B3wUu31OdSeM1ilmbMHojlzvyR
	AhJfQFZ1+CEJeTKUFvs0TR3IIW/HngNQuHSDLcUDGcH5ROukoNZvEs0ZPhrP7zoZJMJBQ9NoR2gJk
	5GY0AjZDUVcWamEJF9dWhegYWdwREyUbfVq7H9VYfl1wiLC2kOBpJFsm2GQ7N/mb2BSBjto7Ta6cc
	ng4NxHMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUq0-00000001WxX-17yH;
	Mon, 09 Nov 2026 19:15:28 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQUpv-00000001WwF-2hyQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 19:15:27 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-36e06480786so569804eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 11:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794251723; x=1794856523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=;
        b=c4B4rgiR+zIF3KFyeSyA8s5XNY7w/9s4Lte6hpIzX2l5d/xUQwQdQpW9czJFEwjmXU
         rcfL9ShWAYxuTHTesICP2oCcHpGo+XZOkd6S6knfP8CTV4N5zSuSwYxfl7oUsTmug/0l
         lzXFeJH8CXflEpVSJjwurayIAeHWbtat7JLDJw9NmxmUR5A9bm0wDuhsFgu3Q8mqwIzo
         Sr7/79D84FMZQde572EquLA5WDQ/9Jswgu+Q1HNqYkjak3v9geAl7NNcICb+rcSiIUj0
         Ku15ldY7zjAO3CKaWN6eFYXcQsFsGURbv1z9ePfn1phtowkjzWS+8b/GWnNwUCsQoOfQ
         LaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251723; x=1794856523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=;
        b=jgEZYh88Rw0qaOwsyziKKuY70iXdaUFf0mNAZoB5io/uQAnSJVmypl5NtICQsz1NVS
         upLV0PCsavvOgAtixtba3XBTQGV2uhLCkorPhvb43Mv2xdCUvuusgKBsj5BCzVeqe53v
         Ssr7KC81J+A1YL62ZHDw850FE8zgiFBHE1vGPoKbfm6nJhUnRGagoEur4j6XcusXi31m
         2BrvUV4jlM0SEDcGMfmYMv/huozJTnPjK9i5TDJgkZ2lPHWyNz/T7rlME4f7PzmJ49rF
         zi00jqszgbQq3Toc/+zLD7ML/qt6/likB71YNmSD3OMOR2Y4YRSQMhjcNeL4KiF8j+8P
         wWIQ==
X-Forwarded-Encrypted: i=1; AL+hErFO/rAX/ka5Qu++suEGqAtoyyoAMMsr9pVVceyopDPgfUpv6vvu84W0TMohYpuNKWF9UufJ7fkIpPfU5G3DCD2d@lists.infradead.org
X-Gm-Message-State: APuU4Z/qebKwR96bN/+MdAX5PD4CB3TafwJf0Ilupul6UxRopmgz4QW4
	d8Iv0Q8OHh3UtXvM770AbIDSE5EJsBMWa9TOwLINio6c3HzVUYngAwYLXDD2pZqA4Ag6Lq7k
X-Gm-Gg: AYBFou1yFpQcks3fwHHqkfrnWtrDJyDLgG3C1SmA/VJUzyzY2bvQwZH81X57YMM34R0
	2IUhSg1vpzO0ECeCdH1AoEmQtJ1QKIBFhHbbwpoYtO/T22lCn2/WFdvwpVwLAL4SBrO3Hxh0t6M
	KXMzbFJphIDArsN/UgNdE4C4lfmqVLAj3AE7e8NHefDY5ikoiA6YOEN5q/dNikYSRQGaDAcTu8r
	6vMKn8tElyuu7afRmmRjqeZOEhfpCdxiLSQeo2PJc9I0pNGurw8CP1/aEJLujMlUcQeDWUjE4bc
	zA6HS/2fz0rpD5CJW3a7mtxNlq2FSOo25pYncnu2LeyjwRz/JIcxIMyuqyQsH3DEG/XbaoUsJ3h
	No9lqLYhIvJJt+VMA4NvpyJGMTX9j+VK7EtTjrnY27zvO2o4v0oTH5hrNS+Mdrq8mqA7427Uc3i
	3v1GZQ/w/etPx41NAcGtuPDJbknsPaHZOsu+9XthOXdqQaKlT59pdLU/hFGHtjvHtzvnyALLAaa
	9V4QEElMeQS6JW98uYjaSNJUBO0RgiVcPXZXdN0o2SHA7Ut8apeZ8ivXM0gP0s/uFcq+hcX7puG
	Y70GMUDdocZa+TpW2XIqtrq+BuAiHStGJiLsI6xKXJ3p1hdfXCsyPgyly43ooILqu2mzeP8=
X-Received: by 2002:a05:7022:2207:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b3b5fed706mr643373c88.18.1794251722468;
        Mon, 09 Nov 2026 11:15:22 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm788478c88.8.2026.11.09.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:15:22 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
Date: Tue, 10 Nov 2026 03:15:15 +0800
Message-ID: <20261109191515.252449-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_111526_101526_785D2C2E 
X-CRM114-Status: GOOD (  12.95  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The LubanCat 4 PCB adds ~2ns of trace delay on both TXC and RXC, but
that alone is not sufficient for reliable RGMII operation.  With
phy-mode = "rgmii" and zero MAC delays the link comes up at 1Gbps but
drops ~90% of the packets; the PHY's internal TX/RX delay is required.

Use phy-mode = "rgmii-id" and keep the MAC's default delays.  With
this configuration a direct link to another 1Gbps NIC passes 2GB in
each direction with iperf3 at ~859-905Mbps, 0% packet loss, and no
CRC or error counters.

Fixes: 6d9430d58714 ("arm64: dts: rockchip: Add EmbedFire LubanCat 4 board")
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 0d28c6165..a042aa702 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -168,12 +168,13 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	/*
-	 * The PCB adds ~2ns of trace delay on both TXC and RXC, so the
-	 * required RGMII clock skew is provided by the board itself.
-	 * Neither the MAC nor the PHY should add any internal delay,
-	 * hence "rgmii" (not "rgmii-id") is correct here.
+	 * The PCB adds ~2ns of trace delay on both TXC and RXC, but that
+	 * alone is not sufficient for reliable RGMII operation: with
+	 * "rgmii" and zero MAC delays the link shows ~90% packet loss.
+	 * The PHY's internal TX/RX delay is required, so use "rgmii-id"
+	 * and keep the MAC's default delays.
 	 */
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2
-- 
2.56.0


