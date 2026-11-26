Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A7606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EI7I72Lz;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Ib1kjaof;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Dse0tQzx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Dt1leGuDwrWA2E3OVhdzYv2X+ho/ucBUcti/3VyXxnk=; b=EI7I72LzLIAfXyNg1dbZC1NpQL
	iS5KKLDebgIkmUJQa2SVW5JsbjSpMq/1dF/xj+0V7mlZNvNSu0ATNEkhQ3WwXfecLtcyGGSBjK6nA
	HmwiKBi5YzAx+W31lNxf8kqgV0Lr8HngzYoONauVItg0ZYHJ9tVh/v9foBLAxypotTsnoNmFxNINk
	w+PEZH3wrJetzWWYc66GuwSG6XJY9Z9RQoQwKbVM2ZtsvA6dhSMY8M80ddNtaJRf0MINmXolxJODq
	6H5kJfLwUqEecMolNZL4oRZBv2ooZFqhUIeSsunUHtLxnnAQR5dH6UUmp3lghi1tqFE4/pB6ipYn0
	1KI+VmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf8O-0000000EIYs-0meA;
	Thu, 26 Nov 2026 19:27:56 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf8L-0000000EIXf-03FD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795721271; bh=Dt1leGuDwrWA2E3OVhdzYv2X+ho/ucBUcti/3VyXxnk=;
 b=Ib1kjaofffLRqFzChJbFtRw0dL2qomq/Mu9kyrgDMv7vz6R0y6VpL8CYR0EIKU97JxKvkSBXq
 dwJY9K8Vn3L1R/AYY5YZXt2kzJvt/Ln2+EGt/qjonpCCz6gcaUFpNMMnsiFdil2lnVu5Xn//xt1
 3JE1828sIkS0V5hvHjifZnNxUni6fLqYY//zcpTAYNJgt0GXQZubj8Ho+oxwVP/yicOqw3K4W7J
 w2/xzD1+ymahZSFqhLSvidAx+/b497CdgxsficnMj7+7StZDoTUS+9MjC6oBFet9vUtPmo3J6jg
 xDQICXeEqoghjPoQj4YUzEUC6p8B+++s7mYRIwhPRE9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795721271; bh=Dt1leGuDwrWA2E3OVhdzYv2X+ho/ucBUcti/3VyXxnk=;
 b=Dse0tQzxiTw9C5iA4so93j9IPit74yxaGHfPwqs9KXS95JhWIePjfKixGmT5TqHAX7gx1QIYf
 4OVAih782q97Wivm1EB6dJOmb/ugGqT+qc4UPJK9alPpDlgEADljSUuxxir2Ev7LGXhQ2zx8GTj
 u3XTxpcYJZkSUARwKgC2424=
CFBL-Feedback-ID: 6b088836b69a54ed847adb2c:f6ea4d869c8a42e936c08f2cc48301d0
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b088836b69a54ed847adb2c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/2] ARM: dts: rockchip: Add ArmSoM Forge1 board
Date: Thu, 26 Nov 2026 19:27:43 +0000
Message-ID: <20261126192746.1595707-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_112753_532539_18642328 
X-CRM114-Status: GOOD (  10.98  )
X-Spam-Score: -2.0 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial support for ArmSoM Forge1 [1].

ArmSoM Forge1 is an industrial-grade product powered by the RK3506J
triple-core Cortex-A7 application processor. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

This series depends on the base SoC dtsi added as part of the series
"ARM: dts: rockchip: Add Luckfox Lyra boards" [2].

Mainline U-Boot support can be tested using a branch at [3], it contains
board support using same devicetree files extended with USB support.

Changes in v2:
- Remove unintended use of zero-width space in cover and commit messages
- Add spi_nand label to flash@0 node
- Drop rtc_int pinctrl, it was not referenced and unclear how RMIO may
  affect how hw description of RTC IC may end up
Link to v1: https://patch.msgid.link/20261122184532.1300004-1-jonas@kwiboo.se/

[1] https://docs.armsom.org/armsom-forge1
[2] https://patch.msgid.link/20261125214421.1580359-1-jonas@kwiboo.se/
[3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (2):
  dt-bindings: arm: rockchip: Add ArmSoM Forge1
  ARM: dts: rockchip: Add ArmSoM Forge1 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm/boot/dts/rockchip/Makefile           |   3 +-
 .../dts/rockchip/rk3506j-armsom-forge1.dts    | 223 ++++++++++++++++++
 3 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
---
Based-on: <20261125214421.1580359-1-jonas@kwiboo.se>

-- 
2.56.1


