Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443F8606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EjlbDMey;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8xOoZm1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lXwLpfc4aS4+J/jJs2iTIAGiSEtFcclowGK9/tjyUGk=; b=EjlbDMeyISYvT3
	vwDh4b/DTYI/5j/1JaCMOjglvWd92w6ni8QMV9coLlpaMdf0gjjVDKI+ksM6jHCDXsO429j94D3hl
	+Lba1ALyoREsg9jJUDFGmkiU7tkV+rhlDCYhJmttBvdueO40uW+oF0hpSWZoC8JeY5H7NSA6bFSFD
	UhWKGfQ+Kh8aiu84+dFX9wLekMMvs5rd8a6cMDvwj0dpmDfRoGBu/lscT7vBZkOBim+G69Xx897Cr
	Ww465QRnbTKkhoUezHrDYyDjPzkWEq25UDReOdYqZNWS5OFY5peL8NAQ76IwXmZOxFmL2QgF/sE+s
	9TViNc5qP1heHwqvg8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVw0C-00000007a6V-0cPh;
	Tue, 24 Nov 2026 19:16:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVw0B-00000007a6P-1TBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:16:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC36F455A0;
	Tue, 24 Nov 2026 19:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333321F000C6;
	Tue, 24 Nov 2026 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795547786;
	bh=lXwLpfc4aS4+J/jJs2iTIAGiSEtFcclowGK9/tjyUGk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=E8xOoZm1tkyvMNjNixCEnPcZxqSvm7nQHecKeztfjP56GWSvZjYReB7gYKUMnv/w0
	 Sm3JsLa7BScRVmvAS4iQD2/oBRunDKNEBcW7/bWITGa+2n8302BouwuRDbV60VPuZg
	 oZD4mrDpCZ1837ckijBp0VEFr+jUN1AjhTzGkgLhtEEqiV2h/rj9UlQWbhuUhiftc3
	 hJCM24QqfT+wOyzl0fIt8DCweVrvK0lJJ5CWDml25DFhXcZc4D2vJUPPWYy6DpgpaN
	 JsVYyoyZsZchDF+71Dwm6d7BrOJ9Mko0WLASP4tj/CWY13bXLducdhFzpeREsi4KOj
	 iyQDhLG7PwCJw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/5] soc: st: stm32mp2-syscfg: register the clock
 device
From: Brian Masney <masneyb@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124-ups_mp25_clk_syscfg-v4-3-894d95dffec4@foss.st.com>
References: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
 <20261124-ups_mp25_clk_syscfg-v4-3-894d95dffec4@foss.st.com>
Date: Tue, 24 Nov 2026 14:16:18 -0500
Message-Id: <179554777875.338124.2443153902372697503.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=F1WVQywTa9F2r7TDaCAJztvWfqC8Q7gfotXdlbvqROs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZH7W0Czi4fuJvs6oPT7shs7bSP1zXa3Km+xF5bf0jV
 WcZTao7SlkYxLgYZMUUWZbkGhVEpK6yvXdHkwVmDisTyBAGLk4BmIjUKUaGnbHpPgx+ZmUPVnA3
 zjwxl7/CLpDp4EoWvXb912Enmq8kMTI0tLaL5vuELPvwdL0ES9a6wooZclMLAliN9nutq72Wxcs
 PAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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

Hi Gabriel,

> The STM32MP23x and STM32MP25x SYSCFG provides the LTDC pixel clock mux,
> whose driver is an auxiliary driver since the SYSCFG node is bound to
> this driver.
> 
> Create the auxiliary device for the clock driver.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> [gabriel.fernandez@foss.st.com: create the device on STM32MP23x too]
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/soc/st/Kconfig           |  1 +
>  drivers/soc/st/stm32mp2-syscfg.c | 14 +++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
> index 2a9d6a77be45..62bbe8c63238 100644
> --- a/drivers/soc/st/Kconfig
> +++ b/drivers/soc/st/Kconfig
> @@ -5,6 +5,7 @@ config SOC_STM32MP2
>  	tristate "STM32MP2 SoC family support"
>  	depends on ARCH_STM32 || COMPILE_TEST
>  	default ARCH_STM32 && ARM64
> +	select AUXILIARY_BUS
>  	select SOC_BUS
>  	help
>  	  If you say yes here, you get support for the ST STM32MP2 family
> diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
> index 770321a4a6f7..1160b65d3dde 100644
> --- a/drivers/soc/st/stm32mp2-syscfg.c
> +++ b/drivers/soc/st/stm32mp2-syscfg.c
> @@ -3,13 +3,25 @@
>   * Copyright 2026 Marek Vasut
>   */
>  
> +#include <linux/auxiliary_bus.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  
>  static int stm32mp2_syscfg_probe(struct platform_device *pdev)
>  {
> -	return devm_of_platform_populate(&pdev->dev);
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return ret;
> +

Looking at the dt binding, I see that the clocks property is optional.
Should this have the following check?

    if (!of_property_present(dev->of_node, "clocks"))
        return 0;

Brian

-- 
Brian Masney <masneyb@kernel.org>

