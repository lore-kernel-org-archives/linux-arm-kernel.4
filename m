Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2830606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hu1gl6l5;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=CaS0Dbn0;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=RaWJejnL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rZ1MV5klzHDundSrNYAkIRPEhuUaPbEd4MMBr8/nalQ=; b=hu1gl6l5WvjGdi
	PMGaHvU7plOkzMWvesTsb7bEnB6A5Hb9Xh4G3m9CQRtsXDj/jJw7kjKif3xoPHg4qwRzx82Fd+Nnr
	2UpgXtoOCBT0vXhXIitoTlP03ZN6NHYfS5wBsPC/rRbmy35co1udlO25kWYhs9uZsbev3aMzCQWdu
	zYf5AvR9AqdyNbFLS7/F2pRqaVmYsYX0Q0UJcGT5gbZKinvKaqaYOyGOX17/1QN3Wr3YCwDNhGpvd
	p5u9NKC6ftXzitfIe3OoD9RQDbudkuoeEFp5KrVBfjWmck21wp6RM+Khl8mxC4mBnSNqyuHo5hQcI
	7HLJzxXcXkj1itYg0kpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULMu-0000000EXYF-2Sk2;
	Fri, 20 Nov 2026 09:57:20 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULMh-0000000EXUf-2EOb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795168626; bh=rZ1MV5klzHDundSrNYAkIRPEhuUaPbEd4MMBr8/nalQ=;
 b=CaS0Dbn00Va020PMXISPJgZCxJ2KGfMRJDi9W0w5nitxhhSKvDF89JHOzBgSfrELVG+QDmD70
 c88zwttL5HZnHR8JVrCnsDfXcXGR9CCOFxiPl4TIITYKAa5qLRqxctvXKToS9JEum9d8b669Xcl
 j4wBJFvRv0NsVds5aC8eC42B1gDh0g8X+fgUWGggyMjXAe41xdzO1/PcYV8sfIMwgdIchDTuRvV
 cOa8aUZPgqlVXf3EvuDi4DqRtm0A4T+z9VO+zFvWW63GKo1Cv9Vod3iGLlM4IA4+tM1OH+AH4Oh
 vdnsgrADhVf2vrI38pjEJHGzVs8ni0Ood43aB2G8nI/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795168626; bh=rZ1MV5klzHDundSrNYAkIRPEhuUaPbEd4MMBr8/nalQ=;
 b=RaWJejnL9H2IdXB6q3ix3638iw/hNjVch+LxxphDgORGIvu+lN05WqkS9nZjPLo7Blt7Yhi3t
 88FFAoKO0nvRApeWsaAirsh8G8b3rTQFcfhH+0nK4b+CZVJEXUndiM57yDV0iqtcyUKrCuY7BV8
 UgSh6BxZNHBB539QB0cGeg0=
