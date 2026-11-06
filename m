Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3EF606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 22:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uDZXd9hr;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=URIe2ULY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=; b=uDZXd9hrb6JbksOU7uZayafsns
	gBGmO4wxna1pXNWlqhcRkVm3IhM41kWKtwTSClWbxm6LtwdzrIcFdFoyxKJ2QQz+LvQMaIsVkNTMz
	l7swNo4G7jljwTJkqzBVEwR9UDlU9IJboo+CKNaenB9R8z8Ha6K0sdAEVoWXFYA0KXwLDqH+v7a5y
	xHwD28D6531hbbdFP9gNF8/3RtQ89hM04ZlwPYdTFAVooARnoRvjjxGzO1ONR+j6rfY6hAJPlHRxC
	7CHnueQGm7MHCk52VzcVQffqlNeRchq+EqwxcnkgYyU8YegaK+7yaUkW5kqMaDavFtBc6xLmO4Y0j
	wp3bHWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSPW-0000000DmcQ-3FMv;
	Fri, 06 Nov 2026 22:27:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPSPS-0000000Dmbi-3stv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 22:27:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e09aa5264so634717f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794004065; x=1794608865; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=URIe2ULYvxmDl5bnXK5F8wTP1YDGl4rooz22SpRQqaXbPMetWWdggcLAXl6vKa+730
         FNUGWrK2OyEMCHONM5cBCRabZvS4a5x/b2J7bd9wn87GaE2uLWcr5IX00Zgn6WP8oDZX
         xdreqGMXPPGWUgt2HoyaMtU8IBv8SlqizEwPSSTIwHt+ZS52g+xldN5g+3CzZRJIHZdg
         ieQ8NSYNHwCIE/8pqs7G9+aqrzoFf+ebYPIUKO025Wpc/Q/vKOaGPuRMgOEqqi+2BPI8
         agsUxTj9o/DeqzK61Af1RG5k77d8y0FAnrS6bcGItf4hVbbs0cbQ9Da8h/0EBThTipl8
         Z/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004065; x=1794608865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm44yLE9zR/+xclgm4/iFVDEIIryMy4vkUArG8yur4M=;
        b=e/cnSNJG0SeooRtBnmWNrpjXsMcNL9kX+95X2XCb3R7wDXEh4CVgQtv/46azt0B/rm
         4Y9YzffNNqjUp3SXnc/sgDnnrCoywoHVhOpsoJ9jFaFRJnAiKnwSrxLI10j6hSW190oS
         RCTlJ58RDlO4ig8hUcwpQshtalNlpajN4i6pgH4/fe4AE5xift04/9V37SPHze2i+qJm
         fb72pKgnXmgs0yaURxzZMNRqLb9ilTngUQklLWbEQFM1rMDCXL6IhaK9qBayCHBraISK
         SffvzaVw8x2oK5Z8M0xCQpQqPLiJ1PeGrI0nt069mOKXzrdQ/rRHIOIcHeFw8gQ0pJCW
         qTrA==
X-Forwarded-Encrypted: i=1; AL+hErGH3/89tO0g2Z5NA4iBDNuphiCe5HoGx9Lzht2SdXKsnGTeUZ3/7wvAyXyWFT4YMei5UMsNiCreYxL0XllWhoxg@lists.infradead.org
X-Gm-Message-State: APuU4Z/xk08H2njGlPODugnBHkC8T0ae1wTlBvjRHbvU1V2C97pfFd56
	SRk6wdv/UIMkajTXGcnNT6r4S+guFYa394wKI+4yJ2Xmsf77rh9zZEblodlKW/Uvnjg=
X-Gm-Gg: AYBFou0FWRIoUq88FqQr5ZVujCeIRXGXdU4qlHUHGHUdyJDzHDhDrJUoqEu0lKKIWMZ
	xGs/ATQX7+QswwZr9ab8zjETKOSh9F99FIiHR6MYWIs1w3boJQ8pA46mGYRLcOmqPs+iQLoq3Ss
	cmhIuDzZrUWcsOF0RPehdPmffAsgueqKAFbAR4lIK35zFecXyShCLlY9Uy5pqnb1+fYIjutbJ2S
	MGH7OCvXy9NttiZCYmrNMRvaurBcrIbIJo0oCyaJa0ri/stPtNjzps5igVDVi/kYhwqoF7SEDLr
	Btp9a9uhmS6aZwgkiSonpd7V7hVcm0MY6AcXzd+nUxSK4NNs+KdBUJcZInl40T8j/iveEwkXy8t
	MuXNi/TxQMZEkzKD7iJssAijgXac47a+EapgsOxbeg3bNMjbHfoGeGvI+ClfG5Tp32xePZ0X2VK
	CzOt+1u6VMgU5iiNDErj38LPEGkt79jdTDrUJDcqsp2iA3gTF7xNMqeW1yTp966E6S3+YI1iVXF
	KKUCNF+BH9S/8uHGf88dGC5b7fBJoy6QewrlCRmjmvGwsZluoKLdNTIyS1JtsUSy3cdktmEdK0H
	ttN4prHsBpuYWpf1EEOW1NKyCpTll2iZ+AjXPDwdcUMjLtG1mhqUFWD6rqUtZ9yD6fLNkMRHjgY
	q/SzUxwT9umY=
