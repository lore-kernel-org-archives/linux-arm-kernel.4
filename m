Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE019606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=283YzqiK;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fBTBUT2U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6uSvfC5jYn0SZCUdkQQtcniyMzEPTSPEt/ng2+mDaK4=; b=283YzqiKwxMNx1
	0Hfr0nFLUyeHqzSJhnWGEf8pdm58rMKgNVfxR5+t2hd/bC31h/U4wlcnoc0+qadKFs5htMeVwetE1
	UBJfrONOSgENsaeZEq7DMLZYfGCzs4k1Rsyuuupw+HvaN8nfMEqhSanxswK5MTZsHPA/fCUV4IubP
	GZMs+YAUsQaornhls77nDqj16f3eXK2/GrMDx1b+hwRqMk0J7YOsIR5DEV58gaLugfbgm6mWmTeRL
	cpjmunTxco0MJEpuXu5BRLcEfC9+wJWLsB3hjhTj+W8mUDkoB68Lj5xmwfQOpF2TQobWSFYYhPHQV
	FSyDtHR1SBPT63VdS81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJpp-000000063nJ-1f7F;
	Tue, 17 Nov 2026 14:06:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJpm-000000063kI-1UC8;
	Tue, 17 Nov 2026 14:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794924412;
	bh=vVV4spwHYbAauEsxYC6THPXIxk5VSqw/wZZWsp1RODU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fBTBUT2UiRc1Wfv+bZejMAlCy2ZeBLbuvsf9BWFa/aPGiC2UtcZHQTGLTB0ZKuvc/
	 SHygH84hz1USDOBqriEO2osZPaJ7bOPKXD3E4xXlGPm6oXUMNoMoQGDATgQ4aceyG3
	 FAqanQsEuobRmY0QjGkOZMz8hBbmB7xL3g5O1mYmfGqNl8ns2VmcthD2GUvjeQvPzZ
	 qwKDscxU1uCiy644O/rHCWUWae7WMghIzrA0PzgXa/oBCw6zwBn/ou8NDc4Pukf/o2
	 CpZQY9600AKwjhbN8EZC5XN+qgVH7VcOQcodCaRjUlOYcdyOJFnQ6sN/1W3SVkLww6
	 O5eKPa+ZNsmhQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5B5E17E0311;
	Tue, 17 Nov 2026 15:06:51 +0100 (CET)