CFBL-Feedback-ID: 6b00196be00cd0846a727911:c9da0eeb4ca56ea6aa90dc5fa3144251
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b00196be00cd0846a727911
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0c495655-9ec8-4d16-a33e-ef4ef3a8f2bc@kwiboo.se>
Date: Fri, 20 Nov 2026 10:56:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: soc: rockchip: Add RK3572 PMU and GRF
To: 1579567540@qq.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20261119-add-board-ok3572-c-soc-v2-1-86f331024ae6@qq.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20261119-add-board-ok3572-c-soc-v2-1-86f331024ae6@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_015708_078122_53B7D8E3 
X-CRM114-Status: GOOD (  24.20  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cunhao Lu,

On 11/19/2026 11:12 AM, Cunhao Lu via B4 Relay wrote:
> From: Cunhao Lu <1579567540@qq.com>
> 
> The RK3572 PMU and GRF blocks are system controllers shared with the
> clock, power-domain, and USB PHY drivers.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This is one of the subsystem submissions for RK3572 support.
> 
> This patch documents the RK3572 power management unit (PMU) and general
> register files (GRFs) used by the clock, power-domain and PHY drivers.
> The GRF binding describes the USB2 PHY as a child of its GRF and
> requires clocks for the NVM0, PHP, PIPE PHY and USB2 PHY GRFs.
> 
> The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
> Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
> The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
> ports, a Type-C dual-role port, eMMC, microSD, and UART.
> 
> Testing was performed with Debian 13 minimal and Linux 7.3 on the
> OK3572-C with the FET3572-C module.
> 
> Passed functionality:
> 
> - SD and eMMC complete the firmware, kernel, and root filesystem
>   boot chain.
> - UART console works at 1500000 baud.
> - SD read/write and data persistence checks pass.
> - All eight CPUs start; CPU frequency scaling and hotplug checks pass.
> - Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
>   transfers.
> - All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
>   and reconnect persistence checks.
> - Type-C host and device modes pass in both plug orientations. Physical
>   reconnects correctly select the expected device, host, and device roles
>   in sequence.
> 
> Some files in this series are derived from the Forlinx OK3572-C BSP
> Alpha1. Thanks to Forlinx for their support.
> Thanks also to Rockchip's David Wu, Elaine Zhang, Finley Xiao, Frank
> Wang, William Wu, and Ye Zhang for providing the driver source files.
> 
> AI assistance:
> 
> - Codex / DeepSeek V4.1 Flash were used for:
>   - Reviewing and adjusting code style to follow community conventions
>   - Automating tests
>   - Collecting data
> ---
> Changes in v2:
> - Split the original RK3572 support series by subsystem.
> - Link to v1:
>   https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com
> ---
> Raw dmesg: see the v1 cover letter.
> ---
>  Documentation/devicetree/bindings/arm/rockchip/pmu.yaml |  2 ++
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> index 1cff2328cd01..43dcaa77ffdb 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> @@ -28,6 +28,7 @@ select:
>            - rockchip,rk3528-pmu
>            - rockchip,rk3562-pmu
>            - rockchip,rk3568-pmu
> +          - rockchip,rk3572-pmu
>            - rockchip,rk3576-pmu
>            - rockchip,rk3588-pmu
>            - rockchip,rv1126-pmu
> @@ -48,6 +49,7 @@ properties:
>            - rockchip,rk3528-pmu
>            - rockchip,rk3562-pmu
>            - rockchip,rk3568-pmu
> +          - rockchip,rk3572-pmu
>            - rockchip,rk3576-pmu
>            - rockchip,rk3588-pmu
>            - rockchip,rv1126-pmu
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index e94c83d7c138..0e0bf8e234c8 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -30,6 +30,12 @@ properties:
>                - rockchip,rk3568-pipe-grf
>                - rockchip,rk3568-pipe-phy-grf
>                - rockchip,rk3568-usb2phy-grf
> +              - rockchip,rk3572-ioc-grf
> +              - rockchip,rk3572-nvm0-grf
> +              - rockchip,rk3572-php-grf
> +              - rockchip,rk3572-pipe-phy-grf
> +              - rockchip,rk3572-pmu0-grf

Are we missing rockchip,rk3572-pmu1-grf and possible other syscons?

> +              - rockchip,rk3572-sys-grf
>                - rockchip,rk3576-bigcore-grf
>                - rockchip,rk3576-cci-grf
>                - rockchip,rk3576-csidphy-grf
> @@ -96,6 +102,7 @@ properties:
>                - rockchip,rk3562-pmu-grf
>                - rockchip,rk3568-grf
>                - rockchip,rk3568-pmugrf
> +              - rockchip,rk3572-usb2phy-grf

Do we need a special rockchip,rk3572-usb2phy-grf? If rk3572 mimics
RK3576 there are two usb2phy GRF, each one identical and only covering
usb2phy functions.

With GRF compat I expect the DT so be something like following:

  usb2phy0_grf: syscon@26054000 {
	compatible = "rockchip,rk3572-usb2phy-grf";
	reg = <0x0 0x26054000 0x0 0x2000>;

	usb2phy0: usb2phy {
		compatible = "rockchip,rk3572-usb2phy";
	};
  };

  usb2phy1_grf: syscon@26056000 {
	compatible = "rockchip,rk3572-usb2phy-grf";
	reg = <0x0 0x26056000 0x0 0x2000>;

	usb2phy1: usb2phy {
		compatible = "rockchip,rk3572-usb2phy";
	};
  };

The usb2phy child node would be the sole child node of GRF and the child
node consume whole parent reg space. Should they instead be merged? That
is how I described the usb2phy nodes in U-Boot mainline work at [1].

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/rk3562/arch/arm/dts/rk3572.dtsi#L357-403

Regards,
Jonas

>                - rockchip,rk3576-ioc-grf
>                - rockchip,rk3576-pmu0-grf
>                - rockchip,rk3576-usb2phy-grf
> @@ -259,6 +266,7 @@ allOf:
>                - rockchip,rk3308-usb2phy-grf
>                - rockchip,rk3328-usb2phy-grf
>                - rockchip,rk3399-grf
> +              - rockchip,rk3572-usb2phy-grf
>                - rockchip,rk3576-usb2phy-grf
>                - rockchip,rk3588-usb2phy-grf
>                - rockchip,rv1108-grf
> @@ -310,6 +318,10 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - rockchip,rk3572-nvm0-grf
> +              - rockchip,rk3572-php-grf
> +              - rockchip,rk3572-pipe-phy-grf
> +              - rockchip,rk3572-usb2phy-grf
>                - rockchip,rk3576-dcphy-grf
>                - rockchip,rk3576-vo1-grf
>                - rockchip,rk3588-vo-grf
> 
> ---
> base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
> change-id: 20261119-add-board-ok3572-c-soc-0bf15aa6f56d
> 
> Best regards,
> --  
> Cunhao Lu <1579567540@qq.com>