X-Received: by 2002:a5d:5d13:0:b0:490:ef5a:bf39 with SMTP id ffacd0b85a97d-492733d12f2mr5925598f8f.6.1794004064618;
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Received: from macbook (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm5497080f8f.28.2026.11.06.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:27:44 -0800 (PST)
Date: Fri, 6 Nov 2026 23:27:38 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <au5RoF6BooP14xhY@macbook>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
 <20261106-headband-buckwheat-fecbd459ee85@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-headband-buckwheat-fecbd459ee85@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_142746_997729_8EC9BA79 
X-CRM114-Status: GOOD (  22.77  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 20:48:01 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> > On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
> > 
> > > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > > +
> > > > +        clock-controller@0 {
> > > > +            compatible = "amlogic,s7-peripherals-clkc";
> > > > +            reg = <0x0 0x0 0x0 0x49c>;
> > > 
> > > What's with the weird numbers in this example?
> > > 
> > > Examples don't have to be real, but when it looks like this the
> > > immediate thought is that the modelling of the device might be
> > > incorrec.t
> > 
> > The numbers are actually real, but the example simply lost their context
> > because I copied the node from the S7 dtsi (not yet submitted), where
> > the controller sits under the APB bus node (bus@fe000000) and the bus
> > ranges make the addresses relative to it.
> > 
> > 		apb: bus@fe000000 {
> > 			compatible = "simple-bus";
> > 			reg = <0x0 0xfe000000 0x0 0x480000>;
> > 			#address-cells = <2>;
> > 			#size-cells = <2>;
> > 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> > 
> > 			clkc_periphs: clock-controller@0 {
> > 				compatible = "amlogic,s7-peripherals-clkc";
> > 				reg = <0x0 0x0 0x0 0x49c>;
> > 				#clock-cells = <1>;
> > 				...
> > 
> > In V2 I'll use an absolute address for the sake of clarity (PLL has the
> > same issue).
> 
> Before you do that, can you please share with me the s7 dtsi? Cos surely
> you've got it in some git repo online somewhere.

The S7 dtsi is already upstream at [0], the peripheral clock controller
and PLL will be enabled in that DTSI with a following series after the
bindings and the drivers in this set are acked, following the diffs that
will be submitted:

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 2c204dcebbba..5f2a61f42cbd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>

 / {
@@ -160,6 +162,22 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_pll: clock-controller@8000 {
+                               compatible = "amlogic,s7-pll-clkc";
+                               reg = <0x0 0x8000 0x0 0x1e8>;
+                               #clock-cells = <1>;
+                               clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_TOP_PLL_OSC>,
+                                        <&scmi_clk CLKID_HDMI_PLL_OSC>;
+                               clock-names = "fix",
+                                             "gp0",
+                                             "hifi",
+                                             "hifi1",
+                                             "hdmi";
+                       };
+
                        uart_b: serial@7a000 {
                                compatible = "amlogic,s7-uart",
                                             "amlogic,meson-s4-uart";

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 5f2a61f42cbd..afc88abea301 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -162,6 +162,40 @@ apb: bus@fe000000 {
                        #size-cells = <2>;
                        ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;

+                       clkc_periphs: clock-controller@0 {
+                               compatible = "amlogic,s7-peripherals-clkc";
+                               reg = <0x0 0x0 0x0 0x49c>;
+                               #clock-cells = <1>;
+                               clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                                        <&clkc_pll CLKID_FCLK_DIV2P5>,
+                                        <&clkc_pll CLKID_FCLK_DIV3>,
+                                        <&clkc_pll CLKID_FCLK_DIV4>,
+                                        <&clkc_pll CLKID_FCLK_DIV5>,
+                                        <&clkc_pll CLKID_FCLK_DIV7>,
+                                        <&clkc_pll CLKID_HIFI_PLL>,
+                                        <&clkc_pll CLKID_GP0_PLL>,
+                                        <&clkc_pll CLKID_HIFI1_PLL>,
+                                        <&scmi_clk CLKID_GP1_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL>,
+                                        <&clkc_pll CLKID_HDMI_PLL_PIX>,
+                                        <&xtal>,
+                                        <&scmi_clk CLKID_ACLKM>;
+                               clock-names = "fclk_div2",
+                                             "fclk_div2p5",
+                                             "fclk_div3",
+                                             "fclk_div4",
+                                             "fclk_div5",
+                                             "fclk_div7",
+                                             "hifi_pll",
+                                             "gp0_pll",
+                                             "hifi1_pll",
+                                             "gp1_pll",
+                                             "hdmi_pll",
+                                             "vid_pix",
+                                             "xtal",
+                                             "axi_frcpu";
+                       };
+
                        clkc_pll: clock-controller@8000 {
                                compatible = "amlogic,s7-pll-clkc";
                                reg = <0x0 0x8000 0x0 0x1e8>;

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi

--
Carlo Caione

