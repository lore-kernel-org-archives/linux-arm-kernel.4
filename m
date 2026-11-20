Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D565F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 02:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SfQVAXEw;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=F5Z5xuru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aCvUb7UtGNSzVb6BdtJGVlutl707NOIlxUqbdWEblTo=; b=SfQVAXEwuvUywv
	uVO8GLulCXCzrKKcBJzxEp95nInkB9y0zOVTuIQj6l9s7Ow1MEPkvVmUiEWHTSeQjHocdcHEOVU6G
	PhKtETqecQcUpPAwpoZMjObKV583KURXY2B7CS9u1JBDGlndsrmKxEjyXQOScqQpYsF3F3jcGuxi0
	/Heif28WOoyHY8ZFW/Z2JswRYfSgB3aOP+qJHjs99V7BCIG27LzDuFwAXLh1YRW/rU3OopBU+BLp8
	7WyghQ0WjB0j2ThtyJozwE90dFgFIoFSFgjD3AYEho0msz6RZBG3yfsWBl0oVTgHqHJwluXq8yO+E
	+R6DKeI25Je2zU+ACaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEkz-0000000DuwE-19KY;
	Fri, 20 Nov 2026 02:53:45 +0000
Received: from mail-m82117.xmail.ntesmail.com ([156.224.82.117])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEkv-0000000Duvj-44JA;
	Fri, 20 Nov 2026 02:53:44 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 555b66815;
	Fri, 20 Nov 2026 10:53:31 +0800 (GMT+08:00)
Message-ID: <f3746e7d-2c56-4e95-bed5-b2e993cf35e0@rock-chips.com>
Date: Fri, 20 Nov 2026 10:53:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ARM: dts: rockchip: Add Luckfox Lyra boards
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261119152055.556266-1-jonas@kwiboo.se>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1f6df9b2803a7kunm6104eb818583c9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCShoZVk1NTEkaHk1OSU1CHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=F5Z5xuruCazoaM4nZqRIoo2ASiIy5//s09rRWUsZaEavrYVosw7/BMchHNSKrMaz2x5f7Fi27GZd7g+aUCbhPiT8mXx095UWd3Yk8A1ZTVmBbxH3af2WdjEcpkyLOu36NS4ESVhil2j7PpGZyueV+6bGlbLDCMX+FcdTsbnLWl8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=aCvUb7UtGNSzVb6BdtJGVlutl707NOIlxUqbdWEblTo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_185342_599306_6DE7EF53 
X-CRM114-Status: GOOD (  15.28  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jonas, 

On 11/19/2026 11:20 PM, Jonas Karlman wrote:
> This series adds initial devicetree for Rockchip RK3506 SoC and initial
> support for Luckfox Lyra board family [1].
> 
> The Luckfox Lyra board family use different RK3506 SoC variants, i.e. Lyra
> and Lyra Plus both use RK3506G2 and Lyra Ultra and Lyra Zero W both use the
> RK3506B varaiant.
> 
> All board compatibles use rockchip,rk3506 in this revision of the series,
> maybe we should use rockchip,rk3506b for the RK3506B (and RK3506J) variants?
> 
> The pinctrl driver for RK3506 will not work as-is using the SoC DT from this
> series. The already merged driver depends on a rockchip,ioc1 phandle prop
> that never was described in dt-bindings. The SoC DT in this series instead
> uses rockchip,grf in GPIO controller node to reference correct IOC for GPIO0
> and GPIO1.
> 
> The branch at [2] contains follow-up patches that e.g. fixes pinctrl driver
> and adds USB support.

Perhaps these pinctrl patches should be included before the dts patch?

Cc: Ye Zhang <ye.zhang@rock-chips.com>

> 
> Mainline U-Boot support can be tested using a branch at [3], it contains
> board support using same devicetree files extended with USB support.
> 
> [1] https://wiki.luckfox.com/Luckfox-Lyra
> [2] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
> [3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506
> 
> Jonas Karlman (8):
>   dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
>   ARM: dts: rockchip: Add support for RK3506
>   dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
>   ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
>   dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
>   ARM: dts: rockchip: Add Luckfox Lyra Ultra board
>   dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
>   ARM: dts: rockchip: Add Luckfox Lyra Zero W board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |   9 +
>  .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
>  arch/arm/boot/dts/rockchip/Makefile           |   6 +-
>  .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
>  .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
>  .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++
>  .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 576 ++++++++++++++++++
>  arch/arm/boot/dts/rockchip/rk3506.dtsi        | 540 ++++++++++++++++
>  .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
>  .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
>  .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 +++
>  11 files changed, 1454 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
> 

-- 
Best, 
Chaoyi


