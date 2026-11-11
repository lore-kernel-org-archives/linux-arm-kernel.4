Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656660A2622
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VIhf7/QQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBBbjLb/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dr/c6inyZfcsokKdZljfnN0MuHP4f675XnQJYTzje7k=; b=VIhf7/QQ5i9TDPB8O96gbgABFW
	oiw2Sq2RD4o4X0tNj9nipznYM6U8UnwFxfurfSKHVUOCEOcdrTrzxTIGwh1BSwYJ+rcDvXkZhn2yf
	puNlTE2ekalLTkR/10m0fJVGsYWQpA5ejv3cGIhDIE+7NFshQ+ujrvPzRbOpyDyyKfAGmp8XyBg94
	RlIejrBgazdU+XgGNOjkO1ulKLkyTg7d2YgxalGh2+n54NYnWlwqKTaNp9JsfnNbvkWK1cF1nibHc
	lTeuTZ5QDNBjfxv3sinWVrRdmCgOsOKm+O3nExBlfRGhtccFVC2MrHAAB1roUD+Ka9sZceUm51OUA
	HeX/rdUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Yv-000000070CW-3cwX;
	Wed, 11 Nov 2026 14:44:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Yt-000000070BP-0aLL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:44:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so19782435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408269; x=1795013069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dr/c6inyZfcsokKdZljfnN0MuHP4f675XnQJYTzje7k=;
        b=WBBbjLb/PJSlhHaoQ4M1jZjpweMRWVOMZB9dIDYe3OO4/oNKbDCuOseZJYij43NVH1
         6XRmVAP561MHnMX+N3RT5CdKnbHtTUsnt9oa6m+KH44QGXQax9EslwTrjLoH+HhE1BDz
         /BVPPBNvQ7m30ep0GQl7N9gkVRdQ1GLJKI7BzwgsL68C+SoMpKnI2iv52kxkxECqluAV
         PVBcUKsQ0r+5PAZN0vV5FmmHhbDcztg5HoFJE7CwlQqLbjpckxnkUuHBS8xTGQr7gaqQ
         EhKB86xjp9WUgjhCT0iTxvNED0pSq7UypYrnosVbPvJyolUm445ohi8urUVxwsIx9TkQ
         bbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408269; x=1795013069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dr/c6inyZfcsokKdZljfnN0MuHP4f675XnQJYTzje7k=;
        b=inuWYoylwFatWttcZJlfTXhcV/64Q6JPuVWH1cWeHUpvmUfsKfz7ltmAdPVBuQLN0w
         T57WyD4d1jDNJbki3fjDdZJYITyel4PQo73oxz/Bk39mK91klv4qktUobYZKsSMZ44e7
         YzSmEKAOedHFIbmPQWsBFnlKv4p1bluw1S7yoYlaVWfhldAYhRzWiiGeMjIpOuTt5Tpn
         rXF1rV097pkLPvXSaLH9cYoYjvOLvILPq6L91WpS0LgumYpCPpZwvkhXYtsRkZGnCreR
         kVl8se3eoj8h8ONK8SoZa5XuhMhrR5bAOausDrX7Oe/ECvDiGgB1C5GO7iwPKfR9Jk1n
         sUXw==
X-Forwarded-Encrypted: i=1; AL+hErHUYdxrGn3qqYD5pkuAw1d3pjjwmGnWRvZf+SMYPM1aIKBCtliCKFjRq50MF7hPEb1P3CzSSFvOvbOyPSGiGmvK@lists.infradead.org
X-Gm-Message-State: APuU4Z8J6eyrDd4CQu6pi1JUwq2S/JBJkgpbEH899QQiHDg6NZfiFPZ3
	o2i56a/rnGwwobBNYQYmp4WpTzz4LnSlY/Pwx9/9z0XyI5BNOutct7wF
X-Gm-Gg: AYBFou1l5/+reY44q6q9Q81q6CYosIOYnOdMRvCcOSq5x6oniwQk7jdyV3XRCII4g5M
	tDW2PVBNzIwozfT9FwEjtZezMmjWjp9v5CgkuHLY4VhjjE7UZNyQKMIaCzPQTY6s0JhpxGuuz20
	K1mpwNxENejYtorUvdIKvG5LTSqielm+BAIew4d9gHmTWNWvq8CKuI8TSbg2wGE8RUEFNAe7uj8
	aMrxNT3aD2u+aHqucotJPZKSDRh6X/HEJgajCokLvpOe79SFatqDYA+k4Imlk2frDedOr5pguL0
	FsFpIBKoQj1xB/B9Zk0I8COcrV0SNFrSVDEHatin030dWU0bBTsUlAR865HJR6VKDGZscoO7hKo
	Y21FA6Mj+NixeA6+8tRKJOoUTCmnnjMtukDxPsGtRbq4wcFzHcQvxEm1qlXvcA6ui7VQBnyV+aK
	ZAsPvRvuMDtpFPtRwfh7rwUF4QeuNyxw2UCcjFmsWbn4ZP0bJtxYfCDJe3oJYeT+LfDWjhg5TS6
	RnKDNwfzPcFvi9TA6Ka8ge9RSCLC/m44vxwlubVsXVTyXCXZzFPj9S1EO5wwPmWY6G5wcji/OZM
	+eq2nK5x3Nynq7ZmhjcO/5LVGTJgJRQQDtE=
