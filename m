Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2496606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HkfqBaF4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhM521TZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xM/qy0LDmGAX2gldlTS/zKbKhse2bwRxfBsg2sK9AYs=; b=HkfqBaF46uHp8nzAfistYqawy/
	26Kb+vfvh6WEOvbnLKz3S6sa7sfka96z7T6OF7AoxNU5pEiBA2wZNshSepi5xd9+SmyvObuE5tl9s
	oKyQLRcIZOwVzs+OsRpoS8G1kyDfkQxW3kIvS/+09Q7WKOP20SgJHbAvIzsSyiTX/vqUsiZu97Ext
	t4vSKML3d7vV/HZRcc1RSSACFvhxXKRjxKgPDP4RvPglMbjnSVqjM0akDHn1y7pDoAKU7gT/hqQ1M
	mz2quWYuiKi6lLfXYRD100NJy7CgoFOa+Ymh/gEdbNYn4v3PObZY+ruNw8mVPPNbGT52eaMkKKewf
	8gib6s6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdDS-00000002MAk-3uGd;
	Tue, 10 Nov 2026 04:12:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdDR-00000002MAb-2875
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:12:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC00960DF0;
	Tue, 10 Nov 2026 04:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1A01F0089F;
	Tue, 10 Nov 2026 04:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794283932;
	bh=xM/qy0LDmGAX2gldlTS/zKbKhse2bwRxfBsg2sK9AYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BhM521TZv3m4O2TAooWY912f0uaCJrfkgK4cXlg6AbKE3eLmvdFpbmynhiXL1QqKy
	 A1AIDCJkZE8gE8ngKX6CENCqjUENkyKHfO5mwy9J7tibQcMhO5ateddHrvkweujjkS
	 OB7nb3YnYQ0B3Kh+EFTva8bTLmap+S9WBIwxPIqPLU+EzmWNUz9QiPjTNdfUhDk120
	 jVHajcTu8rJIB3EZ9PSSVps1uaIa8ennFiwdPC+DwO5nnHMYUHf9k3KlkTfUcZBcFp
	 RoeHCHzB+Be4JDekknEwOBZ62IN6unukUNYk7Z5yQcy5nS372JN2QSe1XIMOSpfNAw
	 J+QzQVz+6Ve5A==
Date: Mon, 9 Nov 2026 22:12:07 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Message-ID: <avKYaYOdaeSn2YoN@zenbook>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
 <20260925-stmfts5-v8-5-0fcf49e2c85f@ixit.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-stmfts5-v8-5-0fcf49e2c85f@ixit.cz>
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Sep 25, 2026 at 11:22:23PM +0200, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 19 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  |  2 +-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..51c835dca43f1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -21,17 +21,34 @@ &framebuffer0 {
>  	stride = <(1080 * 4)>;
>  };
>  
>  &i2c2 {
>  	clock-frequency = <1000000>;
>  
>  	status = "okay";
>  
> -	/* ST,FTS @ 49 */
> +	touchscreen@49 {
> +		compatible = "st,stmfts5";
> +		reg = <0x49>;
> +
> +		pinctrl-0 = <&touchscreen_irq_n>, <&touchscreen_reset>;
> +		pinctrl-names = "default";
> +
> +		interrupts-extended = <&tlmm 125 IRQ_TYPE_LEVEL_LOW>;
> +
> +		mode-switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;

It's not clear to me how this worked or when it started failing, but due
to a conflict with the reboot-mode binding dt-validate crashes when we
reach this property.

I opened a PR to handle it here:
https://github.com/devicetree-org/dt-schema/pull/212

Regards,
Bjorn

> +		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l19a_3p3>;
> +		vdd-supply = <&vreg_l14a_1p8>;
> +
> +		touchscreen-size-x = <1080>;
> +		touchscreen-size-y = <2160>;
> +	};
>  };
>  
>  &mdss_dsi0 {
>  	vdda-supply = <&vdda_mipi_dsi0_1p2>;
>  
>  	status = "okay";
>  
>  	panel@0 {
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index f1379857e2742..6ae1973aa8ac7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -504,17 +504,17 @@ firmware-pins {
>  
>  	touchscreen_reset: ts-reset-state {
>  		pins = "gpio99";
>  		function = "gpio";
>  		drive-strength = <8>;
>  		bias-pull-up;
>  	};
>  
> -	touchscreen_pins: ts-pins-gpio-state {
> +	touchscreen_irq_n: ts-irq-n-gpio-state {
>  		pins = "gpio125";
>  		function = "gpio";
>  		drive-strength = <2>;
>  		bias-disable;
>  	};
>  
>  	touchscreen_i2c_pins: qup-i2c2-gpio-state {
>  		pins = "gpio27", "gpio28";
> 
> -- 
> 2.55.0
> 
> 