Message-ID: <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
Date: Tue, 17 Nov 2026 15:06:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_060654_576361_0315BC5B 
X-CRM114-Status: GOOD (  22.23  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 14:05, Krzysztof Kozlowski wrote:
> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
> approved by Devicetree maintainers, because they were never documented
> as actual ABI.  Drop them, because no new custom aliases are allowed for
> years now.
> 
> This might break users of this undocumented ABI, so these should be
> updated to use only documented and approved ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

That'll just break everything.

I do have a mediatek-drm restructuring series that is partially resolving this
situation, at least for some SoCs it's getting 0 and 1 hw instance id dynamically
recognized, but with some caveats that could be unacceptable (as in, if 0 is
disabled and 1 is enabled, 1 becomes 0, so it's not actually resolving anything
for real, it's just making it tick right when stars in the sky align in the
right way, which for some SoCs is reliably possible without side effects).

In any case, all of the ones that have only instance 0 (and all of the instance
0s) can be removed even right now already (still needs some testing to make sure
that there's no regression), but everything else can't, at least not until the
whole restructuring thing is merged as that'd break things.

Worst part is we have two new SoCs (MT8196, MT8189) ready to be upstreamed here,
which took almost a year of development... and it also does rely on the aliases.
I was in the process of slowly cleaning up those (as I said, there's already a
restructuring that makes things a little better in this regard), but at this point
that'll need to be done with the highest possible priority.

Let me see what can I do to make the right thing to happen.

Anyway - thanks for pointing this.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 17 ----------
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ---------
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  7 ----
>   .../boot/dts/mediatek/mt8188-geralt.dtsi      |  1 -
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 33 -------------------
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  8 -----
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 24 --------------
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 13 --------
>   .../dts/mediatek/mt8390-genio-common.dtsi     |  1 -
>   .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  1 -
>   11 files changed, 126 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 6dd706b27830..971fb19e95df 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -21,23 +21,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		ovl0 = &ovl0;
> -		ovl1 = &ovl1;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
> -		rdma2 = &rdma2;
> -		wdma0 = &wdma0;
> -		wdma1 = &wdma1;
> -		color0 = &color0;
> -		color1 = &color1;
> -		split0 = &split0;
> -		split1 = &split1;
> -		dpi0 = &dpi0;
> -		dsi0 = &dsi0;
> -		dsi1 = &dsi1;
> -	};
> -
>   	psci {
>   		compatible = "arm,psci-0.2";
>   		method = "smc";
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 6ec50125cea0..868b0fb84449 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -22,22 +22,6 @@ / {
>   	#size-cells = <2>;
>   
>   	aliases {
> -		ovl0 = &ovl0;
> -		ovl1 = &ovl1;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
> -		rdma2 = &rdma2;
> -		wdma0 = &wdma0;
> -		wdma1 = &wdma1;
> -		color0 = &color0;
> -		color1 = &color1;
> -		split0 = &split0;
> -		split1 = &split1;
> -		dpi0 = &dpi0;
> -		dsi0 = &dsi0;
> -		dsi1 = &dsi1;
> -		mdp-rdma0 = &mdp_rdma0;
> -		mdp-rdma1 = &mdp_rdma1;
>   		mdp-rsz0 = &mdp_rsz0;
>   		mdp-rsz1 = &mdp_rsz1;
>   		mdp-rsz2 = &mdp_rsz2;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 7414c10ee664..2c3836555e55 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -35,11 +35,6 @@ aliases {
>   		i2c9 = &i2c9;
>   		i2c10 = &i2c10;
>   		i2c11 = &i2c11;
> -		ovl0 = &ovl0;
> -		ovl-2l0 = &ovl_2l0;
> -		ovl-2l1 = &ovl_2l1;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
>   	};
>   
>   	cluster0_opp: opp-table-cluster0 {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 621408439ffa..2f82eb532f30 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -22,13 +22,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		ovl0 = &ovl0;
> -		ovl-2l0 = &ovl_2l0;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
> -	};
> -
>   	fhctl: fhctl@1000ce00 {
>   		compatible = "mediatek,mt8186-fhctl";
>   		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> index 801eee735afe..883141d8a6d5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -9,7 +9,6 @@
>   
>   / {
>   	aliases {
> -		dsi0 = &disp_dsi0;
>   		i2c0 = &i2c0;
>   		i2c1 = &i2c1;
>   		i2c2 = &i2c2;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 14a320f0c70c..f14b23dd57aa 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -23,39 +23,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		dp-intf0 = &dp_intf0;
> -		dp-intf1 = &dp_intf1;
> -		dpi1 = &dpi1;
> -		dsc0 = &dsc0;
> -		ethdr0 = &ethdr0;
> -		gce0 = &gce0;
> -		gce1 = &gce1;
> -		merge0 = &merge0;
> -		merge1 = &merge1;
> -		merge2 = &merge2;
> -		merge3 = &merge3;
> -		merge4 = &merge4;
> -		merge5 = &merge5;
> -		mutex0 = &mutex0;
> -		mutex1 = &mutex1;
> -		padding0 = &padding0;
> -		padding1 = &padding1;
> -		padding2 = &padding2;
> -		padding3 = &padding3;
> -		padding4 = &padding4;
> -		padding5 = &padding5;
> -		padding6 = &padding6;
> -		padding7 = &padding7;
> -		vdo1-rdma0 = &vdo1_rdma0;
> -		vdo1-rdma1 = &vdo1_rdma1;
> -		vdo1-rdma2 = &vdo1_rdma2;
> -		vdo1-rdma3 = &vdo1_rdma3;
> -		vdo1-rdma4 = &vdo1_rdma4;
> -		vdo1-rdma5 = &vdo1_rdma5;
> -		vdo1-rdma6 = &vdo1_rdma6;
> -		vdo1-rdma7 = &vdo1_rdma7;
> -	};
>   
>   	cpus {
>   		#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 898953acdb61..bf5893e3002b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -23,14 +23,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		ovl0 = &ovl0;
> -		ovl-2l0 = &ovl_2l0;
> -		ovl-2l2 = &ovl_2l2;
> -		rdma0 = &rdma0;
> -		rdma4 = &rdma4;
> -	};
> -
>   	clk13m: fixed-factor-clock-13m {
>   		compatible = "fixed-factor-clock";
>   		#clock-cells = <0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 9aaf8b6edcb5..389fb9d7ea89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -23,30 +23,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		dp-intf0 = &dp_intf0;
> -		dp-intf1 = &dp_intf1;
> -		dpi1 = &dpi1;
> -		gce0 = &gce0;
> -		gce1 = &gce1;
> -		hdmi0 = &hdmi;
> -		ethdr0 = &ethdr0;
> -		mutex0 = &mutex;
> -		mutex1 = &mutex1;
> -		merge1 = &merge1;
> -		merge2 = &merge2;
> -		merge3 = &merge3;
> -		merge4 = &merge4;
> -		merge5 = &merge5;
> -		vdo1-rdma0 = &vdo1_rdma0;
> -		vdo1-rdma1 = &vdo1_rdma1;
> -		vdo1-rdma2 = &vdo1_rdma2;
> -		vdo1-rdma3 = &vdo1_rdma3;
> -		vdo1-rdma4 = &vdo1_rdma4;
> -		vdo1-rdma5 = &vdo1_rdma5;
> -		vdo1-rdma6 = &vdo1_rdma6;
> -		vdo1-rdma7 = &vdo1_rdma7;
> -	};
>   
>   	cpus {
>   		#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 2e782558fb77..4b05f6a864d4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -20,19 +20,6 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> -	aliases {
> -		aal0 = &aal0;
> -		ccorr0 = &ccorr0;
> -		color0 = &color0;
> -		dither0 = &dither0;
> -		dpi0 = &dpi0;
> -		dsi0 = &dsi0;
> -		gamma0 = &gamma0;
> -		ovl0 = &ovl0;
> -		rdma0 = &rdma0;
> -		rdma1 = &rdma1;
> -	};
> -
>   	cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 669eaec662f3..a938539c92b8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -21,7 +21,6 @@
>   
>   / {
>   	aliases {
> -		dsi0 = &disp_dsi0;
>   		ethernet0 = &eth;
>   		i2c0 = &i2c0;
>   		i2c1 = &i2c1;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> index f2ad9265be31..d70bed80274b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> @@ -16,7 +16,6 @@
>   
>   / {
>   	aliases {
> -		dsi0 = &disp_dsi0;
>   		ethernet0 = &eth;
>   		i2c0 = &i2c0;
>   		i2c1 = &i2c1;


