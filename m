Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D54460A3824
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uaPaE+Rb;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Rk3AVr1U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dux1zJGa62f9xbjo84Vj+UwdderRbp1DFisvELsP2Ng=; b=uaPaE+Rb+0hxy/
	VXnjnADcrbjtULCvRJhZjPNjsovKnE1edmQgoeVl6PKECYEudFXX+QUCnohoHlU2BLlDQMedgJVkU
	6yGTC698eBFZEqCSXUH/w/mgb1x2tmyTEtM3+5D8CQd0hlUXdzr5hWJmxJnBBUGQW9hBQLDvgZAWJ
	h7rhiqhuFYU2+YQzHhxk5nA1KhsaEQbRVAPV5Qlkdap99yqQOL5C2J5ImzI26NtktlOLC0vWKXSf8
	J3Lwt3OueqDecWidAMtm82O48WhEkZCSO2wPr45ATlKMVHdlXjD3TVdr+XcICWi+5q30F+XxSVvh0
	aFMtFN9mJJ9iTq/kQrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKH-00000009SgM-3h9E;
	Wed, 25 Nov 2026 10:34:09 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKC-00000009Sec-1e4C;
	Wed, 25 Nov 2026 10:34:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4D5922004F5;
	Wed, 25 Nov 2026 11:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795602840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dux1zJGa62f9xbjo84Vj+UwdderRbp1DFisvELsP2Ng=;
	b=Rk3AVr1U48GCmhw4djHMbEqg6kG7+o+u6aB7GAaq9IU0BEQlTpb61ZlRat4U8lAs1qoZ0P
	QJgvTHAc4wVGEKlihzMAXYwCcPy2gbcit2sXeZNxWWR4fn/IxmWRCv4NcdYhb4LL057HDK
	QLyiK6rBTq7VnDzf84f89qpreag1icN/vkcxGlxyPmP2aGMocd3tcpZJnoAJcDIXlFHESQ
	ptYOKyGrhfHPJ9mQhjMs5cBnv7FyYpQsP8S1YquFada64crSdYmEkSy09+XT3Ep9x/+Irp
	iUJyAyDE/nlKMZ2l1pqpb379NUZHwfy6aifW8L/KgInK70GBy2ZrkFM17/W3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795602840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dux1zJGa62f9xbjo84Vj+UwdderRbp1DFisvELsP2Ng=;
	b=QVm9SxnFBlbh3bihbIVI9mkzDgBowJ6NocYYuZiVnl4S5QZx2qirjohwtteqVIpBavcZZ/
	+wnFhmLs3VcU+cIR6gYHTGLhpwfKQ/puHrzB2+LLU1WXBn24qx3X/7f7vcgbTmc9ugNorg
	74H8OIl5jah8hjvdaIIizKr7e5OtK93qVGyrND39fj53lsAnhAXyXpvRqYQAcx5IK2RS0q
	42kmEL1UPqib/VcJGPU0DEJZ/0mPsLv3Cmam9sW6PmaKEPNGBGPF5ty7OFiY1U8/pRRseK
	7YVAF1jV0y1co3DtX27pHmFyur7DHFV31Zr6KVqVteiDQ7L0gciXStf5irsVEg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795602840; a=rsa-sha256;
	cv=none;
	b=fDiVgO61VnTx/fA+e9RWFwPvFfk0AlLW2v3ZgO1sqmK4wGtXd0RwYAxvgqrsTc0lSfTudj
	BPGts/d5hPjAmwpaORQyUEfRKu7KW8oOrKEqSH8QzcJCNBh5E0TYLjQLALcCPtDQWT+rTt
	sKWYSh/Z+Er3ZzAJZBYIcoHk1uLPzSY+5toS1zUS32ZOHf5k3fytAYx82/dCuCi92NnxWr
	ODK9MbrF4BZiVtiqnQbu8sE6mqt5wtI1ta/tIU65WR0dCQd5leNntirRgKRQ88v5GlB2RG
	KmsFfc94wI/aUWR09HRFKZw5OoLkdL/180bxQWKdIbOwDwfVhDBphBU7d03CHQ==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xWAK7-001P9N-2J;
	Wed, 25 Nov 2026 11:34:00 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Wed, 25 Nov 2026 11:33:58 +0100
Subject: [PATCH 2/2] arm64: dts: rockchip: Mark ROCK 5 domain supplies as
 post-init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rock5t-regulator-deps-v1-2-6a3470ad1855@pengutronix.de>
References: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
In-Reply-To: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
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
X-CRM114-CacheID: sfid-20261125_023404_608360_53F69BCC 
X-CRM114-Status: GOOD (  10.81  )
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

The GPU and NPU power domains reference regulators that themselves
depend on the Rockchip power-domain controller through their
respective bus controllers.

Since all power domains are provided by a single device, fw_devlink
attempts to create cyclic sync_state-only proxy links on behalf of
the power-domain child nodes, resulting in the following messages
during boot:

    rockchip-pm-domain fd8d8000.power-management:power-controller: Failed to create device link (0x180) with supplier spi2.0 for /power-management@fd8d8000/power-controller/power-domain@12
    rockchip-pm-domain fd8d8000.power-management:power-controller: Failed to create device link (0x180) with supplier 1-0042 for /power-management@fd8d8000/power-controller/power-domain@8

These are sync_state-only proxy links, not probe-ordering links.

The Rockchip power-domain driver does not require the regulators
to register the domains. It acquires them lazily and enables them
when powering on the corresponding domains.

Mark the regulators as post-init providers in the shared ROCK 5B,
5B+ and 5T DTSI to describe this dependency and avoid the failed
proxy-link creation attempts.

Keep the domain-supply references intact. Testing on the ROCK 5T
shows that the messages disappear while GPU and NPU runtime power
management behaviour remains unchanged.

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b8d90936fc204..002dac5f28fbd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -504,10 +504,12 @@ &pcie3x4 {
 
 &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
+	post-init-providers = <&vdd_gpu_s0>;
 };
 
 &pd_npu {
 	domain-supply = <&vdd_npu_s0>;
+	post-init-providers = <&vdd_npu_s0>;
 };
 
 &pinctrl {

-- 
2.56.0


