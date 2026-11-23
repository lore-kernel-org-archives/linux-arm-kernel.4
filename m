Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A518606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Syab9tWI;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=NJoD1TY/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q9NunyhRXef+uYLUVcBJxPIw1fxbnbcm5osyb8TqXYc=; b=Syab9tWIyvBhfu
	uE5lFW/31Qe4jf2ObYxbwL0MpBfbAJrorFIXTh5Py30pKveinLSIJhG3UyQvshMcMrnwd3ab6BrXN
	XjRpsKD4wqfwgSDr2l/BhcFthETNrB1anqBBvBDZ3AeDsrsFv6iSoktWqLoYP8xTJUtsUqQvHA/5o
	zVhJ2zZ0ZT3h1gJcx1K6fyquQvwauTp6UJU8KlDIfiDlDX0gQsfXdPgcJaZKdLV7cQAQ2nLu+Le+i
	xtycS2jGx/QYmEgip4rUbLbCidwcHlnFg6xJ97vZiPtBUuCBmznhciINCKY2wwRRV4KfKTPckWuun
	TrDepZmQ5ocn5VEDgo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJDc-000000026rl-1qF7;
	Mon, 23 Nov 2026 01:51:44 +0000
Received: from mail-m1602365372.xmail.ntesmail.com ([160.236.53.72])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJDW-000000026rB-2Ynl;
	Mon, 23 Nov 2026 01:51:43 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5595de3af;
	Mon, 23 Nov 2026 09:51:34 +0800 (GMT+08:00)
Message-ID: <5176e5e2-72f3-4175-8b29-1dbc64c4e418@rock-chips.com>
Date: Mon, 23 Nov 2026 09:51:32 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] clk: rockchip: rk3506: Add the SAI MCLK output
 gate clocks
To: Xiangyu Zhu <1194781887@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_C2AD19EB4A6C91A75AD3DC4089CB875C4005@qq.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <tencent_C2AD19EB4A6C91A75AD3DC4089CB875C4005@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa20619f63c03a7kunm9ecc2466b555bb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkwdVkNJH0hDQk9CTEIYGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NJoD1TY/x5HC+BNx2DhEsOexcaA3iF2SBwoYNe3h21uciMr+ZKulGD2CmX3tWEuWoWlx+JRbSnUoWMVVqTcm+C10FJTNIwn1lVOklkI9jXhJJ21KejXGgvp9IaaViHs4YFlyGtsfsu7MPnqwVfPKHG58LodKmT8Ysv35BcjRq/k=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Q9NunyhRXef+uYLUVcBJxPIw1fxbnbcm5osyb8TqXYc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_175139_398407_79F4EB75 
X-CRM114-Status: GOOD (  24.68  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Xiangyu,

On 11/23/2026 8:38 AM, Xiangyu Zhu wrote:
> The RK3506 has four SAI MCLK output gates: SAI0 and SAI1 are controlled
> by bits in the PMU GRF, SAI2 and SAI3 by bits in the system GRF.  Model
> them as GRF gate clocks so the SAI MCLK pin direction can be controlled
> through the clock framework.
> 
> This is v4 of the earlier "rockchip,clk-out" binding/driver submission.
> That one introduced a generic "rockchip,clk-out" compatible plus a
> standalone driver, which is not acceptable: upstream already has generic
> GRF gate support (branch_grf_gate together with rockchip_clk_add_grf()),
> and RK3576 and RK3588 register their SAI/I2S MCLK output gates with it.
> No device tree changes are included.

Please slow down the pace at which you send patches so that people have
time to read them. Don't send your patches within 24 hours.

In addition, your Message-ID seems to have been modified by your email
provider:

Message-ID: <tencent_C4C715C962613597F98212938F8940633306@qq.com>

Please try the downgrade the git version[0] you use for
git send-email, or switch to a different email provider.

[0]: https://lore.kernel.org/all/8771714B848C3A9F+9f64a309-ff70-466f-8d29-15950318b728@airkyi.com/

> 
> v2 registered all four gates from one branch table while only the PMU GRF
> was added as an auxiliary GRF.  The two system GRF gates therefore came
> right after two PMU GRF gates in the same table, and
> rockchip_clk_register_branches() keeps using the regmap it picked for the
> previous branch when it finds no entry for a branch's grf_type, so they
> ended up toggling bits of the PMU GRF.  The SAI0/SAI1 gates are now
> registered from their own table, and only once the PMU GRF was really
> added, so no branch table mixes two GRF types and the PMU GRF gates can
> no longer fall back to the system GRF.
> 
> The series now also documents the RK3506 GRF compatibles in the Rockchip
> GRF binding, including the "rockchip,rk3506-pmu-grf" name used by the
> clock driver.  The RK3506 DTS uses the same PMU GRF compatible; that
> rename is part of the RK3506 DTS series.
> 
> Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
> drives the ES8388 codec, audio playback works, and the GRF gate bits were
> read back from the registers to confirm that they get set.  Enabling the
> SAI2/SAI3 gates sets bit 2 and bit 3 of the system GRF (0xff288004) and
> leaves the PMU GRF alone.
> 
> Changes since v3:
>  - add the RK3506 GRF compatibles to the Rockchip GRF binding
>  - look up the PMU GRF using the documented "rockchip,rk3506-pmu-grf"
>    compatible instead of the vendor's "rockchip,rk3506-grf-pmu" name
> 
> Changes since v2:
>  - register the SAI0/SAI1 gates from a separate table that is only used
>    when the PMU GRF was added successfully
> 
> Changes since v1:
>  - drop the rockchip,clk-out binding and driver
>  - use the existing GATE_GRF support like RK3576 and RK3588 do
>  - limit the series to the clock driver and the dt-bindings IDs
> 
> Xiangyu Zhu (3):
>   dt-bindings: soc: rockchip: Add RK3506 GRF compatibles
>   dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
>   clk: rockchip: rk3506: Register the SAI MCLK output gates
> 
>  .../devicetree/bindings/soc/rockchip/grf.yaml |  4 +++
>  drivers/clk/rockchip/clk-rk3506.c             | 27 +++++++++++++++++++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   |  4 +++
>  3 files changed, 35 insertions(+)
> 

-- 
Best, 
Chaoyi

