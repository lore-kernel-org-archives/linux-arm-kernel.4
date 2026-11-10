Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113660A2605
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wOW3dE95;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILLsqs4q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=; b=wOW3dE95QfMji1k0X8vwiNVrPO
	uqKlg4OXOXKIh0nHuO90KdcCu4JZjcEDrcgVTFhpH+4WJeM8ArBPxJPOShE2nbSIGhy0g/HG+3UMw
	whvmPinZnxMRYy3PDeCOKwKejoSrniMWEWoOWEQqIgObBeoRV4TWxkMFyQtEZnlwRJcKzs2Tc8CkB
	Pq5uc0KlcHOOD8TxmuaDgbe5K8dmWdG34nGsVWNHLL+CX4XtV4Hd/4RrcjJWrA4wXzKzA1oSM9Tdz
	MK8UgbCzRTwm2q/kP6b6qO8imIYW6L7ihoiW35plz+bTpqfpkBsO9kCUA7eS14YabHtvzaH5hwAXW
	8ixQCgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrYJ-00000004uXC-2muF;
	Tue, 10 Nov 2026 19:30:43 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrYG-00000004uWj-10Dx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:30:42 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-37600b0db49so603017eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339039; x=1794943839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=;
        b=ILLsqs4q+9laAmfwUF2Z1qzxpYldnYMvxDoYj8Cnr3VcZlA7rLB0J5jzMb6s/ttVWB
         tr0mrJczgC3eJZKVOZ2E4e0RzyPbLhpLYClNJmI/TnB6yEG3L8jUEgUF2RKc494prFc1
         9fuMkUPi1wkRBqB/2bHDHb1XuiWaR7G6kZt0WlYxTYeakpMPylEXzn5uyltRhF8qJxce
         iT43cCFqunMmZbTggNWTYmhqObMpa2KNheGhGGUimnpzxou1wyLkRb3a6uFVgWQ559W6
         II/4OZfUhCr28pZnc9+LD2L2/w3D65zAf7QXs+CZMHwyCuSe9gUlJBlHMI0ogC3ve2kp
         kmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339039; x=1794943839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=;
        b=KYL4hdVTSJGChfPujaZ/usm+zPYHeXRz5FuP0lrlZm3+qrm70KBHo5rVSR97VYdd3p
         2N03ZxaTVSnnlMuYnKkh0IsXZNiW3cqj4jzSo3q98R2ynvsHBkxtzOCxWdnSoH0psFGq
         Pn2FzIv9fZoGpTUVG8w66Yfwcw+VcY+bvol+EsFNh7/JxJDLIsB6kaWHVE43B15ZU9j4
         uc15h6BAwEPJGSPdw0awobC2dqMqZXYiKbO6Kk20mRCgHhBVT0UGvFLh0b8rysMtKZNJ
         2lA3Qecu0I3ZdhGDJyxCOWCGd7aPzb85lSETNZ12aWrsJZZJZ2QcVwrQN21m/9jdiFvS
         rHoA==
X-Forwarded-Encrypted: i=1; AL+hErEHrUbkPfoKOM6/ONCP/FCQHi58737ApUEaDmyNp9X29sFRP8Te9SBiTPQpwgoK1zPQv0+GjSYbI8e2ITyj4Xmc@lists.infradead.org
X-Gm-Message-State: APuU4Z9kXUXN/2V3qfNoDIqV4WkjNtmdQnk9meIfHn4kKSp5wDiMxoWP
	pF9p6AF6b0sW4VWEUzAIMd5eF0DKQLuwGBsJ+slKyAk4Mmc9UMkkUT5M
