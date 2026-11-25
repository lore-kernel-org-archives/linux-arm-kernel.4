Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A654606A6AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=knCPrKnI;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RzNVdPKf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/vZ/NUO91U7RmjEEQoND7bMbRcAjPQeJzuPnx5wjuNU=; b=knCPrKnIzLlguUY2jDW+KFMRzE
	BJauzN3sMIIhJokt+2ckdMObiF2bE6CO9xFRoeyCdoRrw7CTPc44bWJeYkzKYPNY1BHKLUUkR2MYI
	P674PVtPq26NBDantbqnxACuSECXOay7FGmWQ2AFIhhYhRCK0ClQHoPFiD1Q2HxVq73fmr32erIuO
	m66ffUYz66wyB9QYTtVw2nCbVcXbHOQvNfYbANKjEmDPv1v0OhwI28Z8Yg0uUsGpdj32osiMVo/lL
	oowEgssjGYbIOqdIG17xk3S8bk3Z9l0dOlj5yZ636KB87r4ikmpaw/EWbb1GGsgn1p8tDrhr3U676
	5mRKwiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKS-00000009SjV-0h3s;
	Wed, 25 Nov 2026 10:34:20 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKC-00000009SeJ-1jHl;
	Wed, 25 Nov 2026 10:34:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0E4AC20220C;
	Wed, 25 Nov 2026 11:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795602840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/vZ/NUO91U7RmjEEQoND7bMbRcAjPQeJzuPnx5wjuNU=;
	b=RzNVdPKfVzAoES/QYo3vaq2536/eoZ56Hcse5qvzAHrwxuDS1++EcMAFojo2VklUQm9Gio
	KBVIFNvceztK5XV6hpQ/hZ7nKrp8U0puDIIgvLx28uYmU6ifwAwBIntuzxqGTHCaGKbqzs
	joqJqt/OneJb6JNFPgP9518g7LbyZJMRh3KFKp6FrVmwHDuiUTqcd9MIS3NJJq6lcs0ebh
	vUk3qETvkGVhenAnvQnxnBd4thKF8MMLeEbGZiE6cJDY0hOCCKs9MgIsielcjzuvstoV2O
	NhYG6QALtIxbNwKV9hGwkPaAjTLHJ+ahk4ttstTLco7vT2dwmK+XC1BBD5WbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795602840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/vZ/NUO91U7RmjEEQoND7bMbRcAjPQeJzuPnx5wjuNU=;
	b=DS9rVM3VsRzwqwMCnxcNvzePbFGs0a+/i1VuV0Bi3QBxmp/iy9dY1kfhTSMooxr8kMkDDd
	GUMpspvZb/Ru89T5sD35OM+P2UAV5E7iR1dYeKCx9WJJVsaAVYFfMVy15dOOY/Vx61JfaS
	BkZom5Ni2yKvePGAnRD9DrjP8B5Y/hw0k/AxcWoXJ/Xfe8H/gG4DdbXp3SrYZtl35D2q6k
	yZXt4kvu+iLrQbrNZM/l3a0LfgHB7BoBVk/St1Gmxw+SAu9Yw13HIArIJhNDj0ExKtjELj
	/H9VfVGiCGBPH03GoFG2HQHa5jc41LUbA8jEG5Bay8hAoDcJY7r+0KrPlrlK1g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795602840; a=rsa-sha256;
	cv=none;
	b=abO8ki4S/2xozxmRMYPKdTjHiy4sj6ZvjI4uuoluOA4pL/5xUAQn4rFJzEI3aiJfLVYUGy
	Eac+rfZ39ualJsAJsDCxflk0R3Jwp5WwJdrWUZ//kldJeUCrL3KmPsfG8SNoPI8Zj5rU/P
	wIPqEbQDDAmaQUbZ6RYENyKc9EhjG/mK2P+RkEkbwE64RWQYFS7fh8kvVajMvsv4byTetf
	g/bv3lOjuNeMM499H8Q6U21mtXg7zEGZ8gAjQkRryPBObLxeVmrMBVdpxDvMSyeCpa+j/C
	hXH5YZ4hiCmMQiGWhYmWW5U3zx0Yuzhzax7gIZuHULMLjhVncge/OB3kFkrNDA==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xWAK7-001P9N-1S;
	Wed, 25 Nov 2026 11:33:59 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Subject: [PATCH 0/2] Describe ROCK 5 GPU and NPU regulators as post-init
 providers
Date: Wed, 25 Nov 2026 11:33:56 +0100
Message-Id: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm3iVPmJVzEsYKZC0TCkHYwJ4
 e6OsvwW721grMIGt2ID5beYxDnDnQrwYzcPjBKygc5UOUdX1OifZULlYX11KSoGXgxdIKK6by5
 11UBuF+WHfP7fe3vY1n5in34z2PcvNLSp1nkAAAA=
X-Change-ID: 20261124-rock5t-regulator-deps-1d2227b83768
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Midgy Balon <midgy971@gmail.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_023407_685100_BC75BEC3 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series addresses failed fw_devlink sync_state-only proxy links
by describing the GPU and NPU domain supplies as post-init providers
in the shared ROCK 5B, 5B+ and 5T DTSI.

Related discussion:

https://lore.kernel.org/aixze8zFboY3huSf@venus

Tested on a ROCK 5T with and without the series. All three device-link
creation errors disappear, while driver probing, runtime suspend and
resume, power-domain transitions and regulator reference counts remain
unaffected for the GPU and all three NPU cores.

The modified binding passes dt_binding_check, and all three affected
DTBs pass validation against the Rockchip power-controller schema.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
Freimut Diener (2):
      dt-bindings: power: rockchip: Allow post-init-providers for domains
      arm64: dts: rockchip: Mark ROCK 5 domain supplies as post-init

 Documentation/devicetree/bindings/power/rockchip,power-controller.yaml | 3 +++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi                | 2 ++
 2 files changed, 5 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261124-rock5t-regulator-deps-1d2227b83768

Best regards,
--  
Freimut Diener <f.diener@pengutronix.de>


