Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E5D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ULGZLfmP;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=BlAtMAnU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wC0wUU2m3HtIPmY9jvAO8PsD5hDAxn7Ex23eU3jgxZQ=; b=ULGZLfmPgMoEP6
	G75OBkg93Mi3ZH/myc+FkSOt3JoAXB4+BG5CrxPx1mQ1zpX2t3H6otyB+8eN9nlM30mkPHPQ5MgSL
	ceUTti3ODX3doe6Fk7nCFIE7NRmxFy4wf9CZ/r+556dMV1zRXzyVun37BXs8JTxx6t1j673slWMj0
	oR7FJx7KVLuUpKgEjbfr11QxQFj1mS6kNYxBEgfSfSYLAItdQ6BPlntjnEM9GeOWLGdg17w0nE8Gj
	ODqWiro7+8nfp+sgCva+RCJtcGpPqZ8NvWW2D88ysD316MwHan10pifceZZT0o5WFRxnEbHQhfiso
	cMxaxT4/2ErIuY0yL1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEtn-0000000DvOa-1ZFg;
	Fri, 20 Nov 2026 03:02:51 +0000
Received: from mail-m16023652119.xmail.ntesmail.com ([160.236.52.119])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEtj-0000000DvO5-230f;
	Fri, 20 Nov 2026 03:02:49 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 555bbefdb;
	Fri, 20 Nov 2026 11:02:42 +0800 (GMT+08:00)
Message-ID: <bc2695a5-5b20-4658-a95c-e67731086e9a@rock-chips.com>
Date: Fri, 20 Nov 2026 11:02:40 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ARM: dts: rockchip: Add Luckfox Lyra boards
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261119152055.556266-1-jonas@kwiboo.se>
 <f3746e7d-2c56-4e95-bed5-b2e993cf35e0@rock-chips.com>
Content-Language: en-US
In-Reply-To: <f3746e7d-2c56-4e95-bed5-b2e993cf35e0@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1f6e8035203a7kunm3c3a335e85aa24
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQk0fVh9MGkJLQkhLSkMeTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BlAtMAnUjFxtbegHN4OgFdA/VS6Ly1e3JiRAZwktlvpMQ0vYr762qEMzVP36mIGArANDSPdD+JU8tdEaVdacuzo2MOq446jfShqKXpX3hKh+0mqCYQxaJzwbYLkAySUcMV1krAuUWBd/SqNgMhd7hKrwRs/+3YmcNDWdBc9WMMk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wC0wUU2m3HtIPmY9jvAO8PsD5hDAxn7Ex23eU3jgxZQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_190247_827826_3E30930D 
X-CRM114-Status: GOOD (  14.33  )
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

On 11/20/2026 10:53 AM, Chaoyi Chen wrote:
> Hi Jonas, 
> 
> On 11/19/2026 11:20 PM, Jonas Karlman wrote:
>> This series adds initial devicetree for Rockchip RK3506 SoC and initial
>> support for Luckfox Lyra board family [1].
>>
>> The Luckfox Lyra board family use different RK3506 SoC variants, i.e. Lyra
>> and Lyra Plus both use RK3506G2 and Lyra Ultra and Lyra Zero W both use the
>> RK3506B varaiant.
>>
>> All board compatibles use rockchip,rk3506 in this revision of the series,
>> maybe we should use rockchip,rk3506b for the RK3506B (and RK3506J) variants?
>>
>> The pinctrl driver for RK3506 will not work as-is using the SoC DT from this
>> series. The already merged driver depends on a rockchip,ioc1 phandle prop
>> that never was described in dt-bindings. The SoC DT in this series instead
>> uses rockchip,grf in GPIO controller node to reference correct IOC for GPIO0
>> and GPIO1.
>>
>> The branch at [2] contains follow-up patches that e.g. fixes pinctrl driver
>> and adds USB support.
> 
> Perhaps these pinctrl patches should be included before the dts patch?
> 
> Cc: Ye Zhang <ye.zhang@rock-chips.com>

Oh, I just saw your pinctrl patches. Sorry for the noise.

> 
>>
>> Mainline U-Boot support can be tested using a branch at [3], it contains
>> board support using same devicetree files extended with USB support.
>>
>> [1] https://wiki.luckfox.com/Luckfox-Lyra
>> [2] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
>> [3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506
>>
>> Jonas Karlman (8):
>>   dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
>>   ARM: dts: rockchip: Add support for RK3506
>>   dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
>>   ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
>>   dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
>>   ARM: dts: rockchip: Add Luckfox Lyra Ultra board
>>   dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
>>   ARM: dts: rockchip: Add Luckfox Lyra Zero W board
>>
>>  .../devicetree/bindings/arm/rockchip.yaml     |   9 +
>>  .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
>>  arch/arm/boot/dts/rockchip/Makefile           |   6 +-
>>  .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
>>  .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
>>  .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++
>>  .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 576 ++++++++++++++++++
>>  arch/arm/boot/dts/rockchip/rk3506.dtsi        | 540 ++++++++++++++++
>>  .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
>>  .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
>>  .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 +++
>>  11 files changed, 1454 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
>>  create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
>>
> 

-- 
Best, 
Chaoyi