X-Gm-Gg: AYBFou0ZUnanRXSXQMTAmB/USdEpuUrmPyk/Cjf0c9IYQ1DzM3f5zdXJk2MqhgdKh3Q
	qFh8N7U1tJkA43lTh2D0dURyuQUiv4hVgdE4PjhtFOe1Yrrlxv5cTkOvUs3Fl55JXRD6ajuGskn
	Badh1rx9cYkhgJXEGufxQdIw+8Vti133a/YkCJjNMQKGjXERroCKqM4GZljK7HBTfYs7yofnp60
	wBDBHmGEJJQ2EMQrQP2MPeZzeD4xSDIaUuCPbqykN+C2tCtSLocxXAxP+OksTe1nUXBTvNBQE3P
	RansthIK8AlcqgwVbQUqx5W1nLP4w6zO+mosXAXP2+c2QxkoZ12sFosaIh8/KFk7rjNemAeW7Nl
	gCHqydxm6YHYbVvoKQJBbTm+YwxOS1SqCt4FXT6OQgF6s8gEgHj+hxP/rxNVwcgl1rqFGgsvAH5
	zzLjsnA6ZW7HP1ytXu0vPvksXcNZLSriOGJLLf8Igc/Opc29MxISFnZGj1Z1Tw6QmBVhu76tKoN
	Qx0hZEk5pyOeEKFQ4z+xlKhBh4oVA4ogCcZfINKUbXMh7zLqnCKDalenooSCzv5msG2u5nDuHM0
	8wAxZjR/dGhv6WQeevjCOewxeOCBBuL/yXLeQBnpK6WZQ/xqqg==
X-Received: by 2002:a05:7301:5f17:b0:375:85ac:d14f with SMTP id 5a478bee46e88-3766a1086f8mr574713eec.14.1794339038382;
        Tue, 10 Nov 2026 11:30:38 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7730435eec.0.2026.11.10.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:30:37 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/2] arm64: dts: rockchip: add USB-C PD and DP altmode to LubanCat 4
Date: Wed, 11 Nov 2026 03:30:26 +0800
Message-ID: <20261110193028.512456-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_113040_280134_485E7D1B 
X-CRM114-Status: GOOD (  12.24  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series enables the front-panel USB Type-C port on the EmbedFire
LubanCat 4 single-board computer, covering USB Power Delivery, dual-role
data/power, and DisplayPort alternate mode.

The port is backed by a Fairchild FUSB302 controller on I2C1 (0x22),
a fixed 5V VBUS regulator enabled by GPIO1_C1 (limited to 2A by an
LPW5209 switch), the RK3588 combo PHY usbdp_phy0, and two DC switches
on GPIO4_B3/B4 for the SBU1/SBU2 lines.

The series is organized into two steps:

1. Basic Type-C and USB PD support:
   Adds the FUSB302 node, VBUS regulator, dual-role power (source 5V/2A,
   sink 5V/1A) and dual-role data connector.  Sets usb_host0_xhci to
   OTG mode with usb-role-switch, wires HS data to the host controller
   and SS data to usbdp_phy0, and adds orientation-switch on the PHY.

2. DisplayPort alternate mode:
   Adds the DisplayPort altmode entry (SVID 0xff01) to the connector,
   wires connector SBU (port@2) to usbdp_phy0 (port@3), and connects
   the display pipeline: VOP2 VP1 -> dp0 -> usbdp_phy0 (port@2).

Validation and hardware test status:
- 'make dtbs' builds cleanly without warnings.
- 'make dtbs_check' against usb-connector, phy-rockchip-usbdp,
  rockchip,dw-dp, and fcs,fusb302 schemas passes with 0 warnings.
- Patch 1 has been verified on a physical LubanCat 4 board:
  * tcpm and fusb302 probe cleanly;
  * Host mode: USB 2.0 and USB 3.0 peripherals enumerate; USB 3.0
    operates at SuperSpeed in normal orientation (reverse-orientation
    SuperSpeed is subject to the known upstream phy-rockchip-usbdp bug);
  * Device mode: ConfigFS CDC ACM serial gadget successfully enumerates
    on a host PC at high-speed with bidirectional data communication;
  * VBUS power switch correctly enables in source mode and remains
    disabled in sink mode with reverse current blocked.
- Patch 2 driver stack registration has been verified on board:
  dw_dp binds to the display subsystem, DRM connector card2-DP-1 is
  registered, usbdp phy-mux and phy-switch are registered, and
  typec_displayport binds to the altmode.  Display output / link
  training is disclosed as pending physical verification due to lack
  of a USB-C to DP monitor/cable at this time.

Pufan Jin (2):
  arm64: dts: rockchip: add USB-C PD support to LubanCat 4
  arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4

 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 172 +++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

-- 
2.56.0