X-Received: by 2002:a05:600c:3b01:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4ba09344326mr47001535e9.3.1794408269178;
        Wed, 11 Nov 2026 06:44:29 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:28 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 0/5] net: ethernet: zte: zx279128s: offload flows to and from WLAN interfaces
Date: Wed, 11 Nov 2026 15:44:21 +0100
Message-Id: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_064431_208488_EFA6E079 
X-CRM114-Status: GOOD (  21.81  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series lets the ZX279128S switch driver offload flows whose ingress
or egress is a mac80211 AP interface, so that WiFi <-> WAN NAT traffic
no longer goes through the CPU's forwarding path.  It is based on Navid
Ghahremani's v2 platform series, which adds the SoC and the driver:

  https://lore.kernel.org/r/20261014072109.1759502-1-ghahramani.navid@gmail.com

The switch fabric has a second DMA engine (a ring pair the vendor
firmware uses for exactly this) and 16 "WLAN logical ports" that a
classifier entry can name as ingress or egress.  Patch 3 adds the ring
and the ports; patch 4 binds a mac80211 interface to a port on first
use and accepts flows from the flowtable in both directions; patch 5
adds debugfs testing aids.  Patches 1 and 2 describe the engine's
interrupt.  The WLAN drivers are not touched: the frames the fabric
forwards are handed to the interface's normal transmit path, and the
frames of offloaded flows are picked up on the interface's ingress hook
and injected into the ring.  Any mac80211 driver works.

This is not a WED-like path: the SoC has no block that chains the two
DMA engines, so the CPU still runs the WLAN driver's own transmit and
receive paths for these frames and moves the buffers between the rings
(no copies on the forwarded path).  What it no longer does is the
bridge, routing, conntrack and NAT work, which is where the CPU time
went: CPU0 drops from 54 % to 13-25 % at the rates below.  This is also
how the vendor firmware uses the engine.

Sent as RFC because:

- the base series is not merged yet, so this cannot be applied as is;
- a mac80211 AP interface cannot be put in an offload-enabled flowtable
  today, since mac80211 answers -EOPNOTSUPP to TC_SETUP_FT and
  nf_tables rejects the device.  This series was tested with Felix
  Fietkau's OpenWrt patch that ignores -EOPNOTSUPP there
  (target/linux/generic/pending-6.18/
  701-netfilter-nf_tables-ignore-EOPNOTSUPP-on-flowtable-d.patch).
  Felix, do you plan to send that upstream?  Without it, or something
  like it, this feature cannot be enabled on mainline;
- design: binding a WLAN interface to a switch port from the ethernet
  driver, through the interface's regular paths, keeps the WLAN drivers
  out of it.  I would like to know whether that is acceptable or
  whether this should go through something closer to the mediatek WED
  model.

The SoC has an unrelated problem under WiFi traffic: a PCIe read on one
CPU deadlocks against L2C-310 maintenance on the other, discussed in

  https://lore.kernel.org/r/20261110153522.1620088-1-isasmendi.agus@gmail.com

This series was tested with both workarounds under discussion (a lock
around the PCIe reads, and the L2 cache off through the device tree)
with the same results.

Results on a ZTE ZXHN H3600 (MT7915 as AP, a phone as client, flowtable
with lan, wan and the AP interface, NAT on wan):

  WAN -> WiFi download     393 Mbps offloaded, 109 Mbps on the CPU path
  WiFi -> WAN upload       186 Mbps (capped by the upload server), 60
  30 min soak              111 transfers, none failed, ring counters
                           consistent, kernel log clean
  cold / warm boot gate    17/17 and 5/5 boots, offloaded traffic on
                           each, no hang

IPv6 flows are not offloaded, as in the base driver.  The register
sequence and descriptor layout were reverse engineered from the
vendor's GPL kernel.  Builds without warnings with W=1 (board config
and multi_v7_defconfig); checkpatch --strict, dt_binding_check and
dtbs_check are clean.

Agustin Santiago Isasmendi (5):
  dt-bindings: net: zte,zx279128s-gmac: add the WLAN DMA interrupt
  ARM: dts: zte: zx279128s: add the WLAN DMA interrupt
  net: ethernet: zte: zx279128s: WLAN DMA ring and logical ports
  net: ethernet: zte: zx279128s: offload flows to and from WLAN ports
  net: ethernet: zte: zx279128s: debugfs knobs for the WLAN ring

 .../bindings/net/zte,zx279128s-gmac.yaml      |  20 +-
 arch/arm/boot/dts/zte/zx279128s.dtsi          |   4 +-
 drivers/net/ethernet/zte/Kconfig              |   5 +-
 drivers/net/ethernet/zte/Makefile             |   3 +-
 drivers/net/ethernet/zte/zx279128s-eth.h      | 124 ++-
 drivers/net/ethernet/zte/zx279128s-main.c     |  18 +-
 drivers/net/ethernet/zte/zx279128s-ppe.c      |  92 +-
 drivers/net/ethernet/zte/zx279128s-wlan.c     | 874 ++++++++++++++++++
 8 files changed, 1114 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/ethernet/zte/zx279128s-wlan.c


base-commit: 96b4b72978e9fcfdd74f809c159f26813995631b
-- 
2.30.2


